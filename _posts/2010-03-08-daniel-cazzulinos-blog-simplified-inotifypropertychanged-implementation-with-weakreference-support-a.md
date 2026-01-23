---
layout: post
title: "Daniel Cazzulino's Blog : Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API"
date: 2010-03-08 00:00:00 +0000
---

## Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API 

I've grown a bit tired of implementing [INotifyPropertyChanged](http://msdn.microsoft.com/en-us/library/ms229614.aspx). I've tried ways to improve it before (like [this "ViewModel"](http://clarius.codeplex.com/wikipage?title=ViewModel%20Tool&referringTitle=Home) custom tool which even generates strong-typed event accessors). 

But my fellow [Clarius]() teammate [Mariano](http://weblogs.asp.net/marianor/) thought it was overkill and didn't like that tool much. He mentioned [an alternative approach](http://joshsmithonwpf.wordpress.com/2009/07/11/one-way-to-avoid-messy-propertychanged-event-handling/) also, which I didn't like too much because it relied on the consumer changing his typical interaction with the object events, but also because it has a substantial design flaw that causes handlers not to be called at all after a garbage collection happens. A very simple unit test will showcase this bug.

I also looked at the new [WeakEvent Patterns](http://msdn.microsoft.com/en-us/library/aa970850.aspx) page in MSDN but it's even worse in terms of implementing and exposing it to consumers.

So, with my ever growing love for lambdas and my [strong-typed reflection](http://clarius.codeplex.com/releases/view/9495) approach (used by the first alternative too, btw), I thought I could do better :). Here's the result of that, which I think improves all the above choices.

## Why you need weak reference support

The importance of this cannot be understated. A [delegate](http://msdn.microsoft.com/en-us/library/system.delegate.aspx) that you pass around has a strong reference to the instance that exposes it. This is the [Target](http://msdn.microsoft.com/en-us/library/system.delegate.target.aspx) property on the delegate class. What this means is that even if the subscribing object goes out of scope and is ready to be collected, it will not be as long as the event source (the object exposing the PropertyChanged event, for example) holds a reference to it. And as long as the event subscription is there, the reference will be there too. That's why it is typically important to remove your reference once you're ready to "go" (i.e. on Dispose, you detach from the events you're listening). Needless to say, this is a repetitive, error-prone activity. 

Another typical side-effect of this is that you cannot use anonymous delegates or lambdas if you need to unsubscribe, as you need to keep a reference to the originally subscribed lamdba in order to unsubscribe:
    
    
    var target = new Foo();
    
    target.PropertyChanged += (sender, args) => Console.WriteLine(args.PropertyName);
    
    // How do you unsubscribe now??
    
    // This clearly doesn't work because even if the actual source is the same, 
    // the delegate is still a brand-new one.
    target.PropertyChanged -= (sender, args) => Console.WriteLine(args.PropertyName);
    
    // So you need to keep the lambda around:
    PropertyChangedEventHandler handler = (sender, args) => Console.WriteLine(args.PropertyName);
    
    // Just so you can use that to subscribe/unsubscribe:
    target.PropertyChanged += handler;
    target.PropertyChanged -= handler;
    
    // So typically you're better off just adding a full instance method on your 
    // consumer just so you have a clear pointer for unsubscribing:
    target.PropertyChanged += OnTargetPropertyChanged;
    
    // But now if you need contextual state in the event handler that exists 
    // at subscription time, you need to promote that state to class fields
    // so that you can use that in the event handler
    this.someState = currentMethodState;
    
    // This is looking like .NET 1.0 already ;)
    

## The PropertyChangeManager way

I therefore decided to take a TDD approach to the issue with the following requirements:

  1. The programming model for consumers must not involve creating any new objects. They already have the object that will be raising property change events. 
  2. The "old style" way of attaching to property changed events must still work, but add the weak reference support that's so badly needed. And this must be transparent to consumers. 
  3. A new style should involve using lambdas to avoid property names as strings 
  4. The new style should be trivial to implement for an author exposing INotifyPropertyChanged.

So I came up with these [BDD-style](http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/13/120996.aspx) test specifications:

  * WhenSubscriberIsAlive_ThenNotifiesSubscriber 
  * WhenSubscriberIsNotAlive_ThenDoesNotNotifySubscriber 
  * WhenAddingPropertyChangedHandler_ThenNotifiesSubscriber 
  * WhenAddedPropertyChangedHandlerTargetIsNotAlive_ThenDoesNotNotify 
  * WhenRemovingPropertyChangedHandler_ThenDoesNotNotifySubscriberAnymore

These should cover all use cases.

### Consuming PropertyChangeManager-enabled objects

The fact that a given object is internally (remember requirement 1.) using this PropertyChangeManager is completely hidden from the consumer:
    
    
    var source = new Foo();
    
    source.SubscribeChanged(
        x => x.Name,
        foo => Console.WriteLine(foo.Name));
    

The first argument specifies which property you're interested in, and the second is an Action in this case for the callback when the property changes. It can of course point to a class method:
    
    
    source.SubscribeChanged(
        x => x.Name,
        this.OnRenamed);
    

Optionally, if unsubscribing from the event will be needed at some point, you can just keep a reference to the returned IDisposable object from the call to SubscribeChanged:
    
    
    // this could be assigned to a field, for example.
    IDisposable onRenameSubscription = source.SubscribeChanged(
        x => x.Name,
        foo => Console.WriteLine(foo.Name));
    
    // at some later point (i.e. IDisposable.Dispose implementation of the consumer)
    onRenameSubscription.Dispose();
    // now the subscription is removed, even if I didn't keep the lambda around! 

The source object can still implement INotifyPropertyChanged, but you may want to do so explicitly just for its support for databinding infrastructure. The consumer would still be able to cast the object to INotifyPropertyChanged if he wanted to use the "unsafe" property name strings ;). The implementation can still be made public, though.

### Implementing INotifyPropertyChanged with PropertyChangeManager

The implementer defines a private field to hold a reference the manager:
    
    
    public class Foo : INotifyPropertyChanged
    {
        private PropertyChangeManager propertyChanges;
        private string name;
        private int value;
    
        public Foo()
        {
            this.propertyChanges = new PropertyChangeManager(this);
        }
    

Note that the manager is generic and receives the type of the "change event source", in this case Foo.

Next, your properties need to be turned into "old-style" .NET properties with a backing field, because you need to add a call to the manager in the property setter:
    
    
    public string Name
    {
        get { return name; }
        set { name = value; this.propertyChanges.NotifyChanged(x => x.Name); }
    }
    

Note that the call to the manager also leverages lambdas to avoid using strings.

In order to provide a custom implementation of the INotifyPropertyChanged.PropertyChanged event, you need to implement the interface ~~explicitly~~ and pass-through the implementation to the manager:
    
    
    public PropertyChangedEventHandler PropertyChanged
    {
        add { this.propertyChanges.AddHandler(value); }
        remove { this.propertyChanges.RemoveHandler(value); }
    }
    

~~This is a restriction in the language, which prevents this event from being public. But it's not as bad as it sounds, as~~ you want to encourage adoption of safer lambda-version subscription, which is the last bit to implement:
    
    
    public IDisposable SubscribeChanged(Expression> propertyExpression, Action callbackAction)
    {
        return this.propertyChanges.SubscribeChanged(propertyExpression, callbackAction);
    }
    

How PropertyChangeManager works

The manager works by dismembering the received delegates into their actual target and method info, to be able to weakly reference the former, while remaining able to call the latter. It's a plain list internally, which is scavenged every time an action is performed in the manager (this could be optimized somehow to only happen on Notify, but it simplified the implementation a bit, and it's not like property change performance is a big issue in UIs anyway). 

Here's the [full source](http://pastie.org/859940).

Some tooling such as a custom tool, item template, or code snippets would be nice, I'll try to provide those in the future.

Enjoy!

posted on Monday, March 08, 2010 10:30 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

---
layout: post
title: "Daniel Cazzulino's Blog : Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API"
date: 2010-03-08 00:00:00 +0000
---

Daniel Cazzulino's Blog : Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

Source code published in this blog is [public domain](http://en.wikipedia.org/wiki/Public_domain) unless otherwise specified.

[![](https://web.archive.org/web/20100312141111im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100312141111im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100312141111im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100312141111im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100312141111im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100312141111im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

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

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/221096.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221097 "permalink") Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Monday, March 08, 2010 10:32 AM

I&amp;#39;ve grown a bit tired of implementing INotifyPropertyChanged . I&amp;#39;ve tried ways to improve it [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2010/03/08/simplified-inotifypropertychanged-implementation-with-weakreference-support-and-typed-property-access-api.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221160 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Monday, March 08, 2010 2:03 PM

I don't get why you need to register a lambda to the PropertyChanged event, it is a WPF/silverlight requirement.. If I need to do something when a property changed i usually do within another event.   
  
And I neither understood why the object is raising propertychanged events after being is garbage collected. I've smell with thread issues, it is wrong to raise propertychanged from differents threads than the current dispatcher. Maybe I'm wrong.   
  
thank you [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Jos&#233; F. Romaniello](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://jfromaniello.blogpot.com "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221161 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Monday, March 08, 2010 2:16 PM

If you wanted, you could remove the backing field entirely. This is useful when you want to enforce all changes to go through notification, since it removes the back door access to, for example, this.name:   
  
string Name   
{   
get { return this.PropertyChanges.Get(x = x.Name); }   
set { this.PropertyChanges.Set(x => x.Name, value); }   
}   
  
You could also make the property change management into an extension:   
  
this.GetValue(x => x.Name);   
// PropertyChangeManager.GetValue(this, x => x.Name)   
this.SetValue(x => x.Name, value);   
// PropertyChangeManager.SetValue(this, x => x.Name, value);   
  
Note how this is starting to resemble dependency properties? To that end, maybe you only want to notify if some function is true (for example, x.Equals(y))?   
  
this.SetValueIf(x => x.Name, value, (x, y) => predicate(x, y)); [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

Keith J. Farmer

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221169 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Monday, March 08, 2010 2:27 PM

"In order to provide a custom implementation of the INotifyPropertyChanged.PropertyChanged event, you need to implement the interface explicitly and pass-through the implementation to the manager:"   
  
No, you don't, in this part it's better so that they don't use the event directly, but you can perfectly create a public event for INotifyPropertyChanged with a custom add/remove. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

Steve

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221242 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Monday, March 08, 2010 6:05 PM

You're right Steve! Don't know when this started being supported, but I clearly remember this being the case before :) [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl4$EditLink',''\))

[kzu](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221247 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Monday, March 08, 2010 6:08 PM

Jose: I don't want to merge too many responsibilities, neither have a domain model depend on DependencyProperties and their awkward registration mechanisms and programming model.   
  
What I show here is more aligned with IObservable<T> than dependency properties. It's a programming model for (potentially) non-UI domains that need to provide rich notifications to plug/extensions consumers. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl5$EditLink',''\))

[kzu](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221555 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Tuesday, March 09, 2010 6:53 AM

"Static reflection" to obtain the name string is an expensive operation. Using it for event registration isn't so bad, since that's done only once. Using it for raising the event, however, can be problematic in some scenarios. Setting several properties in a loop can quickly magnify the overhead here into something that may not be acceptable. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl6$EditLink',''\))

[wekempf](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://digitaltapestry.wordpress.com "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221652 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Tuesday, March 09, 2010 10:55 AM

wekempf: measure and decide for yourself. "may" is a clear sign of potentially early (read: unnecessary) optimization.   
  
Especially for notify property changed, which is 99% of times used for UI binding where high-API performance is far from an issue most of the time.   
  
Also, static reflection is not used for the invocation, neither it is expensive at all. The "traditional" reflection invocation is what's expensive.   
  
Retrieving names from expression trees is as quick as an API traversal can be. You're just traversing in-memory data. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl7$EditLink',''\))

[kzu](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#221690 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Tuesday, March 09, 2010 12:32 PM

I did measure, thank you very much. Also, while I fully agree with advising against early optimizations, this causes a very significant increase in the time to call a typical property setter, significant enough for a common enough thing to do, that the chances that this will cause performance issues is significant enough to warrant consideration.   
  
INPC is "99% of times used for UI binding", but the setting of the property isn't directly related to the use of INPC.   
  
In your code, static reflection WAS used for the invocation, and it IS expensive. In comparison to runtime reflection, it's a drop in the bucket, but in comparison to using a magic string, it's an ocean. Since I've never known anyone to use runtime reflection to implement INPC, bringing that up is pointless.   
  
I'm not saying this solution is universally bad. I've got a blog post about doing this same thing myself. I'm just warning that static reflection does come at a significant cost in performance that should be considered. Especially when there's alternatives. For instance, you can use static reflection to obtain the name and then cache it, using the cached instance in the invocation.   
  
We really need MS to provide symbol support in the language :(. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl8$EditLink',''\))

[wekempf](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://digitaltapestry.wordpress.com "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#222583 "permalink") Social comments and analytics for this post @ Wednesday, March 10, 2010 11:36 PM

This post was mentioned on Twitter by blacksphere: Nice #INPC find. <http://tinyurl.com/SimplifiedINotifyPropertyChng> (had to tinyurl it because the url was 162 chars). [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl9$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.ubervu.com/conversations/www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx#222785 "permalink") re: Simplified INotifyPropertyChanged Implementation with WeakReference Support and Typed Property Access API @ Thursday, March 11, 2010 6:46 AM

wekempf: I meant measure *in context* of an actual application typical use. Micro-testing that the setter takes longer is (IMO) quite useless. You get into the whole "iterating chars is faster than a regex" argument which is also pointless.   
  
If in a real app there's no noticeable effect (and I *know* there isn't because we're using this technique heavily), then I'd go every day for something concise, productive, and refactoring friendly, over any other alternative. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl10$EditLink',''\))

[kzu](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

  

[![](/web/20100312141111im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
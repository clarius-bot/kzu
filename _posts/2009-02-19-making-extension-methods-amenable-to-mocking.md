---
layout: post
title: "Making extension methods amenable to mocking"
date: 2009-02-19 00:00:00 +0000
---

##  [Making extension methods amenable to mocking](<http://blogs.clariusconsulting.net/kzu/making-extension-methods-amenable-to-mocking/> "Making extension methods amenable to mocking")

February 19, 2009 6:15 pm

The question of how to mock extension methods comes up frequently enough that I though I might give my opinion and solution to it (which does NOT include using [TypeMock](<http://www.typemock.com/>) ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) ).

A first differentiator is whether you control the definition of the extension methods or not. The latter case would be, for example, the built-in Linq extension methods (First, Count, etc. on IEnumerable<T>) and there's no way to mock them unless you use [TypeMock](<http://www.typemock.com/>). The former would be your own logic that you decide to place in extension methods for whatever reason, and that can be mocked using the technique I’ll explain in this post.

Say you want to add the following extension method: 
    
    
    someType.SendTo(address); 

Such a method would be a static method on a static class: 
    
    
    public static class MessagingExtensions
    {
        public static void SendTo(this SomeType target, string address)
        {
            // Do something
        }
    }
    

Now, instead of declaring it like that, which makes it impossible to mock it using [Moq](<http://moq.me/>) or [Rhino Mocks](<http://ayende.com/projects/rhino-mocks/downloads.aspx>), you define a static method “entry point” for your extensions related to (say) messaging of objects, like so: 
    
    
    someType.Messaging().SendTo(address); 

And your static class changes as follows: 
    
    
    public static class MessagingExtensions
    {
        public static IMessaging Messaging(this SomeType target)
        {
            return MessagingFactory(target);
        }
    
        static MessagingExtensions()
        {
            MessagingFactory = st => new Messaging(st);
        }
    
        internal static Func MessagingFactory { get; set; }
    }

The basic idea is that you take all the static extension methods (i.e. SendTo) and move them to an interface, which can be easily mocked, and make the static class use a factory to construct instances of that interface. This factory can be replaced by a friend test assembly for mocking purposes. 

Note that the actual class that will expose the former extension methods will need to have access to the target instance that was “dotted” to enter the extension. Hence, it will basically keep that instance around ready for the time you invoke an actual method without passing the target (it’s like caching the “this” if you think about it, which you do get on the extension method): 
    
    
    public interface IMessaging
    {
        void SendTo(string address);
    }
    
    internal class Messaging : IMessaging
    {
        SomeType someType;
    
        public Messaging(SomeType someType)
        {
            this.someType = someType;
        }
    
        public void SendTo(string address)
        {
            // Do something with someType and the address.
        }
    }

A test would simply replace the factory and make it return a mock: 
    
    
    var mockMessaging = new Mock();
    MessagingExtensions.MessagingFactory = st => mockMessaging.Object;

This is more work, I know, but now you can mock this dependency without resorting to black magic. Plus, it’s all plain OO once you get past the initial extension method call, and you also gain better control of “extension explosion” by defining the entry points that group related functionality.

� 

This may be useful if you have objects that are heavily extended by external classes or modules.

� 

And here I dub this technique the “Extension Method Entry Point Pattern” ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=117664)

Posted by kzu
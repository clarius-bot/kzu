---
layout: post
title: "Daniel Cazzulino's Blog : Making extension methods amenable to mocking"
date: 2009-02-19 00:00:00 +0000
---

Daniel Cazzulino's Blog : Making extension methods amenable to mocking

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20090222220539im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090222220539im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090222220539im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090222220539im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Making extension methods amenable to mocking 

The question of how to mock extension methods comes up frequently enough that I though I might give my opinion and solution to it (which does NOT include using [TypeMock](http://www.typemock.com/) ;)).

A first differentiator is whether you control the definition of the extension methods or not. The latter case would be, for example, the built-in Linq extension methods (First, Count, etc. on IEnumerable<T>) and there's no way to mock them unless you use [TypeMock](http://www.typemock.com/). The former would be your own logic that you decide to place in extension methods for whatever reason, and that can be mocked using the technique I'll explain in this post.

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
    

Now, instead of declaring it like that, which makes it impossible to mock it using [Moq](http://moq.me/) or [Rhino Mocks](http://ayende.com/projects/rhino-mocks/downloads.aspx), you define a static method "entry point" for your extensions related to (say) messaging of objects, like so: 
    
    
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

Note that the actual class that will expose the former extension methods will need to have access to the target instance that was "dotted" to enter the extension. Hence, it will basically keep that instance around ready for the time you invoke an actual method without passing the target (it's like caching the "this" if you think about it, which you do get on the extension method):
    
    
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

This is more work, I know, but now you can mock this dependency without resorting to black magic. Plus, it's all plain OO once you get past the initial extension method call, and you also gain better control of "extension explosion" by defining the entry points that group related functionality. 

This may be useful if you have objects that are heavily extended by external classes or modules. 

And here I dub this technique the "Extension Method Entry Point Pattern" :)

posted on Thursday, February 19, 2009 10:15 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/117664.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/02/19/Makingextensionmethodsamenabletomocking.aspx#117668 "permalink") Making extension methods amenable to mocking @ Thursday, February 19, 2009 10:33 AM

The question of how to mock extension methods comes up frequently enough that I though I might give my [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2009/02/19/making-extension-methods-amenable-to-mocking.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/02/19/Makingextensionmethodsamenabletomocking.aspx#117693 "permalink") Daniel Cazzulino's Blog : Making extension methods amenable to mocking @ Thursday, February 19, 2009 12:23 PM

Thank you for submitting this cool story - Trackback from DotNetShoutout [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://dotnetshoutout.com/Daniel-Cazzulinos-Blog-Making-extension-methods-amenable-to-mocking "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/02/19/Makingextensionmethodsamenabletomocking.aspx#117840 "permalink") Faking extension methods @ Friday, February 20, 2009 6:46 AM

I just read a post from Daniel Cazzulino about mocking extension methods. He wants to mock an extension [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://bloggingabout.net/blogs/dennis/archive/2009/02/20/faking-extension-methods.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/02/19/Makingextensionmethodsamenabletomocking.aspx#117917 "permalink") Faking extension methods @ Saturday, February 21, 2009 8:10 AM

I just read a post from Daniel Cazzulino about mocking extension methods. He wants to mock an extension [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://bloggingabout.net/blogs/dennis/archive/2009/02/21/faking-extension-methods.aspx "TrackBack")

  

[![](/web/20090222220539im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
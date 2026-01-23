---
layout: post
title: "Daniel Cazzulino's Blog : Mocking protected members with Moq"
date: 2008-07-05 00:00:00 +0000
---

Daniel Cazzulino's Blog : Mocking protected members with Moq


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080714201520im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080714201520im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080714201520im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080714201520im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Mocking protected members with Moq 

If you're familiar with [Moq](http://www.mockframeworks.com/moq), you know that it relies on lambda expressions heavily. This is very good as you get full support from intellisense and refactoring features in Visual Studio. However, it also means you're for the most part restricted to setting expectations on things that your code has access too (public or internal members). 

This is especially annoying with protected members, which are very common in template method pattern, factory methods, etc. In this case, you can't simply set an expectation with a lambda expression, as you have no access from the "outside" to the protected member. Being an important scenario, though, we wanted to add support for it.

We could have just extend the core Mock<T> API and add loosely-typed members that received strings (i.e. `mock.Expect("Foo")`). This would have been bad from the guidance point of view, as it would make for an easy path to "hell" for people not familiar with lambda expression ("mmm... I could use this overload with that lambda thinghy, or just use the simpler string-based overload..."). We'd much rather keep people using strong-typed, lambda-based expectations rather than jumping at the ease of strings.

So, we reached a compromise: we implemented protected expectations using strings, but it will only work for non-public members :). We also didn't want to make this functionality too easy to discover, so we expose it as an extension method that you enable by importing the `Moq.Protected` namespace:
    
    
    using Moq.Protected;

then you use the `Protected` "extension point":
    
    
    var mock = new Mock<CommandBase>();
    mock.Protected()
         .Expect<int>("Execute")
         .Returns(5);
    

The `Expect` overload receiving a type parameter specifies the return value from the invocation. You also have `ExpectGet/Set` members, which expose the same functionality of the strong-typed lambda versions.

Note how rather than polluting the main API with extension overloads receiving strings, we hang all members from the `IProtectedMock` returned from the `Protected()` method call. That's an interesting use of extension methods I think, which you also get to see quite a lot in newer C# 3.5 libraries such as [Autofac](http://autofac.googlecode.com/) and [Umbrella](http://www.codeplex.com/umbrella). 

Another difference in the invocation style for expectations is the argument matching. Here, I couldn't find an easier way to specify then than using a separate class, [ItExpr](http://www.clariusconsulting.net/labs/moq/html/169D5A34.htm) to specify them:
    
    
    mock.Protected()
        .Expect<string>("Execute",
            ItExpr.IsAny<string>())
        .Returns(true);
    

[](http://11011.net/software/vspaste)

The need for this is subtle, and lies in the fact that the Expect method is not receiving a lambda expression, unlike the strong-typed version, and the alternatives were far worse. So basically [ItExpr](http://www.clariusconsulting.net/labs/moq/html/169D5A34.htm) is an expression-returning version of the [It](http://www.clariusconsulting.net/labs/moq/html/FBE0FFA5.htm) class. I still haven't figured out how you would use custom matchers in this scenario. I guess it would involve building the expression trees just like we do to reconstruct the same expression that would result from using the matcher in the lambda Expect.

If you want to play with it, just go ahead and get the [latest version from Google Code](http://code.google.com/p/moq/downloads/list). 

Don't forget to give us feedback through the [discussion list](http://groups.google.com/group/moqdisc/) or [issue tracker](http://code.google.com/p/moq/issues/list). 

Enjoy!

posted on Saturday, July 05, 2008 10:09 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/07/05/MockingprotectedmemberswithMoq.aspx#77739 "permalink") Mocking protected members with Moq @ Saturday, July 05, 2008 10:35 AM

If you&amp;#39;re familiar with Moq , you know that it relies on lambda expressions heavily. This is very [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/07/05/mocking-protected-members-with-moq.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/07/05/MockingprotectedmemberswithMoq.aspx#77873 "permalink") Is Moq too poweful? @ Sunday, July 06, 2008 11:59 AM

It's interesting to see the other mocking frameworks as they grow into maturity. Especially Moq which [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/rosherove/archive/2008/07/06/is-moq-too-poweful.aspx "TrackBack")

  

[![](/web/20080714201520im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
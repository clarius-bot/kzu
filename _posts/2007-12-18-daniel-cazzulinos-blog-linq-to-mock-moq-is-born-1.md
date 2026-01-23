---
layout: post
title: "Daniel Cazzulino's Blog : Linq to Mock: MoQ is born"
date: 2007-12-18 00:00:00 +0000
---

Daniel Cazzulino's Blog : Linq to Mock: MoQ is born


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2982'\))| April 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3043'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| 7| 8| 9| 10| 11| 12  
13| 14| 15| 16| 17| [18](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/18.aspx "1 Post")| 19  
20| [21](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21.aspx "2 Posts")| 22| 23| 24| 25| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/26.aspx "2 Posts")  
[27](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/27.aspx "1 Post")| 28| 29| [30](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/30.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080430151609im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

[![](https://web.archive.org/web/20080430151609im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080430151609im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080430151609im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Linq to Mock: MoQ is born 

(go straight to the snippets if you can't wait ;))

Regardless of whether you use a mocking framework/library or not, as long as you're doing unit testing, you're almost for sure using mocks. Most of the time they are manual mocks typically not even shared outside the scope of a single test fixture as they contain hardcoded values for return types, helper members, etc.

This works well, but it's counter-productive and plain boring. Mocking interfaces just to implement the one or two members you're interested sucks. 

Using a mocking framework helps, but they typically introduce undesired side effects:

  1. Almost every framework I know of requires you to set an expectation for each and every member called on the mocked interface while the tests are running. This includes expectations for attaching/detaching to events, invoking void methods, etc. This causes your unit tests to replicate the entire internal implementation of a given behavior as expectations, and needless to say, this causes any (perfectly valid from the encapsulation point of view) subsequent refactoring of the implementation to break lots of tests that were setup to expect the old interactions.  
  
The setup is typically more involved than the actual unit test itself, and discovering the full chain of calls that should be expected is a painful trial & error exercise until you get the damn interaction right. Needless to say, this can be pretty bad for highly modularized libraries that fragment funcionality in many rather small interacting components.  
  
Psicologically, it also deviates the main focus of the unit test at hand, and over time can lead to an excesive focus on testing the interactions rather than the observable state and behavior from the point of view of the object under test.  

  2. Most frameworks rely on member names passed as strings (i.e. mock.Expect("Foo")), which induces the developer to avoid refactorings that typically cause ripple effects throughout test fixtures. This is especially bad in the light of the previous issue and highly componentized libraries.  

What I always wanted was a mocking framework that did just what I already do manually with my mocks (typically setting up fixed return values on methods or properties, calling a callback on the test to check for a call, or maybe throwing an exception), and which doesn't get in the way of refactoring.

In typically manual mocks you don't care about the ordering of calls, about invocations to methods you generally don't care for a given test, about events subscribed/raised by the mock, etc. (we may add these features in the future if there's enough demand, but I don't think they lead to good testing patterns).

Enough intro! Let's see the code!!! Here's what myself and [waj](http://weblogs.manas.com.ar/waj/2007/12/19/mocking-with-linq-moq-is-here/) got working in about a couple hours of pair programming (further refined and polished over nights and a weekend):  

    
    
    var mock = new Mock<IFoo>();
    mock.Expect(x => x.Execute("ping")).Returns("I'm alive!");
    mock.Expect(x => x.Execute("update foo")).Callback(() => updated = true).Returns("Got your update!");
    mock.Expect(x => x.Execute(It.IsAny<string>())).Throws(new ArgumentException()); 

Here we expect either a ping or an update. Anything else (`It.IsAny`) will throw. 

Note that everything is strong-typed, and refactoring the Execute method in any way will automatically cause the tests to either stay in sync or fail to compile (i.e. you change the type of an argument or remove it). 

The "x" argument in the expect (you can name the variable whatever you want, however) is of the type of the mocked interface, so you call members on it directly.

The `It` class provides for a kind of wildcard support. There's an `IsAny`, `IsInRange` and `IsRegex`. The coolest one though is the plain `It.Is` method that receives a predicate!
    
    
    mock.Expect(x => x.DoInt(It.Is<int>(i => i % 2 == 0))).Returns(1);

Here the mocked object will return the value 1 only if the integer passed to the DoInt method is an even number.

The cool thing about this approach is that you don't need the mocking library to provide all the filters you need, as you can simply pass a predicate for any condition you can dream of.

[Moq](http://code.google.com/p/moq/) is an open source project, released under the new BSD license, and available from its [project home at Google Code](http://code.google.com/p/moq/). 

Check out the [Moq Quickstart](http://code.google.com/p/moq/wiki/QuickStart) wiki page which contains a lot more samples. 

posted on Tuesday, December 18, 2007 3:19 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/18/LinqtoMockMoqisborn.aspx#46475 "permalink") Linq to Mock: Moq is born @ Tuesday, December 18, 2007 8:44 PM

Regardless of whether you use a mocking framework/library or not, as long as you're doing unit testing [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/12/19/linq-to-mock-moq-is-born.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/18/LinqtoMockMoqisborn.aspx#46486 "permalink") Moq: Linq, Lambdas and Predicates applied to Mock Objects @ Wednesday, December 19, 2007 1:00 AM

Kzu and friends have a new pet project called Moq , which may be the coolest derivative open source project [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://feeds.feedburner.com/~r/ScottHanselman/~3/202624136/MoqLinqLambdasAndPredicatesAppliedToMockObjects.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/18/LinqtoMockMoqisborn.aspx#46491 "permalink") Moq, doing mock objects right? @ Wednesday, December 19, 2007 5:08 AM

Moq, doing mock objects right? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://blogs.chimpswithkeyboards.com/jonshute/archive/2007/12/19/Moq-doing-mock-objects-right.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/18/LinqtoMockMoqisborn.aspx#46504 "permalink") Moq: Linq, Lambdas and Predicates applied to Mock Objects @ Wednesday, December 19, 2007 10:34 AM

[](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.hanselman.com/blog/MoqLinqLambdasAndPredicatesAppliedToMockObjects.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/18/LinqtoMockMoqisborn.aspx#52121 "permalink") Contribuciones realizadas por MVPs en Diciembre @ Tuesday, January 15, 2008 10:19 AM

Hola Quiero compartir con todos, estas excelentes contribuciones que han realizado los MVPs en el mes [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl4$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://blogs.msdn.com/mvplead/archive/2008/01/15/contribuciones-realizadas-por-mvps-en-diciembre.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/18/LinqtoMockMoqisborn.aspx#52139 "permalink") Contribuciones realizadas por MVPs en Diciembre @ Tuesday, January 15, 2008 11:13 AM

Hola Quiero compartir con todos, estas excelentes contribuciones que han realizado los MVPs en el mes [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl5$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://geeks.ms/blogs/roller/archive/2008/01/15/contribuciones-realizadas-por-mvps-en-diciembre.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/18/LinqtoMockMoqisborn.aspx#58952 "permalink") Moq's MockBehavior @ Wednesday, March 26, 2008 9:29 AM

Moq has been getting some press lately because it&amp;#39;s the newest mock framework on the block. I think [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl6$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://codebetter.com/blogs/aaron.jensen/archive/2008/03/26/moq-s-mockbehavior.aspx "TrackBack")

  

[![](/web/20080430151609im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
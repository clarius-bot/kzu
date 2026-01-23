---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-02 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Tuesday, May 11, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| 5| 6  
[7](http://clariusconsulting.net/blogs/kzu/archive/2004/5/7.aspx "1 Post")| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/5/8.aspx "1 Post")| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/5/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2004/5/11.aspx "1 Post")| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/5/13.aspx "1 Post")  
[14](http://clariusconsulting.net/blogs/kzu/archive/2004/5/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/5/15.aspx "1 Post")| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/5/17.aspx "2 Posts")| 18| 19| 20  
21| 22| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/5/26.aspx "2 Posts")| 27  
28| 29| 30| [31](http://clariusconsulting.net/blogs/kzu/archive/2004/5/31.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502132030im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Tuesday, May 11, 2004 - Posts

#####  [Sami Jaber (from DotNetGuru.org) article on lightweight containers](http://clariusconsulting.net/blogs/kzu/archive/2004/05/11/228.aspx)

[Half the article](http://www.dotnetguru.org/us/articles/ioc/ioc.html) is almost a straight copy of topics covered by [ Fowler's article](http://www.martinfowler.com/articles/injection.html). Trivial renaming is done to shadow this fact, basically replacing Fowler's MovieFinder example with BusinessObject one, which supposedly should be more attractive. And you only realize this if you read it entirely, and right at the bottom, find the link to Fowler's work and go read it (you realize in the first page if you already did, like myself).

He partially cites Fowler:

> Martin Fowler's argument against this (Service Locator) pattern is its inaptitude to adapt to mock objects (for unit testing).

This reference is clearly distorted to make the previous discussion about Dependency Injection appear as supported and encouraged by Fowler. Initially, Fowler says: 

> A common reason people give for preferring dependency injection is that it makes testing easier. The point here is that to do testing, you need to easily replace real service implementations with stubs or mocks.

Inmediately after, he states *his* view on the matter: 

> However there is really no difference here between dependency injection and service locator: both are very amenable to stubbing. I suspect this observation comes from projects where people don't make the effort to ensure that their service locator can be easily substituted.

Which is absolutely unquestionable.

The article is unnecessarily really hard to follow. The author makes too many assumptions in order for it to be understandable. For example, he assumes the reader is familiar with PetShopDNG. He makes a strong assertion like the following:

> To summarize, **_the Abstract Factory and the dynamic code instantiation are a poor relation of the IOC_** approach. Why should we manage the life cycle of a dependency where an intermediary object could do it ? On another hand, if some techniques like code generation (AOP) allow to insert a behavior between client and provider, IOC gives a similar result with less effort.

Without clarifying a bit of it in the following paragraphs. He also says 

> When .NET IOC Frameworks will be ready (that's to say in some years ;))...

Well, as I showed [ in my previous article](http://weblogs.asp.net/cazzu/archive/2004/05/10/129140.aspx), the building blocks are in-place already, if you follow the ComponentModel architecture.

He shows an example where a class accesses a transaction object by using Transaction.Current:

public bool Buy(SharesInfo shares) { Transaction tx = Transaction.Current; // Execute against DB with tx

This is a very common approach in .NET, and it appears to be the one Indigo will be encouraging. The first drawback is that being a static property call, Transaction must be a specific implementation, not an interface. This was solved in ASP.NET Whidbey providers by having this class and its static members be just proxies on a concrete implementation instantiated as a singleton depending on config. The main drawback, however, is that if many services are potentially available, having [Service].Current for each of them makes for a highly descentralized service management. There's no way to administer, configure and provide all these services in a single place, therefore, maintainability and testability are hurt.

posted [Tuesday, May 11, 2004 11:36 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/05/11/228.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/05/11/228.aspx#comments)

  

[![](/web/20060502132030im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
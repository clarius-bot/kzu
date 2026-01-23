---
layout: post
title: "Daniel Cazzulino"
date: 2004-04-16 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Shadowfax: getting my hands dirty with a SOA-like architecture

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2004/4/2.aspx "1 Post")| 3| 4| 5| 6  
7| 8| 9| 10| 11| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/4/13.aspx "2 Posts")  
[14](http://clariusconsulting.net/blogs/kzu/archive/2004/4/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/4/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/4/16.aspx "3 Posts")| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/4/19.aspx "2 Posts")| 20  
21| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/4/23.aspx "1 Post")| 24| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/4/25.aspx "1 Post")| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/4/26.aspx "2 Posts")| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060516093030im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Shadowfax: getting my hands dirty with a SOA-like architecture 

Recently, I started working with [ Shadowfax](http://www.gotdotnet.com/Community/Workspaces/workspace.aspx?id=9c29a963-594e-4e7a-9c45-576198df8058), a reference architecure coming from the [ Patterns & Practices](http://microsoft.com/practices) group at Microsoft. You have a look at an overview of the architecture at the GDN workspace home. I also recommend [ Hernan de Lahitte](http://weblogs.asp.net/hernandl)'s blog, one of the guys working on it. He has a nice [ introduction](http://weblogs.asp.net/hernandl/archive/2004/02/23/shadowfaxintro.aspx) as as well as a [ closer inspection](http://weblogs.asp.net/hernandl/archive/2004/03/01/82051.aspx) of the processing pipeline. 

I don't to repeat those intros. I'll just say that if you're developing SOA-like architectures, or you need one for your project, you should definitely take a look. It's being developed in a very open manner, with source releases pretty often, with open feedback through the workspace, and even if it's not ready for prime time yet, it's a good indication of where MS thinks you should be going with your projects. It closely follows the advises from [Application Architecture for .NET: Designing Applications and Services](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnbda/html/distapp.asp), and generally represents a pretty good compendium of best practices. It makes heavy use of several application blocks from PAG, su as [ Configuration Management Application Block](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnbda/html/cmab.asp), [ Authorization and Profile Application Block](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnpag/html/authpro_ch_04.asp) an the [ Logging Application Block](http://msdn.microsoft.com/library/en-us/dnpag/html/Logging.asp). 

As this is going to take most of my working day now, I'll start a new category for these posts. ~~I hope[ScottW](http://scottwater.com/) adds support for subscribing to a single category soon (as [dasBlog](http://www.dasblog.net/) does since quite a while...)~~. This way, you can subscribe to this single category if you want. 

I have the task of helping developers have a smooth experience when programming against Shadowfax. I'll drop my ideas here, as well as the dev. aids I think could be useful. Even if you don't use Shadowfax, it would be cool to get your feedback... because it's possible that some of my ideas seem useful only to me! Stay tunned, lots of posts are coming ;)

posted on Friday, April 16, 2004 3:57 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/206.aspx) :: 

  

[![](/web/20060516093030im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
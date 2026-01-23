---
layout: post
title: "Daniel Cazzulino"
date: 2006-03-27 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Tuesday, July 20, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2223'\))| March 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
26| 27| 28| 1| 2| 3| 4  
[5](http://clariusconsulting.net/blogs/kzu/archive/2004/7/5.aspx "2 Posts")| [6](http://clariusconsulting.net/blogs/kzu/archive/2004/7/6.aspx "1 Post")| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/7/9.aspx "2 Posts")| 10| 11  
[12](http://clariusconsulting.net/blogs/kzu/archive/2004/7/12.aspx "1 Post")| 13| 14| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/7/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/7/16.aspx "3 Posts")| 17| 18  
19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/7/20.aspx "1 Post")| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/7/21.aspx "2 Posts")| 22| 23| 24| 25  
26| 27| 28| 29| 30| 31| 1  
2| 3| 4| 5| 6| 7| 8  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060327043950im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Tuesday, July 20, 2004 - Posts

#####  [Transient state management in ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/2004/07/20/TransientState.aspx)

I'm reading PAG guide on [Improving .NET Application Performance and Scalability](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnpag/html/scalenet.asp) (a must-read for every .NET developer), and I noticed they [missed one of the most interesting and useful state management features](http://msdn.microsoft.com/library/en-us/dnpag/html/scalenetchapt06.asp?frame=true#scalenetchapt06_topic16) ASP.NET introduced, the one I call **transient state**. This is the state that lives in `HttpContext.Items`, which only lasts for the duration of the current request, hence its characteristic of "transient". It's really awesome because you can pass information between modules, pages and controls with it, and completely avoid Session state. It's quickly discarded as soon as the current request has finished processing, so it doesn't impose any of the drawbacks you need to care about with Session. 

In my experience, a combination of `HttpContext.Items` and the Cache API almost completely removes the need to use Session at all. And this is a good thing, as you're also avoiding server affinity resulting from inproc session state (the only one that performs well, BTW).

Too bad it didn't make into that excelent guide :( 

posted [Tuesday, July 20, 2004 7:40 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/07/20/TransientState.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/07/20/TransientState.aspx#comments)

  

[![](/web/20060327043950im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
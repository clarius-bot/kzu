---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-07 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, October 10, 2003 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/10/3.aspx "1 Post")| 4  
[5](http://clariusconsulting.net/blogs/kzu/archive/2003/10/5.aspx "1 Post")| 6| [7](http://clariusconsulting.net/blogs/kzu/archive/2003/10/7.aspx "1 Post")| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2003/10/9.aspx "2 Posts")| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11.aspx "1 Post")  
[12](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12.aspx "2 Posts")| 13| 14| 15| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17.aspx "2 Posts")| 18  
19| 20| [21](http://clariusconsulting.net/blogs/kzu/archive/2003/10/21.aspx "1 Post")| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2003/10/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2003/10/25.aspx "1 Post")  
[26](http://clariusconsulting.net/blogs/kzu/archive/2003/10/26.aspx "1 Post")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/10/27.aspx "1 Post")| [28](http://clariusconsulting.net/blogs/kzu/archive/2003/10/28.aspx "1 Post")| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060207043228im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Friday, October 10, 2003 - Posts

#####  [Rss-Data and RSS 2.0 Extensibility](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/87.aspx)

I completely agree with [Dare](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=39a1d4d6-576c-407b-91e6-5c5aa2b0239d) points. My comment on [his weblog](www.25hoursaday.com/weblog/default.aspx) was: 

I believe extensions through namespaces is a great addition to RSS 2.0, but one that was also possible with the [W3C RSS 1.0](http://www.purl.org/rss/)... I imagine an extensible plug-in architecture that would load plugins from URL-retrievable namespaces (that would be a convention, of course, such as "http://danielcazzulino.com.ar/rss/metadata"), and that would participate in the item's rendering process, either server-side or client-side in a news aggregator. The returned plug-in would have to conform to some interface and would be readily downloaded and executed (CAS approval assumed...).   
For the server-side, I even imagine an Accept HTTP header that would tell it whether the client requesting the RSS feed supports a certain feature, for example, Accept: x-include. If such a header was not present, the server could pre-accumulate the XInclude-d fragments from other sources. 

By the W3C RSS 1.0 I meant the [RDF-based](http://www.w3.org/RDF/#agg) original spec. 

posted [Friday, October 10, 2003 12:35 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/87.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/87.aspx#comments)

#####  [Increase IIS/WinXP connection limit (or how to avoid HTTP 403.9 error)](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/86.aspx)

I wish I new [this](http://www.gazitt.com/ohmblog/PermaLink.aspx/f850bebf-97b0-4ebb-99ce-072bdcb4422f) before. 40 simultaneous connections!! Couple that with no HTTP Keep-Alives and it may actually work for you...   
From that post (for my own reference, as it was down some days ago):  

> Alot of people were pinging me today about getting 403.9's when trying to access my website (Access Forbidden: Too many users are connected Internet Information Services). 
> 
> It turns out that the IIS on Windows XP comes configured out of the box for a maximum of 10 HTTP connections. What's worse, IE (actually URLMON) seems to use up 2 connections when hitting a website. I tried figuring out how to raise the connection limit, but there didn't seem to be a documented way of doing this on a non-server version of Windows. Fortunately, my good friend Geoff is the Architect of IIS and was able to help me out. Here's his tip: 
> 
> _This can be bumped up to 40 but not higher (40 is the hardcoded limit)._
> 
> _To do this, find the adsutil.vbs script (should be in c:\inetpub\AdminScripts or similar) and run the following command:_
> 
> _adsutil set w3svc/MaxConnections 40_
> 
> _You can also try to prevent individuals from hogging a bunch of connections and thereby blocking out other users. (IE will normally use 2 connections to a web site.) To do this, launch the IIS admin tool (under control panel / administrative tools), right click on your ‘default web site’ (under ‘web sites’ in the outline control), and mess with the settings in the “connections” part of the “web site” tab. Lowering the timeout (default is 5 min) will cause idle connections to get dropped quicker. Disabling keep alives will cause connections to disconnect immediately after the request is handled instead of waiting for new requests on the same connection. This is a little extreme but you probably don’t care that much about responsiveness, so you might want to just try that and see if it solves the problem._
> 
> Thanks Geoff! I hope I didn't cost the company too many W2K3 licenses by posting this :-) 
> 
>   
> 

posted [Friday, October 10, 2003 12:26 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/86.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/86.aspx#comments)

#####  [Arthur Clark and Rama series](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/85.aspx)

I finished the whole series ([Rendezvous with Rama](http://www.amazon.com/exec/obidos/tg/detail/-/0553287893/qid=/sr=/ref=cm_lm_asin/102-8997685-2897730?v=glance), [Rama II](http://www.amazon.com/exec/obidos/tg/detail/-/0553286587/qid=/sr=/ref=cm_lm_asin/102-8997685-2897730?v=glance), [Garden of Rama](http://www.amazon.com/exec/obidos/tg/detail/-/0553298178/qid=/sr=/ref=cm_lm_asin/102-8997685-2897730?v=glance) and [Rama Revealed](http://www.amazon.com/exec/obidos/tg/detail/-/0553569473/qid=/sr=/ref=cm_lm_asin/102-8997685-2897730?v=glance)) in 45 days. It's THAT good!  
An incredible journey not only to outer space and the unknown, but also deep inside, a critic analysis of the very human nature, our fears and beliefs, the role of God, economics, society, and much more!   
A really deep story, which gave me plenty to think about, not so much about the future, but about today, our world and my own introspection. 

Now I started the [Foundation series](http://www.amazon.com/exec/obidos/tg/stores/series/-/55/paperback/ref=pd_serl_books/102-8997685-2897730) from [Isaac Asimov](http://www.amazon.com/exec/obidos/search-handle-url/index=books&field-author=Asimov%2C%20Isaac/102-8997685-2897730). I read first and second books really fast, in a couple weeks... very interesting so far. Now I'm stuck trying to get the third book in spanish :S.

posted [Friday, October 10, 2003 10:52 AM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/85.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10/85.aspx#comments)

  

![](/web/20060207043228im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
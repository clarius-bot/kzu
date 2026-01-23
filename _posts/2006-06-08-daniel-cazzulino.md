---
layout: post
title: "Daniel Cazzulino"
date: 2006-06-08 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : How to turn on Google Analytics for your site in 2 lines of configuration: a custom IHttpModule

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2312'\))| June 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
28| 29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2006/6/1.aspx "1 Post")| 2| 3  
4| 5| 6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2006/6/8.aspx "2 Posts")| [9](http://clariusconsulting.net/blogs/kzu/archive/2006/6/9.aspx "2 Posts")| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| 22| 23| 24  
25| 26| 27| 28| 29| 30| 1  
2| 3| 4| 5| 6| 7| 8  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060613022841im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## How to turn on Google Analytics for your site in 2 lines of configuration: a custom IHttpModule 

Ok, so I got excited with [Google Analytics](http://www.google.com/analytics) , thanks to [Scott Hanselman](http://www.hanselman.com/blog/GoogleAnalyticsItDoesntSuck.aspx). So I decided to give it a quick try. 

Turns out, you cannot give it a quick try unless you start changing your site's pages to include a piece of script before the </body>... yuck!

I searched the web and found no one who had done the simplest possible thing to have transparent support for Google Analytics on your site without touching a single page: a custom IHttpModule that uses the HttpResponse.Filter property to detect </body> and add the script automatically before sending the buffered output. 

If your site is not a high-traffic, performance-sensitive one (i.e. your corporate site/blog/small community site), you may find this little guy useful (note that I only had about 20' to get it working ;-)). Download the [module for .NET v.2.0](http://clariusconsulting.net/kzu/GoogleAnalyticsModule.cs.v2.txt) or [the one for .NET 1.1](http://clariusconsulting.net/kzu/GoogleAnalyticsModule.cs.v1.txt). Configuration is mininal:

< configuration >

< appSettings >

< add key ="GoogleAnalyticsAccount"value="[Google Analytics Account #]"/>

</ appSettings >

< connectionStrings />

< system.web >

< compilation debug ="true"/>

< authentication mode ="Windows"/>

< httpModules >

< add name ="GoogleAnalytics"type="Clarius.GoogleAnalyticsModule"/>

</ httpModules >

</ system.web >

</ configuration >

Enjoy!

posted on Thursday, June 08, 2006 8:10 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/538.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/06/08/InstantGoogleAnalytics.aspx#545 "permalink") re: How to turn on Google Analytics for your site in 2 lines of configuration: a custom IHttpModule @ Friday, June 09, 2006 8:22 AM

Nice !!! [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

OmegaSupreme

  

[![](/web/20060613022841im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
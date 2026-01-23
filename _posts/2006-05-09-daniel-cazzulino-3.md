---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-09 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Monday, November 03, 2003 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/11/3.aspx "1 Post")| [4](http://clariusconsulting.net/blogs/kzu/archive/2003/11/4.aspx "1 Post")| 5| [6](http://clariusconsulting.net/blogs/kzu/archive/2003/11/6.aspx "1 Post")  
7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/11/10.aspx "1 Post")| 11| 12| 13  
14| 15| 16| 17| 18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2003/11/20.aspx "2 Posts")  
21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/11/22.aspx "1 Post")| 23| 24| 25| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060509181524im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Monday, November 03, 2003 - Posts

#####  [Automatic VS.NET Command Prompt](http://clariusconsulting.net/blogs/kzu/archive/2003/11/03/102.aspx)

Tired of going to the "Visual Studio .NET 2003 Command Prompt" program files shortcut and then having to move to the desired folder? Want to get the environment variables set whenever you run "cmd"?  
Create a .reg file with the following code and merge it in your registry:

`
    
    
    Windows Registry Editor Version 5.00
    
    [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor]
    "AutoRun"="\"C:\\Program Files\\Microsoft Visual Studio .NET 2003\\Common7\\Tools\\vsvars32.bat\""

`

Needless to say, it must point to your installation path. 

posted [Monday, November 03, 2003 11:31 AM](http://clariusconsulting.net/blogs/kzu/archive/2003/11/03/102.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/11/03/102.aspx#comments)

  

[![](/web/20060509181524im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
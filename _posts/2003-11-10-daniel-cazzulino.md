---
layout: post
title: "Daniel Cazzulino"
date: 2003-11-10 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Where on earth did my IComponents go? (VS.NET Whidbey Web Apps)

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060530105545im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Where on earth did my IComponents go? (VS.NET Whidbey Web Apps) 

Non-visual components (those staying in a zone at the bottom of a webform -and also WinForms-) are SO cool: they have rich design-time features (designers, editors, full-blown editing UIs) that are UI-independent (can be used on windows and web forms, think of Dataset, SqlConnection, EventLog, etc.), can provide extensility to preexistent controls through IExtenderProvider, can interact with VS.NET services, generate code for the code-behind InitializeComponent, hook custom serializers, etc., etc. 

Being SO cool, and having developed a couple products (even a yet-another-MVC) that heavily rely on them, it was more than surprising (to say the least) to find that they no longer appear at design-time in Whidbey Web Developer!! Everything seems to work (still) at run-time, but no design-time support!! So all the code serialization, designers and editors are completely useless now :S.  
I honestly hope this is only a matter of early bits and time constraint, and that they are not obsoletting a feature introduced just a couple years ago (and a very good and usefull one indeed).

posted on Monday, November 10, 2003 5:41 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/105.aspx) :: 

  

[![](/web/20060530105545im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
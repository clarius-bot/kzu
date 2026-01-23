---
layout: post
title: "Daniel Cazzulino"
date: 2005-11-11 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : NUnit 2.2 for .NET v2.0 RTM

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| [1](http://clariusconsulting.net/blogs/kzu/archive/2005/11/1.aspx "1 Post")| 2| 3| 4| 5| 6  
7| 8| 9| 10| [11](http://clariusconsulting.net/blogs/kzu/archive/2005/11/11.aspx "1 Post")| 12| 13  
14| 15| 16| 17| [18](http://clariusconsulting.net/blogs/kzu/archive/2005/11/18.aspx "2 Posts")| 19| 20  
21| 22| 23| 24| [25](http://clariusconsulting.net/blogs/kzu/archive/2005/11/25.aspx "1 Post")| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060515091304im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## NUnit 2.2 for .NET v2.0 RTM 

I've modified the public MSI with the [Orca](http://support.microsoft.com/default.aspx?scid=kb;EN-US;255905) tool so that it installs in any version of .NET (which runs fine and is supported anyways...). So [go download](http://aspnet2.com/NUnit-2.2.0.msi) it and enjoy doing TDD ;).

Update: I forgot to mention that after installation, you must open the nunit-gui.exe.config and nunit-console.exe.config and replace the `<startup>` element with:
    
    
      <startup>  
       <requiredRuntime version="v2.0.50727" />  
      </startup>  
     

posted on Friday, November 11, 2005 6:52 AM by [admin](http://clariusconsulting.net/user/Profile.aspx?UserID=1000)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/391.aspx) :: 

  

[![](/web/20060515091304im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
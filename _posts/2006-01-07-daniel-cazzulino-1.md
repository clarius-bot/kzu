---
layout: post
title: "Daniel Cazzulino"
date: 2006-01-07 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : XInclude breaks VS 2005 XML editor intellisense

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| 1| 2| 3| 4  
5| [6](http://clariusconsulting.net/blogs/kzu/archive/2006/1/6.aspx "3 Posts")| [7](http://clariusconsulting.net/blogs/kzu/archive/2006/1/7.aspx "2 Posts")| 8| 9| 10| 11  
[12](http://clariusconsulting.net/blogs/kzu/archive/2006/1/12.aspx "2 Posts")| [13](http://clariusconsulting.net/blogs/kzu/archive/2006/1/13.aspx "1 Post")| 14| 15| 16| 17| 18  
19| 20| 21| 22| 23| 24| 25  
26| 27| 28| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060220124440im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## XInclude breaks VS 2005 XML editor intellisense 

A while back I've reported as a [bug that VS XML editor breaks if you use XInclude elements](http://lab.msdn.microsoft.com/productfeedback/viewfeedback.aspx?feedbackid=FDBK42576) in the document. You may ask: "who cares? .NET does not support XInclude anyway!". It just so happens that the recently released version of the [Guidance Automation Extensions (GAX)](http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/) include the [Mvp.Xml library](http://www.xmlmvp.org/), which adds support for [XInclude](http://www.w3.org/TR/xinclude/) in your guidance package configuration file.

So, in order to benefit from the better manageability and modularity of you guidance package configuration, you have to pay the price of losing intellisense :(... As a workaround, you can keep a dummy XML file around in the solution that you use for authoring the recipe with full intellisense, before you split it in multiple files. However, once you need to start editing it, you're again stuck. I believe the added flexibility is worth the price anyway, but that's just me....(and I'm an XML MVP, so I may be biased ;))

posted on Saturday, January 07, 2006 11:48 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/431.aspx) :: 

  

![](/web/20060220124440im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
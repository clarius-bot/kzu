---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-20 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Secondary disk performance on laptop (for virtual machine working)

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| [1](http://clariusconsulting.net/blogs/kzu/archive/2006/2/1.aspx "1 Post")| 2| 3| 4| 5| 6  
7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2006/2/9.aspx "1 Post")| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2006/2/12.aspx "1 Post")| 13  
14| 15| 16| 17| 18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2006/2/20.aspx "1 Post")  
21| 22| 23| 24| 25| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060514220124im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Secondary disk performance on laptop (for virtual machine working) 

I was trying to determine the best setup for a secondary disk to use to work with a [virtual machine](http://vmware.com/ "VMWare") (VM), which is a must in order to have the development experience inside the VM be almost on a pair with developing on the host machine (without the risks of screwing your machine with betas, etc.). 

I have the usual [Hitachi Travelstar 7K60](http://www.hitachigst.com/portal/site/en/menuitem.c8c3966a526cfb5deb4703e3aac4f0a0/) (7200rpm, 60gb), pretty much the only 7200rpm option about a year ago. And lately I bought a [Seagate Momentus 5400.2](http://www.seagate.com/products/notebook/momentus.html) (5400rpm, 120gb) with the idea that even if it’s slower, I may use it to keep backups of VMs, music, etc.

I had some doubts regarding my [Thinkpad T43p](http://www5.pc.ibm.com/us/products.nsf/$wwwPartNumLookup/_2668G1U) UltraBay performance for the disk. At some point, I felt putting the disk in the UltraBay was slower than using it with the external USB enclosure. So I run some tests with the two disks in USB and UltraBay configuration, using the [PerformanceTest 6.0](http://www.passmark.com/products/pt.htm) software from [PassMark](http://www.passmark.com/), which is supposedly pretty good at testing various performance indicators. 

Results were surprising:

[![Click for bigger image](https://web.archive.org/web/20060514220124im_/http://aspnet2.com/kzu/weblog/HD_Performance-small.png)](http://aspnet2.com/kzu/weblog/HD_Performance.png)

In a nutshell

  * A secondary disk in the UltraBay outperforms USB2 consistently.
  * Hitachi Travestar 7k60 is showing its age, and even the “slower” Seagate Momentus 5400rpm outperforms it consistently by a substantial margin.

So disks switched roles now: 5400rpm for VMs, older 7200rpm for music/backups :o) 

posted on Monday, February 20, 2006 8:46 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/470.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/02/20/LaptopHDPerformance.aspx#478 "permalink") re: Secondary disk performance on laptop (for virtual machine working) @ Thursday, March 09, 2006 5:14 AM

Back in school they taught us the formula to calculate the perf of a disk but I can’t remember it by heart now (I had to in those day). What I do remember is that the most important feature in a disk are the seek time and the cache, not the RPM. So maybe that was the difference maybe not [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[alex jack](http://clariusconsulting.net/utility/Redirect.aspx?U=http://staff.southworks.net/alejack/ "Anonymous")

  

[![](/web/20060514220124im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
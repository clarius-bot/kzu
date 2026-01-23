---
layout: post
title: "Daniel Cazzulino"
date: 2004-10-07 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Breathing TDD: learning to distrust yourself

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))| August 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2435'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2004/10/4.aspx "1 Post")| 5  
6| [7](http://clariusconsulting.net/blogs/kzu/archive/2004/10/7.aspx "1 Post")| 8| 9| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/10/12.aspx "1 Post")  
13| 14| 15| 16| 17| 18| 19  
20| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21.aspx "4 Posts")| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/10/23.aspx "1 Post")| 24| 25| 26  
27| 28| 29| 30| 31| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060829211649im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Breathing TDD: learning to distrust yourself 

The more I use Test Driven Development (TDD), the more I learn that I must not trust myself. You see, before TDD, I used to develop big chunks of applications, doing some minimal (relative to TDD approach) testing from the end-user perspective. This approach to app development assumes you trust yourself in the code you write, as you know what you're doing, right? Well, my experience (and a lot of other's too) tells me that a huge number of subtle and hard to repro/track bugs can result from this approach (specially if they happen deep inside your libraries). (not that I've discovered anything new, of course....)

The more time I spend using TDD, the less I trust in my coding. I've found and fixed lots of bugs in my code before even checking the code in the repository. So, unless I have some NUnit tests that tell me from **outside** my code (the code I'll deliver for production, actually) that what I did actually works as expected, I do not consider the code to be trustworthy. Initially, it seems as it slows down your productivity, as I tend to spend an equal amount of time writing tests as writing the actual features. But in the long term, the code is much more robust and stable, and you can always do some refactoring without risking the entire project. The tests ensure you don't break other parts of the product.

If you're not doing TDD yet, you're really missing something...

posted on Thursday, October 07, 2004 7:23 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/294.aspx) :: 

  

[![](/web/20060829211649im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
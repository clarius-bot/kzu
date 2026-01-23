---
layout: post
title: "Daniel Cazzulino's Blog : Locating the active item in the solution explorer"
date: 2008-04-18 00:00:00 +0000
---

Daniel Cazzulino's Blog : Locating the active item in the solution explorer


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2982'\))| April 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3043'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| [7](http://www.clariusconsulting.net/blogs/kzu/archive/2008/4/7.aspx "2 Posts")| 8| 9| 10| 11| 12  
13| 14| 15| 16| 17| [18](http://www.clariusconsulting.net/blogs/kzu/archive/2008/4/18.aspx "2 Posts")| 19  
20| 21| 22| 23| 24| 25| 26  
27| 28| 29| 30| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080421221036im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080421221036im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080421221036im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080421221036im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Locating the active item in the solution explorer 

Say you are working with a code file. At some point, you "Go To Definition" of another type, and now you have its code file opened. Or maybe you just run the solution to debug a weird issue that's happening, turn on "break when exception is thrown" option, and just when the exception is thrown, Visual Studio gets activated, and you get the relevant code file opened at the appropriate location.

Now, say you have a typical solution, which contains solution folders and many projects. Can you quickly locate the project/folder where the file is?

![image](https://web.archive.org/web/20080421221036im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image.png)

I've found that MOST developers simply go fishing for the file, or look at the file path and pray the solution folders actually match physical folders so they can manually traverse it, etc. Turns out there's a much better alternative, which is to turn on "Track Active Item in Solution Explorer" under Tools > Options > Projects and Solutions:

![image](https://web.archive.org/web/20080421221036im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image_3.png)

Now after clicking OK, the solution explorer is automatically expanded and the proper node selected:

![image](https://web.archive.org/web/20080421221036im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image_4.png)

Much better, right?

Well, turns out that I'm pretty darn sure this option was ON by default in VS2002 and maybe even 2003. I [reported this back in 2005](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=105637 "Make "Trake Active Item in Solution Explorer" be enabled by default") with a suggestion to turn it on by default again. It was resolved "By Design": 

> ...due to a significant amount of customer feedback we've received. The concern that people were raising about having this option enabled by default was that there were certain scenarios where there was a performance hit. 

Well, I tried it with the certainly big Enterprise Library 3.1 solution (no unit tests), which contains 38 projects with 1867 files in 1136 folders and haven't noticed any significant issue associated with enabling that option.

If you think the usability improvements from having this option on surpass the remote chance that in certain scenarios there may be a performance hit (?), please go and [vote to get it fixed](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=105637 "Make "Trake Active Item in Solution Explorer" be enabled by default"). Believe me, [we CAN make it change](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/ForthosethatthinkMicrosoftConnectisuseless.aspx "For those that think Microsoft Connect is useless"). I'm going to reopen the bug if there are significantly new voters.

posted on Friday, April 18, 2008 1:44 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/59922.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/Locatingtheactiveiteminthesolutionexplorer.aspx#59928 "permalink") Locating the active item in the solution explorer @ Friday, April 18, 2008 2:08 AM

Say you are working with a code file. At some point, you &amp;quot;Go To Definition&amp;quot; of another type [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/04/18/locating-the-active-item-in-the-solution-explorer.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/Locatingtheactiveiteminthesolutionexplorer.aspx#59968 "permalink") Locating the active item in the solution explorer @ Friday, April 18, 2008 6:34 AM

You've been kicked (a good thing) - Trackback from DotNetKicks.com [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.dotnetkicks.com/visualstudio/Locating_the_active_item_in_the_solution_explorer "TrackBack")

  

[![](/web/20080421221036im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
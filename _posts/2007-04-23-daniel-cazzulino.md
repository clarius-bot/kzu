---
layout: post
title: "Daniel Cazzulino"
date: 2007-04-23 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, July 01, 2005 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2616'\))| April 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2677'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 29| 30| 31  
[1](http://www.clariusconsulting.net/blogs/kzu/archive/2005/7/1.aspx "3 Posts")| 2| 3| 4| 5| 6| 7  
[8](http://www.clariusconsulting.net/blogs/kzu/archive/2005/7/8.aspx "2 Posts")| 9| 10| 11| 12| 13| 14  
15| 16| 17| 18| 19| 20| 21  
[22](http://www.clariusconsulting.net/blogs/kzu/archive/2005/7/22.aspx "1 Post")| 23| 24| 25| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2005/7/26.aspx "2 Posts")| [27](http://www.clariusconsulting.net/blogs/kzu/archive/2005/7/27.aspx "1 Post")| [28](http://www.clariusconsulting.net/blogs/kzu/archive/2005/7/28.aspx "2 Posts")  
29| 30| 1| 2| 3| 4| 5  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070423215515im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Friday, July 01, 2005 - Posts

#####  [How to show commands in a web project command bar](http://www.clariusconsulting.net/blogs/kzu/archive/2005/07/01/GATWebProjectCommandBar.aspx)

In the good old days of Everett (VS 2003), all project kinds, either web, win, class library, etc, shared the same command bar. You could put a command in all of them at once just by adding to that one. Nowadays, web projects (Venus) no longer use the C#/VB project systems. Hence, your commands in projects that were supposed to appear on web projects too, will certainly dissapear.   
  
In [GAT](http://lab.msdn.microsoft.com/teamsystem/workshop/gat/), you specify the command bar you want a command to appear, as follows:  

    
    
    <CommandBar Name="Project" />

  
The supported named command bars are just a subset, and nothing more than a facility to the guidance package author. In reallity, they are just shorcuts for the real GUIDs and IDs of the package and command bar respectively. And you can pass those two values instead of a name. For web projects, you specifically use:  

    
    
     <CommandBar ID="1136" Guid="d309f791-903f-11d0-9efc-00a0c911004f"/>

  
That will make a recipe appear in the context menu of a web project.  
  

posted [Friday, July 01, 2005 5:06 PM](http://www.clariusconsulting.net/blogs/kzu/archive/2005/07/01/GATWebProjectCommandBar.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

#####  [Composite UI Application Block is out!](http://www.clariusconsulting.net/blogs/kzu/archive/2005/07/01/CABPR1.aspx)

Peter is much more elocuent than me, so [I'll let you read his post with the announcement](http://www.peterprovost.org/archive/2005/06/30/5301.aspx). CAB is a very important step forward for developing rich client applications with good architectural design. Don't miss it if you're doing/planning to do any further WinForms development.  

posted [Friday, July 01, 2005 4:58 PM](http://www.clariusconsulting.net/blogs/kzu/archive/2005/07/01/CABPR1.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

#####  [ClariuS Rocks!](http://www.clariusconsulting.net/blogs/kzu/archive/2005/07/01/ClariusRocks2005.aspx)

For me, quite an impressive record in visibility for just over a year of life:  

  * [Chris Sell's Applied XML DevCon](http://www.sellsbrothers.com/conference/)
  * [TechEd 2005](http://www.msteched.com/)
  * [VSLive! 2005 (happening right now!!)](http://www.ftponline.com/conferences/vslive/2005/bo/asp-sessions.aspx)

And we also did a lot of coding, not just talking about it ;-). [You already saw some of it](http://lab.msdn.microsoft.com/teamsystem/workshop/gat/), there's much more coming!  

posted [Friday, July 01, 2005 12:51 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2005/07/01/ClariusRocks2005.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070423215515im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
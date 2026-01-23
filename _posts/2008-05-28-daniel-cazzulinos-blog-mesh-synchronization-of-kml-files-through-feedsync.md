---
layout: post
title: "Daniel Cazzulino's Blog : Mesh synchronization of KML files through FeedSync"
date: 2008-05-28 00:00:00 +0000
---

Daniel Cazzulino's Blog : Mesh synchronization of KML files through FeedSync


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3043'\))| June 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3104'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
8| 9| 10| 11| 12| 13| 14  
15| 16| 17| [18](http://www.clariusconsulting.net/blogs/kzu/archive/2008/5/18.aspx "1 Post")| 19| 20| 21  
22| 23| 24| 25| 26| 27| [28](http://www.clariusconsulting.net/blogs/kzu/archive/2008/5/28.aspx "1 Post")  
29| 30| 1| 2| 3| 4| 5  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080603044808im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

[![](https://web.archive.org/web/20080603044808im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080603044808im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080603044808im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Mesh synchronization of KML files through FeedSync 

We've been working for the past few days on a [mesh4x](http://mesh4x.org/) adapter that can synchronize a potentially big KML file at a very granular level (styles, placemarks, folders, etc.) so that you can collaboratively edit these large files without having to resolve spurious "conflicts".

From [Ed's blog post](http://edjez.instedd.org/2008/05/build-maps-collaboratively-with-new.html): 

> This could be synchronized peer-to-peer (a KML on your disk to a KML on a USB drive or someone else's box) as well as via a 'cloud' web service. Note this is changing the data inside the KML, it is **not just 'file sharing'**. The adapter knows about KML and keeps track of versions of fine-grained elements (pushpins, placemarks, polygons) inside the same file. It is an example of how a data mesh could be used to synchronize fine-grained data between applications.

**Update** : Read more [about the latest version](http://feeds.feedburner.com/%7Er/edjez/%7E3/297090861/improvements-to-mesh4x-kml-adapter.html) (including single-file storage, KMZ support, etc.).  

I believe this is one of the first instances of a mesh-style synchronization that really proves the point and possibilities of [FeedSync](http://feedsync.org/) and also [Live Mesh](http://mesh.com/). Something that [Joel Spolsky clearly didn't get](http://www.joelonsoftware.com/items/2008/05/01.html).

This technology is going to change the way we think about applications, data ownership and sharing. It's actually a pity that some people is focusing on the one * **sample** * application that Microsoft is showing (file/folder sharing) to evaluate it.

posted on Wednesday, May 28, 2008 2:14 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/05/28/MeshsynchronizationofKMLfilesthroughFeedSync.aspx#70818 "permalink") Mesh synchronization of KML files through FeedSync @ Wednesday, May 28, 2008 2:41 PM

We&amp;#39;ve been working for the past few days on a mesh4x adapter that can synchronize a potentially big [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/05/28/mesh-synchronization-of-kml-files-through-feedsync.aspx "TrackBack")

  

[![](/web/20080603044808im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog : Freeing up data and collaboration via the mesh"
date: 2009-03-05 00:00:00 +0000
---

Daniel Cazzulino's Blog : Freeing up data and collaboration via the mesh

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20100123102448im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100123102448im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100123102448im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100123102448im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100123102448im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100123102448im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

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

## Freeing up data and collaboration via the mesh 

Last weekend, during the [ALT.NET Seattle](http://altnetseattle.pbwiki.com/) conference, I spoke for quite a while with [Miguel de Icaza](http://tirania.org/blog/) on the work [we're](http://clariusconsulting.net/) doing with [InSTEDD](http://instedd.org/) in the area of data synchronization. He was very excited, and wondered how come this wasn't more broadly known. 

I realized that I hadn't [blogged about it in a while](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/29/62598.aspx), and it seems to me that this seemingly niche technology isn't getting the broad publicity it deserves. So I'll try to explain in simple terms what it is, and why it matters in many, many scenarios.

Imagine you have an application (mobile or desktop), which can be partially connected, and needs to synchronize data with a server, bi-directionally. That's not very innovative or disruptive, is it? Of course NOT. We have been doing this with various degrees of success and complexity for years.

What IS new, is that this time around we're not in front of a one-off, proprietary solution (more on that below). Also, there are many scenarios where the synchronization is not client-server, but true peer-to-peer: imagine doctors collecting disease reporting information, and sharing that with other doctors in the same area, but also with a central authority, which happens to just be one more node in the mesh. And what's also new

Such a scenario was implemented by contributing the [mesh4x.org](http://mesh4x.org/) stack and the necessary plug-ins to the [JavaROSA](http://www.openrosa.org/index.php/javarosa) project. We also enabled such a scenario for the National Center for Public Health Informatics, [US CDC](http://www.cdc.gov/), whose Director mentioned Mesh4x as one three key disruptive new technologies.

[Eduardo Jezierski](http://edjez.instedd.org/) has an extensive [for-geeks-only explanation on the whole Mesh4x vision and architecture](http://edjez.instedd.org/2008/12/for-geeks-progress-on-mesh4x-cloud.html), which you will surely find interesting.

## How

Sync technologies have existed before. What's unique (I think) about Mesh4x is that it's based on an open specification that defines not only the wire format for these sync exchanges between nodes, but also the accompanying algorithm to detect conflicts in a consistent manner throughout the mesh. This specification is [FeedSync](http://feedsync.org/), which is also embraced by Live Mesh, Sync Framework, etc. Mesh4x is an open source implementation of the specification, plus a set of adapters that expose data from multiple disparate data stores as a feedsync-compatible stream (i.e. MySQL, Excel, Access, SQL Server, KML files, whatever).

The importance of this adapter-driven approach is that instead of developing one-off sync strategies for every app/product you build, you only need ONE adapter per store TYPE (i.e. MySQL adapter will happily handle ANY such database). This frees you to focus on your value add, rather than the specifics of the not-so-simple problem domain of two-way sync.

The coolest feature ever, IMO, is the one that allows you to sync any adapter/data source with any other endpoint (which in turn may be any other adapter/data source) over [plain ***SMS*** without any kind of data/internet connection](http://edjez.instedd.org/2008/06/mesh4x-sms-adapter-sync-data-without.html). Just let that sink in your mind for a sec: we have a compressed, highly optimized, diff-based mechanism to sync ANY data source with ANY other data source over SMS (i.e. Access with MySQL over SMS, etc.), and this works TWO WAYS. (we do have HTTP-based sync too, of course!)

![kind of like this](https://web.archive.org/web/20100123102448im_/http://lh4.ggpht.com/edujez/SO-xHeELQ9I/AAAAAAAAAMQ/kaqQSEUKUmg/image_thumb%5B29%5D.png?imgmax=800)

[Marcelo Tondato](http://jtondato.clariusconsulting.net/) has been the brain and dev behind these awesome features.

The main driving force for Mesh4x at this point is the work in the early detection and disaster response, part of [InSTEDD](http://instedd.org/)'s charter, but this technology applies to a wide range of scenarios. It's extremely exciting stuff, which is still providing real value right now, while at the same time evolving to include more and more features and scenarios. 

Head over to [http://mesh4x.org](http://mesh4x.org/) to give these guys feedback or learn more about the feature!

posted on Thursday, March 05, 2009 4:05 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/05/Freeingupdataandcollaborationviathemesh.aspx#119923 "permalink") Freeing up data and collaboration via the mesh @ Thursday, March 05, 2009 4:39 PM

Last weekend, during the ALT.NET Seattle conference, I spoke for quite a while with Miguel de Icaza on [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2009/03/05/freeing-up-data-and-collaboration-via-the-mesh.aspx "TrackBack")

  

[![](/web/20100123102448im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
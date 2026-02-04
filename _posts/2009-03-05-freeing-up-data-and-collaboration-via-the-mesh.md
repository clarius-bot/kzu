---
layout: post
title: "Daniel Cazzulino's Blog - Freeing up data and collaboration via the mesh"
date: 2009-03-05 00:00:00 +0000
---

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

/kzu

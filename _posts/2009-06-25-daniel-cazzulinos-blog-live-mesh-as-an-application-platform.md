---
layout: post
title: "Daniel Cazzulino's Blog : Live Mesh as an application platform"
date: 2009-06-25 00:00:00 +0000
---

Daniel Cazzulino's Blog : Live Mesh as an application platform

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20090629230722im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090629230722im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20090629230722im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20090629230722im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090629230722im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090629230722im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Live Mesh as an application platform 

## The potential

You surely read quite a bit about Live Mesh. [Oran Dennison](http://orand.blogspot.com/) has number of very technical and insightful posts on various aspects of the underlying platform.

Recently, we run an internal prototype to build an application on top of Live Mesh. I’m not talking about the kind of the typically showcased consumer-centric application where it’s all about sharing my personal photos, apps and videos with friends and family. I’m talking about a typical app for collaboration, involving group discussions (conversation-oriented like gmail), chat and shared calendar. Think about the aspects of Groove that are missing today from Live Mesh :).

The benefits of building an application on top of Live Mesh infrastructure are compelling:

  1. Built-in authentication, authorization and membership/account management via Live IDs 
  2. Built-in transparent offline support (programming against the local Live Operating Environment is the same as for the cloud one) 
  3. Automatic synchronization across nodes/users, with built-in conflict detection and preservation (which is different than conflict *resolution*, which is typically application-specific) 

All these you’d have to build yourself if you were to develop an app requiring offline support. And compared to the other offerings such as Astoria Offline, Live Mesh certainly seems to be the one ahead of the crowd in terms of maturity.

With such an infrastructure in place, surely to be included sooner or later in every Windows box (with support for Mac and hopefully ported to Linux maybe via [http://mesh4x.org](http://mesh4x.org/)?), it could become the obvious choice for pretty much any application. You’d be using Live Mesh as a general purpose store for your data, like a database. Imagine not having to think about offline, synchronization, authentication and authorization ever again! It almost sounds too good to be true. 

In true Microsoft fashion, they have set to build a platform for all developers to leverage, not just a “file sync thinghy” like Dropbox, FolderShare or the myriad others. Being based on open standards (ATOM and FeedSync), it also allows others to join the platform and clears the doubts regarding vendor lock-in: you own the data, and it’s readily available for you to consume via a standard and documented API and format.

### Social Applications

A somewhat less evident benefit of the platform is the ability to incorporate social networking capabilities right inside the application. Rather than going to a social network site/app to tell your friends which movies you liked, just rank the movie from within the player when you’re done watching it: all your friends using the same app can not only receive the rank but also know what you’re watching *right-now*. 

Same principle applies to any application, where you could start ad-hoc collaboration with other users based on the current activity (i.e. we’re all filling out a form and you’re having a problem understanding something: you could just ask the other users who are working on the same form, or who have just completed it successfully), and even perform some of those together, such as browsing, authoring a document, etc. If you add the live mesh remote desktop functionality in the mix, you can imagine some very interesting possibilities.

So far, Live Mesh hasn’t introduced the concepts of networks and friends. Invites are for any Live ID user, regardless of whether they are in my contacts list or not. And it’s good that they haven’t mixed the two things at this point. We can share an application/Mesh object without being “friends” (we’re not in each other’s Messenger contact list). Over time, it would be interesting to allow the application developer to leverage something more social networking-oriented, such as inviting “my family” or “my coworkers” to share an application. I think this will eventually come to the platform, as the concept of groups in Live Messenger has silently evolved quite a bit, but they already have enough on their plate to work on for now.

## 

## The current shortcomings

The prototype didn’t end up very well, unfortunately. A number of limitations of the current (as of Apr 2009) Live Framework CTP prevent it from being used for general purpose client application development (I have no idea of mesh-enabled web application scenarios).

As a believer on the usefulness of reporting suggestions and bugs to Microsoft via [Connect](http://connect.microsoft.com/), each issue is followed by a link for you to vote if you think it’s important to get it fixed.

### Invitations

First and foremost, there is a serious problem with the way invitations work: there is simply NO way for an application to accept invites, and currently the only way is to get an invitation *email* in your inbox with a link to your (web) live desktop site where you can accept the invitation. This is totally unacceptable for most applications. If we’re both using the same live mesh-powered application, and you invite me to share some data for it (in our prototype case, I could be invited to a discussion group), the obvious thing would be for me to receive a notification *in the application* that I’ve been invited, and be able to accept it right from there. Alternatively, I could receive the invitation via the Live Mesh notifier tray icon, and accept it from there too. Either way would work, but the current approach is simply impractical. Moreover, the UI says you’ve been invited to a “Live Mesh Folder”, which is totally misleading as accepting the invitation takes you to the live mesh desktop UI where nothing new seems to have happened after accepting (‘cause there’s no new folder to show!). I believe this to be a drawback of focusing too much on the file sharing “sample app” (I still believe Microsoft should open source it and use it as a showcase of what great things you can do on top of Live Mesh, but it should still be just another regular citizen in the mesh, with no more privileges as my own apps).

### Generic Data Store

In order for Live Mesh to succeed as an application platform that you rely on to replace your typical database, it has to provide the same capabilities we’ve come to expect from them, and efficient and flexible querying is a critical part of it. Currently, even though Live Mesh allows you to store custom data (i.e. your entities, albeit in a rather XML-ugly way) in the entries, rich querying over that data is impossible. It’s even impossible to query over custom attributes or elements at the item level if you decide to go with the low-level Syndication API way.

Beyond just XPath-like querying, I think Live Mesh as a generic store should provide a LINQ provider like Astoria does, so that you can work with your data at the domain/entity level, and let the infrastructure handle the serialization and storage (i.e. partition entities across feeds, ensure referential integrity, etc.). I doubt anyone wants to be writing queries over ATOM feeds once you’ve become addicted to LINQ querying.

### Online/Offline Inconsistencies

Even though API-wise it doesn’t matter whether you’re talking to the local LOE (Live Operating Environment) or the cloud LOE, the operations you can do vary in somewhat unpredictable (and certainly undocumented) ways. For example, you cannot create a MeshObject (the elemental unit of authorization and sharing) if you’re offline, or invite users, etc. 

In order to enable true offline apps, at the bare minimum the current inconsistencies need to be addressed.

It’s also unclear how authentication works (or doesn’t) when you’re offline, or how you can achieve peer-to-peer synchronization in the absence of internet connectivity.

## Conclusions

I remain excited by Live Mesh possibilities. I think it will be a game changer, and it will play an increasingly important role as a general purpose application platform. It won’t achieve all that overnight, and it will take a couple of revs to get the platform there. 

I wouldn’t advise you to take a hard dependency on Live Mesh right-away. The Live Framework CTP is ahead of the public Live Mesh beta

posted on Thursday, June 25, 2009 9:02 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20090629230722im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
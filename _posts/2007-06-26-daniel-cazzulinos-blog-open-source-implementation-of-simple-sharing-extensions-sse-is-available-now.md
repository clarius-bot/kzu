---
layout: post
title: "Daniel Cazzulino's Blog : Open source implementation of Simple Sharing Extensions (SSE) is available now!"
date: 2007-06-26 00:00:00 +0000
---

## Open source implementation of Simple Sharing Extensions (SSE) is available now! 

SSE is an XML micro-format and corresponding sync algorithm that can be embedded in RSS or Atom feeds to allow for two-way synchronization among peers. More important: the algorithm allows for mesh-style synchronization between nodes, with no concept of a "master" copy. This can be game-changing for data-exchange and app-level data interop. But only the future will tell.

SSE was [initially announced](http://rayozzie.spaces.live.com/blog/cns!FB3017FBB9B2E142!175.entry?_c11_blogpart_blogpart=blogview&_c=blogpart#permalink) by [Ray Ozzie](http://rayozzie.spaces.live.com/blog/cns!FB3017FBB9B2E142!285.entry "Update on SSE from Ray") (Microsoft's CTO). [Ed Jeziersky](http://blogs.msdn.com/edjez/ "Ed Jeziersky's Blog") brought this technology to my attention (thanks Ed!), and I soon got pretty excited given its potential. It had been quite a success in [Strong Angel III](http://www.strongangel3.net/sse "Usage of SSE in Strong Angel III") too. 

You can learn more about SSE by watching the [MSDN TV video](http://msdn.microsoft.com/msdntv/episode.aspx?xml=episodes/en/20060330sseps/manifest.xml) and reading the [latest SSE spec](http://msdn2.microsoft.com/en-us/xml/bb510102.aspx) and links above.

So I started working on an open-source implementation I got very good synergy from [Steven Lees](http://blogs.msdn.com/stevenlees/default.aspx), [Paresh Suthar](http://psuthar.spaces.live.com/) and the rest of Ray Ozzie's [Concept Development Team](http://www.google.com/search?hl=en&q=ray%20ozzie%20concept%20development%20team). It's great to see Microsoft so supportive of open source projects :D (I guess most people don't realize there's a grassroots "revolution" going on in that aspect inside Microsoft... see what's happening with the [DLR](http://blogs.msdn.com/hugunin/archive/2007/04/30/a-dynamic-language-runtime-dlr.aspx), [ASP.NET](http://www.microsoft.com/downloads/details.aspx?FamilyID=ef2c1acc-051a-4fe6-ad72-f3bed8623b43&displaylang=en), etc.).

I'm glad to announce that the first beta release of the open-source [SimpleSharing.NET](http://simplesharing.net/) library is [available for download now](http://www.codeplex.com/sse/Release/ProjectReleases.aspx?ReleaseId=5301). Right now, it has 83% code coverage through unit tests so I'm quite confident on its quality :) 

What can you do with the library right now?

  * Create an adapter (repository) that talks to your underlying application data/business objects (your CRM system, data-entry app, whatever) 
  * Export RSS feeds with synchronization information embeeded for merging with other feeds 
  * Import RSS feeds from other peers 
  * Synchronize a local feed via HTTP with a server feed 
  * Do all this without changing any code in your app: this makes for a hassle-free way to add import/export/sync functionality to your application

The SSE spec takes care of defining a standard algorithm for detecting conflicts and updates in a merge operation, as well as the behavior for deleted and created items. This makes for a predictable behavior regardless of the actual implementation technology. 

I created this library with the following goals in mind:

  * Have a minimal library that can be easily extended with adapters to accomodate simple synchronization scenarios 
  * Provide a full .NET as well as .NET Compact Framework implementation 
  * Interop with other SSE implementations as they come along 
  * Allow in a future version to synchronize weblog feeds across multiple disparate engines (should be very helpful for people moving from a hosted service such as weblogs.asp.net to a self-hosted environment that want to avoid losing the traffic from the old site)

The following are non-goals:

  * Provide a full-blown and highly optimized synchronization engine (i.e., you can hardly use it for full database merge/replication, complex data/binary payload sync, etc.) 
  * Provide a server-side story 
  * Provide a service to periodically perform sync with a server and manage jobs (this means you have to manually sync from your app using the exposed SyncEngine API)

Included in the download is a sample application that is a very simple Customer CRUD application that provides a custom adapter to import/export feeds using its internal data-access component (so show how the adapter component can indeed be implemented on top of existing application components), and which syncs with a simple ASMX webservice via HTTP. This sample application uses a [SQL Compact Edition](http://www.microsoft.com/downloads/details.aspx?FamilyId=%2085E0C3CE-3FA1-453A-8CE9-AF6CA20946C3&displaylang=en) database, so you'll need to install it, as well as the [SQL Compact Edition Tools for VS 2005](http://www.microsoft.com/downloads/details.aspx?FamilyId=877C0ADC-0347-4A47-B842-58FB71D159AC&displaylang=en). If you don't want to, just exclude the Samples solution folder from the solution.

Feedback welcomed! (either comments here, or in [the user forum](http://www.codeplex.com/sse/Thread/List.aspx))

posted on Tuesday, June 26, 2007 8:30 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

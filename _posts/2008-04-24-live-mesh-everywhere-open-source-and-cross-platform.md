---
layout: post
title: "Daniel Cazzulino's Blog - Live Mesh Everywhere: open source and cross-platform"
date: 2008-04-24 00:00:00 +0000
---

## Live Mesh Everywhere: open source and cross-platform 

You have probably read or [listened](http://channel9.msdn.com/showpost.aspx?postid=399578 "Ray Ozzie's Live Mesh Overview video") all the (maybe a bit vague) information about the [Mesh Operating Environment](http://www.google.com/search?hl=en&q=mesh+operating+environment&btnG=Search "MOE Google Search") (MOE): a platform that will allow multiple applications and devices to participate in the [Live Mesh](http://www.google.com/search?hl=en&q=microsoft%20live%20mesh "Live Mesh Google Search"). 

Let's get to the more technical details now, and leave the end-user marketing to someone else ;). 

At the core of Live Mesh is [FeedSync](http://feedsync.org/), a public spec by Microsoft, [evolved from](http://en.wikipedia.org/wiki/Simple_Sharing_Extensions) the ["old" days of SSE](http://msdn2.microsoft.com/en-us/xml/bb510102.aspx). It didn't get its deserved attention IMO back in the day, even though you could put together the pieces from Ray's announcement and later adoption by other products and figure out Live Mesh was coming sooner or later. [Ed Jezierski](http://edjez.instedd.org/) got me interested in it WAY back, and as a result, I created the [first open source implementation](http://www.codeplex.com/sse "SimpleSharing @ CodePlex") of the spec. 

To understand its importance you need to first understand what FeedSync is. The most succinct definition I could come up with is: 

> _FeedSync is a definition of a versioning header (or metadata) and its associated creation, update and deletion behavior as well as a generic conflict detection algorithm based on it, which can be attached to an arbitrary piece of data._

The interesting part of it, as you are probably realizing already, is NOT the XML microformat itself, or its representation in an RSS/Atom feed, but rather the behavior and semantics associated with it, which you can rely on to be present at compliant endpoints. 

The specification defines the behavior for merging (arguably the most important one) data between two "feeds" (think of these as "streams of data with associated versioning header/metadata") in a consistent manner. It's two-way sync for the masses. 

Of course, specs without implementations are seldom of any use. Microsoft is providing their own with the [Microsoft Synchronization Framework](http://msdn2.microsoft.com/en-us/sync/default.aspx) (which does other things in addition to supporting FeedSync), and now Live Mesh. But nothing forbids the community from building compliant cross-platform open source alternative implementations. 

Being an open source fan myself, and being lucky enough to work for an [organization whose goal is to produce open source software to help in the humanitarian space](http://instedd.org/), I'm glad to announce that we have already been working actively in this space, and we just released early versions of our ongoing projects at [Google Code](http://code.google.com/p/mesh4x/). 

## 

## Mesh for X

Or Mesh4x for "short", is an umbrella project by [InSTEDD](http://instedd.org/) under which we're producing Mesh4j and Mesh4n (Java and .NET respectively) versions of a unified implementation and library design/API for FeedSync synchronization between arbitrary repositories of data (i.e. databases, files, spreadsheets, etc.). We may very well come up with Mesh4py (Phyton), Mesh4r (Ruby) or whatever we or the community need to satisfy data synchronization scenarios. 

The Mesh4n version is coming straight from its old place in CodePlex, but you expect it to evolve together with the Mesh4j version. Our goal is to keep feature-parity on both. This version of FeedSync for .NET is being used by [Microsoft Humanitarian Systems](http://www.strongangel3.net/mhs) (MHS) in Afganistan to synchronize disparate data sources in extreme and low connectivity conditions as mentioned by [Ted Okada](http://blog.jonudell.net/2007/07/12/a-conversation-with-ted-okada-about-the-work-of-microsoft-humanitarian-systems/) (i.e. to achieve two-way synchronization of disconnected Access databases, Excel files and plain RSS files on a pendrive, between any of them!). 

At this time, both libraries provide the basic synchronization algorithm and Sync (metadata) data model, as well as the core interfaces to create your own repository adapters to expose data from arbitrary sources for FeedSync synchronization. We'll be building concrete repository adapters during the next few weeks. The most interesting one for me is the Mobile repository, which should allow you to sync two repositories over cellphones, without cellphone internet connection or even a data plan (which needless to say is not very frequent in the under-developed or even developing world). 

We'll also be looking for refactoring opportunities to simplify certain scenarios and accomodate the future roadmap for FeedSync. 

Some people have argued this is just another consumer-oriented Microsoft-thinghy that will hardly make a difference in anything. I believe that's a mistake, as it's ignoring the underpinning technology, the fact that it's a public specification, and that it can be applied to really free the data once and for all, regardless of platform, application, format, language, etc. This is the very reason I'm not excited at all by all the [Atom Publishing Protocol](http://en.wikipedia.org/wiki/Atom_%28standard%29 "Wikipedia on Atom")[fuss that's happening](http://www.infoq.com/news/2008/03/microsoft-atompub)[these](http://www.25hoursaday.com/weblog/2008/02/28/WindowsLivePlatformNewsMicrosoftStandardizesOnAtomPubForWebServicesAndOtherStories.aspx)[days](http://blogs.msdn.com/astoriateam/archive/2008/02/13/atompub-support-in-the-ado-net-data-services-framework.aspx). Web 2.0/AJAX + APP is SO client-server... but that's for another post, another day. 

Stay tunned as I'll be posting more detailed (and practical) information about Mesh4x in the coming weeks, as well as the cool stuff we're doing with [InSTEDD](http://instedd.org/) as part of its [goal of helping in the humanitarian space by applying technology](http://instedd.org/about).  

/kzu

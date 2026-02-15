---
layout: post
title: Mesh synchronization of KML files through FeedSync
date: 2008-05-28 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/mesh-synchronization-of-kml-files-through-feedsync
tags:
- .NET
- All Technology
- Mesh

---

We've been working for the past few days on a [mesh4x](http://mesh4x.org/) adapter that can synchronize a potentially big KML file at a very granular level (styles, placemarks, folders, etc.) so that you can collaboratively edit these large files without having to resolve spurious "conflicts".

From [Ed's blog post](http://edjez.instedd.org/2008/05/build-maps-collaboratively-with-new.html): 

> This could be synchronized peer-to-peer (a KML on your disk to a KML on a USB drive or someone else's box) as well as via a 'cloud' web service. Note this is changing the data inside the KML, it is **not just 'file sharing'**. The adapter knows about KML and keeps track of versions of fine-grained elements (pushpins, placemarks, polygons) inside the same file. It is an example of how a data mesh could be used to synchronize fine-grained data between applications.

**Update** : Read more [about the latest version](http://feeds.feedburner.com/%7Er/edjez/%7E3/297090861/improvements-to-mesh4x-kml-adapter.html) (including single-file storage, KMZ support, etc.).  

I believe this is one of the first instances of a mesh-style synchronization that really proves the point and possibilities of [FeedSync](http://feedsync.org/) and also [Live Mesh](http://mesh.com/). Something that [Joel Spolsky clearly didn't get](http://www.joelonsoftware.com/items/2008/05/01.html).

This technology is going to change the way we think about applications, data ownership and sharing. It's actually a pity that some people is focusing on the one * **sample** * application that Microsoft is showing (file/folder sharing) to evaluate it.

/kzu

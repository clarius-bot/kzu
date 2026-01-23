---
layout: post
title: "Daniel Cazzulino's Blog : Funq: applying TDD to build a dependency injection container you can understand"
date: 2009-01-30 00:00:00 +0000
---

## Funq: applying TDD to build a dependency injection container you can understand 

I'm planning to record a series of screencasts which will serve as walk-throughs on how to apply TDD on a practical project consisting in building a full-featured and high-performance DI container which has two very explicit goal: minimalistic design and small footprint.

Both goals come from the requirements of the project I'm building this for: the upcoming version of the [patterns & practices](msdn.microsoft.com/practices) [Mobile Client Software Factory](http://www.codeplex.com/mobile). As I've tweeted in the past, the Compact Framework and constrained execution environment of a mobile device, place some requirements on anything you do there, but specially for something which can have a broad impact in performance as a DI container, which typically replaces most object lifecycle management throughout the codebase.

We learned the hard way that a DI container not designed up-front with those two goals in mind end up being practically unusable in a mobile device. Despite my arduous efforts to make ObjectBuilder v1.0 and CAB 1.0 perform well on .NET CF, truth is that the process was quite involved, not very well understood, somewhat esoteric and with profound and positive performance implications that didn't end up being sufficient nevertheless. I basically created a tool that could be invoked in a post-build process that would scan via reflection all the DI/CAB attributes in the target assembly, and generate a "strong-typed" assembly with all that information already extracted, ready to be consumed by a new strategy in ObjectBuilder that knew how to replace reflection-based setup with this new approach: obgen, it was called (following sgen, for ahead of time generation of XmlSerializer classes to speed up things too).

But at the time, we didn't make any architectural changes in ObjectBuilder or CAB itself, which ended up imposing a high cost in application startup time. Both tools were designed for desktop usage, and it showed up in the end.

This time, we won't try to fit a tool designed for a different purpose (i.e. Unity v2.0) into the new requirements. We'll rather do it the other way around, and we'll do it together, so that we can gather your feedback on it along the way.

The series will also serve as a good example, I think, on how TDD is done in practice (by me at least ;)), which might be interesting if you're looking for concrete examples in a rather interesting problem domain.

Funq is the code-name I'll be using for this project, which will be released (for the .NET CF) on Codeplex ([http://mobile.codeplex.com](http://mobile.codeplex.com/)) later on. A desktop/silverlight version is out of scope for p&p on this project, but it's something I might do on my own by forking it (I might keep the Funq name :)) while keeping it in full sync with the p&p release. 

posted on Friday, January 30, 2009 9:00 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

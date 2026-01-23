---
layout: post
title: "Daniel Cazzulino's Blog : Why Embedded Silverlight Makes Sense"
date: 2009-07-13 00:00:00 +0000
---

## Why Embedded Silverlight Makes Sense 

So Microsoft just [shipped Silverlight 3.0](http://weblogs.asp.net/scottgu/archive/2009/07/10/silverlight-3-released.aspx). Outstanding achievement in its own right for a company that takes multi-year cycles for pretty much every product, if you ask me.

Silverlight is indeed a very cool technology. With the latest additions and especially the HD media capabilities, it’s already ahead of the crowd that it started “emulating”. I want to see Silverlight further expanded in the following two scenarios:

  1. Replacement for Media Center XML language: who wants to learn yet another UI markup language? Deprecate it, move to Silverlight-only.
  2. Embedded chipset with built-in support for an “Silverlight Embedded” profile

### Replacement for Media Center

Currently, [Media Center uses its own markup language](http://weblogs.asp.net/scottgu/archive/2009/07/10/silverlight-3-released.aspx) and lacks tooling support that Silverlight/WPF enjoy (Blend/VisualStudio). It’s time to let it die and embrace Silverlight markup, even if that requires creating a “Silverlight Media Center” profile with a subset that must be supported by extenders.

### Embedded Silverlight is the key

This is IMO where the bigger opportunity lies (and it also powers the previous one). Right now, we’re starting to see pervasive DivX support even in DVD players. The main reason is the availability of [DivX certified chipsets](http://investors.divx.com/releasedetail.cfm?ReleaseID=210505) that OEMs can leverage to build [compelling and cheap products](http://www.amazon.com/Philips-DVP5992-1080p-Upscaling-Player/dp/B001AXBGZO). Imagine what would it be if Microsoft partnered with chipmakers (would love to see an AMD/ATI partnership) to ship certified “Silverlight Embedded Profile” chips that supported VC1 playback as well as some markup subset for the UI. Given that VC-1 is already being adopted for Blue-ray content, it wouldn’t be too crazy to imagine a scenario where Silverlight-driven interactive content could be also provided in such disks.

With pervasive and cheap chipsets (maybe they could also honor VC-1 profiles to reduce processing power requirements for lighter scenarios), you could even imagine interactive content becoming part of picture frames, TVs, set-top boxes, DVD players, etc. etc.

If they take the idea further enough, you could even envision a .NET MicroFramework-powered certified chip that could even run some .NET code alongside pure XAML markup… 

I’m telling you, Microsoft is on the verge of something BIG!

posted on Monday, July 13, 2009 10:03 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

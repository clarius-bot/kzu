---
layout: post
title: "Daniel Cazzulino's Blog : Why Windows Media Center is dead"
date: 2010-01-03 00:00:00 +0000
---

## Why Windows Media Center is dead 

Windows Media Center (WMC) is based on a relatively simple (albeit awfully implemented) principle: you have ONE "server" PC holding and running your media, and then you associate any number of Media Center Extenders to it that are typically (except for the XBox 360) single-purpose devices that can only act as such and are fancy and silent enough to deserve a place in your living room.

I guess back in 2005, the entire model and most of Microsoft design decisions on this product may have be justifiable. 5 years later, none of them make any sense and IMO mean that WMC is currently a totally flawed, doomed and generally useless product for most common needs.

## Why it (kind of) made sense back then

  * Hardware: In 2005, you wouldn't dare subject your family to the noise, ugliness, quirkiness, uex, power comsumption, and cost of a full-blown "Home Theater PC" (HTPC) or an XBox power sucker. The Media Center Extender model made sense because you couldn't buy a full PC that was silent and nice-looking enough for the price of an extender. (but the extenders weren't without [limitations either](http://linksys.custhelp.com/cgi-bin/linksys.cfg/php/enduser/std_adp.php?p_faqid=5085), a good review of it at the time at the [supersite](http://www.winsupersite.com/reviews/mce.asp))
  * The user experience is quite cool (but the extenders' lower processing profile meant their UI rendering capabilities were significantly worse)

## Why it doesn't make sense anymore

  * Hardware: nowadays you can buy a full blown PC, small, silent and power-efficient for [$199](http://www.newegg.com/Product/Product.aspx?Item=N82E16883103228)-[$249](http://configure.us.dell.com/dellstore/config.aspx?oc=ddcwua1&c=us&l=en&s=dhs&cs=19). Why would you want a crippled, single-purpose device when you can have the full power of a desktop, with the capability to play back any weird format you can possibly throw at it, provided you just install the right codec. No more hardware limitations and being stuck with an [obsolete device](http://www.linksysbycisco.com/US/en/products/DMA2200).
  * Software: back then, the Media Center team invented their own markup language to accommodate disparate rendering capabilities between a full PC, the XBox and a crippled extender. Nowadays we have WPF and Silverlight, no need to learn a new UI markup language. The extenders UI is sluggish at best, compared with what's possible in a PC with WPF/Silverlight.
  * OS: Windows 7 is a kick-ass operating system, with a ton of features. It's a snappy, sleek, touch-friendly, smart connected (i.e. "[Play To](http://thedigitallifestyle.com/cs/wikis/windows7/play-to-devices.aspx)"/[DLNA](http://dlna.org/), [HomeGroup](http://windowsteamblog.com/blogs/windowsexperience/archive/2008/10/28/how-libraries-amp-homegroup-work-together-in-windows-7.aspx), etc. etc.) platform. And it runs great on the smallest chips out there (it gave new life an 'old' Dell Mini 9 I had, for example). 
  * Home Server: having all your media in a "plain" PC is risky. You need to take care of backups, redundancy, fault-tolerance, etc. Today, it's a [no-brainer to buy a Windows Home Server](http://www.tomshardware.com/reviews/hp-mediasmart-server,2496-2.html) and let it manage all this for you, automatically, transparently, and just dead easily.

This combination makes [desktop media management](http://xbmc.org/) software a viable alternative and can certainly power your living room and projector. I believe we're at the beginning of a revolution in smart homes and connected media, just because of this new synergy and convergence.

If I had to start a project like that right now, I'd make it so that:

  * It runs full WPF on the HTPCs connected to every TV.
  * It supports a centralized repository for the entire house (which could be a regular PC or a Windows Home Server-WHS)
  * It has a built-in extensibility model based on some dependency injection technology (i.e. MEF), and *everything* including the core functionality is a plugin
  * It leverages WHS to provide mostly the same UI over the internet by leveraging Silverlight (single programming model for both), so that I can access all the same content from everywhere, and automatically takes advantage of [Smooth Streaming](http://www.iis.net/expand/SmoothStreaming) for videos.
  * It integrates with home security cameras and provides those both in the home (i.e. monitor the baby upstairs on a [PiP](http://en.wikipedia.org/wiki/Picture-in-picture) window) or via the web (i.e. watch my home while on vacations) leveraging [Live Smooth Streaming](http://www.iis.net/expand/LiveSmoothStreaming).
  * It empowers a huge plugin community that can create cool advanced features like face detection on photos and videos and security recordings, provide filtered views of those, map pictures with geocoding, provide a "home connection point" where a GPS could submit road trip info, etc. etc.

For now, I got my [Dell Zino HD](http://www.dell.com/us/en/corp/desktops/inspiron-zino-hd/pd.aspx?refid=inspiron-zino-hd&s=corp) (shipping soon) and I'm looking forward to selling the [assorted](http://www.linksysbycisco.com/US/en/products/DMA2200) [Frankenstein](http://www.amazon.com/LG-BD300-Network-Blu-ray-Player/dp/B001F5FI3S) [media](http://www.amazon.com/Hewlett-Packard-X280N-HP-MediaSmart-Connect/dp/B001AHLODY) setup I have right now. 

The future looks bright for the smart home :)

posted on Sunday, January 03, 2010 12:55 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

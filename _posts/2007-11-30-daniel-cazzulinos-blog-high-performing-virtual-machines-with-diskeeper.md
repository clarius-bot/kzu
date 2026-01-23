---
layout: post
title: "Daniel Cazzulino's Blog : High-performing virtual machines with Diskeeper"
date: 2007-11-30 00:00:00 +0000
---

Daniel Cazzulino's Blog : High-performing virtual machines with Diskeeper


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080907144852im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080907144852im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080907144852im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080907144852im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## High-performing virtual machines with Diskeeper 

One of the first things (if not THE first thing) I install on virtual machines (as well as the host) is Diskeeper. It really makes a noticeable difference on the performance of the VM, especially when compared to other VMs you use for quite some time without defrag'ing. VMs stress the hard drive a lot, so keeping it in good shape is a must for well performing VMs. 

I just noticed that the new Diskeeper 2008 is out, and it seems to have a few interesting new features:

> **InvisiTasking  
> ** A breakthrough technology that creates for truly transparent defragmentation. The innovative design pushes defragging to the background. And this new technology lets you thoroughly defrag your computer by only using untapped and idle resources.

Not sure how this one is different to the "Set it and forget it" it had before... sounds more like marketing stuff ;) 

> **Defrag in extreme conditions  
> ** Millions of fragments? Less than 1% free space? No problem. Diskeeper 2008 is specially designed to handle the harshest hard-drive situations.

Doesn't look like my typical usage scenario, but might be cool for other people. 

> **Intelligent software  
> ** Automatically constructs a defrag process around your specific needs. Recognizes memory use and automatically applies the most efficient defrag strategy for your PC.

Sounds like the defrag would be more aggressive the more free resources you have... sounds good, especially given that I have 4GB RAM for the times I've VMs open, but it's not all the time, so every now and then, I'd have tons of free RAM... 

> **I-FAASTT 2.0******(Intelligent File Access Acceleration Sequencing Technology)  
> Recognizes and opens up access to your most frequently requested files. Diskeeper 2008 will increase speeds to heavily-trafficked files by up to 80%.

This one looks good. Seems like a kind of "ReadyBoost" at the hard-drive level.

And it's definitely not an expensive product for the features you get. I love it. I'll [give it a try](http://consumer.diskeeper.com/downloads/Downloads.aspx?RId=11221&SId=1&CId=1&Aeid=0&Apid=PPS0002948) and let you know how it goes.

posted on Friday, November 30, 2007 10:50 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20080907144852im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
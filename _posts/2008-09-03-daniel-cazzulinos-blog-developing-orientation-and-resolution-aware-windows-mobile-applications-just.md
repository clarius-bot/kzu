---
layout: post
title: "Daniel Cazzulino's Blog : Developing orientation and resolution aware Windows Mobile applications just got a TON easier"
date: 2008-09-03 00:00:00 +0000
---

Daniel Cazzulino's Blog : Developing orientation and resolution aware Windows Mobile applications just got a TON easier


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080915101953im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080915101953im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080915101953im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080915101953im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Developing orientation and resolution aware Windows Mobile applications just got a TON easier 

Quite some time ago I posted about how we ([Clarius Consulting](http://clariusconsulting.net/) with [Microsoft Patterns & Practices](http://msdn.microsoft.com/practices)) [solved the multiple resolution/orientation problem](http://www.clariusconsulting.net/blogs/kzu/archive/2006/05/09/OrientationAwareIntroduction.aspx) for Windows Mobile developers by introducing the [Orientation Aware Control](http://www.clariusconsulting.net/blogs/kzu/archive/2006/07/05/ZeroCodeAdaptiveUIs.aspx) (OAC) as part of the [Mobile Client Software Factory](http://msdn.microsoft.com/mobileclientfactory). As any 6-month project, there were a number of features that had to be left out because of time constraints. Also, being two years old also shows: that version does not support smartphone project types, neither Windows Mobile 6, nor VS2008, etc. A few bugs were also discovered after being released.

So we took the original version, and improved it substantially, adding highly requested features and keeping it up to date with the new platforms. Just take a look at the [features and a comparison with the original p&p OAC](http://orientationaware.net/features.html). 

You can now design your mobile applications that support multiple languages, resolutions and orientations in VS2008, and take advantage of the insanely cool VS integration the OAC provides:

[![](https://web.archive.org/web/20080915101953im_/http://amz.orientationaware.net/img/features/ftr-03.gif)](http://amz.orientationaware.net/img/features/ftr-03_ZOOM.gif "Multiple Screen Designs for a Single Control")

![](https://web.archive.org/web/20080915101953im_/http://amz.orientationaware.net/img/videos/scr-01.gif)

Last weekend the OAC reached another important milestone with its 2008 RTM version! Just go and look at the [screenshots and videos](http://www.orientationaware.net/videos.html) to see it in action. I'm quite proud of this particular project, as it involved quite a bit of spelunking with VS designer infrastructure, design-time location internals, run-time location behavior, etc. 

My friend and OAC Lead [Joe](http://www.mobilepractices.com/) has blogged more about [the release and why it's important to you](http://www.mobilepractices.com/2008/09/orientation-aware-control-2008-released.html).

posted on Wednesday, September 03, 2008 8:40 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/09/03/DevelopingorientationandresolutionawareWindowsMobileapplicationsjustgotaTONeasier.aspx#81852 "permalink") Developing orientation and resolution aware Windows Mobile applications just got a TON easier @ Wednesday, September 03, 2008 9:25 AM

Quite some time ago I posted about how we ( Clarius Consulting with Microsoft Patterns &amp;amp;amp; Practices [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/09/03/developing-orientation-and-resolution-aware-windows-mobile-applications-just-got-a-ton-easier.aspx "TrackBack")

  

[![](/web/20080915101953im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
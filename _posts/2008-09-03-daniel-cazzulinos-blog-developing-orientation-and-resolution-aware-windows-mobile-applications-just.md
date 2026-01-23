---
layout: post
title: "Daniel Cazzulino's Blog : Developing orientation and resolution aware Windows Mobile applications just got a TON easier"
date: 2008-09-03 00:00:00 +0000
---

## Developing orientation and resolution aware Windows Mobile applications just got a TON easier 

Quite some time ago I posted about how we ([Clarius Consulting](http://clariusconsulting.net/) with [Microsoft Patterns & Practices](http://msdn.microsoft.com/practices)) [solved the multiple resolution/orientation problem](http://www.clariusconsulting.net/blogs/kzu/archive/2006/05/09/OrientationAwareIntroduction.aspx) for Windows Mobile developers by introducing the [Orientation Aware Control](http://www.clariusconsulting.net/blogs/kzu/archive/2006/07/05/ZeroCodeAdaptiveUIs.aspx) (OAC) as part of the [Mobile Client Software Factory](http://msdn.microsoft.com/mobileclientfactory). As any 6-month project, there were a number of features that had to be left out because of time constraints. Also, being two years old also shows: that version does not support smartphone project types, neither Windows Mobile 6, nor VS2008, etc. A few bugs were also discovered after being released.

So we took the original version, and improved it substantially, adding highly requested features and keeping it up to date with the new platforms. Just take a look at the [features and a comparison with the original p&p OAC](http://orientationaware.net/features.html). 

You can now design your mobile applications that support multiple languages, resolutions and orientations in VS2008, and take advantage of the insanely cool VS integration the OAC provides:

[![](https://web.archive.org/web/20080915101953im_/http://amz.orientationaware.net/img/features/ftr-03.gif)](http://amz.orientationaware.net/img/features/ftr-03_ZOOM.gif "Multiple Screen Designs for a Single Control")

![](https://web.archive.org/web/20080915101953im_/http://amz.orientationaware.net/img/videos/scr-01.gif)

Last weekend the OAC reached another important milestone with its 2008 RTM version! Just go and look at the [screenshots and videos](http://www.orientationaware.net/videos.html) to see it in action. I'm quite proud of this particular project, as it involved quite a bit of spelunking with VS designer infrastructure, design-time location internals, run-time location behavior, etc. 

My friend and OAC Lead [Joe](http://www.mobilepractices.com/) has blogged more about [the release and why it's important to you](http://www.mobilepractices.com/2008/09/orientation-aware-control-2008-released.html).

/kzu

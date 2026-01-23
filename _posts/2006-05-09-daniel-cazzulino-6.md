---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-09 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : p&p for smart devices: solving the multiple resolution/orientation problem

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2312'\))| June 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2006/5/9.aspx "1 Post")| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2006/5/24.aspx "1 Post")  
25| 26| [27](http://clariusconsulting.net/blogs/kzu/archive/2006/5/27.aspx "1 Post")| 28| 29| 30| 1  
2| 3| 4| 5| 6| 7| 8  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060617081633im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## p&p for smart devices: solving the multiple resolution/orientation problem 

The reality of mobile development (specially if you're creating a product) is not so different to that of web development: the clients that will be using the application may not be under your control, and they may support different sets of features and capabilities. In the ASP.NET world, this was solved by the set of mobile-enabled controls, that basically rendered different markup depending on the device. Even in ASP.NET v2.0, this solution (the so-called control adapters architecture) is still in its infancy and not fully completed in its integration with the "standard" controls. 

In the mobile development world, the problem is not even in its infancy. Up to know, that is ;-). 

In the devices world, the critical difference between clients is not on the platform (as in the web, where you have different browsers supporting different standards, etc.). When you decide to develop your application using .NET Compact Framework (CF), you're already filtering the range of devices to Windows-based (most probably Windows Mobile 5.0 if it's a brand new one) Pocket PCs or SmartPhones. In this scenario, your most challenging issue is how to support the different so-called form factors (or resolutions, such as VGA, QVGA) and screen orientations (can be landscape or portrait).

The Microsoft .NET Compact Framework (CF) 2.0 introduces some features that certainly help alleviate the problem, specifically in the WinForms area, where you can use the familiar docking and anchoring funcionality to have your controls automatically resize according to screen size. However, this falls short for most applications. For example, say you’re displaying a purchase order in a vertical QVGA screen (240x320). Most probably you have laid out the controls so that each value you want to show is displayed in a single “line”. Well, if the screen is rotated, you probably don't want to simply make your fields wider. That may be a waste of valuable space, and result in a poorer user experience by the requirement to constantly scroll the screen. In this case, it may actually be better to lay out controls differently, so that you can for example display two values per "line".

Of course, the logic of the user control/form (hereafter simply referred to as "control", which is even technically correct as the Form class inherits from Control too ;-)) is the same: the data binding, event wiring, the controller/presenter logic, etc. So in an ideal world the layouts would be sort of "skins" for the control, that are applied dynamically depending on the current device form factor and orientation.

If you think for a moment on the problem at hand, and how the ideal solution would look like, you may realize that the .NET Framework (and therefore the CF too) already provides a mechanism that allows applying "skins" to WinForms controls: localization. Making a form localizable allows you to completely re-arrange the layout for each supported language, including size, location, text, etc. Basically any property that has been "tagged" with [Localizable] can participate in this "skinning". 

Good news is that the [Mobile Client Software Factory (MC-SF)](http://practices.gotdotnet.com/mobile "GDN Workspace") from p&p makes this ideal solution a reality with the introduction of a custom user control that you can use as the base class for yours. I've been working for the past few weeks on this feature, and I think it's an absolutely revolutionary simplification of the way you will author UIs for multiple devices. In future posts I will discuss its features and implementation, but in the meantime, here are a number of screenshots that should speak for themselves ;-)

[ ![Overview1-small.png](/web/20060617081633im_/http://clariusconsulting.net/ImageGallery/kzu/Mobile/Overview1-small.png) ](http://clariusconsulting.net/ImageGallery/kzu/Mobile/Overview1.png "Click to enlarge")

In this picture you can see the new Rotate verb on the context menu of a derived control, and also the new dependent file TeamView.resources, which I'll explain in future posts and is the key to the multiple resources design. You can also see the new Orientation property in the Design category, as well as the Localizable property which is now read-only and forced to True. I already hinted that our solution leverages the localization features of .NET, and therefore relies on that property being True.

[ ![Overview2-small.png](/web/20060617081633im_/http://clariusconsulting.net/ImageGallery/kzu/Mobile/Overview2-small.png) ](http://clariusconsulting.net/ImageGallery/kzu/Mobile/Overview2.png "Click to enlarge")

Here you can see that the horizontal layout for the very same control has a completely different design. The labels and textboxes are now on the right side, to take advantage of the extra space available in landscape mode, and to avoid unnecessary scrolling.

[ ![Overview3-small.png](/web/20060617081633im_/http://clariusconsulting.net/ImageGallery/kzu/Mobile/Overview3-small.png) ](http://clariusconsulting.net/ImageGallery/kzu/Mobile/Overview3.png "Click to enlarge")

This is a screenshot of the emulator running the application with the orientation aware control. In a future post I will link to the download of this sample, so that you get to know the team behind the [p&p Mobile Client Software Factory](http://practices.gotdotnet.com/mobile "GDN Workspace") ;-) (that's what the data on the list is).

[ ![Overview4-small.png](/web/20060617081633im_/http://clariusconsulting.net/ImageGallery/kzu/Mobile/Overview4-small.png) ](http://clariusconsulting.net/ImageGallery/kzu/Mobile/Overview4.png "Click to enlarge")

Finally, you can see that when the user rotates the screen, the control automatically re-applies the corresponding layout. Pretty cool, right? ;-) Stay tunned.

posted on Tuesday, May 09, 2006 5:28 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/509.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/05/09/OrientationAwareIntroduction.aspx#511 "permalink") Mobile Client Software Factory deuts @ MEDC @ Wednesday, May 10, 2006 6:42 PM

This week most of the Mobile Client Software Factory dev&amp;nbsp;team is at MEDC, in Las Vegas, presenting... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://blogs.msdn.com/edjez/archive/2006/05/10/595020.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/05/09/OrientationAwareIntroduction.aspx#512 "permalink") Mobile Client Software Factory debuts @ MEDC @ Wednesday, May 10, 2006 6:43 PM

This week most of the Mobile Client Software Factory dev&amp;nbsp;team is at MEDC, in Las Vegas, presenting... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://blogs.msdn.com/edjez/archive/2006/05/10/595020.aspx "TrackBack")

  

[![](/web/20060617081633im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
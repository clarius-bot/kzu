---
layout: post
title: "Daniel Cazzulino"
date: 2006-07-05 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : p&p for smart devices: zero code adaptive UIs

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2616'\))| April 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2677'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| [5](http://www.clariusconsulting.net/blogs/kzu/archive/2006/7/5.aspx "1 Post")| [6](http://www.clariusconsulting.net/blogs/kzu/archive/2006/7/6.aspx "1 Post")| 7  
8| 9| 10| 11| 12| 13| 14  
15| 16| 17| 18| 19| 20| 21  
22| 23| 24| 25| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2006/7/26.aspx "1 Post")| 27| 28  
29| 30| 1| 2| 3| 4| 5  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070426181547im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## p&p for smart devices: zero code adaptive UIs 

As part of the [Mobile Client Software Factory](http://go.microsoft.com/fwlink/?LinkId=62546) I've been working on for the past few months, [we introduced the Orientation Aware Control](http://clariusconsulting.net/blogs/kzu/archive/2006/05/09/OrientationAwareIntroduction.aspx) (OAC). I blogged about it and showed it working. In this post I'll delve a little more on the process you go when building UIs for devices that must adapt to different resolutions and orientations.  
  
I've already [hinted that the solution](http://clariusconsulting.net/blogs/kzu/archive/2006/05/09/OrientationAwareIntroduction.aspx) we implemented is based on the [Localization](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cptutorials/html/resources_and_localization_using_the__net_framework_sdk.asp) feature in .NET. So let's see how you go about using it.  
  
First step is to add a new UserControl to your project, and changing the base class to inherit from the OrientationAwareControl class provided with the factory. After you do that, you will see something like the following:  
  
![OAC new properties and commands](/web/20070426181547im_/http://www.clariusconsulting.net/ImageGallery/kzu/Mobile/OAC-1.png)   
  
New and modified properties:  

  * Localizable: as you can see from the property description from the above screenshot, this property is fixed to the True value. This is the proof that OAC uses the localization feature, and therefore this property cannot be changed. 
  * Orientation: this property can have the values Vertical | Horizontal, and corresponds to the Rotate command (both in context menu as command area in the properties window). It basically allows you to design different UI for the portrait and landscape orientations. 
  * Resolution: this property allows you to select one of the available resolutions. These resolutions can be the standard ones (VGA and QVGA standard or square), and will show up in a dropdown. More on how this list is populated and how to add custom resolutions later.

New commands: the commands, as is usual on custom control designers, are available either from the context menu of the control and in the command area in the properties window.  

  * Rotate: rotates the current layout, so that you can start designing the rotated layout. By default, the first time the control is rotated, controls bounds will be checked to see if they fit in the rotated control (height and width are switched). If they don't, they will be moved up and left until all controls fall within bounds of the container user control. 
  * Switch to Default Layout: by design, in VS2005 you can only add new components/controls through the designer if the current control/form is in the default culture. Because the OAC extends the localization infrastructure, the equivalent of the default culture is the default layout, meaning default culture + default resolution and vertical orientation. More on how to set which is the default resolution later on. 
  * The other three commands help in designing localized versions of the different resolutions. Basically, whenever you start with a new locale (say Spanish), the default layout is applied to the new resolution/orientation/culture, which is probably not optimum depending on which locale you are designing. For example, say you have QVGA-Spanish already designed, and now you want to design VGA-Spanish. The default culture layout will be applied and auto-scaled to give you a starting point. Well, in the localization case, you probably want to have all the labels and other text properties applied too, so that you don't have to translate everything again. Copy Text Properties is there for that purpose. You just switch back to the QVG-Spanish layout, click Copy Text Properties, and back in the VGA-Spanish, you click Paste Properties. All text properties will be set in all controls, saving you quite a bit of time. The same goes for the layout properties. If you already designed the layout for one, say, VGA-Horizontal resolution, and now you're localizing it, in every locale instead of re-locating all controls, you can simply Paste Properties after you run the Copy Layout Properties from the "source" layout (i.e. VGA-Horizontal, Default culture). Layout properties are basically location and size.

As you see, there's NO code whatesoever that you need to write to detect the current screen size and apply the appropriate resource. All is done automatically by the base Orientation Aware Control. In addition, and because we're reusing the localization feature in .NET, layouts are "inherited" across locales. Also, when no specific layout is found for the current resolution (i.e. a new device just came out), the default layout will automatically be applied.

### How do resolutions work

I said above that the available resolutions are rendered as a dropdown you can pick from in the properties window. Here's how it looks:

![Properties window showing available resolutions](/web/20070426181547im_/http://www.clariusconsulting.net/ImageGallery/kzu/Mobile/OAC-2.png)

Notice the description at the bottom of the window. This description is dynamic, and reflects the form factors that support the given resolution. So where is this information pulled from? 

This is a pretty advanced control, which was very fun to develop. Turns out that there's an IPlatformInformation service exposed to device control designers, that allows you to list and retrieve form factors defined in Tools | Options | Device Tools | Form Factors options page in Visual Studio. This is how the page looks after you install the Windows Mobile 5.0 SDK:

![Device Tools options in VS](/web/20070426181547im_/http://www.clariusconsulting.net/ImageGallery/kzu/Mobile/OAC-3.png)

At first, my control simply reused the FormFactor you already have in custom user controls:

![Built-in designer showing FormFactor property](/web/20070426181547im_/http://www.clariusconsulting.net/ImageGallery/kzu/Mobile/OAC-4.png)

That turned out to be a bad idea, as multiple form factors can have the same physical screen resolution, such as Phone VGA and VGA (both are 480x640). Hence, the OAC designer is hiding this property and providing an alternative one, the Resolution property. Basically it's populating the unique set of resolutions, and building the description dynamically to show which form factors defined in the VS options support the current value. 

The OAC is fully integrated with the VS options dialog shown above. You can easily use the Save As button above to create a new form factor based on an existing one. After renaming it, you can click the Properties button and change its resolution. Once you're done, the control will automatically pick the new resolution (you may need to close and reopen the designer):

![Custom resolution in the OAC](/web/20070426181547im_/http://www.clariusconsulting.net/ImageGallery/kzu/Mobile/OAC-5.png)

Note that in the VS options dialog you can also specify which is the default form factor, so that if your default target device is going to be, say, VGA, you don't need to change the resolution in every new control you create. 

Stay tunned as I continue to explore the journey of building such a cool control, if I'm allowed to say so ;-). I have little doubt that this is the way to go for the .NET CF v3. We'll see...

posted on Wednesday, July 05, 2006 1:18 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070426181547im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
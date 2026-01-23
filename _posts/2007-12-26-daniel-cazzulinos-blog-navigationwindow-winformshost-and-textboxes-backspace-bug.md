---
layout: post
title: "Daniel Cazzulino's Blog : NavigationWindow, WinFormsHost and TextBoxes: backspace bug"
date: 2007-12-26 00:00:00 +0000
---

Daniel Cazzulino's Blog : NavigationWindow, WinFormsHost and TextBoxes: backspace bug

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081219193123im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081219193123im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081219193123im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081219193123im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

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

## NavigationWindow, WinFormsHost and TextBoxes: backspace bug 

WPF [NavigationWindow](http://msdn2.microsoft.com/en-us/library/system.windows.navigation.navigationwindow.aspx) is a very handy class that allows you to easily build Vista-like wizards, or any kind of window that resembles the browser-style navigation: 

[ ![NavWindow](/web/20081219193123im_/http://www.clariusconsulting.net/images/blogs/kzu/WPFNavigationWindowWinFormsHostandTextBo_13FBF/NavWindow_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/WPFNavigationWindowWinFormsHostandTextBo_13FBF/NavWindow.png)

The [NavigationWindow](http://msdn2.microsoft.com/en-us/library/system.windows.navigation.navigationwindow.aspx) will automatically handle the Backspace, Back/Next keys and perform the appropriate navigation on the window pages. 

If you're combining this class with the [WindowsFormsHost](http://msdn2.microsoft.com/en-us/library/system.windows.forms.integration.windowsformshost.aspx) to integrate WinForms controls, you may hit a very annoying bug: if there are textboxes in your WinForm control, hitting Backspace while editing the input on it will cause the navigation window to navigate back, instead of deleting the text on the TextBox. Yikes! 

Being WPF the new kid on the block, I was immediately tempted to blame it. Turns out it's a bug in the WinForms [TextBoxBase](http://msdn2.microsoft.com/en-us/library/system.windows.forms.textboxbase.aspx) :S. 

You see, before WPF gets a chance to handle an input message, [WindowsFormsHost](http://msdn2.microsoft.com/en-us/library/system.windows.forms.integration.windowsformshost.aspx) tries to determine whether any contained control is interested in handling the message first and gives it the option to do that right away. This is done by calling the WinForms [Control.PreProcessControlMessage](http://msdn2.microsoft.com/en-us/library/system.windows.forms.control.preprocesscontrolmessage.aspx)() which ultimately calls the virtual [Control.IsInputKey](http://msdn2.microsoft.com/en-us/library/system.windows.forms.control.isinputkey.aspx) which controls use to determine a particular key is part of their input processing. The problem is that [TextBoxBase](http://msdn2.microsoft.com/en-us/library/system.windows.forms.textboxbase.aspx) does not say it's interested in handling the Backspace key (but it does so for Esc, Tab, Home, End, etc., and inherits the text keys from the base Control class implementation of IsInputKey).

Therefore, the [WindowsFormsHost](http://msdn2.microsoft.com/en-us/library/system.windows.forms.integration.windowsformshost.aspx) doesn't do anything further with the message, and the message enters the WPF input system, where it induces events tunneled and bubbled across the element tree. Eventually, [NavigationWindow](http://msdn2.microsoft.com/en-us/library/system.windows.navigation.navigationwindow.aspx) handles the key thanks to the built-in [CommandBinding](http://msdn2.microsoft.com/en-us/library/system.windows.input.commandbinding.aspx) for navigating back. Bummer :(.  

Fortunately, there are a couple workarounds: 

  1. Create your own TextBox-derived control that fixes the IsInputKey implementation and use that in your controls: 
         
         public class TextBox2 : TextBox   
         {   
           protected override bool IsInputKey(Keys keyData)   
           {   
             return base.IsInputKey(keyData) || keyData == Keys.Back;   
           }   
         }; 

  2. Cancel NavigationWindow's [CommandBinding](http://msdn2.microsoft.com/en-us/library/system.windows.input.commandbinding.aspx) for the backspace key by doing this in the constructor of your NavigationWindow-derived class: 
         
         InputBindings.Add(new KeyBinding(ApplicationCommands.NotACommand, new KeyGesture(Key.Back))); 

I prefer the latter, as it doesn't require you to modify your existing WinForms controls. On the other hand, it removes the Backspace gesture for navigating back, but that's not too bad as I doubt users are actually going to miss it (how many people navigate back in the browser by pressing Backspace anyway?)

I created a small repro and [reported this bug through Connect](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=304777). Feel free to vote for it ;)

posted on Wednesday, December 26, 2007 10:20 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/48243.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/26/NavigationWindowWinFormsHostandTextBoxesbackspacebug.aspx#48255 "permalink") NavigationWindow, WinFormsHost and TextBoxes: backspace bug @ Wednesday, December 26, 2007 10:56 AM

WPF NavigationWindow is a very handy class that allows you to easily build Vista-like wizards, or any [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/12/26/navigationwindow-winformshost-and-textboxes-backspace-bug.aspx "TrackBack")

  

[![](/web/20081219193123im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
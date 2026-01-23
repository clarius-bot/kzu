---
layout: post
title: "Daniel Cazzulino's Blog : WPF NavigationWindow, WinFormsHost and TextBoxes: backspace bug"
date: 2007-11-15 00:00:00 +0000
---

Daniel Cazzulino's Blog : WPF NavigationWindow, WinFormsHost and TextBoxes: backspace bug


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081022075906im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081022075906im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081022075906im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081022075906im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## WPF NavigationWindow, WinFormsHost and TextBoxes: backspace bug 

The WPF NavigationWindow is a very cool way to develop apps that expose a browser-like user experiences: 

[ ![NavigationWindow](/web/20081022075906im_/http://www.clariusconsulting.net/images/blogs/kzu/WPFNavigationWindowWinFormsHostandTextBo_13FBF/NavigationWindow_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/WPFNavigationWindowWinFormsHostandTextBo_13FBF/NavigationWindow.png)

As you probably know, you can also host Windows Forms controls within the pages: 

[ ![NavigationWinForms](/web/20081022075906im_/http://www.clariusconsulting.net/images/blogs/kzu/WPFNavigationWindowWinFormsHostandTextBo_13FBF/NavigationWinForms_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/WPFNavigationWindowWinFormsHostandTextBo_13FBF/NavigationWinForms.png)

the screenshot shows a WinForms usercontrol that contains a label and a textbox. This is the second page, as denoted by the "Back" button being enabled now. 

However, while you're typing on the textbox, **if you press the backspace key** , instead of deleting a character from the textbox, **the NavigationWindow navigates back**! 

From a very helpful Microsoft employee that looked at this issue, we learn: 

> This unfortunate interaction appears to be due to a bug in WinForms. The WindowsFormsHost sees input messages first. It tries to determine whether any contained control is interested in handling the message and gives it the option to do that right away. It does that by calling WinForms.Control. PreProcessControlMessage(). The problem, as I see it, is that **TextBox does not say it's interested in handling the Backspace key** (but it does so for text keys, Esc, Enter, PgDown, Tab, etc.). Then the WindowsFormsHost doesn't do anything further with the message, and the message enters the WPF input system, where it induces events tunneled and bubbled across the element tree. **Eventually, NavigationWindow handles the key thanks to the built-in CommandBinding for navigating back**. 

I was suggested two workarounds: 

  1. Create a TextBox-derived class that does register interest in the backspace key: 
         
             public class TextBox2 : TextBox  
             {  
                  protected override bool IsInputKey(Keys keyData)  
                  {  
                      return base.IsInputKey(keyData) || keyData == Keys.Back;  
                  }  
             }; 
         

  2. Cancel NavigationWindow's CommandBinding for the backspace key by doing this in the constructor of your NW-derived class: 
         
         InputBindings.Add(new KeyBinding(ApplicationCommands.NotACommand, new KeyGesture(Key.Back))); 

I created a small repro and reported this bug through Connect: <https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=304777> (you can vote it!)

posted on Thursday, November 15, 2007 10:51 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/11/15/WPFNavigationWindowandWinFormsHostandTextBoxesbackspacebug.aspx#41525 "permalink") WPF NavigationWindow, WinFormsHost and TextBoxes: backspace bug @ Thursday, November 15, 2007 12:02 PM

The WPF NavigationWindow is a very cool way to develop apps that expose a browser-like user experiences [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/11/15/wpf-navigationwindow-winformshost-and-textboxes-backspace-bug.aspx "TrackBack")

  

[![](/web/20081022075906im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
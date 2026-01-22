---
layout: post
title: "NavigationWindow, WinFormsHost and TextBoxes: backspace bug"
date: 2013-10-16 00:00:00 +0000
---

##  [NavigationWindow, WinFormsHost and TextBoxes: backspace bug](<http://blogs.clariusconsulting.net/kzu/navigationwindow-winformshost-and-textboxes-backspace-bug/> "NavigationWindow, WinFormsHost and TextBoxes: backspace bug")

December 26, 2007 6:20 pm

WPF [NavigationWindow](<http://msdn2.microsoft.com/en-us/library/system.windows.navigation.navigationwindow.aspx>) is a very handy class that allows you to easily build Vista-like wizards, or any kind of window that resembles the browser-style navigation: 

[  
![NavWindow](http://www.clariusconsulting.net/images/blogs/kzu/WPFNavigationWindowWinFormsHostandTextBo_13FBF/NavWindow_thumb.png)  
](<http://www.clariusconsulting.net/images/blogs/kzu/WPFNavigationWindowWinFormsHostandTextBo_13FBF/NavWindow.png>)

The [NavigationWindow](<http://msdn2.microsoft.com/en-us/library/system.windows.navigation.navigationwindow.aspx>) will automatically handle the Backspace, Back/Next keys and perform the appropriate navigation on the window pages. 

If you’re combining this class with the [WindowsFormsHost](<http://msdn2.microsoft.com/en-us/library/system.windows.forms.integration.windowsformshost.aspx>) to integrate WinForms controls, you may hit a very annoying bug: if there are textboxes in your WinForm control, hitting Backspace while editing the input on it will cause the navigation window to navigate back, instead of deleting the text on the TextBox. Yikes! 

Being WPF the new kid on the block, I was immediately tempted to blame it. Turns out it’s a bug in the WinForms [TextBoxBase](<http://msdn2.microsoft.com/en-us/library/system.windows.forms.textboxbase.aspx>) :S. 

You see, before WPF gets a chance to handle an input message, [WindowsFormsHost](<http://msdn2.microsoft.com/en-us/library/system.windows.forms.integration.windowsformshost.aspx>) tries to determine whether any contained control is interested in handling the message first and gives it the option to do that right away. This is done by calling the WinForms [Control.PreProcessControlMessage](<http://msdn2.microsoft.com/en-us/library/system.windows.forms.control.preprocesscontrolmessage.aspx>)() which ultimately calls the virtual [Control.IsInputKey](<http://msdn2.microsoft.com/en-us/library/system.windows.forms.control.isinputkey.aspx>) which controls use to determine a particular key is part of their input processing. The problem is that [TextBoxBase](<http://msdn2.microsoft.com/en-us/library/system.windows.forms.textboxbase.aspx>) does not say it’s interested in handling the Backspace key (but it does so for Esc, Tab, Home, End, etc., and inherits the text keys from the base Control class implementation of IsInputKey).

Therefore, the [WindowsFormsHost](<http://msdn2.microsoft.com/en-us/library/system.windows.forms.integration.windowsformshost.aspx>) doesn’t do anything further with the message, and the message enters the WPF input system, where it induces events tunneled and bubbled across the element tree. Eventually, [NavigationWindow](<http://msdn2.microsoft.com/en-us/library/system.windows.navigation.navigationwindow.aspx>) handles the key thanks to the built-in [CommandBinding](<http://msdn2.microsoft.com/en-us/library/system.windows.input.commandbinding.aspx>) for navigating back. Bummer ![:\(](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_sad.gif) .

Fortunately, there are a couple workarounds: 

  1. Create your own TextBox-derived control that fixes the IsInputKey implementation and use that in your controls: 
         
         public class TextBox2 : TextBox {   protected override bool IsInputKey(Keys keyData)   {     return base.IsInputKey(keyData) || keyData == Keys.Back;   } }; 

  2. Cancel NavigationWindow’s [CommandBinding](<http://msdn2.microsoft.com/en-us/library/system.windows.input.commandbinding.aspx>) for the backspace key by doing this in the constructor of your NavigationWindow-derived class: 
         
         InputBindings.Add(new KeyBinding(ApplicationCommands.NotACommand, new KeyGesture(Key.Back))); 

I prefer the latter, as it doesn’t require you to modify your existing WinForms controls. On the other hand, it removes the Backspace gesture for navigating back, but that’s not too bad as I doubt users are actually going to miss it (how many people navigate back in the browser by pressing Backspace anyway?)

I created a small repro and [reported this bug through Connect](<https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=304777>). Feel free to vote for it ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif)

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=48243)

Posted by kzu
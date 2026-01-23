---
layout: post
title: "Daniel Cazzulino's Blog : WPF NavigationWindow, WinFormsHost and TextBoxes: backspace bug"
date: 2007-11-15 00:00:00 +0000
---

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

/kzu

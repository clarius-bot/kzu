---
layout: post
title: "Daniel Cazzulino"
date: 2005-05-28 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : ASP.NET v2.0: is the non-visual components support finally back?

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2005/5/3.aspx "1 Post")| [4](http://clariusconsulting.net/blogs/kzu/archive/2005/5/4.aspx "1 Post")| 5| 6  
7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2005/5/9.aspx "1 Post")| 10| 11| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2005/5/13.aspx "1 Post")  
14| 15| 16| 17| 18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2005/5/20.aspx "1 Post")  
21| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2005/5/24.aspx "1 Post")| 25| 26| 27  
[28](http://clariusconsulting.net/blogs/kzu/archive/2005/5/28.aspx "2 Posts")| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502011541im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## ASP.NET v2.0: is the non-visual components support finally back? 

[Quite some time ago](http://weblogs.asp.net/cazzu/archive/2004/08/25/LosingComponents.aspx) I started warning people about an important feature that was removed from ASP.NET Whidbey: non-visual components (IComponent-based classes). [I logged the bug in Product Feedback](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=e2996990-64a5-4308-921d-245071e6f174), which resulted in a major number of votes that eventually draw some attention internally and resulted in the last update status which is **Fixed**.  
  
Now that [Whidbey Beta2 has finally hit the streets](http://lab.msdn.microsoft.com/vs2005/), it's time to regress the bug and see if it's really fixed. What follows is what I found (hint: another deception point).  
  
I focus the discussion of the features that are missing on [the article I published on CodeProject](http://www.codeproject.com/csharp/UIAOP.asp) that showcases the full power of non-visual components and the extender provider model in v1.x.

First of all, instead of restoring the "Components Tray", they force you to right-click on the .aspx file and select View Component Designer: 

![](https://web.archive.org/web/20060502011541im_/http://aspnet2.com/kzu/weblog/ComponentsNotBack1.png)

That wouldn't be terribly bad, except for the consequences:

  * **Extender Providers no longer work** : the component is no longer officially part of the web form, but something that lives "behind" and that you have to see through a different designer. This means that the forms designer has no knowledge whatesoever about extender providers as it used to have. The following extension of built-in controls is no longer possible:  
  
![](https://web.archive.org/web/20060502011541im_/http://aspnet2.com/kzu/weblog/components_tray5.png)  

  * **Designers/editors no longer work** : if a designer relied on showing information from the current page, that won't work either. That's basically because the new designer surface you get is not the one for the form at all, but a new one created for non-visual components. That means that all controls on the form, which used to live in the same container (`IContainer`, specifically) as your own components, no longer do. Effectively, you have no way of retrieving the controls that exist on the design surface of the forms editor. This is even if the `IDesignerHost` service (that you can still ask for) Container property contains a `Page` object, and that's because it's empty of controls :S:S. The following kind of editor is no longer possible:  
  
![](https://web.archive.org/web/20060502011541im_/http://aspnet2.com/kzu/weblog/components_tray2.png)![](https://web.archive.org/web/20060502011541im_/http://aspnet2.com/kzu/weblog/components_tray3.png)  

  * **Components don't show up in the Toolbox** : there's no way to make components appear in the toolbox. Even if they do show up in the Customize Toolbox dialog, and you can select them, they will never show up in the toolbox. As a consequence, there's no way to drop new components on a form. How are you supposed to use them therefore? The only way is through the components designer surface, with the problems mentioned above.

Therefore, one of the most important uses of a component, which was to extend and interact with the form's UI elements, in nicely decoupled way (you didn't need to inherit any of the built-in controls to add functionality to them), is no longer possible. 

Interestingly, WinForms developers continue to enjoy this feature, and the code generation part was made more robust and clean with the introduction of partial classes. I see this as a sign of commiting with an existing feature and working to improve it where it was lacking, as opposed to starting from scratch again and leaving the customers guessing what the hell happened to their investment.

Maybe I'm just too pesimist. But this doesn't look like a fix at all for my bug, and it certainly cuts so many of the features of non-visual components that it renders them pretty much useless. Hence, it only makes sense for me to reactivate the bug and ask once more for your cooperation in voting for this feature to come back once more. [Go and vote the bug if you feel this is an important feature being lost](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=e2996990-64a5-4308-921d-245071e6f174).

posted on Saturday, May 28, 2005 12:30 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/343.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/05/28/ComponentsNotBack.aspx#424 "permalink") re: ASP.NET v2.0: is the non-visual components support finally back? @ Monday, December 19, 2005 3:53 PM

So, if I understand this correctly we basically can't use our new 2.0 Entities in design time (ASP.NET) to do anything useful. I can use my objects just terrifically in Windows Forms but they're useless in ASP.NET, I can get from my components in thier flakey new "Component Designer" mode to my actual ASPX page to use them? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Mike Griffin](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.entityspaces.net "Anonymous")

  

[![](/web/20060502011541im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
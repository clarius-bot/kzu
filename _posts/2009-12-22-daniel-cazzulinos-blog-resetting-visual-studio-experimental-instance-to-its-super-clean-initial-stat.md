---
layout: post
title: "Daniel Cazzulino's Blog : Resetting Visual Studio Experimental Instance to its super-clean initial state"
date: 2009-12-22 00:00:00 +0000
---

Daniel Cazzulino's Blog : Resetting Visual Studio Experimental Instance to its super-clean initial state


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20100123102517im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100123102517im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100123102517im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100123102517im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100123102517im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100123102517im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Resetting Visual Studio Experimental Instance to its super-clean initial state 

If you are doing Visual Studio extensibility (VSX) work, you are probably aware of the existence of the Visual Studio "Experimental" instance. This is basically an instance of VS that has its own isolated registry, settings, extensions, etc. This allows you to test your extensions to VS without polluting your main development environment.

Sometimes, the environment might get corrupted for whatever reason, or it might be that you just want to test your extension with a clean environment after messing with it for a while. 

The Visual Studio SDK does come with a tool to reset the experimental instance, available from your Start menu with the name "Reset the Microsoft Visual Studio 2010 Experimental instance". That will not, however, give you the pristine environment you got the first time you start the experimental instance to test your first extension.

In order to get a super-clean environment, here's what you need to do:

  1. Close any running instance of VS Experimental. 
  2. Delete the entire folder %LocalAppData%\Microsoft\VisualStudio\10.0Exp 
  3. Run regedit.exe 
  4. Delete the registry key HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\10.0Exp 
  5. Delete the registry key HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\10.0Exp_Config 
  6. Run the command "Reset the Microsoft Visual Studio 2010 Experimental instance" from your start menu.

Now you'll have a fully restored environment. Also, any existing extensions you have in your main environment will be copied over to the experimental instance, with one caveat: you'll have to manually enable them from the Extension Manager UI from a running experimental instance to get them running.

If you've been doing VSX work in previous versions of VS, you'll sure appreciate the drastically simplified install/reset experience enabled by the new deployment mechanism in VS2010 via Extension Manager and VSIX files. If you have not, then this doesn't sound so scary anymore, does it? ;-)

Happy extending!

posted on Tuesday, December 22, 2009 11:24 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/12/22/194705.aspx#194718 "permalink") Resetting Visual Studio Experimental Instance to its super-clean initial state @ Tuesday, December 22, 2009 11:52 AM

If you are doing Visual Studio extensibility (VSX) work, you are probably aware of the existence of the [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2009/12/22/resetting-visual-studio-experimental-instance-to-its-super-clean-initial-state.aspx "TrackBack")

  

[![](/web/20100123102517im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog : How to develop WPF applications in VS2005 and VS2008 simultaneously"
date: 2007-09-12 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to develop WPF applications in VS2005 and VS2008 simultaneously


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081121150739im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081121150739im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081121150739im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081121150739im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## How to develop WPF applications in VS2005 and VS2008 simultaneously 

In order to develop WPF apps in VS2005, you must install the corresponding CTP tools for it. These will basically bring in some new project templates, project types, MSBuild taks and designers. The designers are quite slow, and don't always work as expected. Being a CTP, and with VS2008 ("Orcas") already in the beta phase, I don't expect these to be updated anymore. Wouldn't it be great if you had a choice to use VS2008 or VS2005 with the same project files?

I'm not suggesting your entire team moves to VS2008. It's a pain to work with beta versions for your main development environment. Believe me, I developed GAX/GAT using pre-Beta1 versions of VS2005 (then "Whidbey") which we used to upgrade every couple weeks because it was quite unstable. It's no fun. Lots of time wasted. 

That's why I think it's better if whoever on the team is willing to take the risk goes ahead and sets up VS2008 on a virtual machine (**don't mess your main machine with betas**!) and works there. 

The process is quite straightforward:

  1. Clone your solution file, typically ending it with "VS2008.sln" to make it explicit that this is the "beta" solution file. 
  2. Open in VS2008, and complete the upgrade wizard. This will remove from the project files the MSBuild import of WPF targets, as they are built-in VS2008. 
  3. Close the solution, and open each project file with a text/XML editor. Towards the end of the file, add the following Import:

    
    
        ...      
        <Import Project="$(MSBuildBinPath)\Microsoft.CSharp.targets" />
        <Import Project="$(MSBuildBinPath)\Microsoft.WinFX.targets" />
    </Project>

That import is required by VS2005 in order to properly compile the XAML files, but fortunately, it works just fine also in VS2008. 

Now you can have half your team with VS2005 and the adventurous ones on VS2008 :)

posted on Wednesday, September 12, 2007 8:07 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/12/HowtodevelopWPFapplicationsinVS2005andVS2008simultaneously.aspx#31546 "permalink") How to develop WPF applications in VS2005 and VS2008 simultaneously @ Wednesday, September 12, 2007 1:10 PM

In order to develop WPF apps in VS2005, you must install the corresponding CTP tools for it. These will [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/09/12/how-to-develop-wpf-applications-in-vs2005-and-vs2008-simultaneously.aspx "TrackBack")

  

[![](/web/20081121150739im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
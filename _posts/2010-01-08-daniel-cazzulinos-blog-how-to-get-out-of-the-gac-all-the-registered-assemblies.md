---
layout: post
title: "Daniel Cazzulino's Blog : How to get out of the GAC all the registered assemblies"
date: 2010-01-08 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to get out of the GAC all the registered assemblies


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20100123102233im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100123102233im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100123102233im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100123102233im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100123102233im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100123102233im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## How to get out of the GAC all the registered assemblies 

You know how annoying the GAC shell extension makes it to access the actual assemblies:

![image](https://web.archive.org/web/20100123102233im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtogetoutoftheGACalltheregisteredassem_AA28/image.png)

Utterly useless. 

Of course, you surely know that you can get to those elusive assemblies via the command-line and side-step the shell extension:

[![image](https://web.archive.org/web/20100123102233im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtogetoutoftheGACalltheregisteredassem_AA28/image_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/HowtogetoutoftheGACalltheregisteredassem_AA28/image_3.png)

But, now you need to go to each assembly folder, then its version, and so the actual assemblies are scattered through various locations.

This one-liner powershell command will get them all out in a folder of your choosing for easy Reflector-ing (create the target before running it):
    
    
    Get-ChildItem C:\Windows\assembly\GAC_MSIL -filter *.dll -recurse | Copy-Item -destination C:\GAC

posted on Friday, January 08, 2010 7:06 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/01/08/HowtogetoutoftheGACalltheregisteredassemblies.aspx#201128 "permalink") How to get out of the GAC all the registered assemblies @ Friday, January 08, 2010 7:26 AM

You know how annoying the GAC shell extension makes it to access the actual assemblies: Utterly useless [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2010/01/08/how-to-get-out-of-the-gac-all-the-registered-assemblies.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/01/08/HowtogetoutoftheGACalltheregisteredassemblies.aspx#201169 "permalink") re: How to get out of the GAC all the registered assemblies @ Friday, January 08, 2010 10:20 AM

Can't you just xcopy them when you are in command line? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

AndrewSeven

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/01/08/HowtogetoutoftheGACalltheregisteredassemblies.aspx#202457 "permalink") re: How to get out of the GAC all the registered assemblies @ Monday, January 11, 2010 1:23 PM

To bypass the shell extension type the following (on your start menu)   
  
%windir%\assembly\GAC_MSIL   
  
Then create a link on your desktop.   
  
/J [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

Jonas

  

[![](/web/20100123102233im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
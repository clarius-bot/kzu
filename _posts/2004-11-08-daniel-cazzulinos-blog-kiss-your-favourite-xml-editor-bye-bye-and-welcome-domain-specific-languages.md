---
layout: post
title: "Daniel Cazzulino's Blog : Kiss your favourite XML editor bye bye! (and welcome Domain Specific Languages designers!)"
date: 2004-11-08 00:00:00 +0000
---

Daniel Cazzulino's Blog : Kiss your favourite XML editor bye bye! (and welcome Domain Specific Languages designers!)

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20080827161041im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080827161041im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080827161041im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080827161041im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Kiss your favourite XML editor bye bye! (and welcome Domain Specific Languages designers!) 

With the advent of XML, each and every piece of software is configurable with it, from [Virtual PC](http://www.microsoft.com/windows/virtualpc/default.mspx) to [IIS](http://www.microsoft.com/WindowsServer2003/iis/default.mspx) to [log4net](http://logging.apache.org/log4net/) to [Shadowfax](http://workspaces.gotdotnet.com/shadowfx) and all the Application Blocks released from [PAG](http://www.microsoft.com/practices) ... you name it.   
  
If you think about it, however, it's quite easy to realize that what those XML files are actually, is nothing more than a text-based representation of the concepts in the particular domain of the tool/app. So, log4net has the concepts of Appenders, Filters, Object Formatters, and so on, while Shadowfax (as most SOA frameworks) has the concepts of Pipeline, Handler, Service Action, and so on. Therefore, XML is just a means to express the particular layout/behavior you want these tools/frameworks to have at run-time. It's not about XML, stupid! It's about the [Domain Specific Language](http://en.wikipedia.org/wiki/Domain-specific_language) (DSL) expressed in (serialized into) those tags.  
  
A very important step forward to make these languages first-class citizens in the developer's minds and programming experience has been made by Microsoft with [the release of the tools necessary to build your own DSL editors/designers](http://lab.msdn.microsoft.com/vs2005/teamsystem/workshop/dsltools/). With these specialized editors, the need for a generic XML editor (when used to edit configuration) will dissapear. How many people do you think is using generic XML editors to create instance documents that are used as **input** for an application (other than just for testing purposes)? My bet: **NONE** (InfoPath doesn't count, as it's not an XML editor but a forms tool, which just happens to use XML as the underlying store). Generic XML editors, instead, have been primarily used to _configure_ the myriad of tools/blocks/frameworks that you need to use to get your application up and running fast and with minimal effort (other than the one needed to configure it in the first place, an increasingly complex one indeed!). It's time to move forward.  
  
That's why I think any effort put in creating [generic/customizable XML editors](http://www.google.com/search?q=configuration+editor+.net) is futile. I believe the future is a multitude of specialized designers for the different aspects of an application (their DSLs). I hope sooner than later we'll see [an editor like this](http://www.exadel.com/strutsStudio/features/6.0/viewlets/strutsstudio6_viewlet_swf.html) for tools like [UIP](http://msdn.microsoft.com/library/en-us/dnpag/html/uipab.asp), and we'll have nothing to envy the [Eclipse](http://eclipse.org/) guys...  

posted on Monday, November 08, 2004 3:56 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/304.aspx) :: 

  

[![](/web/20080827161041im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
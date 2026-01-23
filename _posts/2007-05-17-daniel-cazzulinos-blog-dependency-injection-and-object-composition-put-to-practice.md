---
layout: post
title: "Daniel Cazzulino's Blog : Dependency Injection and Object Composition put to practice"
date: 2007-05-17 00:00:00 +0000
---

Daniel Cazzulino's Blog : Dependency Injection and Object Composition put to practice


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081206132508im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081206132508im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081206132508im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081206132508im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Dependency Injection and Object Composition put to practice 

[Last week I presented](http://www.sigs-datacom.de/sd/kongresse/set_2007/index.htm "SET Conference") this topic in Zurich, based on [p&p ObjectBuilder](http://www.codeplex.com/objectbuilder "ObjectBuilder @ CodePlex"). It's amazing how much interest people show around this topic, yet there is so little available on the web about ObjectBuilder. 

The project has been open sourced for a while now, but the lack of good documentation and a full DI container hindered its adoption. First thing I hear on these conferences is that it's too low-level, and that higher level APIs are needed.  
  
I believe that's what will happen in the short-term. ObjectBuilder is a very good tool to apply simple dependency injection and object composition functionality in your app, without taking huge dependencies. For the most part, you can make it work even without using custom attributes and the like.  

  
You can [get the slides](http://www.clariusconsulting.net/kzu/SET2007_ObjectBuilder.zip "Powerpoint 2007 Slides") (PowerPoint 2007), and [download the sample project](http://clariusconsulting.net/downloads/farcaster.zip "Sample ObjectBuilder project") that compares the usage against standard hardcoded dependencies and even Pico and Spring.  

posted on Thursday, May 17, 2007 7:51 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/05/17/ObjectBuilderZurich.aspx#24875 "permalink") Dependency Injection and Object Composition put to practice @ Thursday, May 17, 2007 8:24 AM

Note : this entry has moved . Last week I presented this topic in Zurich, based on p&amp;amp;p ObjectBuilder [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/05/17/ObjectBuilderZurich.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/05/17/ObjectBuilderZurich.aspx#24876 "permalink") Dependency Injection and Object Composition put to practice @ Thursday, May 17, 2007 8:38 AM

Note : this entry has moved . Last week I presented this topic in Zurich, based on p&amp;amp;p ObjectBuilder [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/05/17/ObjectBuilderZurich.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/05/17/ObjectBuilderZurich.aspx#24880 "permalink") Dependency Injection and Object Composition put to practice @ Thursday, May 17, 2007 11:31 AM

Note : this entry has moved . Last week I presented this topic in Zurich, based on p&amp;amp;p ObjectBuilder [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/05/17/ObjectBuilderZurich.aspx "TrackBack")

  

[![](/web/20081206132508im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
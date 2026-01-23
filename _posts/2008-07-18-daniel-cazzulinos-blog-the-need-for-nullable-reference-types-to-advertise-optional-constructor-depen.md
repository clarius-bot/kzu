---
layout: post
title: "Daniel Cazzulino's Blog : The need for nullable reference types to advertise optional constructor dependencies"
date: 2008-07-18 00:00:00 +0000
---

Daniel Cazzulino's Blog : The need for nullable reference types to advertise optional constructor dependencies


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080827162645im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080827162645im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080827162645im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080827162645im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

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

## The need for nullable reference types to advertise optional constructor dependencies 

In "traditional" OOP, you advertise your class required dependencies via constructor arguments:
    
    
    public Foo(IOutput output, ILogger logger, ...)

Typically, the first few lines of code will check that these dependencies are not null. 

Optional dependencies may be provided as properties, which you can leave unset (null). 

Internally, in order to avoid a multitude of conditionals checking for nulls, you might have your own ["null" implementations](http://en.wikipedia.org/wiki/Null_Object_pattern) of the dependencies' interfaces (i.e. NullLogger which does nothing). This way the code is more readable, and you can always assume the dependencies are non-null and you'll never get a NullReferenceException ;)

One problem with property dependency injection is that you can't readily tell which properties are dependencies, and with constructor arguments, you cannot specify which ones are optional (can be passed null OK). 

I think a much more consistent approach, and one that would integrate very well with the [nullable value types](http://msdn.microsoft.com/en-us/library/1t3y8s4s.aspx) functionality in .NET, is to introduce the concept of a nullable reference type:
    
    
    public Foo(IOutput output, ILogger? logger, ...)

What this tells the caller, is that the first argument is a required dependency, while the second can be null. I believe the .NET framework should go one step further and give the implementer a null implementation of the interface or abstract class if the argument is null. This way, you get rid of all nulls in your apps.

You can also avoid depending on properties to advertise optional dependencies (and an associated custom attribute such as [MEF](http://blogs.msdn.com/kcwalina/archive/2008/04/25/MEF.aspx) in order to indicate it's a dependency and not a regular property).

posted on Friday, July 18, 2008 2:42 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://clariusconsulting.net/blogs/kzu/archive/2008/07/18/Theneedfornullablereferencetypestoadvertiseoptionalconstructordependencies.aspx#78621 "permalink") The need for nullable reference types to advertise optional constructor dependencies @ Friday, July 18, 2008 3:05 AM

In &amp;quot;traditional&amp;quot; OOP, you advertise your class required dependencies via constructor arguments [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/07/18/the-need-for-nullable-reference-types-to-advertise-optional-constructor-dependencies.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2008/07/18/Theneedfornullablereferencetypestoadvertiseoptionalconstructordependencies.aspx#80405 "permalink") Illinois newspaper advertising directory @ Saturday, August 09, 2008 9:21 AM

[...] an undesirable unintended consequence with respect to home safety. After Hurricane Katrina, I remember reading a short newspaper article about do-it-yourself roof repair because of the shortage of roofing services after the disaster. [...] [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://newspaper-advertising.findincity.net/illinois/newspaper-advertising_cities.aspx "TrackBack")

  

[![](/web/20080827162645im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
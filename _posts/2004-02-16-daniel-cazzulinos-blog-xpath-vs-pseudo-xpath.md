---
layout: post
title: "Daniel Cazzulino's Blog : XPath vs pseudo-XPath"
date: 2004-02-16 00:00:00 +0000
---

Daniel Cazzulino's Blog : XPath vs pseudo-XPath


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081122035057im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081122035057im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081122035057im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081122035057im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

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

## XPath vs pseudo-XPath 

[Oleg](http://www.tkachenko.com/blog/archives/000159.html) commented on my [XSE (Xml Streaming Events)](http://weblogs.asp.net/cazzu/posts/XSEIntro.aspx) implementation. He has a nice code snipped with something called an XmlUpdater. Really cool. I'd like to see that code!  

He has a couple of observations about my wildcard syntax. Clarifying them:  
":*" = any element with an empty namespace.  
"*.*" = any element in any namespace.   
Those are different things ;).   
All available wildcards are explained in [the previous post](http://weblogs.asp.net/cazzu/posts/XseTransformations.aspx), towards the end. 

Strictly speaking, his forwardonly navigator is not XPath either, just like my two initial XSE factories. XPath is a very concrete concept and specification. If I'm not going to support it, well, I don't need to care about its syntax, providing I give users something easy to understand. I believe the wildcards are FAR more easier to grasp than the `local-name` and `namespace-uri` XPath counterparts.   
The `RootedPath` and `RelativePath` are just factories for concrete compiled algorithms that are different in implementation (codegen). Note there's no X in the middle, so it's no XPath at all ;).  
Of course, calling something akin to folder browsing anything else than "path" would be unnatural, that's why I chose it. 

My idea was to implement compiled algorithms that (IMO) will always be more performant than generic ones. In the code download I even provide an `InterpretedPath` factory that does just this. Doesn't compile anything and evaluates dynamically. There's a price to pay, just like I guessed. 

Bottom lines: 

  * Naming XPath things that are not, confuses developers.
  * Seeking XPath support where it's overkill is not wise, IMO.
  * XPath will NEVER be available in streaming APIs.
  * Having path-like expression syntax for streaming XML handling can hardly be called "reinventing the wheel". You have to choose the solution that best applies to your problem. Call it whatever you like ;).

**Update: read these follow-up:**

  * [XSE Initial Release](http://weblogs.asp.net/cazzu/archive/2004/02/16/XSERelease.aspx)
  * [XSE != XPath != SXPath != XPathReader](http://weblogs.asp.net/cazzu/archive/2004/02/16/XseNotXPath.aspx)

posted on Monday, February 16, 2004 9:50 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20081122035057im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
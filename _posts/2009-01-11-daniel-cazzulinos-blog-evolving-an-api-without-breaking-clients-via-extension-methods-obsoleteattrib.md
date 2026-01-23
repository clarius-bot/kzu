---
layout: post
title: "Daniel Cazzulino's Blog : Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute: Part II"
date: 2009-01-11 00:00:00 +0000
---

Daniel Cazzulino's Blog : Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute: Part II

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20090125221443im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090125221443im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090125221443im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090125221443im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

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

## Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute: Part II 

Due to a bug in VS intellisense (go [vote for it!](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=395913 "MS Connect Bug")), my otherwise [nice approach to API evolution](http://www.clariusconsulting.net/blogs/kzu/archive/2009/01/08/115183.aspx) doesn't quite work as I expected. Basically, regardless of whether you flag your new extension methods containing the obsolete APIs (read [my previous post](http://www.clariusconsulting.net/blogs/kzu/archive/2009/blogs/kzu/archive/2009/01/08/115183.aspx) if that didn't make sense ;)) with [EditorBrowsableState.Never](http://msdn.microsoft.com/en-us/library/system.componentmodel.editorbrowsablestate.aspx), they will still show up in intellisense. Essentially, VS ignores the attribute altogether for extension methods.  

You typically don't want that behaviors, as it would confuse users of your library to see legacy members (as extension methods) alongside the new ones:

![image](/web/20090125221443im_/http://www.clariusconsulting.net/images/blogs/kzu/EvolvinganAPIwithoutbreakingclientsviaex_F080/image.png)

A side effect of the approach in [my previous post](http://www.clariusconsulting.net/blogs/kzu/archive/2009/01/08/115183.aspx) is that you need to add a reference to the new Legacy.dll assembly in order for your existing code to compile. This may be an issue for some users.

So, in order to overcome the bug and also improve the backwards compatibility, I gave the approach another twist.

Typically, you have basically two different scenarios when you want to evolve the API:

  * Renamed members should NEVER become visible, EVER. Existing code should continue to compile as-is if possible.
  * Existing functionality that you want to obsolete but still want to make visible to users in case they depend on its continued use, should become visible only when they add a reference to the new Legacy.dll assembly. But existing code should continue to compile as-is if possible.

Given the annoying editor browsable bug, we cannot fully control visibility through that. But we can leverage the situation and use extension methods on the Legacy.dll assembly to control the visibility of the main assembly members. 

Turns out that when you provide an extension method with the same name as a hidden method in the target class, that hidden method becomes visible, and of course the compiler will always resolve to it rather than the extension method. 

So, this would be the intellisense experience without the Legacy.dll assembly reference (note missing VerifyAll):

![image](/web/20090125221443im_/http://www.clariusconsulting.net/images/blogs/kzu/EvolvinganAPIwithoutbreakingclientsviaex_F080/image_3.png)

Note that the line just above the intellisense window invokes VerifyAll(), with no compile error, but with the Obsolete warning. This means new code will typically not use the obsolete method as the developer will not see it at all. If we add a reference to the legacy assembly (which contains an extension method for the given class/interface, with the same name, in this case "VerifyAll"), here's what happens instead:

![image](/web/20090125221443im_/http://www.clariusconsulting.net/images/blogs/kzu/EvolvinganAPIwithoutbreakingclientsviaex_F080/image_4.png)

Note how the method becomes fully visible, but we never see the extension method version (which should have a blue down arrow). This is nice, as it means that the user sees the documentation and attributes for the non-extension method, which still lives in your core assembly.

  

The next version of [Moq](http://moq.me/) will use this to always hide renamed members from intellisense, and to make the old ones that people might still need to use visible when they add a reference to Moq.Legacy.dll. Regardless of whether you add a reference to this assembly or not, your existing test projects will not be broken and will continue to compile.

posted on Sunday, January 11, 2009 12:23 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/115318.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/01/11/115318.aspx#115359 "permalink") Interesting Finds: January 12, 2009 @ Monday, January 12, 2009 7:01 AM

[](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://jasonhaley.com/blog/archive/2009/01/12/142703.aspx "TrackBack")

  

[![](/web/20090125221443im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog : Updated WLW Cross-Post plugin"
date: 2009-02-05 00:00:00 +0000
---

Daniel Cazzulino's Blog : Updated WLW Cross-Post plugin


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20090212134554im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090212134554im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090212134554im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090212134554im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Updated WLW Cross-Post plugin 

Now that there's an [official installer of Live Writer](http://get.live.com/) that works on x64, I updated my [plugin](http://www.codeplex.com/clarius/Release/ProjectReleases.aspx?ReleaseId=6626) that allows you to cross-post a blog entry to a second WLW account, optionally summarizing the entry and always linking back to the source blog. I summarized the reasons why you might need to do this as well as the feature set in [How to cross post entries across blogs from Windows Live Writer](http://www.clariusconsulting.net/blogs/kzu/archive/2007/08/24/HowtocrosspostentriesacrossblogsfromWindowsLiveWriter.aspx).

The plugin options are still the same:

![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image.png)

And after you posted successfully your original entry, cross-posting to the selected account is one click away:

![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_3.png)

The cross-posted entry, if summarized, will be intelligently stripped at the specified * **content** * characters (i.e. 300 chars counting actual text content, not markup/attributes) while preserving your markup surroundings, therefore properly cutting not only text paragraphs:

[ ![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_4.png)

but also right in the middle of bullet lists:

[ ![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_thumb_3.png) ](http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_5.png)

and even inside code blocks which might even include formatting markup:

[ ![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_thumb_4.png) ](http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_6.png)

Go get the [WLW Cross-Post Plugin](http://www.codeplex.com/clarius/Release/ProjectReleases.aspx?ReleaseId=6626), another resounding success from your friends at [Clarius](http://www.clariusconsulting.net/)[Labs](http://www.codeplex.com/clarius) :)

posted on Thursday, February 05, 2009 1:45 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/02/05/116658.aspx#116660 "permalink") Updated WLW Cross-Post plugin @ Thursday, February 05, 2009 10:20 PM

Now that there&amp;#39;s an official installer of Live Writer that works on x64, I updated my plugin that [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2009/02/06/updated-wlw-cross-post-plugin.aspx "TrackBack")

  

[![](/web/20090212134554im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog : Add References with Search"
date: 2010-06-09 00:00:00 +0000
---

Daniel Cazzulino's Blog : Add References with Search

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

Source code published in this blog is [public domain](http://en.wikipedia.org/wiki/Public_domain) unless otherwise specified.

[![](https://web.archive.org/web/20100811025908im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100811025908im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100811025908im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100811025908im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100811025908im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100811025908im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Add References with Search 

If you have been using VS2010 for any significant amount of time, you surely came across the awkward, slow and hard to use Add Reference dialog. Despite some (apparent) [improvements over the VS2008](http://weblogs.asp.net/scottgu/archive/2009/10/29/add-reference-dialog-improvements-vs-2010-and-net-4-0-series.aspx) behavior, in its current form it's even LESS usable than before. A brief non-exhaustive summary of the typical grief with this dialog is:

  1. Scrolling a list of *hundreds* of entries? (300+ typically)
  2. No partial matching when typing: yes, you can type in the list to get to the desired entry, but the matching is performed in an exact manner, from the beginning of the assembly name. So, to get to the (say) "Microsoft.VisualStudio.Settings" assembly, you actually have to type the first two segments in their entirety before starting to type "Settings".
  3. Lazy loading with no progress indicator: loading is done asynchronously in VS2010, supposedly improving the situation from VS2008 where it would just freeze until it was done. Well, without an indicator, you don't know when loading is done and when it's safe to assume a given assembly isn't there because it is truly not available.
  4. Random order while lazy loading: moreover, while the lazy loading is happening (and you don't know when it's done), entries in the list are added in an almost random order, so any scrolling or typing you do results in constant repositioning of the current selection and changes to the underlying list. This makes it effectively impossible to use the dialog until the lazy loading is completed.
  5. No sorting while lazy loading: related to the previous one, you cannot sort the list at all until the lazy loading is complete, so scrolling is impossible.

So [we decided](http://www.clariusconsulting.net/) to do something about it. I introduce you to the [Search References extension](http://visualstudiogallery.msdn.microsoft.com/en-us/02c0bded-4739-40ec-af07-9eb002a27246):

![image\[5\]](https://web.archive.org/web/20100811025908im_/http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image5.png)

From the Extension Manager in Visual Studio 2010, you can simply search the Online Gallery for "Search Reference" and install it right-away:

![image](https://web.archive.org/web/20100811025908im_/http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image.png)

The dialog loads VERY fast. And because a picture speaks a thousand words, here are more screenshots to get you excited.

Partial matching:

![image\[10\]](https://web.archive.org/web/20100811025908im_/http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image10.png)

Multi-selection:

![image\[18\]](https://web.archive.org/web/20100811025908im_/http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image18.png)

Current project .NET profile aware. Silverlight 4:

![image\[23\]](https://web.archive.org/web/20100811025908im_/http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image23.png)

Silverlight 3:

![image\[28\]](https://web.archive.org/web/20100811025908im_/http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image28.png)

Enjoy, and don't forget to rate it!

posted on Wednesday, June 09, 2010 7:08 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20100811025908im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
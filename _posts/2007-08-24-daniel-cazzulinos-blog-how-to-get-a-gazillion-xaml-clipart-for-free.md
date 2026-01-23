---
layout: post
title: "Daniel Cazzulino's Blog : How to get a gazillion XAML clipart for free"
date: 2007-08-24 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to get a gazillion XAML clipart for free


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20080715105543im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080715105543im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080715105543im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080715105543im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## How to get a gazillion XAML clipart for free 

You surely know [XAML subsumes pretty much all of SVG](http://www.google.com/search?hl=en&q=xaml%20vs%20svg), right?

[SVG](http://www.w3.org/TR/SVG/) has been around for quite more time than XAML, and even if hasn't taken off as fast as many expected, at least I could find a [huge collection](http://www.openclipart.org/ "Open Clip Art Library") of [freely](http://creativecommons.org/license/publicdomain "Public Domain license!") available clipart.

Now all I needed was a way to convert all that stuff that you can [get in a single gigantic download](http://openclipart.org/media/downloads) if you want to XAML. 

I wish it was always this simple: go download [ViewerSvg](http://www.wpf-graphics.com/ViewerSvg.aspx) :). 

Not only does the tool work great, it also comes with a [library](http://www.wpf-graphics.com/ReaderSvg.aspx) you can use too :). So instead of using the UI, I used the library to create a very simple console application ([Svg2Xaml project](http://www.codeplex.com/clarius/Release/ProjectReleases.aspx?ReleaseId=6612 "Project source and binaries at CodePlex")) that will convert one or more files (or every file it finds recursively in one or more folders) to XAML.

The end result is not a gazillion (but you already guessed that, right?) but a very nice 7557 XAML files :). You can get the [self-extracting exe](http://downloads.clariusconsulting.net/openclipart-0.18-full-xaml.exe "49,4 MB should fly from Amazon") (powered by the very fast and excellent compression tool [7zip](http://www.7-zip.org/)) or a [standard zip](http://downloads.clariusconsulting.net/openclipart-0.18-full-xaml.zip "90,4 MB almost 2x size just to get it as a ZIP? :p"). If you're using IE, use Save Target As because Amazon S3 doesn't send the content-type for the file and IE might try to open it as text :S (a post for another day, why Amazon S3 sucks for standard web hosting). 

The download contains the PNG version from the original SVG so that you can not only compare, but also browse the clipart more easily from windows explorer.

I offered this converted library to the guys at the [Open Clip Art Library](http://www.openclipart.org/), so it may end up there soon too.

Enjoy!

posted on Friday, August 24, 2007 8:45 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/30180.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/08/24/HowtogetagazillionXAMLclipartforfree.aspx#30181 "permalink") How to get a gazillion XAML clipart for free @ Friday, August 24, 2007 8:45 AM

You surely know XAML subsumes pretty much all of SVG , right? SVG has been around for quite more time [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/08/24/how-to-get-a-gazillion-xaml-clipart-for-free.aspx "TrackBack")

  

[![](/web/20080715105543im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
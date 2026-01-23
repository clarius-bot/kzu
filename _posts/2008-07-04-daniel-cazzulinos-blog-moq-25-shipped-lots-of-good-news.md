---
layout: post
title: "Daniel Cazzulino's Blog : Moq 2.5 shipped: lots of good news!"
date: 2008-07-04 00:00:00 +0000
---

Daniel Cazzulino's Blog : Moq 2.5 shipped: lots of good news!


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20080708025959im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080708025959im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080708025959im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080708025959im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Moq 2.5 shipped: lots of good news! 

Today we shipped Moq v2.5. It's been a while since RC1 (a month or so feels so long for an open source agile project!) and we god very good feedback and suggestions for the final release. I'm pretty happy with the current drop and felt it was time for a new stable release. 

The change log is quite extensive and yet there are quite a few fixes and improvements here and there that are not reflected in it. Over the next few posts I'll be showcasing the various new features. For now, here's the log:

Version 2.5

  * Added support for mocking protected members 
  * Added new way of extending argument matchers which is now very straightforward 
  * Added support for mocking events 
  * Added support for firing events from expectations 
  * Removed usage of MBROs which caused inconsistencies in mocking features 
  * Added ExpectGet and ExpectSet to better support properties, and provide better intellisense. 
  * Added verification with expressions, which better supports Arrange-Act-Assert testing model (can do Verify(m => m.Do(...))) 
  * Added Throws<TException>
  * Added mock.CallBase property to specify whether the virtual members base implementation should be called 
  * Added support for implementing, setting expectations and verifying additional interfaces in the mock, via the new mock.As<TInterface>() method (thanks Fernando Simonazzi!) 
  * Improved argument type matching for Is/IsAny (thanks Jeremy.Skinner!)

My personal favorites: streamlined custom matchers (you can completely replace the built-in It.IsXXX matchers), mocking events and adding interfaces to a mock (I'll expand on those soon).

Go ahead and get the [latest version from Google Code](http://code.google.com/p/moq/downloads/list). 

As usual, we'd love to hear your feedback at the [discussion list](http://groups.google.com/group/moqdisc/) or [issue tracker](http://code.google.com/p/moq/issues/list), and patches are always welcome :)

posted on Friday, July 04, 2008 7:10 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/77643.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/07/04/77643.aspx#77671 "permalink") Moq 2.5 shipped: lots of good news! @ Friday, July 04, 2008 11:15 PM

Today we shipped Moq v2.5. It&amp;#39;s been a while since RC1 (a month or so feels&amp;amp;nbsp; so long for [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/07/05/moq-2-5-shipped-lots-of-good-news.aspx "TrackBack")

  

[![](/web/20080708025959im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
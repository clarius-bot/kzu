---
layout: post
title: "Daniel Cazzulino's Blog : Automocking container with Moq"
date: 2008-10-13 00:00:00 +0000
---

Daniel Cazzulino's Blog : Automocking container with Moq


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081223081852im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081223081852im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081223081852im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081223081852im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Automocking container with Moq 

I realized that I never blogged about this cool feature contributed by [Slava](http://code.google.com/u/slava42/) to [Moq-Contrib](http://code.google.com/p/moq-contrib).

Auto-mocking containers was an idea originally (IIRC) from the guys at [Eleutian](http://blog.eleutian.com/CommentView,guid,762249da-e25a-4503-8f20-c6d59b1a69bc.aspx), later on [picked up by Jeremy Miller](http://codebetter.com/blogs/jeremy.miller/archive/2008/02/09/automocker-in-structuremap-2-5.aspx) with [Rhino Mocks](http://ayende.com/) and [StructureMap](http://structuremap.sourceforge.net/).

The [wiki document Slava put together on Automocking](http://code.google.com/p/moq-contrib/wiki/Automocking) is a fantastic overview. Basically, you can have an ([Autofac](http://autofac.googlecode.com/)-powered) container create your objects under test with all its dependencies injected as mocks:
    
    
    var factory = new MockFactory(MockBehavior.Loose);  
    var container = new AutoMockContainer(factory);  
    var tree = container.Create<Tree>();

Because it uses a [MockFactory](http://www.clariusconsulting.net/labs/moq/html/4C85C26D.htm), it also integrates with the rest of the features in Moq that are available through the factory, such as consistent settings for [mock behavior](http://www.clariusconsulting.net/labs/moq/html/90760C57.htm), whether to [call base class implementations](http://www.clariusconsulting.net/labs/moq/html/B8B2A0F0.htm), and the [default value behavior](http://www.clariusconsulting.net/labs/moq/html/186CEE4D.htm).

Go ahead and [read the wiki](http://code.google.com/p/moq-contrib/wiki/Automocking) and [get the bits](http://code.google.com/p/moq-contrib)!

posted on Monday, October 13, 2008 11:56 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/103446.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/13/AutomockingcontainerwithMoq.aspx#103474 "permalink") Automocking container with Moq @ Tuesday, October 14, 2008 1:06 AM

I realized that I never blogged about this cool feature contributed by Slava to Moq-Contrib . Auto-mocking [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/10/14/automocking-container-with-moq.aspx "TrackBack")

  

[![](/web/20081223081852im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
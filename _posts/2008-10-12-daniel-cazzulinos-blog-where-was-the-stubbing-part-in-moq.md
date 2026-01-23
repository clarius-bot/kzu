---
layout: post
title: "Daniel Cazzulino's Blog : Where was the stubbing part in Moq?"
date: 2008-10-12 00:00:00 +0000
---

Daniel Cazzulino's Blog : Where was the stubbing part in Moq?

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081223084424im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081223084424im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081223084424im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081223084424im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Where was the stubbing part in Moq? 

In my [very recent previous post](http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102921.aspx) I said "mocking and stubbing easier than ever", but actually forgot to mention the stubbing part :S.

This one is not new for users of [moq-contrib](http://moq-contrib.googlecode.com/), but we decided to move this to the core Moq library as we get the question on how to stub properties often enough... :)

It's actually rather simple and easy to implement just by using Moq external API, but as a facility, here's what you can do:
    
    
    var mock = new Mock<IHaveValue>();
    // start "tracking" sets/gets to this property
    mock.Stub(v => v.Value);
    // alternatively, provide a default value for the stubbed property
    mock.Stub(v => v.Value, 5);
    
    // Now you can do:
    
    IHaveValue hv = mock.Object;
    // Initial value was stored
    Assert.Equal(5, hv.Value);
    
    // New value set which changes the initial value
    hv.Value = 6;
    Assert.Equal(6, hv.Value);
    

[](http://11011.net/software/vspaste)

What is new in this version beyond the original [moq-contrib](http://moq-contrib.googlecode.com/) stubbing, is the ability to stub all properties of the object in a single call:
    
    
    var mock = new Mock<IFoo>();
    mock.StubAll();
    

[](http://11011.net/software/vspaste)

This feature integrates seamlessly with the default value behavior specified for the mock, as explained in the [previous post](http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102921.aspx), meaning that you can stub all properties and cause them to return new mocks when appropriate, also recursively (but lazily!), in a single call. This may be redundant to note, but it's just to point that the API and behavior is still consistent.

If you want to have some fun reading rather crazy reflection API usage to invoke various generic methods including ones receiving Func<T> and passing function pointers with it, [go ahead](http://code.google.com/p/moq/source/browse/trunk/Source/Stub/StubExtensions.cs). It was FUN :).

Next: out/ref parameters in Moq!!!

posted on Sunday, October 12, 2008 11:51 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/102928.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102928.aspx#102930 "permalink") re: Where was the stubbing part in Moq? @ Sunday, October 12, 2008 11:53 PM

BTW, forgot to mention you need to add an import of Moq.Stub namespace :) [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[kzu](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102928.aspx#102939 "permalink") Where was the stubbing part in Moq? @ Monday, October 13, 2008 12:39 AM

In my very recent previous post I said &amp;quot;mocking and stubbing easier than ever&amp;quot;, but actually [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/10/13/where-was-the-stubbing-part-in-moq.aspx "TrackBack")

  

[![](/web/20081223084424im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
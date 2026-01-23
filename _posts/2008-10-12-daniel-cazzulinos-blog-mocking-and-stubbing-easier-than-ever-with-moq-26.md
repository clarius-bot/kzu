---
layout: post
title: "Daniel Cazzulino's Blog : Mocking and stubbing easier than ever with Moq 2.6"
date: 2008-10-12 00:00:00 +0000
---

Daniel Cazzulino's Blog : Mocking and stubbing easier than ever with Moq 2.6


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081016100056im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081016100056im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081016100056im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081016100056im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Mocking and stubbing easier than ever with Moq 2.6 

I've just released a new version of [Moq](http://moq.me/) which contains a few bug fixes but two extremely useful features: recursive mocks and mocked default values.

## Recursive mocks

Quite often you have a root mock object from which other mocks should "hang" through property accesses, such as HttpContextBase.Response: you want the response object returned to also be a mock. 

Setting such hierarchies before this release was quite verbose:
    
    
    var context = new Mock<HttpContextBase>();
    var response = new Mock<HttpResponseBase>();
    
    context.Expect(c => c.Response).Returns(response.Object);
    response.Expect(r => r.ContentType).Returns("application/xml");

In this new release, it's possible to just use your root object to set expectations on any path in the hierarchy, so the above turns to:
    
    
    var context = new Mock<HttpContextBase>();
    
    context.Expect(c => c.Response.ContentType).Returns("application/xml");
    

The auto-mocked properties have the same behavior as the "owning" mock.

I've found this extremely useful and right now it's also supported in TypeMock and soon (I hope) followed by Rhino too.

## Mocked default values

In Moq, your mocks are by default "loose", so they never throw exceptions when they are invoked without a corresponding expectation. Most people find this very intuitive as a default, but sometimes wish some properties returned mocks instead. In spirit, this is similar to recursive mocks, but it's more of a lazy-on-demand creation of mocks as needed, without the need to set expectations on anyone. 

Following the example above, you could create the context like so (note the added property to set the default value behavior):
    
    
    var context = new Mock<HttpContextBase> { DefaultValue = DefaultValue.Mock };
    
    var response = context.Response; // will be non-null, an auto-generated mock!  
    // I could set further expectations on this object, by retrieving its corresponding Mock  
    Mock.Get(response).Expect(r => r.ContentType).Returns("application/xml");

The setting is recursive, so if I request a property from the response mock that is also of a mock-able type, I'd get a mock too. 

Both are closely related, and maybe they could both be called "recursive mocks" if you will. 

One of the coolest things in Moq (IMO) continues to be the transparent continuum between fake/stub/mock which basically depends on how you use the one and only "moq" :). 

On top of that, I got a really cool domain name for the project: [http://moq.me](http://moq.me/)

Feedback welcomed on both features! Next I have to write about future directions... 

posted on Sunday, October 12, 2008 11:11 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/102921.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102921.aspx#102929 "permalink") Mocking and stubbing easier than ever with Moq 2.6 @ Sunday, October 12, 2008 11:53 PM

I&amp;#39;ve just released a new version of Moq which contains a few bug fixes but two extremely useful features [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/10/13/mocking-and-stubbing-easier-than-ever-with-moq-2-6.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102921.aspx#102938 "permalink") Where was the stubbing part in Moq? @ Monday, October 13, 2008 12:39 AM

In my very recent previous post I said &amp;quot;mocking and stubbing easier than ever&amp;quot;, but actually [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/10/13/where-was-the-stubbing-part-in-moq.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102921.aspx#102995 "permalink") Moq - Stubbing is back! @ Monday, October 13, 2008 6:20 AM

Мабуть, я&amp;#160; вже усім прожужав вуха про своє кохання – це Moq . Те ще це кохання може засвідчити, [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://dev.net.ua/blogs/mikechaliy/archive/2008/10/13/7001.aspx "TrackBack")

  

[![](/web/20081016100056im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
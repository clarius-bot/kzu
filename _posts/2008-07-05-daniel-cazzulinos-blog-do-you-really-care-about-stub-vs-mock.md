---
layout: post
title: "Daniel Cazzulino's Blog : Do you really care about Stub vs Mock?"
date: 2008-07-05 00:00:00 +0000
---

Daniel Cazzulino's Blog : Do you really care about Stub vs Mock?


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20080714123235im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080714123235im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080714123235im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080714123235im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Do you really care about Stub vs Mock? 

I've argued in the past that this [theoretical discussion is utterly useless](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/27/48594.aspx). In my experience you need slightly different things from your [test doubles](http://www.martinfowler.com/bliki/TestDouble.html) at different times and depending on the scenarios and what you care about testing in a particular test. 

If you're not using any mock/stub framework, you're typically creating manual test aids that morph (so that you can reuse them) as your tests evolve, and end up encompassing a mixture of a fake (i.e. you might put in an in-memory implementation), a stub (flags to tell you whether given members were called) and a mock (you might provide delegates to execute when members are executed, so that you can throw/callback/whatever). I've done this countless times before jumping to a framework/library to help me with this, and I know this is the [continuum most developers live in](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21/47152.aspx).

Yet, we still see discussions like [Rhino Mocks 3.5 Design Decisions: The role of Stub vs. Mock](http://www.ayende.com/Blog/archive/2008/06/29/Rhino-Mocks-3.5-Design-Decisions-The-role-of-Stub-vs.aspx), were the user is asked to make a choice that he will seldom understand without reading the theoretical background. This is counter-productive IMO.

Compare the original two versions with [Moq](http://www.mockframeworks.com/moq)'s version:
    
    
    public void When_user_forgot_password_should_save_user()
    {
        var userRepository = new Mock<IUserRepository>();
        var smsSender = new Mock<ISmsSender>();
    
        var theUser = new User { HashedPassword = "this is not hashed password" };
    
        userRepository.Expect(x => x.GetUserByName("ayende")).Returns(theUser);
    
        var controllerUnderTest = new LoginController(userRepository.Object, smsSender.Object);
    
        controllerUnderTest.ForgotMyPassword("ayende");
    
        userRepository.Verify(x => x.Save(theUser));
    }
    

[](http://11011.net/software/vspaste)

As you see, the way you use the "mock" is what makes it look more like a stub or a "true" mock (i.e. you verify all expectations, and you create it with [MockBehavior.Strict](http://www.clariusconsulting.net/labs/moq/html/90760C57.htm)). You don't have to pick a Stub vs Mock.

This simplifies the learning curve on the framework, and basically allows you to set intuitive options that don't force you entirely in one way or the other (the combination of Expect...Verifiable...Verify allows for VERY flexible usage).

I hope just like everyone's now seeing the value of NOT having an explicit record-reply model, we'll move past this rigid theoretical frame and into a more pragmatic and flexible view of mocking in general.

posted on Saturday, July 05, 2008 11:49 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/77747.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/07/05/77747.aspx#77752 "permalink") Do you really care about Stub vs Mock? @ Saturday, July 05, 2008 12:22 PM

I&amp;#39;ve argued in the past that this theoretical discussion is utterly useless . In my experience you [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/07/05/do-you-really-care-about-stub-vs-mock.aspx "TrackBack")

  

[![](/web/20080714123235im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
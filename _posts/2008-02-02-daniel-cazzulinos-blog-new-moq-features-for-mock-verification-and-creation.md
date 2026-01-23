---
layout: post
title: "Daniel Cazzulino's Blog : New Moq features for mock verification and creation"
date: 2008-02-02 00:00:00 +0000
---

Daniel Cazzulino's Blog : New Moq features for mock verification and creation


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081102081403im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081102081403im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081102081403im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081102081403im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## New Moq features for mock verification and creation 

I wrote before about [What's wrong with the Record/Reply/Verify model for mocking frameworks](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/26/48177.aspx), and in that context, why [Moq](http://code.google.com/p/moq/) didn't provide a mock verification functionality.

Given that the project is driven by users' feedback, both internal (our own team who's using it extensively) and external, we added mock verification to [Moq](http://code.google.com/p/moq/). I guess this finally settles the issue of [whether it's a mocking framework or a stub framework](http://www.ayende.com/Blog/archive/2007/12/26/The-RecordReplayVerify-model.aspx#20456) :).

## Verification

## 

So let's review how this feature is used and a couple alternatives that are in place:
    
    
    //setup - data
    var order = new Order(TALISKER, 50);
    var mock = new Mock<IWarehouse>(MockBehavior.Relaxed);
    
    //setup - expectations
    mock.Expect(x => x.HasInventory(TALISKER, 50)).Returns(true);
    ...
    // other test code, exercising the mock
    ...
    //verify state
    Assert.IsTrue(order.IsFilled);
    //verify interaction
    mock.VerifyAll();
    

[](http://11011.net/software/vspaste)

The new [VerifyAll](http://www.clariusconsulting.net/labs/moq/html/604FBEC0.htm)() method will ensure all expectations are satisfied (invoked). There's also a [Verify](http://www.clariusconsulting.net/labs/moq/html/E9CC3712.htm)() alternative which is more flexible, allowing you to verify only those expectations that have been marked as [Verifiable](http://www.clariusconsulting.net/labs/moq/html/EAF9AE67.htm):
    
    
    //setup - expectations
    mock.Expect(x => x.HasInventory(TALISKER, 50)).Verifiable().Returns(true);  
    //setup other expectation that may not be Verifiable
    ...
    //verify only Verifiable expectations.
    mock.Verify();
    

[](http://11011.net/software/vspaste)

This alternative is especially useful when you're setting up optional default expectations in a fixture setup and verifying at tear down:
    
    
    Mock<IWarehouse> warehouseMock;
    
    [SetUp]
    public void SetUp()
    {
        warehouseMock = new Mock<IWarehouse>(MockBehavior.Loose);
    
        // setup default non-verifiable (optional) expectation/return value
        warehouseMock.Expect(warehouse => warehouse.HasInventory(TALISKER, 50)).Returns(true);
    }
    
    [TearDown]
    public void TearDown()
    {
        warehouseMock.Verify();
    }
    

[](http://11011.net/software/vspaste)

Reusing default expectations in fixture setups makes for much more compact and targeted mock setups in specific tests. All the boring default (maybe optional) interactions are moved away to the setup. In my experience (and that of some of our users) this makes for much cleaner tests.

This can also be combined with the ability to override expectations. So in the example above, if a particular test needs to return a different value, it can just re-set the expectation and the new expectation will be the active one:
    
    
    // override default expectation set in fixture setup
    warehouseMock.Expect(warehouse => warehouse.HasInventory(TALISKER, 50)).Returns(false);
    

## Consistency via MockFactory

After some very good feedback and a bit of [back-and-forth with Garry](http://www.hanselman.com/forum/messages.aspx?TopicID=161#post556) over at [Hanselforum](http://www.hanselman.com/forum/), we finally settled on a way to make mock creation and verification easier when multiple mocks are in use in a single test.

If you're using a [mock behavior](http://www.clariusconsulting.net/labs/moq/html/90760C57.htm) other than the default (i.e. you want strict mocks that will throw for anything without an explicit expectation, or the absolute opposite, a loose mock) you'll be passing this enumeration value to each and every mock you create:
    
    
    //setup - data
    var warehouseMock = new Mock<IWarehouse>(MockBehavior.Loose);  
    var loggerMock = new Mock<ILogger>(MockBehavior.Loose);  
    //other mocks with same behavior 

If your mocks always have the same behavior, and you use a particular style of verification always ([Verify](http://www.clariusconsulting.net/labs/moq/html/E9CC3712.htm) or [VerifyAll](http://www.clariusconsulting.net/labs/moq/html/604FBEC0.htm) as explained above), you can save some boring typing and gain consistency by using a [MockFactory](http://www.clariusconsulting.net/labs/moq/html/4C85C26D.htm). This factory can be initialized at fixture setup and used on tear down to verify all mocks created using its [Create](http://www.clariusconsulting.net/labs/moq/html/CA3F5C37.htm) method:
    
    
    MockFactory factory;
    
    [SetUp]
    public void SetUp()
    {
        factory = new MockFactory(MockBehavior.Loose);
    }
    
    [TearDown]
    public void TearDown()
    {
        factory.Verify();
    }
    
    [Test]
    public void ShouldDoSomething()
    {
        //...
        var mock = factory.Create<IWarehouse>();
        //...
        // all created mocks will be verified automatically 
        // when the test finishes
    }
    

[](http://11011.net/software/vspaste)

This feature further reduces code duplication and makes tests even more concise. The explicit nature of expectations and verification makes it unnecessary to (ab)use the disposable pattern which precludes fixture setup/teardown reuse. 

We continue to strive to keep [Moq](http://code.google.com/p/moq/) faithful to its core design principle of simplicity by allowing manipulation of mock instances directly. Most mocking newcomers to will find this a refreshing alternative to the established and somewhat unnatural (I'd say also artificial) record/reply model. 

Let us know what you'd like to see in future versions, what you like and what you don't! You can either [submit an issue](http://code.google.com/p/moq/issues/list) (not only bugs, but also suggestions) or [send an email to the user's group](https://web.archive.org/web/20081102081403/mailto:moqdisc@googlegroups.com).

posted on Saturday, February 02, 2008 6:18 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/02/02/NewMoqfeaturesformockverificationandcreation.aspx#55114 "permalink") New Moq features for mock verification and creation @ Saturday, February 02, 2008 6:53 PM

I wrote before about What's wrong with the Record/Reply/Verify model for mocking frameworks , and in [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/02/02/new-moq-features-for-mock-verification-and-creation.aspx "TrackBack")

  

[![](/web/20081102081403im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
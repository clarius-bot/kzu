---
layout: post
title: "New Moq features for mock verification and creation"
date: 2012-04-01 00:00:00 +0000
---

##  [New Moq features for mock verification and creation](<http://blogs.clariusconsulting.net/kzu/new-moq-features-for-mock-verification-and-creation/> "New Moq features for mock verification and creation")

February 3, 2008 2:18 am

I wrote before about [What’s wrong with the Record/Reply/Verify model for mocking frameworks](<http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/26/48177.aspx>), and in that context, why [Moq](<http://code.google.com/p/moq/>) didn’t provide a mock verification functionality.

Given that the project is driven by users’ feedback, both internal (our own team who’s using it extensively) and external, we added mock verification to [Moq](<http://code.google.com/p/moq/>). I guess this finally settles the issue of [whether it’s a mocking framework or a stub framework](<http://www.ayende.com/Blog/archive/2007/12/26/The-RecordReplayVerify-model.aspx#20456>) ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) .

## Verification

## 

So let’s review how this feature is used and a couple alternatives that are in place:
    
    
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
    

[](<http://11011.net/software/vspaste>)

The new [VerifyAll](<http://www.clariusconsulting.net/labs/moq/html/604FBEC0.htm>)() method will ensure all expectations are satisfied (invoked). There’s also a [Verify](<http://www.clariusconsulting.net/labs/moq/html/E9CC3712.htm>)() alternative which is more flexible, allowing you to verify only those expectations that have been marked as [Verifiable](<http://www.clariusconsulting.net/labs/moq/html/EAF9AE67.htm>):
    
    
    //setup - expectations
    mock.Expect(x => x.HasInventory(TALISKER, 50)).Verifiable().Returns(true);//setup other expectation that may not be Verifiable
    ...
    //verify only Verifiable expectations.
    mock.Verify();
    

[](<http://11011.net/software/vspaste>)

This alternative is especially useful when you’re setting up optional default expectations in a fixture setup and verifying at tear down:
    
    
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
    

[](<http://11011.net/software/vspaste>)

Reusing default expectations in fixture setups makes for much more compact and targeted mock setups in specific tests. All the boring default (maybe optional) interactions are moved away to the setup. In my experience (and that of some of our users) this makes for much cleaner tests.

This can also be combined with the ability to override expectations. So in the example above, if a particular test needs to return a different value, it can just re-set the expectation and the new expectation will be the active one:
    
    
    // override default expectation set in fixture setup
    warehouseMock.Expect(warehouse => warehouse.HasInventory(TALISKER, 50)).Returns(false);
    

## Consistency via MockFactory

After some very good feedback and a bit of [back-and-forth with Garry](<http://www.hanselman.com/forum/messages.aspx?TopicID=161#post556>) over at [Hanselforum](<http://www.hanselman.com/forum/>), we finally settled on a way to make mock creation and verification easier when multiple mocks are in use in a single test.

If you’re using a [mock behavior](<http://www.clariusconsulting.net/labs/moq/html/90760C57.htm>) other than the default (i.e. you want strict mocks that will throw for anything without an explicit expectation, or the absolute opposite, a loose mock) you’ll be passing this enumeration value to each and every mock you create:
    
    
    //setup - data
    var warehouseMock = new Mock<IWarehouse>(MockBehavior.Loose);var loggerMock = new Mock<ILogger>(MockBehavior.Loose);//other mocks with same behavior 

If your mocks always have the same behavior, and you use a particular style of verification always ([Verify](<http://www.clariusconsulting.net/labs/moq/html/E9CC3712.htm>) or [VerifyAll](<http://www.clariusconsulting.net/labs/moq/html/604FBEC0.htm>) as explained above), you can save some boring typing and gain consistency by using a [MockFactory](<http://www.clariusconsulting.net/labs/moq/html/4C85C26D.htm>). This factory can be initialized at fixture setup and used on tear down to verify all mocks created using its [Create](<http://www.clariusconsulting.net/labs/moq/html/CA3F5C37.htm>) method:
    
    
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
    

[](<http://11011.net/software/vspaste>)

This feature further reduces code duplication and makes tests even more concise. The explicit nature of expectations and verification makes it unnecessary to (ab)use the disposable pattern which precludes fixture setup/teardown reuse. 

We continue to strive to keep [Moq](<http://code.google.com/p/moq/>) faithful to its core design principle of simplicity by allowing manipulation of mock instances directly. Most mocking newcomers to will find this a refreshing alternative to the established and somewhat unnatural (I’d say also artificial) record/reply model. 

Let us know what you’d like to see in future versions, what you like and what you don’t! You can either [submit an issue](<http://code.google.com/p/moq/issues/list>) (not only bugs, but also suggestions) or [send an email to the user’s group](<https://web.archive.org/web/20120401220917/mailto:moqdisc@googlegroups.com>).

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=55096)

Posted by kzu
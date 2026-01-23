---
layout: post
title: "Daniel Cazzulino's Blog : Tuesday, April 22, 2008 - Posts"
date: 2008-07-25 00:00:00 +0000
---

Daniel Cazzulino's Blog : Tuesday, April 22, 2008 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20080725034909im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080725034909im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080725034909im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080725034909im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Tuesday, April 22, 2008 - Posts

#####  [MoQ now uses xUnit for its unit tests](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/22/MoQnowusesxUnitforitsunittests.aspx)

After talking to a few guys during the MVP summit and the proceedings of the ALT.NET conference, I decided to give [xUnit](http://www.codeplex.com/xunit/ "xUnit home page") a serious try. 

I'm quite pleased with it. Using .NET idioms rather than excessive attributes (i.e. [SetUp] vs class constructor, [TearDown] vs IDisposable, etc.) is a good thing. 

"Upgrading" was quite easy: for the most part, it was a search & replace of:

  * [Test] => [Fact] 
  * [SetUp] => "" 
  * [TearDown] => "" 
  * Assert.That => Assert.True 
  * Assert.Fail => Assert.True(false, 
  * Assert.Isxxx => Assert.xxx 
  * Assert.Arexxx => Assert.xxx

The only tricky one which took the most time was replacing all the [ExpectedException] attributes with Assert.Throws. I like xUnit approach better, but it was annoying anyways. The good thing is that I deleted some code that was not used as the exceptions were being thrown before, and I didn't realize 'cause I was using [ExpectedException]. 

Renaming [Test] to [Fact] also has IMO a very good consequence: it forces you to think about your test method names as fact statements that make sense as an english sentence. I've argued with my team about the value of that, and we had a convention for [Test] that the method names must start with "Should". This also has the same effect, but being kind of enforced by the framework is better. The following test will now bother you when you read it:
    
    
    [Fact]  
    public void InvokeWithTwoArgs()

you can no longer say that the method name expresses a fact. It's a subconscious thing, nothing to be too passionate about, but it helps, believe me. 

One minor issue is that in order to use [TDD.NET](http://www.testdriven.net/) to run the tests, you need to run the xUnit installer tool (included in MoQ trunk at Lib\xUnit\xunit.installer.exe) to explicitly enable the runner. Unfortunately, once you do that, you can no longer use TDD.NET to run NUnit tests (or any of its [supported test frameworks](http://www.testdriven.net/)): you need to re-run the tool and disable TDD.NET support explicitly. But I'm confident it's just a matter of time before it's supported out of the box in TDD.NET.

So far, I think xUnit brings a fresh perspective to unit test frameworks. Challenging the status quo generally results in interesting new ideas IMO :) 

posted [Tuesday, April 22, 2008 2:27 PM](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/22/MoQnowusesxUnitforitsunittests.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/22/MoQnowusesxUnitforitsunittests.aspx#comments)

#####  [Improving MoQ to allow arrange-act-assert testing style](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/22/ImprovingMoQtoallowarrangeactasserttestingstyle.aspx)

Today, the [MoQ](http://code.google.com/p/moq/)[API](http://www.clariusconsulting.net/labs/moq/html/F3C3BE5A.htm) lets you setup expectations and later verify them, like so:
    
    
    [Fact]
    public void FillingRemovesInventoryIfInStock()
    {
        //arrange/setup
        var order = new Order(TALISKER, 50);
        var mock = new Mock<IWarehouse>();
    
        //setup - expectations
        **mock.Expect(x = > x.HasInventory(TALISKER, 50)).Returns(true);
    **//act
        order.Fill(mock.Object);
    
        //assert
        Assert.True(order.IsFilled);
        //verify interaction
        **mock.VerifyAll();**
    }
    

A very good feedback I got during the past [MVP Summit](https://www.mvpsummit2008.com/) was that the current approach moves all the semantic relevance for mocks up to the setup phase of the test. In order words, it doesn't fit well in the Arrange-Act-Assert pattern, as effectively the "asserts" (expectations that must be met) are now in the "arrange" (or setup) phase of the test.

The Verify/VerifyAll call which is down at the assertion phase contains no semantic whatsoever about what it is you are expecting to happen. 

In order to be accomodate this requirement, I'm gonna be adding a overload to Verify that takes the expression you want to verify:
    
    
    				//assert
    mock.Verify(x => x.HasInventory(TALISKER, 50));

[ ](http://11011.net/software/vspaste) [ ](http://11011.net/software/vspaste)

This would bring back the assertion phase to the place it belongs, if that's what you need. And because the default behavior on MoQ mocks is that they never throw on unexpected invocations, you can use the Expect only to setup return values when you need them (I'm hesitant to rename Expect to Setup, as for people using strict mocks that prefer the VerifyAll approach, it won't make much sense). 

What do you think?

posted [Tuesday, April 22, 2008 7:45 PM](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/22/ImprovingMoQtoallowarrangeactasserttestingstyle.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/22/ImprovingMoQtoallowarrangeactasserttestingstyle.aspx#comments)

  

[![](/web/20080725034909im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
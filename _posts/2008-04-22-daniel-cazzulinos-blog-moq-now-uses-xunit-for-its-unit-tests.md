---
layout: post
title: "Daniel Cazzulino's Blog : MoQ now uses xUnit for its unit tests"
date: 2008-04-22 00:00:00 +0000
---

## MoQ now uses xUnit for its unit tests 

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

posted on Tuesday, April 22, 2008 2:27 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

---
layout: post
title: "Daniel Cazzulino's Blog : Mocks: by-the-book vs practical"
date: 2007-12-27 00:00:00 +0000
---

## Mocks: by-the-book vs practical 

![c12--professor-umbridge](/web/20080507070923im_/http://www.clariusconsulting.net/images/blogs/kzu/Mocksbythebookvspractical_F83B/c12professorumbridge.jpg) Lately, there's been some formalization of the definitions of mocks, stubs, fakes and dummies, which Fowler popularized through his site with his article [Mocks aren't Stubs](http://martinfowler.com/articles/mocksArentStubs.html) by introducing the concepts from Gerard Meszaros' [xUnit patterns book](http://xunitpatterns.com/). I haven't read the book, but the definitions are sensible.

The article attempts to clarify the Mock and Stub concepts, while trying to separate them from the testing styles known as mockist TDD and state/classic TDD. In my opinion, the article fails because the very concept of a Mock is quite different in the mind of one or the other kind of TDDer. 

This is further aggravated by the fact that to the [average developer](http://www.codinghorror.com/blog/archives/001002.html) mock and stub (even fakes) are completely indistinguishable and used interchangeably in practice. This may also be in part because most developers (average or otherwise, by chance or by decision) are not using any mock framework at all (which would introduce them to the more strict concept of a mock) and typically live in a world of manual "mocks" that gets them through various stages I outlined in a [previous post](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21/47152.aspx). For people doing manual mocks, there's always a bit of a stub, a bit of a (true) mock, a bit of a fake on each mock, even at various stages during the life of a particular mock. 

I'm realizing that for most pragmatic guys (like pretty much everyone at [my own company](), but also [others](http://www.ayende.com/Blog/archive/2007/12/26/The-RecordReplayVerify-model.aspx#20456)), the distinction is very much useless. So-called mockists will insist that [mock verification is an intrinsic part](http://www.ayende.com/Blog/archive/2007/12/26/The-RecordReplayVerify-model.aspx) of the definition of what a mock is. I don't think so, and [Wikipedia](http://en.wikipedia.org/wiki/Mock_object) only states the distinction between mocks and fakes as a preference of "some authors", citing [Michael Feathers](http://en.wikipedia.org/wiki/Mock_object#_ref-0). I believe this somewhat artificial distinction has been further reinforced by pretty much all mock libraries, therefore restricting the meaning of a mock in practice to those that follow very specific usage conventions imposed by these libraries.

To a pragmatist and classic/state TDDer, a mock is nothing more than a test aid to help a test pass. It's not a core part of the test. It's considered accessory and supplemental at best. The core of the test is the object under test and its externally observable behavior and state, with all its internal details as much as possible protected with strong encapsulation. If some interaction with external dependencies is required to test a particular behavior, then it's perfectly acceptable to mock/stub/fake that, but only to the extent that assertions can be made about the object under state, not necessarily about the mocks themselves. 

A lengthy and fruitful discussion I am having with [Ayende](http://www.ayende.com/Blog/archive/2007/12/19/Moq-Mocking-in-C-3.0.aspx) (of [Rhino Mocks](http://www.ayende.com/projects/rhino-mocks.aspx) fame) made me realize that naming something "mock" that does not adhere strictly to the restrictive concept of mock that mock libraries have imposed is bound to cause disagreement among "pundits" in the TDD camp (especially with mockists). But I also think the generic concept of a "mock" in the general sense is used much more extensively than "stub" or even "fake". 

So, [MoQ](http://code.google.com/p/moq/) will not be renamed to anything like StubQ or the like, because (besides not being as cool a name) I firmly believe that we should be more flexible about what we call mocks, just because that's the reality of most programmers anyway, and it's the way the concept is used, regardless of what we "[the other 20%](http://www.codinghorror.com/blog/archives/001002.html)" try to make them believe.

Anyway, [happy mocking](http://code.google.com/p/moq/wiki/QuickStart) without remorse if you [don't verify your mocks](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/26/48177.aspx) ;). It's all right as long as it gets your (mostly classic) tests green.

posted on Thursday, December 27, 2007 10:18 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

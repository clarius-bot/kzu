---
layout: post
title: "Daniel Cazzulino's Blog - State Testing vs Interaction Testing"
date: 2007-12-21 00:00:00 +0000
---

## State Testing vs Interaction Testing 

Highly recommended reading: [Fowler's article Mocks aren't Stubs](http://martinfowler.com/articles/mocksArentStubs.html). It's a very clear characterization of the types of so-called Test Doubles (mocks, fakes, stubs, etc.) you can use to aid your unit testing needs, but also of the kinds of TDD you can do: classic (or state) TDD and mockist (or interaction) TDD.

I got the feeling that the article seemed a bit biased towards mockist TDD, only to see in the "So should I be a classicist or a mockist?" section that Fowler himself is a classic TDDer :o). Maybe it's because mockist TDD is a newer approach to TDD and therefore required a more extensive explanation. Or maybe it's just that the article title is a bit misleading as its content is about mocks in the strict sense used by mockists, and not in the general sense I think of them (as generic aids in unit testing).

I'm a state testing guy myself, but I always found it very annoying having to create all those little "mocks" to help me test classes that had dependencies. So I always thought a mocking library would be very handy to use. And as Fowler says, "it's often hard to judge a technique without trying it seriously". So I set to use a mocking framework ([NMock2](http://nmock.org/)) throughout a project, to learn what it feels like.

At first it felt very good not to have to create mocks manually, but very soon I started to feel the smell in all those lengthy setups where we were basically duplicating in mock expectations the entire interaction between collaborating classes which were completely unrelated to the object under test. I remember even having to set expectations for a component attaching to events raised by a dependency, which was completely unrelated to the core test and a mere internal detail about the communication between these components.

We suffered dozens of tests fail not only as a consequence of refactoring, but also as part of regularly added new features (i.e. a new event being raised by a collaborator). It was painful to get into any but the most trivial refactoring. And it went this way for months, not just for a week of trial. We still have the mockists tests we did back then, but over time we went back to manually creating our mocks, mostly following the approach I explained in [Mocks, Stubs and Fakes: it's a continuum](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21/47152.aspx).

It's important to realize that it's not a failure of the particular mocking library we used. It's a by-design "feature" of mockist TDD, and one that is hard to avoid as most libraries are designed around the same principles. The sole presence of a "Verify" method on the mock is a smell to me, one that will slowly get you into testing the interactions as opposed to testing the observable state changes caused by a particular behavior.

So, if you wonder why [Moq](http://code.google.com/p/moq/) doesn't provide a [Verify](http://www.clariusconsulting.net/labs/moq/index.html) method, now you know why :). It's IMO the most classic/state TDD-friendly mocking library available, and the most [minimalist](http://www.clariusconsulting.net/labs/moq/index.html) too :).

/kzu

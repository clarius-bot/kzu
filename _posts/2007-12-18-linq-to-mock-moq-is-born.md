---
layout: post
title: "Linq to Mock: MoQ is born"
date: 2007-12-18 00:00:00 +0000
---

(go straight to the snippets if you can't wait ;))

Regardless of whether you use a mocking framework/library or not, as long as you're doing unit testing, you're almost for sure using mocks. Most of the time they are manual mocks typically not even shared outside the scope of a single test fixture as they contain hardcoded values for return types, helper members, etc.

This works well, but it's counter-productive and plain boring. Mocking interfaces just to implement the one or two members you're interested sucks. 

Using a mocking framework helps, but they typically introduce undesired side effects:

  1. Almost every framework I know of requires you to set an expectation for each and every member called on the mocked interface while the tests are running. This includes expectations for attaching/detaching to events, invoking void methods, etc. This causes your unit tests to replicate the entire internal implementation of a given behavior as expectations, and needless to say, this causes any (perfectly valid from the encapsulation point of view) subsequent refactoring of the implementation to break lots of tests that were setup to expect the old interactions.  
  
The setup is typically more involved than the actual unit test itself, and discovering the full chain of calls that should be expected is a painful trial & error exercise until you get the damn interaction right. Needless to say, this can be pretty bad for highly modularized libraries that fragment funcionality in many rather small interacting components.  
  
Psicologically, it also deviates the main focus of the unit test at hand, and over time can lead to an excesive focus on testing the interactions rather than the observable state and behavior from the point of view of the object under test.  

  2. Most frameworks rely on member names passed as strings (i.e. mock.Expect("Foo")), which induces the developer to avoid refactorings that typically cause ripple effects throughout test fixtures. This is especially bad in the light of the previous issue and highly componentized libraries.  

What I always wanted was a mocking framework that did just what I already do manually with my mocks (typically setting up fixed return values on methods or properties, calling a callback on the test to check for a call, or maybe throwing an exception), and which doesn't get in the way of refactoring.

In typically manual mocks you don't care about the ordering of calls, about invocations to methods you generally don't care for a given test, about events subscribed/raised by the mock, etc. (we may add these features in the future if there's enough demand, but I don't think they lead to good testing patterns).

Enough intro! Let's see the code!!! Here's what myself and [waj](http://weblogs.manas.com.ar/waj/2007/12/19/mocking-with-linq-moq-is-here/) got working in about a couple hours of pair programming (further refined and polished over nights and a weekend):  

    
    
    var mock = new Mock<IFoo>();
    mock.Expect(x => x.Execute("ping")).Returns("I'm alive!");
    mock.Expect(x => x.Execute("update foo")).Callback(() => updated = true).Returns("Got your update!");
    mock.Expect(x => x.Execute(It.IsAny<string>())).Throws(new ArgumentException()); 

Here we expect either a ping or an update. Anything else (`It.IsAny`) will throw. 

Note that everything is strong-typed, and refactoring the Execute method in any way will automatically cause the tests to either stay in sync or fail to compile (i.e. you change the type of an argument or remove it). 

The "x" argument in the expect (you can name the variable whatever you want, however) is of the type of the mocked interface, so you call members on it directly.

The `It` class provides for a kind of wildcard support. There's an `IsAny`, `IsInRange` and `IsRegex`. The coolest one though is the plain `It.Is` method that receives a predicate!
    
    
    mock.Expect(x => x.DoInt(It.Is<int>(i => i % 2 == 0))).Returns(1);

Here the mocked object will return the value 1 only if the integer passed to the DoInt method is an even number.

The cool thing about this approach is that you don't need the mocking library to provide all the filters you need, as you can simply pass a predicate for any condition you can dream of.

[Moq](http://code.google.com/p/moq/) is an open source project, released under the new BSD license, and available from its [project home at Google Code](http://code.google.com/p/moq/). 

Check out the [Moq Quickstart](http://code.google.com/p/moq/wiki/QuickStart) wiki page which contains a lot more samples. 

/kzu

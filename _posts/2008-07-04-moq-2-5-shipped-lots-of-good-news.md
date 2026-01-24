---
layout: post
title: "Daniel Cazzulino's Blog - Moq 2.5 shipped: lots of good news!"
date: 2008-07-04 00:00:00 +0000
---

## Moq 2.5 shipped: lots of good news! 

Today we shipped Moq v2.5. It's been a while since RC1 (a month or so feels so long for an open source agile project!) and we god very good feedback and suggestions for the final release. I'm pretty happy with the current drop and felt it was time for a new stable release. 

The change log is quite extensive and yet there are quite a few fixes and improvements here and there that are not reflected in it. Over the next few posts I'll be showcasing the various new features. For now, here's the log:

Version 2.5

  * Added support for mocking protected members 
  * Added new way of extending argument matchers which is now very straightforward 
  * Added support for mocking events 
  * Added support for firing events from expectations 
  * Removed usage of MBROs which caused inconsistencies in mocking features 
  * Added ExpectGet and ExpectSet to better support properties, and provide better intellisense. 
  * Added verification with expressions, which better supports Arrange-Act-Assert testing model (can do Verify(m => m.Do(...))) 
  * Added Throws<TException>
  * Added mock.CallBase property to specify whether the virtual members base implementation should be called 
  * Added support for implementing, setting expectations and verifying additional interfaces in the mock, via the new mock.As<TInterface>() method (thanks Fernando Simonazzi!) 
  * Improved argument type matching for Is/IsAny (thanks Jeremy.Skinner!)

My personal favorites: streamlined custom matchers (you can completely replace the built-in It.IsXXX matchers), mocking events and adding interfaces to a mock (I'll expand on those soon).

Go ahead and get the [latest version from Google Code](http://code.google.com/p/moq/downloads/list). 

As usual, we'd love to hear your feedback at the [discussion list](http://groups.google.com/group/moqdisc/) or [issue tracker](http://code.google.com/p/moq/issues/list), and patches are always welcome :)

/kzu

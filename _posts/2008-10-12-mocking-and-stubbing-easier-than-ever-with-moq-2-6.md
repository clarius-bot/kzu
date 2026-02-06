---
layout: post
title: "Mocking and stubbing easier than ever with Moq 2.6"
date: 2008-10-12 00:00:00 +0000
---

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

/kzu

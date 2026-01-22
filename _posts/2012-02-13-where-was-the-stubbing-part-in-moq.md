---
layout: post
title: "Where was the stubbing part in Moq?"
date: 2012-02-13 00:00:00 +0000
---

##  [Where was the stubbing part in Moq?](<http://blogs.clariusconsulting.net/kzu/where-was-the-stubbing-part-in-moq/> "Where was the stubbing part in Moq?")

October 13, 2008 6:51 am

In my [very recent previous post](<http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102921.aspx>) I said “mocking and stubbing easier than ever”, but actually forgot to mention the stubbing part :S.

This one is not new for users of [moq-contrib](<http://moq-contrib.googlecode.com/>), but we decided to move this to the core Moq library as we get the question on how to stub properties often enough… ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

It’s actually rather simple and easy to implement just by using Moq external API, but as a facility, here’s what you can do:
    
    
    var mock = new Mock<IHaveValue>();
    // start "tracking" sets/gets to this property
    mock.Stub(v => v.Value);
    // alternatively, provide a default value for the stubbed property
    mock.Stub(v => v.Value, 5);
    
    // Now you can do:
    
    IHaveValue hv = mock.Object;
    // Initial value was stored
    Assert.Equal(5, hv.Value);
    
    // New value set which changes the initial value
    hv.Value = 6;
    Assert.Equal(6, hv.Value);
    

[](<http://11011.net/software/vspaste>)

What is new in this version beyond the original [moq-contrib](<http://moq-contrib.googlecode.com/>) stubbing, is the ability to stub all properties of the object in a single call:
    
    
    var mock = new Mock<IFoo>();
    mock.StubAll();
    

[](<http://11011.net/software/vspaste>)

This feature integrates seamlessly with the default value behavior specified for the mock, as explained in the [previous post](<http://www.clariusconsulting.net/blogs/kzu/archive/2008/10/12/102921.aspx>), meaning that you can stub all properties and cause them to return new mocks when appropriate, also recursively (but lazily!), in a single call. This may be redundant to note, but it’s just to point that the API and behavior is still consistent.

If you want to have some fun reading rather crazy reflection API usage to invoke various generic methods including ones receiving Func<T> and passing function pointers with it, [go ahead](<http://code.google.com/p/moq/source/browse/trunk/Source/Stub/StubExtensions.cs>). It was FUN ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) .

Next: out/ref parameters in Moq!!!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=102928)

Posted by kzu
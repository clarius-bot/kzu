---
layout: post
title: "Daniel Cazzulino's Blog - Do you really care about Stub vs Mock?"
date: 2008-07-05 00:00:00 +0000
---

## Do you really care about Stub vs Mock? 

I've argued in the past that this [theoretical discussion is utterly useless](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/27/48594.aspx). In my experience you need slightly different things from your [test doubles](http://www.martinfowler.com/bliki/TestDouble.html) at different times and depending on the scenarios and what you care about testing in a particular test. 

If you're not using any mock/stub framework, you're typically creating manual test aids that morph (so that you can reuse them) as your tests evolve, and end up encompassing a mixture of a fake (i.e. you might put in an in-memory implementation), a stub (flags to tell you whether given members were called) and a mock (you might provide delegates to execute when members are executed, so that you can throw/callback/whatever). I've done this countless times before jumping to a framework/library to help me with this, and I know this is the [continuum most developers live in](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21/47152.aspx).

Yet, we still see discussions like [Rhino Mocks 3.5 Design Decisions: The role of Stub vs. Mock](http://www.ayende.com/Blog/archive/2008/06/29/Rhino-Mocks-3.5-Design-Decisions-The-role-of-Stub-vs.aspx), were the user is asked to make a choice that he will seldom understand without reading the theoretical background. This is counter-productive IMO.

Compare the original two versions with [Moq](http://www.mockframeworks.com/moq)'s version:
    
    
    public void When_user_forgot_password_should_save_user()
    {
        var userRepository = new Mock<IUserRepository>();
        var smsSender = new Mock<ISmsSender>();
    
        var theUser = new User { HashedPassword = "this is not hashed password" };
    
        userRepository.Expect(x => x.GetUserByName("ayende")).Returns(theUser);
    
        var controllerUnderTest = new LoginController(userRepository.Object, smsSender.Object);
    
        controllerUnderTest.ForgotMyPassword("ayende");
    
        userRepository.Verify(x => x.Save(theUser));
    }
    

[](http://11011.net/software/vspaste)

As you see, the way you use the "mock" is what makes it look more like a stub or a "true" mock (i.e. you verify all expectations, and you create it with [MockBehavior.Strict](http://www.clariusconsulting.net/labs/moq/html/90760C57.htm)). You don't have to pick a Stub vs Mock.

This simplifies the learning curve on the framework, and basically allows you to set intuitive options that don't force you entirely in one way or the other (the combination of Expect...Verifiable...Verify allows for VERY flexible usage).

I hope just like everyone's now seeing the value of NOT having an explicit record-reply model, we'll move past this rigid theoretical frame and into a more pragmatic and flexible view of mocking in general.

/kzu

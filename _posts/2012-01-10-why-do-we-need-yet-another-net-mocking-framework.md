---
layout: post
title: "Why do we need yet another NET mocking framework"
date: 2012-01-10 00:00:00 +0000
---

##  [Why do we need yet another NET mocking framework](<http://blogs.clariusconsulting.net/kzu/why-do-we-need-yet-another-net-mocking-framework/> "Why do we need yet another NET mocking framework")

March 15, 2008 3:51 pm

[Updated for Moq v4 syntax]

I got this question a couple times in the past MIX08 at Las Vegas. And this is a very valid question indeed, given that there’s already [Rhino](<http://www.mockframeworks.com/rhino>), [EasyMock](<http://www.mockframeworks.com/easymock>), [TypeMock](<http://www.mockframeworks.com/typemock>) and [NMock](<http://www.mockframeworks.com/nmock>) (to name a few). So why did we give you Moq?

One possible answer would be to start with a checklist of what Moq offers that others don’t in terms of supported features. That would be a mistake, though, as it could be easily argued that a better choice would have been to contribute to an already established opensource framework that accepted community contributions.

There’s one fundamental reason why there are a variety of frameworks/libraries that do similar things throughout the opensource space: more choices mean more freedom to pick the one that best suits your unique sense of style, simplicity, flexibility, etc. So, when I hear the question, I immediately think about it in the opposite terms: why not?

The value we think Moq brings to the community is simplicity through a more natural programming model.

## Status-quo

When I look at a [Rhino Mocks quickstart](<http://orand.blogspot.com/2007/12/rhino-mocks-quick-reference.html>) and read about its "3 different record/replay syntax styles, 4 types of mocks, 7 if you include MultiMocks…", I can’t help but think that it’s far from ideal for any newcomer. The situation doesn’t seem to be significantly better in other .NET mock frameworks with similar range of features.

I’ve already argued in the past why I think forcing regular developers to learn and understand [the difference between a stub, a fake, a "true" mock and a dynamic mock is unproductive and largely irrelevant](<http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21/47152.aspx>) for their TDD needs.

Also, even though [quite common in the mocking community](<http://ayende.com/Blog/archive/2007/12/26/The-RecordReplayVerify-model.aspx>), the [typical record/replay model is alien to developers](<http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/26/48177.aspx>) and introduces yet another new concept that makes the learning curve steeper than needed.

On top of this situation, along came C# 3.0 with some amazing language features that could be put to use to significantly increase the usability and elegance of any mocking framework.

## Back to basics with Moq

The first thing we did was spike the simplest possible framework in order to assess the benefits and potential cost of development. We were blown away with my friend [Juan ](<http://weblogs.manas.com.ar/waj/>)when we got the basics (expectations, return values, callbacks and throwing exceptions) working after a mere 2 hours of intense pairing. We saw the clear benefits of a simpler API, as well as the sheer beauty of C# 3.0 lambda expressions applied to mocks.

In Moq, there’s exactly *one* API to learn: [Mock<T>](<http://www.clariusconsulting.net/labs/moq/html/98C52E48.htm>). Creating a mock is no different than creating any other object:
    
    
    mock = new Mock<ICommand>();

There’s no record/reply model to learn, no static calls on hard-to-discover classes, etc. For the most part, you don’t even need to read the documentation at all (although it [has extensive code documentation complete with code samples](<http://www.clariusconsulting.net/labs/moq/index.html>)), because using the various features is generally one "dot" away from your mock instance:
    
    
    mock.Setup(command => command.Execute("ping"));

Basically the expectation is a lambda that can represent an invocation to a void method or to a value-returning one. The lambda argument (such as `command` above) is automatically inferred to be of the type of the mock (the `T` argument when you create it).

Intellisense integration combined with the fluent API goes a long way in helping you figure out your next steps once you have a setup in place. For example, the `ICommand.Execute` method returns a string, and therefore, one "dot" away you have the options for the corresponding setup:

![image](http://blogs.clariusconsulting.net/kzu/files/2012/01/image.png)

Let’s say that you change the expectation to be an invocation to another method which is void, instead (changing Execute to Undo in this case):

![image](http://blogs.clariusconsulting.net/kzu/files/2012/01/image1.png)

Note how the available options have changed now. There’s no more Returns, as the method has nothing to return now. Callback is still available, like Throws. Note, however, that Raises was not available before. That’s because before you can raise an event from the call, you need to specify whether you’ll return a value or throw an exception. But you didn’t need to know the proper sequence of invocations ahead of time: intellisense guided you automatically.

As the invocation progresses, the fluent API will guide you through the remaining options. Let’s say in the previous example you specify that an exception will be thrown for an empty command:

![image](http://blogs.clariusconsulting.net/kzu/files/2012/01/image2.png)

Because you have already specified that the mock will throw an exception, you can no longer specify a return value, which is natural, of course. Now you can only specify if the invocation will be verified later for the setup, if you wish to. 

As you can see, learning to use the API is mostly about using it and "dotting" into the created mock. Note we’re using the [trick I mentioned in my previous post to streamline the intellisense experience](<http://www.clariusconsulting.net/blogs/kzu/archive/2008/03/10/58301.aspx>).

Note how the specifics of the theoretical difference between stubs, fakes and mocks are completely absent. They are irrelevant to the average developer, so we don’t surface it in the API either. What you typically care about when you work with test aids (or [test doubles](<http://www.martinfowler.com/bliki/TestDouble.html>)) is whether you want each and every invocation made to it to have a corresponding expectation (i.e. it is "strict") or some grades of flexibility (i.e. it only throws for abstract members invocations, or only when a return value is needed, or even never unless you specify so). That’s a more natural model, and it’s surfaced in the API as a constructor argument for the mock:

![image](http://blogs.clariusconsulting.net/kzu/files/2012/01/image3.png)

The various options control the mock behavior when an invocation is performed on it without a previously defined corresponding expectation. This way you can easily change how strict or loose it will be.

### Mock Verification

Mock verification may be optional depending on your mocking style. I’m myself a classicist, and we realized many people are. In fact, the "strictness" of some mock frameworks and the kind of "smell" they introduce by overly tying expectations and verifications to concrete implementation details of interactions is one of the first arguments classicists (I can hear my friend [Peter Provost](<http://www.peterprovost.org/>)…) will bring up when talking about the "drawbacks" of using mock frameworks.

As such, we made mock verification completely optional and very granular. You can [verify only the expectations you want to verify](<http://www.clariusconsulting.net/labs/moq/html/E9CC3712.htm>) (those marked as Verifiable), or you can verify an entire mock (with VerifyAll).

In case you need consistent mock behavior and verification, you can opt to use the the MockFactory class if you want to.

### Mock Reuse

In typical unit tests, your reusable objects live in test class fields that you initialize at test setup and cleanup on tear down. It’s quite common to have default behavior associated with mocks, and being able to reuse these expectations can make your tests much more concise:
    
    
    [TestFixture]
    public class Demo
    {
        Mock<ICommand> mock;
    
        [SetUp]
        public void SetUp()
        {
            mock = new Mock<ICommand>();
            mock.Setup(command => command.Execute(""))
                .Throws(new ArgumentException());
            mock.Setup(command => command.Execute(null))
                .Throws(new ArgumentNullException());
        }
    
        [Test]
        public void Run()
        {
            // We can reuse the default expectations for null or empty commands
            mock.Setup(command => command.Execute("ping"))
                .Returns(true);
    
            // pass this mock to other components
            // that may call "ping" and check for the
            // return value true.
        }
    }

To make reuse even more flexible and compelling, you can actually override a default expectation in a specific unit test by just re-defining it.

You can also place calls to Verify or VerifyAll on the test tear down method to have consistent verification if that’s what you need.

These features take away one of the typical complaints: that using mock frameworks typically make your unit tests too verbose and obscure the true purpose of the test behind somewhat unrelated expectations that have to be set just to hook everything together. Now you can move all that repetitive code (and typically expensive to fix when implementation details change) to the fixture setup, and have a central place to maintain when interactions change.

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=58442)

Posted by kzu
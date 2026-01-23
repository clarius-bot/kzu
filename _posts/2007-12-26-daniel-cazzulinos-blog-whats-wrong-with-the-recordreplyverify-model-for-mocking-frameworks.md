---
layout: post
title: "Daniel Cazzulino's Blog : What's wrong with the Record/Reply/Verify model for mocking frameworks"
date: 2007-12-26 00:00:00 +0000
---

## What's wrong with the Record/Reply/Verify model for mocking frameworks 

Most mocking frameworks, and especially the two most popular ones, [Rhino Mocks](http://www.ayende.com/Wiki/%28S%28er4mx1bdcnrr3y45fuz15i45%29%29/Rhino+Mocks+Documentation.ashx) and [TypeMock](http://www.typemock.com/), use a record/reply/verify model where the developer invokes members on the mock during the record phase, does a replay to prepare the mock for those expectations, and finally do a verify before the test ends. 

From Rhino documentation (emphasis mine):

> Record & Replay model - a model that allows for recording actions on a mock object and then replaying and verifying them. **All mocking frameworks uses this model**. Some (NMock, TypeMock.Net, NMock2) use it implicitly and some (EasyMock.Net, Rhino Mocks) use it explicitly. 

Well, it's [not true anymore](http://code.google.com/p/moq/) that *all" mocking frameworks use record/replay :). 

Anyway, [an example from Rhino](http://www.ayende.com/Wiki/%28S%28gtsaaq45luwfjj55wlskhgjg%29%29/Default.aspx?Page=Rhino+Mocks+Introduction) is:
    
    
    [Test]
    public void SaveProjectAs_CanBeCanceled()
    {
      MockRepository mocks = new MockRepository();
      IProjectView projectView = (IProjectView)mocks .CreateMock(typeof(IProjectView));
      Project prj = new Project("Example Project");
      IProjectPresenter presenter = new ProjectPresenter(prj,projectView);
      Expect.Call(projectView.Title).Return(prj.Name);
      Expect.Call(projectView.Ask(question,answer)).Return(null);
    **mocks.ReplayAll();**
      Assert.IsFalse(presenter.SaveProjectAs());          
    **mocks.VerifyAll();**}

I find this record/replay/verify model somewhat unnatural. When you follow the typical progression explained in [Mocks, Stubs and Fakes: it's a continuum](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21/47152.aspx), you end up thinking about your mocks as invokers of your delegates/lambdas. There's no especial concept to understand. It's "plain .NET" if you will. The above test in [MoQ](http://code.google.com/p/moq/) (which is the result of taking that very progression and turning it into a generic mock framework) looks like the following:
    
    
    [Test]
    public void SaveProjectAs_CanBeCanceled()
    {
        string question, answer;
        var projectView = new Mock<IProjectView>();
        var prj = new Project("Example Project");
        var presenter = new ProjectPresenter(prj, projectView.Object);
        
        projectView.Expect(x => x.Title).Returns(prj.Name);
        projectView.Expect(x => x.Ask(question, answer)).Returns(null);
        
        Assert.IsFalse(presenter.SaveProjectAs());
    }
    

[ ](http://11011.net/software/vspaste)

Note that the only assertion is the one on the presenter.SaveProjectAs. There are absolutely no "side effects" from using the mock framework. It's just a helper for your [traditional state/classic test](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21/StateTestingvsInteractionTesting.aspx). And [MoQ](http://code.google.com/p/moq/) is mostly syntactic sugar for what [you could have done yourself](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/21/47152.aspx). 

Verifying the mock slowly but almost inevitably takes you down the path of focusing your tests in the interaction as opposed to the state of the object under test. I agree with mockists that sometimes an interaction test is the only way to ensure a given behavior (cache hits/misses is the most evident one), but it's more of the exception than the rule IMO. 

That's why [MoQ](http://code.google.com/p/moq/) doesn't provide a Verify method on its Mock<T> class. I strongly believe that an API that makes it very easy for you to do the "right thing" is the way to go. You can still verify the interactions with [MoQ](http://code.google.com/p/moq/), but it's going to be a bit more work, keeping flags of invoked members and setting them from callbacks. This way, the mocking framework takes you away from that kind of testing by making it more difficult.

posted on Wednesday, December 26, 2007 4:20 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

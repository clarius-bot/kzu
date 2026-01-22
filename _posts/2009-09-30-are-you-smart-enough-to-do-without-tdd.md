---
layout: post
title: "Are you smart enough to do without TDD"
date: 2009-09-30 00:00:00 +0000
---

##  [Are you smart enough to do without TDD](<http://blogs.clariusconsulting.net/kzu/are-you-smart-enough-to-do-without-tdd/> "Are you smart enough to do without TDD")

September 30, 2009 4:18 am

Ayende wrote a controversial post titled ~~I’m so smart I don’t need TDD~~ [Even tests has got to justify themselves](<http://ayende.com/Blog/archive/2009/09/28/even-tests-has-got-to-justify-themselves.aspx>) ![;-\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) . It’s important to read it, because it reinforces many of the reasons why “regular developers” (i.e. NOT *you* if you’re even reading blogs as you are) continue to see “us” as some kind of unreachable and infallible elite of “hero programmers” who will eventually show up (i.e. be hired for big bucks, which we surely do want ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) ) and save the day.

You see, Ayende appears to say that if you’re smart enough, you’ll just know what code to write, just like that. Ergo, if you don’t know, maybe you’re not that smart and hence you would need this technique for losers called Test Driven Design/Development.

That’s not how it works, at least for me. Far from it. I’ve been doing TDD for years on several projects and with varying degrees of similarity. And I can tell you that even for those where I already had a very clear idea of an initial design, I always ended up with something (however slightly) different after doing it TDD-style. It consistently enriches my APIs by providing me a users point of view that an integration/scenario test would never give me. 

### Spikes

With regards to design uncertainty (which is what Ayende mentions as his only motivator for doing TDD), I usually take a different approach altogether: run a quick time-boxed spike (or several), to test a couple design choices quickly, without the “overhead” of doing it “right”. These are throw-away spikes that you learn from. When I’m done with the learning, I go back to doing it with TDD, and it’s almost guaranteed it will not look 100% like the spikes, and that it will be much more robust and user-friendly.

### Documentation 

A new appreciation I’m developing for TDD when done with certain consistent naming conventions (i.e. Given, When, Then style), is the ability to have a human readable and always up to date specification of what the various components do. Yes, this is not something you’ll show your end users, but it IS something the developer or project lead coming after you can certainly learn from. Ayende assumes everyone will be equally smart as he is and immediately grasp his software designs, ’cause you know, there’s only one way it could have been done right ![:P](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_razz.gif) . In order to fix bugs and maintain non-trivial software, you need to know what individual components are doing.

### Proof

I’ll refer to one case of each situation where TDD provided value.

  * [Moq](<http://moq.me/>) vs [Rhino Mocks](<http://www.mockframeworks.com/rhino>): he read the ([useless IMO](<http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/27/48594.aspx>)) literature on mocks vs stubs vs fakes, had apparently a clear idea of what to do, and came up with Rhino’s awkward, user unfriendly and hard to learn API with a myriad of concepts and options, and a record-replay-driven API (ok, I’m sure it was not his original idea, but certainly it’s his impl.) which two years ago seemed to him to [stand at the core of mocking](<http://ayende.com/Blog/archive/2007/12/26/The-RecordReplayVerify-model.aspx>). Nowadays not only he learned what I’ve been saying all along, that “[dynamic, strict, partial and stub… No one cares](<http://ayende.com/Blog/archive/2009/09/03/planning-for-rhino-mocks-4.0.aspx>)“, but also is planning to remove the [record / playback API](<http://ayende.com/Blog/archive/2009/09/03/planning-for-rhino-mocks-4.0.aspx>) too. 

I’m pretty sure that if he had sat down with a blank project, two years ago, and rebuilt Rhino Mocks using TDD and a fresh mind, he would have ended with something very similar to [Moq](<http://moq.me/>), way earlier, rather than seeming to be playing catch-up. 

[Moq](<http://moq.me/>) on the other hand started from a blank slate, purely TDD-driven, with no preconceptions whatsoever on its API (other than the conviction that we just need one word, “mock”). I’m obviously biased, but [users seem to love](<http://moq.me/wiki/ILoveMoq>) its [simplicity too](<http://search.twitter.com/search?q=moq>).   

  * Complex behavior: on a farily complex workflow-related implementation, I recently got asked what the behavior of a Join node was in our project. I could just run a test that does a very simple reflection-driven query and get the following answer to the project lead: 
        
        Join Spec
          Given a join with two predecessors and one successor
             When a predecessor is available, Then join is blocked
             When a predecessor is blocked, Then join is blocked
             When a predecessor is in progress, Then join is blocked
             When a predecessor is unknown, Then join is blocked
             When a successor state changes, Then join state does not change
             When both predecessors are finished, Then join is finished

That is simply invaluable. Anyone coming later to the project only needs to read that to grasp an immediate understanding of the intended behavior. And it’s isolated and unit-tested. How does the test code look like? Well, pretty much like your regular TDD-style, but with some naming conventions: 
    
    
    namespace JoinSpec
    {
       [TestClass]
       public class GivenAJoinWithTwoPredecessorsAndOneSuccessor
       {
         // ctor builds up the context
         [TestMethod]
         public void WhenAPredecessorIsAvailable_ThenJoinIsBlocked()
         {
           // set predecesor state, and verify the join is with the given state
         }
       }
    }

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=171102)

Posted by kzu
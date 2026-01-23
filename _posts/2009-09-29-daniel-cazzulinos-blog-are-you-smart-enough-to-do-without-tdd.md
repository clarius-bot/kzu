---
layout: post
title: "Daniel Cazzulino's Blog : Are you smart enough to do without TDD"
date: 2009-09-29 00:00:00 +0000
---

Daniel Cazzulino's Blog : Are you smart enough to do without TDD


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20091003131709im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20091003131709im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20091003131709im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20091003131709im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20091003131709im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20091003131709im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Are you smart enough to do without TDD 

Ayende wrote a controversial post titled ~~I'm so smart I don't need TDD~~ [Even tests has got to justify themselves](http://ayende.com/Blog/archive/2009/09/28/even-tests-has-got-to-justify-themselves.aspx) ;-). It's important to read it, because it reinforces many of the reasons why "regular developers" (i.e. NOT *you* if you're even reading blogs as you are) continue to see "us" as some kind of unreachable and infallible elite of "hero programmers" who will eventually show up (i.e. be hired for big bucks, which we surely do want :)) and save the day.

You see, Ayende appears to say that if you're smart enough, you'll just know what code to write, just like that. Ergo, if you don't know, maybe you're not that smart and hence you would need this technique for losers called Test Driven Design/Development.

That's not how it works, at least for me. Far from it. I've been doing TDD for years on several projects and with varying degrees of similarity. And I can tell you that even for those where I already had a very clear idea of an initial design, I always ended up with something (however slightly) different after doing it TDD-style. It consistently enriches my APIs by providing me a users point of view that an integration/scenario test would never give me. 

### Spikes

With regards to design uncertainty (which is what Ayende mentions as his only motivator for doing TDD), I usually take a different approach altogether: run a quick time-boxed spike (or several), to test a couple design choices quickly, without the "overhead" of doing it "right". These are throw-away spikes that you learn from. When I'm done with the learning, I go back to doing it with TDD, and it's almost guaranteed it will not look 100% like the spikes, and that it will be much more robust and user-friendly.

### Documentation 

A new appreciation I'm developing for TDD when done with certain consistent naming conventions (i.e. Given, When, Then style), is the ability to have a human readable and always up to date specification of what the various components do. Yes, this is not something you'll show your end users, but it IS something the developer or project lead coming after you can certainly learn from. Ayende assumes everyone will be equally smart as he is and immediately grasp his software designs, 'cause you know, there's only one way it could have been done right :P. In order to fix bugs and maintain non-trivial software, you need to know what individual components are doing.

### Proof

I'll refer to one case of each situation where TDD provided value.

  * [Moq](http://moq.me/) vs [Rhino Mocks](http://www.mockframeworks.com/rhino): he read the ([useless IMO](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/27/48594.aspx)) literature on mocks vs stubs vs fakes, had apparently a clear idea of what to do, and came up with Rhino's awkward, user unfriendly and hard to learn API with a myriad of concepts and options, and a record-replay-driven API (ok, I'm sure it was not his original idea, but certainly it's his impl.) which two years ago seemed to him to [stand at the core of mocking](http://ayende.com/Blog/archive/2007/12/26/The-RecordReplayVerify-model.aspx). Nowadays not only he learned what I've been saying all along, that "[dynamic, strict, partial and stub... No one cares](http://ayende.com/Blog/archive/2009/09/03/planning-for-rhino-mocks-4.0.aspx)", but also is planning to remove the [record / playback API](http://ayende.com/Blog/archive/2009/09/03/planning-for-rhino-mocks-4.0.aspx) too.   
  
I'm pretty sure that if he had sat down with a blank project, two years ago, and rebuilt Rhino Mocks using TDD and a fresh mind, he would have ended with something very similar to [Moq](http://moq.me/), way earlier, rather than seeming to be playing catch-up.   
  
[Moq](http://moq.me/) on the other hand started from a blank slate, purely TDD-driven, with no preconceptions whatsoever on its API (other than the conviction that we just need one word, "mock"). I'm obviously biased, but [users seem to love](http://moq.me/wiki/ILoveMoq) its [simplicity too](http://search.twitter.com/search?q=moq).   

  * Complex behavior: on a farily complex workflow-related implementation, I recently got asked what the behavior of a Join node was in our project. I could just run a test that does a very simple reflection-driven query and get the following answer to the project lead: 
        
        Join Spec
          Given a join with two predecessors and one successor
             When a predecessor is available, Then join is blocked
             When a predecessor is blocked, Then join is blocked
             When a predecessor is in progress, Then join is blocked
             When a predecessor is unknown, Then join is blocked
             When a successor state changes, Then join state does not change
             When both predecessors are finished, Then join is finished

That is simply invaluable. Anyone coming later to the project only needs to read that to grasp an immediate understanding of the intended behavior. And it's isolated and unit-tested. How does the test code look like? Well, pretty much like your regular TDD-style, but with some naming conventions: 
    
    
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

posted on Tuesday, September 29, 2009 9:18 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/09/29/AreyousmartenoughtodowithoutTDD.aspx#171130 "permalink") re: Are you smart enough to do without TDD @ Tuesday, September 29, 2009 10:28 PM

The world is changing... we are evolving... what is important is recognize good ideas. I was looking for AAA for long time; for me, it is the most natural way to write tests.   
  
btw @ Buenos Aires CodeCamp I saw a test with record-play-rewind inside the default comments, of ASP.MVC, Arrange-Act-Assert... very funny.   
  
NOTE: at the end of the demo they talked about NMock + RhinoMock and they doesn't know about the existence of MoQ. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Fabio Maulo](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://fabiomaulo.blogspot.com/ "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/09/29/AreyousmartenoughtodowithoutTDD.aspx#171149 "permalink") re: Are you smart enough to do without TDD @ Tuesday, September 29, 2009 11:33 PM

re: Are you smart enough to do without TDD [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://ayende.com/Blog/archive/2009/09/30/re-are-you-smart-enough-to-do-without-tdd.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/09/29/AreyousmartenoughtodowithoutTDD.aspx#171229 "permalink") re: Are you smart enough to do without TDD @ Wednesday, September 30, 2009 3:42 AM

hmmm I have tried your approach in the past. And did not work well for me . Too long method and class names and too difficult to organize and find them. Could you post on that subject? How you organize a real worl solution? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Apostolis Bekiaris](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://apobekiaris.blogspot.com "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/09/29/AreyousmartenoughtodowithoutTDD.aspx#171268 "permalink") re: Are you smart enough to do without TDD @ Wednesday, September 30, 2009 6:29 AM

While you seem to have some well thought arguments here in favor of TDD, I do want to point out that your bashing of Rhino Mocks is misinformed.   
  
Rhino Mocks is not playing catch-up. I was using it on .net 1.0 - try writing MoQ for .net 1.0 and see how easily you can do AAA. Instead of playing catchup, Rhino is adding features as the language and tool landscape changes. Sounds like a good design, if capable of that.   
  
And if you read the post that states the record/replay model is at the core of mocking, you'll see the actually uses this wording "You specify what you think that should happen, you execute the code under test and then you verify that the expected happened.".   
  
Full disclosure: I'm currently using neither Rhino nor MoQ, and have used both with few complaints against either.   
  
  
Really, I'd prefer reading your post as a response to his, but you mixed in needless Rhino bashing for absolutely no reason, and its inaccuracy detracted from your other thoughts. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

Philip

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/09/29/AreyousmartenoughtodowithoutTDD.aspx#171302 "permalink") re: Are you smart enough to do without TDD @ Wednesday, September 30, 2009 8:03 AM

I'm sorry, but I have to agree completely with Philip here, Rhino mocks is 5 years old, initially written in .net 1.0 and updated over the years, attacking it in this manner seems a little short sighted.   
  
As for TDD, sure there are instances that its appropriate, and a powerful way to develop sound solutions, but at the same time there are realworld cases where it's not.   
  
Mocking is an essential part of any tdd or general unit tests for a decent sized project (mvc .net and ata access layers is a great example) so surely someone who has provided that amount of support to the .net oss community and created an early mocking solution would know a thing or two about tdd and its benefits. Might i suggest a little more care when jumping to conclusions when reading other blogs. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl4$EditLink',''\))

Simon

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/09/29/AreyousmartenoughtodowithoutTDD.aspx#171360 "permalink") re: Are you smart enough to do without TDD @ Wednesday, September 30, 2009 11:33 AM

Nicely said!   
  
It all comes down to Shu-Ha-Ri - while Masters in the Ri stage may exist, I'm wise enough to know that I'm fallible.   
  
<http://en.wikipedia.org/wiki/Shuhari>   
  
Regarding comments by others: I don't mind a little Rhino-bashing; there are enough sycophants ready to agree with anything Ayende says. I've paid my dues fighting with Rhino Mocks and attempting Boo DSLs. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl5$EditLink',''\))

[Bill Sorensen](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.truewill.net/myblog/index.php "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/09/29/AreyousmartenoughtodowithoutTDD.aspx#172086 "permalink") re: Are you smart enough to do without TDD @ Friday, October 02, 2009 8:25 AM

I'd love to be smart enough to not need TDD. But then, I'd love to be smart enough to be able to DO TDD in the first place.   
  
Knowing what my code will pretty much look like before I start writing it would be a nice skill to have. Not there yet, unfortunately. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl6$EditLink',''\))

[Will Sullivan](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://statestreetgang.net "Anonymous")

  

[![](/web/20091003131709im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
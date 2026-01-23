---
layout: post
title: "Daniel Cazzulino's Blog : Automocking container with Moq"
date: 2008-10-13 00:00:00 +0000
---

## Automocking container with Moq 

I realized that I never blogged about this cool feature contributed by [Slava](http://code.google.com/u/slava42/) to [Moq-Contrib](http://code.google.com/p/moq-contrib).

Auto-mocking containers was an idea originally (IIRC) from the guys at [Eleutian](http://blog.eleutian.com/CommentView,guid,762249da-e25a-4503-8f20-c6d59b1a69bc.aspx), later on [picked up by Jeremy Miller](http://codebetter.com/blogs/jeremy.miller/archive/2008/02/09/automocker-in-structuremap-2-5.aspx) with [Rhino Mocks](http://ayende.com/) and [StructureMap](http://structuremap.sourceforge.net/).

The [wiki document Slava put together on Automocking](http://code.google.com/p/moq-contrib/wiki/Automocking) is a fantastic overview. Basically, you can have an ([Autofac](http://autofac.googlecode.com/)-powered) container create your objects under test with all its dependencies injected as mocks:
    
    
    var factory = new MockFactory(MockBehavior.Loose);  
    var container = new AutoMockContainer(factory);  
    var tree = container.Create<Tree>();

Because it uses a [MockFactory](http://www.clariusconsulting.net/labs/moq/html/4C85C26D.htm), it also integrates with the rest of the features in Moq that are available through the factory, such as consistent settings for [mock behavior](http://www.clariusconsulting.net/labs/moq/html/90760C57.htm), whether to [call base class implementations](http://www.clariusconsulting.net/labs/moq/html/B8B2A0F0.htm), and the [default value behavior](http://www.clariusconsulting.net/labs/moq/html/186CEE4D.htm).

Go ahead and [read the wiki](http://code.google.com/p/moq-contrib/wiki/Automocking) and [get the bits](http://code.google.com/p/moq-contrib)!

posted on Monday, October 13, 2008 11:56 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

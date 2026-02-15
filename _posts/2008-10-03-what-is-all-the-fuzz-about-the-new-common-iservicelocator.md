---
layout: post
title: What is all the fuzz about the new common IServiceLocator
date: 2008-10-03 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/what-is-all-the-fuzz-about-the-new-common-iservicelocator
tags:
- .NET
- All Technology

---

There's been [some](http://codebetter.com/blogs/jeremy.miller/archive/2008/08/16/it-s-time-for-ioc-container-detente.aspx) [excitement](http://codebetter.com/blogs/jeremy.miller/archive/2008/08/16/it-s-time-for-ioc-container-detente.aspx) [lately](http://www.tavaresstudios.com/Blog/post/Announcing-The-IServiceLocator-interface.aspx) about the introduction of a [common IServiceLocator](http://www.codeplex.com/CommonServiceLocator) that all major DI containers apparently will provide.

Unless you're building an "[extensible framework leveraging framework consumer selectable IoC containers](http://codebetter.com/blogs/jeremy.miller/archive/2008/08/16/it-s-time-for-ioc-container-detente.aspx)", don't sweat it too much, the interface was NOT created for you!

Let me reiterate: adding a dependency on IServiceLocator to your classes is NOT a good idea. When you do so, instead of an explicit and self documenting dependency on an external object, you're tunneling this locator that now hides to the class consumers which are its true dependencies. This is BAD, as it requires users to go to your class documentation (and hope it's updated) rather than its constructor to see what it needs to operate. If you've done any kind of work extending VS you know how bad this can get.

I've seen comments that this is just a "purist" view and that the real world ain't like this and you still need it.

Somehow some people seem to think that we (those who have contributed some [open source framework](http://mockframeworks.com/moq) of sorts) don't work on real projects and live in an ideal world and make frameworks for these ideal situations which don't actually translate to your real world. That we somehow just dream about the ideal conditions and spit a framework accordingly.

Oh that's so wrong ;). I wish it were that way sometimes, though, hehe.

I speak from experience in actual projects (working on two of them simultaneously these days, one of them fairly large), and let me repeat: **YOU DON'T NEED A DEPENDENCY ON IServiceLocator** in your business objects.

What you might need is to change your DI framework of choice if it doesn't allow you to get rid of that dependency ;).  
Let me elaborate on some of the situations that supposedly require so:

  1. Named instances: just move the named instance requirement outside the bz class and into the container configuration:  

         
         builder.Register<IBar>(c => new Bar(c.Resolve<IFoo>("a"))); 

  2. Need all instances of X: again, move the dependency out of your bz class and into configuration!  

         
         builder.Register<IBar>(c => new Bar( /* get an IEnumerable<T> from container, or whatever */  )); 

  3. Need to create new instances of components inside your bz class (that is, you need a factory?): register a Func<T> factory for your component!  

         
         builder.RegisterGeneratedFactory<Func<IBar>>();
         
         ctor Foo(Func<IBar> barFactory);
         
         // Foo needs a new bar?  
         var b = barFactory();

  
If you can come up with a real world scenario (which does NOT involve authoring a framework such as ASP.NET MVC, MonoRail, etc.) where a good DI container cannot save you from having that dependency, only then I'll believe you need IServiceLocator. 

I'd argue that people that should care/use such a thing is even less than 1%. That's why I wouldn't go about publicizing this thing so much, and you should hardly care about it. I can see it applied by (non-DI) framework authors to enable different DI frameworks to be plugged-in, but I hardly see how anyone doing "real world" work would benefit rather than detriment from its use.

There you have my rant too :)

/kzu

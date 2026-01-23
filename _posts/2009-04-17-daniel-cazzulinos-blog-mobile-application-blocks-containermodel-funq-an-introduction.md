---
layout: post
title: "Daniel Cazzulino's Blog : Mobile Application Blocks ContainerModel / Funq: an introduction"
date: 2009-04-17 00:00:00 +0000
---

## Mobile Application Blocks ContainerModel / Funq: an introduction 

If you follow my blog, you probably heard about [Funq](http://funq.me/), and maybe you even watched the [screencasts](http://www.clariusconsulting.net/blogs/kzu/archive/2009/02/02/116399.aspx) I did about it while developing it (yeah, I'm missing a bunch of new ones!).

When we started working on a rev for the original Mobile Client Software Factory v1 for [patterns & practices](http://msdn.microsoft.com/practices), we had a list of top-priority issues and feature requests expressed by the community and the advisory board. Very high on the list was *removal* of the Composite UI Application Block (CAB) from the blocks, as its performance impact was too great for mobile apps. 

Despite all my efforts to make CAB more performant (including compile-time codegen a-la sgen of the injection policies), I just couldn't make it fly. It was simply not designed for a constrained execution environment where things like allocated bytes and JIT compilation DOES matter.

Yet, we didn't want to just rip-off CAB and leave nothing to replace it. Designing an application in a loosely coupled way and enabling testability are important goals that we wanted to encourage in the mobile world. So I decided to start from scratch on the simplest possible DI container we could give mobile developers that could add sufficient value to their architectures without compromising application cold boot speed or general runtime performance.

The culmination of that effort is a very simple container (I claim anyone can crack open the source code and understand it quite easily ;)) that outperforms every other DI container on the market by orders of magnitude. I named the new [Mobile Application Blocks](http://mobile.codeplex.com/) (MAB) DI framework ContainerModel. p&p already has a desktop/silverlight offering in the space with [Unity](http://unity.codeplex.com/), so with their authorization, I forked (but keep 100% in sync) the project into [Funq](http://funq.me/), which provides the desktop and silverlight binaries and source. So, MAB ContainerModel == Funq. It may be that the latter adds features that only apply to the desktop and/or silverlight (i.e. ASP.NET MVC and WCF integration, etc.), but the core will always remain in sync.

The performance results for the CF version are:

![image](/web/20090420043907im_/http://www.clariusconsulting.net/images/blogs/kzu/MobileApplicationBlocksContainerModelFun_79EB/image.png)

Here you can see how bad ObjectBuilder v1 (the backbone of CAB) was, even at a generous (estimated average) 7x performance gain via compile-time codegen, resulting in a 133x overhead! (without the obgen compile-time tool, it would be ~900x :S).

In comparison, the new ContainerModel is a modest 12x slower than no DI at all, and still orders of magnitude faster than a quick port to CF of both Autofac and Unity. 

On the desktop, numbers are also equally encouraging:

![image](/web/20090420043907im_/http://www.clariusconsulting.net/images/blogs/kzu/MobileApplicationBlocksContainerModelFun_79EB/image_3.png)

This shows only the top 3 performing containers, as including others such as Windsor ruins the graph (it's 6x slower than Autofac, about 80x slower than Funq).

As I said, key performance counters you typically don't measure on the desktop are of critical importance on the CF. So I developed the container while carefully watching the impact on those. Here are the results and comparison:

[ ![image](/web/20090420043907im_/http://www.clariusconsulting.net/images/blogs/kzu/MobileApplicationBlocksContainerModelFun_79EB/image_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/MobileApplicationBlocksContainerModelFun_79EB/image_4.png)

As you can see, Unity does significantly better than the original ObjectBuilder, but it was still not enough for CF. The new ContainerModel overhead is barely noticeable across all areas, with consistently low impact.

To be honest, the comparison on the CF is unfair to the other frameworks, because none of them were designed nor optimized for use on mobile devices. I just ported enough of the code to get them to compile and run.  

  

Over the next few posts, I'll explain more about its design and features. Stay tunned!

posted on Friday, April 17, 2009 5:27 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

---
layout: post
title: "Funq: screencast series on how to build a DI container using TDD"
date: 2009-02-02 00:00:00 +0000
---

##  [Funq: screencast series on how to build a DI container using TDD](<http://blogs.clariusconsulting.net/kzu/funq-screencast-series-on-how-to-building-a-di-container-using-tdd/> "Funq: screencast series on how to build a DI container using TDD")

February 2, 2009 8:49 pm

Over the past few days, I spent some time recording the experience of building a dependency injection container using test driven development. It was a cool experience for me, and I hope you find the screencasts useful.

Here are all the episode links:

  1. Part I: selecting a high performance approach and building the basics with few lines of code. [View](<http://www.viddler.com/explore/dcazzulino/videos/1/>) | [Download](<http://cloud.funq.me/part1.mp4>)
  2. Part II: adding support for passing constructor arguments to resolved instances. [View](<http://www.viddler.com/explore/dcazzulino/videos/2/>) | [Download](<http://cloud.funq.me/part2.mp4>)
  3. Part III: adding named services and refactoring to improve code. [View](<http://www.viddler.com/explore/dcazzulino/videos/4/>) | [Download](<http://cloud.funq.me/part3.mp4>)
  4. Part IV: add support for instance reuse. [View](<http://www.viddler.com/explore/dcazzulino/videos/5/>) | [Download](<http://cloud.funq.me/part4.mp4>)
  5. Part V: adding support for container hierarchies. [View](<http://www.viddler.com/explore/dcazzulino/videos/6/>) | [Download](<http://cloud.funq.me/part5.mp4>)
  6. Part VI: adding deterministic disposal of container hierarchies and instances created by them. [View](<http://www.viddler.com/explore/dcazzulino/videos/7/>) | [Download](<http://cloud.funq.me/part6.mp4>)
  7. Part VII: polishing a fluent API. [View](<http://www.viddler.com/explore/dcazzulino/videos/8/>) | [Download](<http://cloud.funq.me/part7.mp4>)
  8. Part VIII: adding support for initializer functions. [View](<http://www.viddler.com/explore/dcazzulino/videos/9/>) | [Download](<http://cloud.funq.me/part8.mp4>)
  9. Part IX: how well does it perform really? [View](<http://www.viddler.com/explore/dcazzulino/videos/10/>) | [Download](<http://cloud.funq.me/part9.mp4>)

Funq is by no means a revolutionary concept to DI, I’m well aware of that. But it’s one that takes a minimalistic approach to keep the performance impact of DI to a bare minimum. One of the project core requirements was to perform very well on the Compact Framework, as part of its inclusion in the upcoming [Mobile Client Software Factory v2](<http://www.codeplex.com/mobile>) from [patterns & practices](<http://msdn.microsoft.com/practices>).

I hope this series serves to understand the inner workings of this fully functional yet extremely simple DI container.

[**Update 3/10/2011**]: I’ve been told these videos are being used also to showcase how to do TDD in a real-world scenario, which is quite gratifying. And I’ve just checked [Amazon Cloud Front](<http://aws.amazon.com/cloudfront/>) (which I use to make the downloads available to you at the fastest possible speeds without breaking the bank) and it’s still consistently delivering ~4GB/month of downloads across the globe (top EU, then USA).

I also learned I can embed the videos right here, so here they are ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

### ![Loading](http://cdn-static-qsc-1.viddler.com/vlnc/live/images/loaders/ajaxload.gif)  
Loading Viddler Videos

[Powered By Viddler](<http://viddler.com/>)

  

Posted by kzu
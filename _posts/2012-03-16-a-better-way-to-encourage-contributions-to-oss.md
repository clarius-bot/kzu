---
layout: post
title: "A better way to encourage contributions to OSS"
date: 2012-03-16 00:00:00 +0000
---

Currently in the .NET world, most OSS projects are available via a [NuGet](<http://nuget.org/>) package. Users have a very easy path towards *using* the project right away.

But let’s say they encounter some isssue (maybe a bug, maybe a potential improvement) with the library. At this point, going from user to contributor (of a fix, or a good bug repro or even a spike for a new feature) is a very steep and non trivial multi-step process of registering with some open source hosting site (codeplex, github, bitbucket, etc.), learning how to grab the latest sources, build the project, formulate a patch (or fork the code), learn the source control software they use (mercurial, git, svn, tfs), install whatever tools are needed for it, read about the contributors workflow for the project (do you fork & send pull requests? do you just send a patch file? do you just send a snippet? a unit test? etc.), and on, and on, and on. Granted, you may be lucky and already know the source control system the project uses, but in really, I’d say the chances are pretty low. I believe most developers *using* OSS are far from familiar with them, much less with contributing back to various projects. We OSS devs like to be on the cutting edge all the time, ya’ know, always jumping on the new SCC system, the new hosting site, the new agile way of managing work items, bug tracking, code reviews, etc. etc. etc.. But most of our OSS users are largely the “[dark matter developers](<https://bit.ly/zb1zQM>)”, they simply don’t have the time to put through all that friction just to contribute back. Even if they want to, it’s just WAY too much. It’s discouraging.

We can do better.

How about this flow? 

  1. User installs library: install-package Moq 
  2. He/she uses it happily for years (let’s say ![Winking smile](http://blogs.clariusconsulting.net/kzu/files/2012/03/wlEmoticon-winkingsmile.png)), until one day an issue comes up that’s becoming annoying or doesn’t look like it has a known workaround. So it’s time for a time-boxed investigation to see if it’s truly a library bug or a user bug. 
  3. User uninstalls library: uninstall-package Moq 
  4. User installs library source package: install-package Moq.Source 
     * At this point, they get the entire *source* for the project, as content (source) files in the SAME project they were previously using the library reference. Everything should still compile just like before. All that changed is that now you’re building against the actual sources, not the library. 
     * Any dependencies the library uses for compiling got added automatically by NuGet to the users’ project. 
  5. In order to understand a bit the library source code and how it’s being tested, the user installs the library unit tests source package: install-package Moq.Tests 
     * At this point, they can run the entire test suite for the library, inspect the tests to learn how to isolate various pieces, and learn about the structuring of the code a bit. 
     * Note that the tests source would typically be installed in a test project on the user’s solution. 
  6. Now the user goes and creates a new unit test to try to repro in isolation the issue he/she found. 
  7. After a successful repro, the time-box may be over. But still, the clean repro he/she got is very useful in its own. 
     * If the user has enough time, they may even be able to fix the issue in the code itself, or add the missing behavior. 
     * Because of the way NuGet works, when you install a package that brings “content” (code, markup, config files, etc.) into your project, you now have two copies of that content: the original one under the packages folder alongside the solution file, and the potentially modified one in your own project. 
  8. At this point,**a little bit of VS extensibility and automation could detect that you made changes to that code, and offer a context menu to “Send Feedback”,** which could pre-package the diff (patch file, .zip, clone/commit/whatever), allow the user to enter briefly an explanation of the issue, and be done. 
  9. Now, if the issue was really a showstopper, the user now has a way forward, that didn’t even require them to leave their own solution. Granted, checking into a company source control the actual source for an entire OSS project is typically unfeasible. So the alternative is for them to just uninstall-package Moq.Source, go back to install-package Moq and go on by implementing a workaround. But they have actively contributed back to a project they appreciate, they now have a real explanation (for dev leads, upper management) of why something proved harder than expected, and they probably even came out of the experience learning a new trick or two that they found in that codebase while they were investigating. An all around win-win situation. 

I believe this is totally worth exploring. I’m willing to give this a try for Moq v5, as we talked about in [our first hangout](<https://bit.ly/xNP9BT>). What do you think? Is this something that looks reasonable and useful?

/kzu

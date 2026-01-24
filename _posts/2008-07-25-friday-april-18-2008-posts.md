---
layout: post
title: "Daniel Cazzulino's Blog - Friday, April 18, 2008 - Posts"
date: 2008-07-25 00:00:00 +0000
---

## Friday, April 18, 2008 - Posts

#####  [Locating the active item in the solution explorer](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/Locatingtheactiveiteminthesolutionexplorer.aspx)

Say you are working with a code file. At some point, you "Go To Definition" of another type, and now you have its code file opened. Or maybe you just run the solution to debug a weird issue that's happening, turn on "break when exception is thrown" option, and just when the exception is thrown, Visual Studio gets activated, and you get the relevant code file opened at the appropriate location.

Now, say you have a typical solution, which contains solution folders and many projects. Can you quickly locate the project/folder where the file is?

![image](https://web.archive.org/web/20080725035525im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image.png)

I've found that MOST developers simply go fishing for the file, or look at the file path and pray the solution folders actually match physical folders so they can manually traverse it, etc. Turns out there's a much better alternative, which is to turn on "Track Active Item in Solution Explorer" under Tools > Options > Projects and Solutions:

![image](https://web.archive.org/web/20080725035525im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image_3.png)

Now after clicking OK, the solution explorer is automatically expanded and the proper node selected:

![image](https://web.archive.org/web/20080725035525im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image_4.png)

Much better, right?

Well, turns out that I'm pretty darn sure this option was ON by default in VS2002 and maybe even 2003. I [reported this back in 2005](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=105637 "Make "Trake Active Item in Solution Explorer" be enabled by default") with a suggestion to turn it on by default again. It was resolved "By Design": 

> ...due to a significant amount of customer feedback we've received. The concern that people were raising about having this option enabled by default was that there were certain scenarios where there was a performance hit. 

Well, I tried it with the certainly big Enterprise Library 3.1 solution (no unit tests), which contains 38 projects with 1867 files in 1136 folders and haven't noticed any significant issue associated with enabling that option.

If you think the usability improvements from having this option on surpass the remote chance that in certain scenarios there may be a performance hit (?), please go and [vote to get it fixed](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=105637 "Make "Trake Active Item in Solution Explorer" be enabled by default"). Believe me, [we CAN make it change](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/ForthosethatthinkMicrosoftConnectisuseless.aspx "For those that think Microsoft Connect is useless"). I'm going to reopen the bug if there are significantly new voters.

posted [Friday, April 18, 2008 1:44 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/Locatingtheactiveiteminthesolutionexplorer.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [5 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/Locatingtheactiveiteminthesolutionexplorer.aspx#comments)

#####  [For those that think Microsoft Connect is useless](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/ForthosethatthinkMicrosoftConnectisuseless.aspx)

A while back I reported both [through my weblog](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/25/SeriousflawinWPFvalidationinfrastructureforValidationRuleandBinding.aspx "Serious flaw in WPF validation infrastructure for ValidationRule and Binding") and [Microsoft Connect](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=299711) what I thought was a serious flaw in the WPF validation infrastructure for ValidationRule and Binding. The issue, in short was:

> > The validation check is invoked during any attempt to update the underlying data ... **_before a value converter is called_** (if present)...

Take special note that this was not some undocumented, strange behavior, but rather something that was explicitly explained on [MSDN where the validation process was explained](http://msdn2.microsoft.com/en-us/library/ms752347.aspx#validation_process) as part of the design. 

But based on my feedback and the 13 other people that voted to fix the bug, it looks like they just did so (at least that's what [the bug](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=299711) status shows).

Pretty significant IMO, especially since in my experience these kind of "breaking changes even if the existing behavior was already broken" issues rarely get fixed, no matter how obvious the error might be. 

Continue blogging and bitching about stuff that bothers you, but don't forget to [report it formally](https://connect.microsoft.com/): it might [make a difference](http://www.clariusconsulting.net/blogs/kzu/archive/2004/09/11/ContributingFeedback.aspx "How I got Microsoft to create XPathExpression.Compile") and we may end up getting a better product from Microsoft (it may take years, but hey, it's a learning process!).

posted [Friday, April 18, 2008 1:12 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/ForthosethatthinkMicrosoftConnectisuseless.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/ForthosethatthinkMicrosoftConnectisuseless.aspx#comments)

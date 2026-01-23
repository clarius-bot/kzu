---
layout: post
title: "Daniel Cazzulino's Blog : Locating the active item in the solution explorer"
date: 2008-04-18 00:00:00 +0000
---

## Locating the active item in the solution explorer 

Say you are working with a code file. At some point, you "Go To Definition" of another type, and now you have its code file opened. Or maybe you just run the solution to debug a weird issue that's happening, turn on "break when exception is thrown" option, and just when the exception is thrown, Visual Studio gets activated, and you get the relevant code file opened at the appropriate location.

Now, say you have a typical solution, which contains solution folders and many projects. Can you quickly locate the project/folder where the file is?

![image](https://web.archive.org/web/20080421221036im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image.png)

I've found that MOST developers simply go fishing for the file, or look at the file path and pray the solution folders actually match physical folders so they can manually traverse it, etc. Turns out there's a much better alternative, which is to turn on "Track Active Item in Solution Explorer" under Tools > Options > Projects and Solutions:

![image](https://web.archive.org/web/20080421221036im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image_3.png)

Now after clicking OK, the solution explorer is automatically expanded and the proper node selected:

![image](https://web.archive.org/web/20080421221036im_/http://www.clariusconsulting.net/images/blogs/kzu/Locatingtheactiveiteminthesolutionexplor_185C/image_4.png)

Much better, right?

Well, turns out that I'm pretty darn sure this option was ON by default in VS2002 and maybe even 2003. I [reported this back in 2005](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=105637 "Make "Trake Active Item in Solution Explorer" be enabled by default") with a suggestion to turn it on by default again. It was resolved "By Design": 

> ...due to a significant amount of customer feedback we've received. The concern that people were raising about having this option enabled by default was that there were certain scenarios where there was a performance hit. 

Well, I tried it with the certainly big Enterprise Library 3.1 solution (no unit tests), which contains 38 projects with 1867 files in 1136 folders and haven't noticed any significant issue associated with enabling that option.

If you think the usability improvements from having this option on surpass the remote chance that in certain scenarios there may be a performance hit (?), please go and [vote to get it fixed](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=105637 "Make "Trake Active Item in Solution Explorer" be enabled by default"). Believe me, [we CAN make it change](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/18/ForthosethatthinkMicrosoftConnectisuseless.aspx "For those that think Microsoft Connect is useless"). I'm going to reopen the bug if there are significantly new voters.

posted on Friday, April 18, 2008 1:44 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

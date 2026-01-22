---
layout: post
title: "Add References with Search"
date: 2010-06-09 00:00:00 +0000
---

##  [Add References with Search](<http://blogs.clariusconsulting.net/kzu/add-references-with-search/> "Add References with Search")

June 9, 2010 2:08 pm

If you have been using VS2010 for any significant amount of time, you surely came across the awkward, slow and hard to use Add Reference dialog. Despite some (apparent) [improvements over the VS2008](<http://weblogs.asp.net/scottgu/archive/2009/10/29/add-reference-dialog-improvements-vs-2010-and-net-4-0-series.aspx>) behavior, in its current form it’s even LESS usable than before. A brief non-exhaustive summary of the typical grief with this dialog is:

  1. Scrolling a list of *hundreds* of entries? (300+ typically)
  2. No partial matching when typing: yes, you can type in the list to get to the desired entry, but the matching is performed in an exact manner, from the beginning of the assembly name. So, to get to the (say) “Microsoft.VisualStudio.Settings” assembly, you actually have to type the first two segments in their entirety before starting to type “Settings”.
  3. Lazy loading with no progress indicator: loading is done asynchronously in VS2010, supposedly improving the situation from VS2008 where it would just freeze until it was done. Well, without an indicator, you don’t know when loading is done and when it’s safe to assume a given assembly isn’t there because it is truly not available.
  4. Random order while lazy loading: moreover, while the lazy loading is happening (and you don’t know when it’s done), entries in the list are added in an almost random order, so any scrolling or typing you do results in constant repositioning of the current selection and changes to the underlying list. This makes it effectively impossible to use the dialog until the lazy loading is completed.
  5. No sorting while lazy loading: related to the previous one, you cannot sort the list at all until the lazy loading is complete, so scrolling is impossible.

So [we decided](<http://www.clariusconsulting.net/>) to do something about it. I introduce you to the [Search References extension](<http://visualstudiogallery.msdn.microsoft.com/en-us/02c0bded-4739-40ec-af07-9eb002a27246>):

![image\[5\]](http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image5.png)

From the Extension Manager in Visual Studio 2010, you can simply search the Online Gallery for “Search Reference” and install it right-away:

![image](http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image.png)

The dialog loads VERY fast. And because a picture speaks a thousand words, here are more screenshots to get you excited.

Partial matching:

![image\[10\]](http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image10.png)

Multi-selection:

![image\[18\]](http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image18.png)

Current project .NET profile aware. Silverlight 4:

![image\[23\]](http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image23.png)

Silverlight 3:

![image\[28\]](http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image28.png)

Enjoy, and don’t forget to rate it!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=247793)

Posted by kzu
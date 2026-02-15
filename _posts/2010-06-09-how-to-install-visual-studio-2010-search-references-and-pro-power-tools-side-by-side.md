---
layout: post
title: How to install Visual Studio 2010 Search References and Pro Power Tools side
  by side
date: 2010-06-09 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/how-to-install-visual-studio-2010-search-references-and-pro-power-tools-side-by-side
tags:
- .NET
- All Technology

---

The new [Visual Studio 2010 Pro Power Tools](http://visualstudiogallery.msdn.microsoft.com/en-us/d0d33361-18e2-46c0-8ff2-4adea1e34fef) bring a new Add Reference dialog that completely replaces the classic one when you click the familiar Add Reference command:

![image](/img/2010-06-09-1.png)

It seems like a nice dialog that is more aligned with the new Add New dialog and the Extension Manager one. But for this particular case, I believe it's awfully overkill (what's the use of that right sidebar? what's the use for the categories of assemblies split between Framework and Extensions?).

The (also new) [Search References](http://visualstudiogallery.msdn.microsoft.com/en-us/02c0bded-4739-40ec-af07-9eb002a27246) extension which [I blogged about earlier](http://www.clariusconsulting.net/blogs/kzu/archive/2010/06/09/AddReferenceswithSearch.aspx), gives you the familiar classic dialog enhanced with the must-have Search capability:

![image\[10\]](https://web.archive.org/web/20100612215802im_/http://www.clariusconsulting.net/images/blogs/kzu/d5a5f81701d1_9BFA/image10.png)

This dialog has a few key usability features that make it a snap to use (and better than the Pro Power Tools one, I think): it will open up focused on the search textbox, it will remember your last search, and it supports keyboard-only usage extensively (i.e., type "entity", down-arrow to enter the filtered list, shift or control multi-select, press Enter and done!). Also, as you're already used to, double clicking on a reference also directly adds it and dismisses the dialog (in the Pro Power Tools you need to close the dialog explicitly).

If you want to continue using this familiar, lightweight and simpler dialog, but still want to install the Pro Power Tools, you can easily disable its "Add Reference" dialog by going to your `%LocalAppData%\Microsoft\VisualStudio\10.0\Extensions\Microsoft\Visual Studio 2010 Pro Power Tools` folder, and deleting the `AddReference.dll` and `AddReference.pkgdef` files.

Enjoy!

/kzu

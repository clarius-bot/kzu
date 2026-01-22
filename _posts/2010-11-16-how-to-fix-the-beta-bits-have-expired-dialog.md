---
layout: post
title: "How to fix the Beta bits have expired dialog"
date: 2010-11-16 00:00:00 +0000
---

##  [How to fix the Beta bits have expired dialog](<http://blogs.clariusconsulting.net/kzu/how-to-fix-the-beta-bits-have-expired-dialog/> "How to fix the Beta bits have expired dialog")

November 16, 2010 11:57 am

If you installed a [WoVS](<http://visualstudiogallery.msdn.microsoft.com/en-us/site/profile?userName=Clarius%20%20Consulting>) extension prior to 10/25, and didn’t update the bits from the Updates tab in Extension Manager prior to 10/27, then you may see the following annoying dialog:

[![image](http://www.clariusconsulting.net/images/blogs/kzu/817571e35a31_7959/image_thumb.png)](<http://www.clariusconsulting.net/images/blogs/kzu/817571e35a31_7959/image.png>)

Due to an unfortunate bug, the expiration time was not being checked once for the lifetime of VS, but repeatedly, causing this dialog to never go away in some extensions ![Sad smile](http://www.clariusconsulting.net/images/blogs/kzu/817571e35a31_7959/wlEmoticon-sadsmile.png). This also meant that you didn’t even had a chance to go to the Extension Manager to update it or remove it! The typical Add/Remove programs didn’t work either as VS extensions are typically not installed via an MSI.

But the Visual Studio 2010 extensibility model is designed to cope with this easily. All extensions are xcopy-deployed to your %localappdata%\Microsoft\VisualStudio\10.0\Extensions folder. There is a folder per company (WoVS extensions are under "Clarius Consulting"), and just deleting an extension's folder is enough to remove it completely from VS.

Once you removed the expired ones, you can download them again from the Extension Manager.

We apologize for this very annoying bug. We have now updated the bits all extensions use for expiration checking to be smarter, so you shouldn’t see this nasty issue again.

Thanks for your patience!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=296679)

Posted by kzu
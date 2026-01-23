---
layout: post
title: "How to map a shared SkyDrive folder as a network drive in Windows"
date: 2012-03-22 00:00:00 +0000
---

##  [How to map a shared SkyDrive folder as a network drive in Windows](<http://blogs.clariusconsulting.net/kzu/how-to-map-a-shared-skydrive-folder-as-a-network-drive-in-windows/> "How to map a shared SkyDrive folder as a network drive in Windows")

March 22, 2012 1:37 pm

  1. Open the folder in the skydrive site using the browser (it would be under Shared menu on the left). The url will look something like: https://skydrive.live.com/?cid=529BD9445B66F60D&id=529BD9445B66F60D%21189#cid=529BD9445B66F60D&id=529BD9445B66F60D%21189. Now the “cid” query parameter in the URL.
  2. Right-click on Network (in windows explorer), then “Map Network Drive”
  3. Specify Folder as: https://d.docs.live.net/[cid]/[folder_name]. For the sample URL above, it would be https://d.docs.live.net/529bd9445b66f60d/CQRS (note the folder name isn’t in the URL, you need to know it beforehand, and it has to match what it’s named on the site).
  4. Check the “Use alternate credentials” option in the dialog: 

![image](http://blogs.clariusconsulting.net/kzu/files/2012/03/image.png)

  5. Click Finish. Enter your Live ID credentials when asked. Done!

Not everything works that great (i.e. copying large files via drag&drop doesn’t work, renaming folders, etc., at least in my experience), but it’s pretty darn convenient most of the time. I’m not sure the same thing works for your own personal folders. I don’t use SkyDrive at all, but it certainly does for shared ones (nice when you need a simple way to share docs within a team, privately and without requiring any software to be installed for syncing…).

Enjoy.

Posted by kzu

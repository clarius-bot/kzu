---
layout: post
title: "Daniel Cazzulino's Blog : Hard drive capable of hosting Windows Home Server was not found while installing on VMWare"
date: 2007-10-01 00:00:00 +0000
---

## Hard drive capable of hosting Windows Home Server was not found while installing on VMWare 

VMWare suggests by default that you create SCSI hard drives when you create a new VM based on the Win2003 profile. 

Turns out that WHS will not recognize these drives:

[![image](https://web.archive.org/web/20080603044758im_/http://www.clariusconsulting.net/images/blogs/kzu/HarddrivecapableofhostingWindowsHomeServ_F2F/image_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/HarddrivecapableofhostingWindowsHomeServ_F2F/image.png)

You will have to shutdown the VM, remove and optionally delete the original SCSI disk, and create new IDE drive. Remember to make it bigger than 65GB, and now installation should run smoothly.

/kzu

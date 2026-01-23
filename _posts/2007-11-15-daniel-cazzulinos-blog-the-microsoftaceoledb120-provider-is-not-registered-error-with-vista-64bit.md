---
layout: post
title: "Daniel Cazzulino's Blog : The 'Microsoft.ACE.OLEDB.12.0' provider is not registered error with Vista 64bit"
date: 2007-11-15 00:00:00 +0000
---

## The 'Microsoft.ACE.OLEDB.12.0' provider is not registered error with Vista 64bit 

If you're getting this error while trying to connect to Access 2007 or Excel 2007 via the Office 12 OleDB provider, you must first make sure you have the [Office 2007 data providers](http://www.microsoft.com/downloads/details.aspx?FamilyID=7554F536-8C28-4598-9B72-EF94E038C891&displaylang=en "MSDN download") installed.

Next, under x64 (64bit), the data providers will not work by default as they are 32-bit only (x86), even if the [data providers download page](http://www.microsoft.com/downloads/details.aspx?FamilyID=7554F536-8C28-4598-9B72-EF94E038C891&displaylang=en "MSDN download") doesn't say it. You have to explicitly compile for x86 instead of the default "Any CPU" platform:

[ ![AnyCPU](/web/20080412091633im_/http://www.clariusconsulting.net/images/blogs/kzu/The.0providerisnotregisterederrorwithVis_A50/AnyCPU_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/The.0providerisnotregisterederrorwithVis_A50/AnyCPU.png)

The solution is to add a new configuration for x86 platform in VS (click on Configuration Manager shown above), and build with explicit x86 target platform. This will force 32bit runtime and therefore will be able to load the provider on the 32 bit process. 

[ ![NewConfiguration](/web/20080412091633im_/http://www.clariusconsulting.net/images/blogs/kzu/The.0providerisnotregisterederrorwithVis_A50/NewConfiguration_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/The.0providerisnotregisterederrorwithVis_A50/NewConfiguration.png)

![x86Configuration](/web/20080412091633im_/http://www.clariusconsulting.net/images/blogs/kzu/The.0providerisnotregisterederrorwithVis_A50/x86Configuration.png)

[ ![VSx86](/web/20080412091633im_/http://www.clariusconsulting.net/images/blogs/kzu/The.0providerisnotregisterederrorwithVis_A50/VSx86_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/The.0providerisnotregisterederrorwithVis_A50/VSx86.png)

posted on Thursday, November 15, 2007 7:58 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

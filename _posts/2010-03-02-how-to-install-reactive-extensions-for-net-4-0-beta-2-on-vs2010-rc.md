---
layout: post
title: How to install Reactive Extensions for .NET 4.0 Beta 2 on VS2010 RC
date: 2010-03-02 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/how-to-install-reactive-extensions-for-net-4-0-beta-2-on-vs2010-rc
tags:
- .NET
- All Technology

---

  1. Get the [.NET 4.0 Beta 2 download](http://msdn.microsoft.com/en-us/devlabs/ee794896.aspx) from MSDN. 
  2. Open the downloaded .exe with [7zip](www.7-zip.org/) (i.e. right-click on file, select 7-Zip > Open Archive) 
  3. Navigate to the .rsrc\RCDATA\ "folder" and open the CABINET file:  
  
![image](/img/2010-03-02-1.png)   

  4. Extract the contained MSI, install and enjoy!  
  
![image](/img/2010-03-02-2.png)   

I thought I'd need to crack the MSI open with the good old Orca tool, but turns out I didn't have to!

Stay tuned, my [Reactive Framework Extensions Generator](http://www.clariusconsulting.net/blogs/kzu/archive/2009/11/26/ReactiveFrameworkExtensionsGenerator.aspx) will be soon updated to RC too :)

Enjoy!

/kzu

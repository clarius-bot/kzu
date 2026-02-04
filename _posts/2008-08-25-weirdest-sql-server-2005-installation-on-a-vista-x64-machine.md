---
layout: post
title: "Daniel Cazzulino's Blog - Weirdest SQL Server 2005 installation on a Vista x64 machine"
date: 2008-08-25 00:00:00 +0000
---

## Weirdest SQL Server 2005 installation on a Vista x64 machine 

While attempting to install SQL Server x64 I got a number of errors, so I ended up uninstalling all components I could find in the control panel, and reinstalling x32. 

Now it was time for SP2, I ended having to download BOTH x64 and x32 versions as half my components are in each platform :S. Miraculously enough, it works just fine.

Here's what I ended with:

Database Services x32  
SQL Server Native Client x64  
Client Components x32  
Backward Compatibility x64  
Microsoft SQL Server VSS Writer x64 

I installed first the x64 SP2, and then x32, and everything went smooth (aside from the 2x download size).

/kzu

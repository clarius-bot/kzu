---
layout: post
title: How to exclude copy local referenced assemblies from a VSIX
date: 2012-11-09 00:00:00 +0000
tags:
- ef
- .NET
- All Technology
- XML
- Miscelaneous
---
When you add library references to project that are not reference assemblies or installed in the GAC, Visual Studio defaults to setting Copy Local to True:

[![image](/img/2012-11-09-1.png)](<http://blogs.clariusconsulting.net/kzu/files/2012/11/image.png>)

If, however, those dependencies are distributed by some other means (i.e. another extension, or are part of VS private assemblies, or whatever) and you want to avoid including them in your VSIX, you can add the following property to the project file:
    
    
    <PropertyGroup>
      ...
      <IncludeCopyLocalReferencesInVSIXContainer>false</IncludeCopyLocalReferencesInVSIXContainer>

/kzu

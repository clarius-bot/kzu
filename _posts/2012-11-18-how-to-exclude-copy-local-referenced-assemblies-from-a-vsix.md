---
layout: post
title: "How to exclude copy local referenced assemblies from a VSIX"
date: 2012-11-18 00:00:00 +0000
---

##  [How to exclude copy local referenced assemblies from a VSIX](<http://blogs.clariusconsulting.net/kzu/how-to-exclude-copy-local-referenced-assemblies-from-a-vsix/> "How to exclude copy local referenced assemblies from a VSIX")

November 9, 2012 2:49 pm

When you add library references to project that are not reference assemblies or installed in the GAC, Visual Studio defaults to setting Copy Local to True:

[![image](http://blogs.clariusconsulting.net/kzu/files/2012/11/image_thumb.png)](<http://blogs.clariusconsulting.net/kzu/files/2012/11/image.png>)

If, however, those dependencies are distributed by some other means (i.e. another extension, or are part of VS private assemblies, or whatever) and you want to avoid including them in your VSIX, you can add the following property to the project file:
    
    
    <PropertyGroup>
      ...
      <IncludeCopyLocalReferencesInVSIXContainer>false</IncludeCopyLocalReferencesInVSIXContainer>

Posted by kzu
---
layout: post
title: "OutDir vs OutputPath"
date: 2014-01-28 00:00:00 +0000
---

##  [OutDir vs OutputPath](<http://blogs.clariusconsulting.net/kzu/outdir-vs-outputpath/> "OutDir vs OutputPath")

January 28, 2014 1:25 am

Which one should you use? Seems like OutputPath is the way to go, since it’s the one that is specified on every project you create, right inside the Debug or Release configuration. 

From C:\Windows\Microsoft.NET\Framework\v4.0.30319\Microsoft.Common.targets, however, we learn:
    
    
    OutDir:
    Indicates the final output location for the project or solution. When building a solution,
    OutDir can be used to gather multiple project outputs in one location. In addition,
    OutDir is included in AssemblySearchPaths used for resolving references.
    
    OutputPath:
    This property is usually specified in the project file and is used to initialize OutDir.
    OutDir and OutputPath are distinguished for legacy reasons, and OutDir should be used if at all possible.

Sometimes the best way to understand MSBuild is to dig deeper in the built-in targets. They are pretty well self-documented.

Posted by kzu

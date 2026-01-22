---
layout: post
title: "High level overview of Visual Studio Extensibility APIs"
date: 2013-10-25 00:00:00 +0000
---

##  [High level overview of Visual Studio Extensibility APIs](<http://blogs.clariusconsulting.net/kzu/high-level-overview-of-visual-studio-extensibility-apis/> "High level overview of Visual Studio Extensibility APIs")

October 25, 2013 12:45 pm

If your head is dizzy with the myriad VS services and APIs, from EnvDTE to Shell.Interop, this should clarify a couple things.

First a bit of background:

APIs on EnvDTE (DTE for short, since that’s the entry point service you request from the environment) was originally an API intended to be used by macros. It’s also called the automation API. Most of the time, this is a simplified API that is easier to work with, but which doesn’t expose 100% of what VS is capable of doing. It’s also kind of the “rookie” way of doing VS extensibility (VSX for short), since most hardcore VSX devs sooner or later realize that they need to make the leap to the “serious” APIs.

The “real” VSX APIs virtually always start with IVs, make heavy use of uint, ref/out parameters and HResults. These are the APIs that have been evolving for years and years, and there is a lot of COM baggage. [IVsHierarchy](<http://msdn.microsoft.com/en-us/library/microsoft.visualstudio.shell.interop\(v=vs.90\).aspx>) is a pretty representative example. But there’s hope, since most of the newer capabilities of the IDE are exposed with much more modern and .NET-friendly APIs, such as [IVsExtensionManager](<http://msdn.microsoft.com/en-us/library/microsoft.visualstudio.extensionmanager.ivsextensionmanager.aspx>).

## Solution Traversal

Solution traversal is such a core activity for any VS extension that you almost always need to do it sooner or later. As you probably guessed, there are two main ways: DTE/Automation way, and the IVs* way. 

One key thing to understand is that the automation API is an *optional* API that project types can decide to support. There’s no guarantee that any part of the automation APIs will work for a particular project. This is what may cause an extension to fail for example in a solution with a VC++ project and not with “regular” C#/VB projects.

I’d always go for the IVs* way always, since it’s more reliable, and works with projects that may not expose automation API for their custom project types. You can always get at the information the DTE API exposes by using the IVs* APIs, but it’s generally quite a bit more work.

## Too Painful?

Alternatively, you can take advantage of [Clide](<https://nuget.org/packages/clide>), a more intuitive and .NET friendly API, which leverages Linq, extension methods, dependency injection for testability, etc. 

For example, after doing 
    
    
    install-package Clide
    

on your Visual Studio extension, you can write code like this to retrieve the display name of all projects in the solution:
    
    
    var projects = DevEnv.Get(serviceProvider)
        .SolutionExplorer()
        .Solution
        .Traverse()
        .OfType<IProjectNode>()
        .Select(project => project.DisplayName)
        .ToList();
    

(this requires two using statements: Clide and Clide.Solution).

You can do things like show the solution explorer, save the solution, subscribe to solution and project events, and much more.

[Clide is open source](<https://github.com/clariuslabs/clide>) software provided by [Clarius Labs](<https://github.com/clariuslabs>). And being a NuGet package, its documentation is available at [NuDoq](<http://www.nudoq.org/#!/Projects/Clide>), of course ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif)

![](https://raw.github.com/clariuslabs/common/master/ClariusLabs.png)

Posted by kzu
---
layout: post
title: "Check your Embed Interop Types flag when doing Visual Studio extensibility work"
date: 2011-03-11 00:00:00 +0000
---

##  [Check your Embed Interop Types flag when doing Visual Studio extensibility work](<http://blogs.clariusconsulting.net/kzu/check-your-embed-interop-types-flag-when-doing-visual-studio-extensibility-work/> "Check your Embed Interop Types flag when doing Visual Studio extensibility work")

March 11, 2011 11:06 pm

In case you didn’t notice, VS2010 adds a new property to assembly references in the properties window: Embed Interop Types:

[![image](http://blogs.clariusconsulting.net/kzu/files/2011/03/image_thumb.png)](<http://blogs.clariusconsulting.net/kzu/files/2011/03/image.png>)

This property was introduced as a way to overcome [the pain of deploying Primary Interop Assemblies](<http://blogs.msdn.com/b/samng/archive/2010/01/24/the-pain-of-deploying-primary-interop-assemblies.aspx>). Read that blog post, it will help understand why you DON’T need it when doing VS extensibility (VSX) work.

It’s generally advisable when doing VSX development NOT to use Embed Interop Types, which is a feature intended mostly for office PIA scenarios where the PIA assemblies are HUGE and had to be shipped with your app. This is NEVER the case with VSX authoring. All interop assemblies you reference (EnvDTE, VS.Shell, etc.) are ALWAYS already there in the users’ machine, and you NEVER need to distribute them. So embedding those types only increases your assembly size without a single benefit to you (the extension developer/author).

But on the other hand, it confuses the VS debugger the hell out. If you are debugging some VS automation code and want to issue a command via the Immediate window or the Quick Watch to (say) count how many projects are there in the solution, you’d enter something like this: dte.Solution.Projects.OfType<EnvDTE.Project>().Count(). When you do, you will get this seemingly weird error:

> Embedded interop type ‘EnvDTE.Project’ is defined in both ‘EnvDTE.dll’ and ‘NuGet.VisualStudio.dll’. Some operations on objects of this type are not supported while debugging. Consider casting this object to type ‘dynamic’ when debugging or building with the ‘Embed Interop Types’ property set to false. 

But now that you know what that property is for, you probably guessed why it’s happening: the debugger doesn’t know WHICH EnvDTE you are referring two, because there are TWO in the AppDomain, one in the VS built-in EnvDTE.dll assembly, and one in NuGet.VisualStudio.dll assembly in this case ([as reported](<http://nuget.codeplex.com/discussions/249382>)), which is of course contains EnvDTE types as they are embedded!!!

So, it makes it painful for everybody doing VS extensibility work, for no gain whatsoever. 

Next time you add an assembly reference to a VSIX project, please go and check that property, as the default behavior kick is to embed the types. 

Enjoy!

Posted by kzu

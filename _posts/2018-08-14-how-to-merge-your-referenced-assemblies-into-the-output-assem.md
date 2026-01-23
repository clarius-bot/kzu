---
layout: post
title: "How to merge your referenced assemblies into the output assembly for improved usability"
date: 2018-08-14 00:00:00 +0000
tags: [ddd, ef, eventsourcing, extensibility, gadgets, mocking, moq, msbuild, mvc, nuget, patterns, programming, t4, technology, vsx, wcf, webapi]
---

##  [How to merge your referenced assemblies into the output assembly for improved usability](http://blogs.clariusconsulting.net/kzu/how-to-merge-your-referenced-assemblies-into-the-output-assembly-for-improved-usability/ "How to merge your referenced assemblies into the output assembly for improved usability")

March 11, 2010 6:24 pm

Something we’ve been doing in [moq](http://moq.me/) since the very beginning is to have a single assembly as output: Moq.dll. This reduces the clutter for users and lets them focus on what they need from our library, rather than getting the noise of whatever third-party (or internal) libraries we use to implement it.

This is good from the deployment point of view too, and if all your libraries are actually internal infrastructure assemblies, you can even make them all internal types of your output assembly.

The key to all this is [ILMerge](http://www.clariusconsulting.net/blogs/research.microsoft.com/en-us/people/mbarnett/ilmerge.aspx), and it’s very easy to setup in a project. You just need to download the installer, copy the included executable somewhere (i.e. “Tools”) near your project and reference it from a post-build task in the project. The following configuration merges all referenced assemblies that have “Copy Local” set to true into the output assembly, and internalizes all the types in those libraries (makes them all internal to the output assembly), except for those in the optional (can be empty) exclude file (which can contain a full type name per line, to leave their visibility untouched):
    
    
    <target name="AfterBuild" condition=" '$(Configuration)' == 'Release' ">
            <createitem include="@(ReferenceCopyLocalPaths)" condition="'%(Extension)'=='.dll'">
                    <output itemname="AssembliesToMerge" taskparameter="Include" />
            </createitem>
            <exec command=""$(MSBuildProjectPath)..\..\..\..\Tools\ILMerge.exe" /internalize:"$(MSBuildProjectPath)ilmerge.exclude" /ndebug /keyfile:$(AssemblyOriginatorKeyFile) /out:@(MainAssembly) /targetplatform:v4,$(MSBuildToolsPath) "@(IntermediateAssembly)" @(AssembliesToMerge->'"%(FullPath)"', ' ')" />
            <delete files="@(ReferenceCopyLocalPaths->'$(OutDir)%(DestinationSubDirectory)%(Filename)%(Extension)')" />
    </target>
    

After merging the assemblies (only for release builds, in this case), it will delete the embedded assemblies.

Enjoy!

Update: turns out I [had blogged about this before more extensively ![:\)](https://web.archive.org/web/20180814222617im_/http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) ](http://www.clariusconsulting.net/blogs/kzu/archive/2009/02/23/LeveragingILMergetosimplifydeploymentandyourusersexperience.aspx).

![](https://web.archive.org/web/20180814222617im_/http://www.clariusconsulting.net/aggbug.aspx?PostID=222905)

Posted by kzu

![Comments](https://web.archive.org/web/20180814222617im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/hr.png)

### 3 Comments

  1. [![](https://web.archive.org/web/20180814222617im_/http://1.gravatar.com/avatar/57c618fa5d080b5d2333d9a958d9efc6?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Grumps]() [ February 2, 2013 at 12:16 am. ](http://blogs.clariusconsulting.net/kzu/how-to-merge-your-referenced-assemblies-into-the-output-assembly-for-improved-usability/#comment-1757)

Not only do you need to render code usefully in the web-page (seriously, it is cut-off and I can’t even scroll), but the posted code is invalid. <exec command="".. really?

  2. [Visual Studio Merging of Assemblies After Build | nooblikeaboss](http://nooblikeaboss.wordpress.com/2013/04/19/visual-studio-merging-of-assemblies-after-build/) [ April 19, 2013 at 10:09 am. ](http://blogs.clariusconsulting.net/kzu/how-to-merge-your-referenced-assemblies-into-the-output-assembly-for-improved-usability/#comment-1792)

[...] <http://blogs.clariusconsulting.net/kzu/how-to-merge-your-referenced-assemblies-into-the-output-assem..>. [...]

  3. [Visual Studio Merging of Assemblies After Build | (noob=>boss)](http://nooblikeaboss.wordpress.com/2013/08/08/visual-studio-merging-of-assemblies-after-build/) [ August 8, 2013 at 12:12 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-merge-your-referenced-assemblies-into-the-output-assembly-for-improved-usability/#comment-2082)

[...] <http://blogs.clariusconsulting.net/kzu/how-to-merge-your-referenced-assemblies-into-the-output-assem..>. [...]

Comments are closed
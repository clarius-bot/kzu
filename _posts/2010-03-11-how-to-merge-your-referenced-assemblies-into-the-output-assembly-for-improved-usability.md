---
layout: post
title: "How to merge your referenced assemblies into the output assembly for improved usability"
date: 2010-03-11 00:00:00 +0000
---

##  [How to merge your referenced assemblies into the output assembly for improved usability](<http://blogs.clariusconsulting.net/kzu/how-to-merge-your-referenced-assemblies-into-the-output-assembly-for-improved-usability/> "How to merge your referenced assemblies into the output assembly for improved usability")

March 11, 2010 6:24 pm

Something we’ve been doing in [moq](<http://moq.me/>) since the very beginning is to have a single assembly as output: Moq.dll. This reduces the clutter for users and lets them focus on what they need from our library, rather than getting the noise of whatever third-party (or internal) libraries we use to implement it.

This is good from the deployment point of view too, and if all your libraries are actually internal infrastructure assemblies, you can even make them all internal types of your output assembly.

The key to all this is [ILMerge](<http://www.clariusconsulting.net/blogs/research.microsoft.com/en-us/people/mbarnett/ilmerge.aspx>), and it’s very easy to setup in a project. You just need to download the installer, copy the included executable somewhere (i.e. “Tools”) near your project and reference it from a post-build task in the project. The following configuration merges all referenced assemblies that have “Copy Local” set to true into the output assembly, and internalizes all the types in those libraries (makes them all internal to the output assembly), except for those in the optional (can be empty) exclude file (which can contain a full type name per line, to leave their visibility untouched):
    
    
    <target name="AfterBuild" condition=" '$(Configuration)' == 'Release' ">
            <createitem include="@(ReferenceCopyLocalPaths)" condition="'%(Extension)'=='.dll'">
                    <output itemname="AssembliesToMerge" taskparameter="Include" />
            </createitem>
            <exec command=""$(MSBuildProjectPath)..\..\..\..\Tools\ILMerge.exe" /internalize:"$(MSBuildProjectPath)ilmerge.exclude" /ndebug /keyfile:$(AssemblyOriginatorKeyFile) /out:@(MainAssembly) /targetplatform:v4,$(MSBuildToolsPath) "@(IntermediateAssembly)" @(AssembliesToMerge->'"%(FullPath)"', ' ')" />
            <delete files="@(ReferenceCopyLocalPaths->'$(OutDir)%(DestinationSubDirectory)%(Filename)%(Extension)')" />
    </target>
    

After merging the assemblies (only for release builds, in this case), it will delete the embedded assemblies.

Enjoy!

Update: turns out I [had blogged about this before more extensively ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) ](<http://www.clariusconsulting.net/blogs/kzu/archive/2009/02/23/LeveragingILMergetosimplifydeploymentandyourusersexperience.aspx>).

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=222905)

Posted by kzu
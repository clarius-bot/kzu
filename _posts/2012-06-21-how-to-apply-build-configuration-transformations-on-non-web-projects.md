---
layout: post
title: "How to apply build configuration transformations on non-web projects"
date: 2012-06-21 00:00:00 +0000
---

##  [How to apply build configuration transformations on non-web projects](<http://blogs.clariusconsulting.net/kzu/how-to-apply-build-configuration-transformations-on-non-web-projects/> "How to apply build configuration transformations on non-web projects")

June 21, 2012 5:44 pm

This is a pretty common request, and the simple [answer is available in SO](<http://stackoverflow.com/questions/3004210/app-config-transformation-for-projects-which-are-not-web-projects-in-visual-stud>): right after the C# targets import, add the following:
    
    
    <UsingTask TaskName="TransformXml" AssemblyFile="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v10.0\Web\Microsoft.Web.Publishing.Tasks.dll" />
    <Target Name="AfterCompile" Condition="exists(\'app.$(Configuration).config\')">
      <!-- Generate transformed app config in the intermediate directory -->
      <TransformXml Source="app.config" Destination="$(IntermediateOutputPath)$(TargetFileName).config" Transform="app.$(Configuration).config" />
      <!-- Force build process to use the transformed configuration file from now on. -->
      <ItemGroup>
        <AppConfigWithTargetPath Remove="app.config" />
        <AppConfigWithTargetPath Include="$(IntermediateOutputPath)$(TargetFileName).config">
          <TargetPath>$(TargetFileName).config</TargetPath>
        </AppConfigWithTargetPath>
      </ItemGroup>
    </Target>

This works well for a single project, but there’s a problem: the config file is not copied to the output directory when this project is referenced from another one. Say this is a class library, used by a front-end app: you’ll want the config file copied over, alongside the main dll, pdb and xml documentation file, if any. I [found hints at the solution](<http://stackoverflow.com/questions/10905138/how-to-include-excluded-file-types-in-msbuild>) [mixed with](<http://stackoverflow.com/questions/2011434/preventing-referenced-assembly-pdb-and-xml-files-copied-to-output>) other questions in SO too, although [some of the solutions](<http://stackoverflow.com/questions/5918780/can-we-autocopy-the-dll-config>) are one-offs. [David found the key](<http://stackoverflow.com/questions/9765686/include-referenced-projects-config-file>) to the solution: the task that resolves references relies on a set of allowed extensions to be included in the output directory for references, which is controlled by the following property:
    
    
    <PropertyGroup>
        <AllowedReferenceRelatedFileExtensions>
            $(AllowedReferenceRelatedFileExtensions);
            .dll.config
        </AllowedReferenceRelatedFileExtensions>
    </PropertyGroup>

I also found that for the app.config transformation to work consistently from the command line and for referenced projects, I had to make it run earlier, and make sure it runs before the target that resolves project references. I achieved this with the following complete .targets that you can use:
    
    
    <?xml version="1.0" encoding="utf-8"?>
    <Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
        <UsingTask TaskName="TransformXml" AssemblyFile="$(MSBuildExtensionsPath32)\Microsoft\VisualStudio\v10.0\Web\Microsoft.Web.Publishing.Tasks.dll" />
    
        <PropertyGroup>
            <AllowedReferenceRelatedFileExtensions>
                $(AllowedReferenceRelatedFileExtensions);
                .dll.config
            </AllowedReferenceRelatedFileExtensions>
        </PropertyGroup>
    
        <PropertyGroup>
            <ResolveReferencesDependsOn>
                TransformConfig;
                $(ResolveReferencesDependsOn)
            </ResolveReferencesDependsOn>
        </PropertyGroup>
    
        <Target Name="TransformConfig" BeforeTargets="_CopyAppConfigFile" Condition="Exists(\'App.$(Configuration).config\')">
            <!--Generate transformed app config in the intermediate directory-->
            <TransformXml Source="App.config" Destination="$(IntermediateOutputPath)$(TargetFileName).config" Transform="App.$(Configuration).config" />
            <!--Force build process to use the transformed configuration file from now on.-->
            <ItemGroup>
                <AppConfigWithTargetPath Remove="App.config" />
                <AppConfigWithTargetPath Include="$(IntermediateOutputPath)$(TargetFileName).config">
                    <TargetPath>$(TargetFileName).config</TargetPath>
                </AppConfigWithTargetPath>
            </ItemGroup>
        </Target>
    </Project>

By simply adding this as an import right after the C# imports, you get automatic transformation of your own project App.config, but also inclusion in the output directory of the transformed configs of referenced projects:
    
    
    <Import Project="$(MSBuildToolsPath)\Microsoft.CSharp.targets" />
    <Import Project="$(SolutionDir)\ConfigTransform.targets" />

So this is a combination of different pieces that I found on [SO](<http://stackoverflow.com/>), which is an amazingly comprehensive Q&A site where you can find the answer to pretty much anything ![Sonrisa](http://blogs.clariusconsulting.net/kzu/files/2012/06/wlEmoticon-smile1.png).

There are two extensions in the VS gallery that claim to achieve this:

  * [SlowCheetah](<http://visualstudiogallery.msdn.microsoft.com/69023d00-a4f9-4a34-a6cd-7e854ba318b5>): this one contains a complete rewrite of the [XDT transforms language](<http://msdn.microsoft.com/en-us/library/dd465326.aspx>). I’d rather not depend on the proper cloning of built-in VS behaviors.
  * [Configuration Transform](<http://visualstudiogallery.msdn.microsoft.com/579d3a78-3bdd-497c-bc21-aa6e6abbc859>): this is exactly what I wanted. It just adds the MSBuild configuration shown at the beginning. It doesn’t do the second part for referenced projects, but it’s very simple and has no external dependencies whatesoever.

Of course, a simple .targets import does the trick, but the tools help automate adding the dependent files for each build configuration, so they can come in handy too.

Enjoy!

Posted by kzu

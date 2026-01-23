---
layout: post
title: "How to perform regular expression based replacements on files with MSBuild"
date: 2012-12-04 00:00:00 +0000
---

##  [How to perform regular expression based replacements on files with MSBuild](<http://blogs.clariusconsulting.net/kzu/how-to-perform-regular-expression-based-replacements-on-files-with-msbuild/> "How to perform regular expression based replacements on files with MSBuild")

December 4, 2012 11:34 pm

And [without a custom DLL with a task](<https://bit.ly/RAjUjY>), too ![Smile](http://blogs.clariusconsulting.net/kzu/files/2012/12/wlEmoticon-smile.png). 

The example at the bottom of the MSDN page on [MSBuild Inline Tasks](<http://msdn.microsoft.com/en-us/library/dd722601.aspx>) already provides pretty much all you need for that with a TokenReplace task that receives a file path, a token and a replacement and uses string.Replace with that. Similar in spirit but way more useful in its implementation is the [RegexTransform in NuGet’s Build.tasks](<https://bit.ly/WI1hHv>). It’s much better not only because it supports full regular expressions, but also because it receives items, which makes it very amenable to batching (applying the transforms to multiple items). You can read about how to use it for [updating assemblies with a version number](<https://bit.ly/RAk62L>), for example.

I recently had a need to also supply [RegexOptions](<https://bit.ly/RAkhuT>) to the task so I extended the metadata and a little bit of the inline task so that it can parse the optional flags. So when using the task, I can pass the flags as item metadata as follows:
    
    
    <Target Name="ReplaceReleaseNotes">
        <ItemGroup>
            <RegexTransform Include="$(BuildRoot)**\*.nuspec"
                            Condition="'$(ReleaseNotes)' != ''">
                <Find><![CDATA[<releaseNotes />            </RegexTransform>
    
    Invoking the target:
        <RegexTransform Items="@(RegexTransform)" />
    ============================================================
    -->
    <UsingTask TaskName="RegexTransform"
               TaskFactory="CodeTaskFactory"
               AssemblyFile="$(MSBuildToolsPath)\Microsoft.Build.Tasks.v4.0.dll">
        <ParameterGroup>
            <Items ParameterType="Microsoft.Build.Framework.ITaskItem[]" />
        </ParameterGroup>
        <Task>
            <Using Namespace="System.IO" />
            <Using Namespace="System.Text.RegularExpressions" />
            <Using Namespace="Microsoft.Build.Framework" />
            <Code Type="Fragment"
                  Language="cs">
                <![CDATA[
           foreach(var item in Items)
           {
             string fileName = item.GetMetadata("FullPath");
             string find = item.GetMetadata("Find");
             string replaceWith = item.GetMetadata("ReplaceWith");
             string optionsValue = item.GetMetadata("Options") ?? "";
    
             var options = string.IsNullOrWhiteSpace(optionsValue) ?
                 RegexOptions.None : (RegexOptions)Enum.Parse(typeof(RegexOptions), optionsValue.Replace('|', ','));
    
             if(!File.Exists(fileName))
             {
               Log.LogError("Could not find file: {0}", fileName);
               return false;
             }
             string content = File.ReadAllText(fileName);
             File.WriteAllText(
               fileName,
               Regex.Replace(
                 content,
                 find,
                 replaceWith,
                 options
               )
             );
           }
         ]]>
            </Code>
        </Task>
    </UsingTask>

**Update** : As noted by Emperor, I simplified the code for parsing the enum from using Aggregate to a simple string replace of | with a comma, which is readily supported by Enum.Parse ![Smile](http://blogs.clariusconsulting.net/kzu/files/2012/12/wlEmoticon-smile.png)

Posted by kzu

---
layout: post
title: "Writing inline MSBuild tasks in C# for one-liners"
date: 2011-05-09 00:00:00 +0000
---

##  [Writing inline MSBuild tasks in C# for one-liners](<http://blogs.clariusconsulting.net/kzu/writing-inline-msbuild-tasks-in-c-for-one-liners/> "Writing inline MSBuild tasks in C# for one-liners")

May 9, 2011 12:52 pm

Every now and then, when trying to do something in MSBuild, I hit a roadblock (or maybe just some unintuitive “feature”) and I’m left thinking “gosh, now I have to create a custom MSBuild task for this one-liner that is SO trivial in plain C#!”.

Well, no more with MSBuild 4.0. You can now write [inline tasks](<http://msdn.microsoft.com/en-us/library/dd722601.aspx>) in plain C# which can of course have [input and output parameters](<http://msdn.microsoft.com/en-us/library/dd723643.aspx>). 

For example, I needed to checkout a file from TFS before some task run and tried to write it. Checking out from TFS can easily be done with an Exec task:
    
    
    <Exec Command="&quot;$(VS100COMNTOOLS)..\IDE\tf.exe&quot; checkout $(ExtenderNamesTargetFile)"
          WorkingDirectory="$(MSBuildProjectDirectory)" />

(Note how I’m [NOT using $(DevEnvDir)](<https://bit.ly/jcvzmX>)) 

That’s simple enough, but it has a problem: performance. The tf.exe command connects to the TFS server every time for the checkout, and this can take some time. Not something you want to do if the file is already checked out! So I needed a simple condition: just checkout if the file is readonly. 

Of course there’s no built-in way in MSBuild to check if a file is readonly. Inline MSBuild task to the rescue!
    
    
    <UsingTask TaskName="IsFileReadOnly" TaskFactory="CodeTaskFactory" AssemblyFile="$(MSBuildToolsPath)\Microsoft.Build.Tasks.v4.0.dll">
        <ParameterGroup>
            <FileName ParameterType="System.String" Required="true" />
            <IsReadOnly ParameterType="System.Boolean" Output="true" />
        </ParameterGroup>
        <Task>
            <Using Namespace="System.IO"/>
            <Code Type="Fragment" Language="cs">
                <![CDATA[
    this.IsReadOnly = new FileInfo(this.FileName).IsReadOnly;
    ]]>
            </Code>
        </Task>
    </UsingTask>

This task simply constructs a file info and returns its readonly state. Note that it has both input and output parameters. 

The parameters simply become properties that you can access from within the code using “this.” as MSBuild is surely generating a class for you with the given usings and properties and compiling it on the fly with the optional References element that you can specify too.

You consume it from a targets like any built-in or custom task:
    
    
    <IsFileReadOnly FileName="$(ExtenderNamesTargetFile)">
        <Output PropertyName="ShouldCheckoutExtenderNames" TaskParameter="IsReadOnly"/>
    </IsFileReadOnly>

And with that, I have a property to use for my condition for the checkout command:
    
    
    <Exec Command="&quot;$(VS100COMNTOOLS)..\IDE\tf.exe&quot; checkout $(ExtenderNamesTargetFile)"
          WorkingDirectory="$(MSBuildProjectDirectory)"
          Condition="$(ShouldCheckoutExtenderNames)"/>

Pretty cool and flexible!

Posted by kzu

---
layout: post
title: "Daniel Cazzulino's Blog - How to transform T4 templates on build without installing a Visual Studio SDK"
date: 2014-01-13 00:00:00 +0000
---

##  [How to transform T4 templates on build without installing a Visual Studio SDK](<http://blogs.clariusconsulting.net/kzu/how-to-transform-t4-templates-on-build-without-installing-a-visual-studio-sdk/> "How to transform T4 templates on build without installing a Visual Studio SDK")

January 13, 2014 5:26 pm

The [MS recommended way](<http://msdn.microsoft.com/en-us/library/ee847423.aspx>) is to just use the Microsoft.TextTemplating.targets which come with the [Visual Studio Visualization and Modeling SDK](<http://go.microsoft.com/fwlink/?LinkID=185579>). It makes me slightly nervous that it requires a little known SDK that is hosted on <http://archive.msdn.microsoft.com/vsvmsdk> rather than something more “official” like the [MSDN Download Center](<http://www.microsoft.com/en-us/download/>), where the [proper VS SDK lives](<http://www.microsoft.com/en-us/download/details.aspx?id=40758>). It also turns out to be absolutely unnecessary, since all you need is already installed with your base Visual Studio setup.

Visual Studio installs the [TextTransform.exe](<http://msdn.microsoft.com/en-us/library/bb126245.aspx>) utility, which can use used to transform a template automatically. Ideally, you shouldn’t have to do anything different than you do today when using text templates, and the automatic build-time transform should “just happen”. One way to achieve this is by grabbing all the files that have one of the T4 custom tools assigned (they are always assigned them when you create a new text template in VS):
    
    
    <Target Name="TransformOnBuild" AfterTargets="BeforeBuild">
    
        <Error Text="Failed to find TextTransform.exe tool at '$(_TransformExe)."
                Condition="!Exists('$(_TransformExe)')"/>
    
        <ItemGroup>
            <_TextTransform Include="@(None)"
                            Condition="'%(None.Generator)' == 'TextTemplatingFilePreprocessor' Or '%(None.Generator)' == 'TextTemplatingFileGenerator'" />
        </ItemGroup>
    
        <!-- Perform task batching for each file -->
        <Exec Command="&quot;$(_TransformExe)&quot; &quot;@(_TextTransform)&quot;"
              Condition="'%(Identity)' != ''"/>
    
    </Target>

To determine the location of the utility, we can use a cascading mechanism where we probe for the current VS version as well as all the known ones if that doesn’t work. This is just to be on the super-safe side. Any version of the tool back to VS2010 will work just the same, since very little has changed in the T4 world since then:
    
    
    <PropertyGroup>
        <!-- Initial default value -->
        <_TransformExe>$(CommonProgramFiles)\Microsoft Shared\TextTemplating\10.0\TextTransform.exe</_TransformExe>
        <!-- If explicit VS version, override default -->
        <_TransformExe Condition="'$(VisualStudioVersion)' != ''">$(CommonProgramFiles)\Microsoft Shared\TextTemplating\$(VisualStudioVersion)\TextTransform.exe</_TransformExe>
        <!-- Cascading probing if file not found -->
        <_TransformExe Condition="!Exists('$(_TransformExe)')">$(CommonProgramFiles)\Microsoft Shared\TextTemplating\10.0\TextTransform.exe"</_TransformExe>
        <_TransformExe Condition="!Exists('$(_TransformExe)')">$(CommonProgramFiles)\Microsoft Shared\TextTemplating\11.0\TextTransform.exe"</_TransformExe>
        <_TransformExe Condition="!Exists('$(_TransformExe)')">$(CommonProgramFiles)\Microsoft Shared\TextTemplating\12.0\TextTransform.exe"</_TransformExe>
        <!-- Future proof 'til VS2013+2 -->
        <_TransformExe Condition="!Exists('$(_TransformExe)')">$(CommonProgramFiles)\Microsoft Shared\TextTemplating\13.0\TextTransform.exe"</_TransformExe>
        <_TransformExe Condition="!Exists('$(_TransformExe)')">$(CommonProgramFiles)\Microsoft Shared\TextTemplating\14.0\TextTransform.exe"</_TransformExe>
    </PropertyGroup>

That’s all that’s needed. In order to make it super-easy for myself and others, I put together a [nuget package](<https://www.nuget.org/packages/Clarius.TransformOnBuild>) and accompanying [github repo](<https://github.com/clariuslabs/TransformOnBuild>) to maintain it. Just install it like:
    
    
    PM> Install-Package Clarius.TransformOnBuild

You won’t need to do anything else and your text templates will start transforming automatically on build thanks to the included targets file.

I thought about making the target that transform smarter and only transform if the source template is changed with regards to the last generated output, but it gets very tricky if you use includes. I’m not sure if there should be an additional item property to explicitly mark an included template as the source for the change detection or if the straightforward case without includes is common enough that it’s worth including the smart check anyways despite resulting in outdated output when includes are used?

Would love to hear your thoughts on that. For the time being, simple “transform always” behavior it is ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

Enjoy!

/kzu

---
layout: post
title: "How to create a Visual Studio extensibility project that is compatible with VS 2010, 2012 and 2013"
date: 2014-04-02 00:00:00 +0000
---

##  [How to create a Visual Studio extensibility project that is compatible with VS 2010, 2012 and 2013](<http://blogs.clariusconsulting.net/kzu/how-to-create-a-visual-studio-extensibility-project-that-is-compatible-with-vs-2010-2012-and-2013/> "How to create a Visual Studio extensibility project that is compatible with VS 2010, 2012 and 2013")

January 11, 2014 1:52 pm

For most common project types, you can just create a project in VS2010 and open it in 2012 and 2013 just fine. For some others (like VS package or VSIX projects), you may find Visual Studio wants to perform a one-way conversion:

![image](http://blogs.clariusconsulting.net/kzu/files/2014/01/image.png)

The first check that was introduced with VS2012 was to require a new $(MinimumVisualStudioVersion) property that has to match the also newly introduced $(VisualStudioVersion). The one-way upgrade would end up introducing the following two properties at different places in the project file:
    
    
    <VisualStudioVersion Condition="'$(VisualStudioVersion)' == ''">10.0</VisualStudioVersion><MinimumVisualStudioVersion>11.0</MinimumVisualStudioVersion>

The next was to improve the way the location of the VSSDK is determined (to allow overriding it on build servers, I assume). Where previously you’d have a hardcoded reference to the VSSDK targets:
    
    
    <Import Project="$(MSBuildExtensionsPath32)\Microsoft\VisualStudio\v10.0\VSSDK\Microsoft.VsSDK.targets" Condition="false" />

You’d now have:
    
    
    <PropertyGroup>
        <VisualStudioVersion Condition="'$(VisualStudioVersion)' == ''">10.0</VisualStudioVersion>
        <VSToolsPath Condition="'$(VSToolsPath)' == ''">$(MSBuildExtensionsPath32)\Microsoft\VisualStudio\v$(VisualStudioVersion)</VSToolsPath>
    </PropertyGroup>
    <Import Project="$(VSToolsPath)\VSSDK\Microsoft.VsSDK.targets" Condition="'$(VSToolsPath)' != ''" />

This makes it possible to build the same extension for multiple Visual Studio targets. 

While these changes seem like they would be backwards-compatible with VS2010, they are not. Specifically, the MinimumVisualStudioVersion = 11.0 is the problem there. Moreover, when we open the project in VS2013, it will be updated to 12.0 making it incompatible with VS2012 AND VS2010!

![image](http://blogs.clariusconsulting.net/kzu/files/2014/01/image1.png)

We can solve it by changing it as follows:
    
    
    <!-- This is the property that causes VS 2012+ to insist on one-way update of the project -->
    <PropertyGroup Condition="'$(VisualStudioVersion)' &gt;= '11.0'">
        <MinimumVisualStudioVersion>$(VisualStudioVersion)</MinimumVisualStudioVersion>
    </PropertyGroup>

We assume that later versions of VS will keep checking the same way, so we use the >= 11.0 condition there, and essentially just make the two match. With this in place, we can now open the project in all three versions. 

Another property that VS2013 adds too is:
    
    
    <OldToolsVersion>4.0</OldToolsVersion>

So to recap, we can just add these properties at the top of the project file:
    
    
    <PropertyGroup>
        <VisualStudioVersion Condition="'$(VisualStudioVersion)' == ''">10.0</VisualStudioVersion>
        <VSToolsPath Condition="'$(VSToolsPath)' == ''">$(MSBuildExtensionsPath32)\Microsoft\VisualStudio\v$(VisualStudioVersion)</VSToolsPath>
    </PropertyGroup>
    
    <!-- This is the property that causes VS 2012+ to insist on one-way update of the project -->
    <PropertyGroup Condition="'$(VisualStudioVersion)' &gt;= '11.0'">
        <MinimumVisualStudioVersion>$(VisualStudioVersion)</MinimumVisualStudioVersion>
    </PropertyGroup>
    <!-- This is an additional property added by VS 2013 -->
    <PropertyGroup Condition="'$(VisualStudioVersion)' &gt;= '12.0'">
        <OldToolsVersion>4.0</OldToolsVersion>
    </PropertyGroup>

And at the bottom, replace the SDK targets with:
    
    
    <Import Project="$(VSToolsPath)\VSSDK\Microsoft.VsSDK.targets" Condition="'$(VSToolsPath)' != ''" />

## Referencing SDK Assemblies

In addition to the project opening fine, you also need to be able to reference the SDK assemblies from your projects properly. This is tricky since the location of the SDK assemblies changed significantly between 2010 and 2012+. It used to be under C:\Program Files (x86)\Microsoft Visual Studio 2010 SDK SP1\ and now is under C:\Program Files (x86)\Microsoft Visual Studio 11.0\VSSDK\\. Clearly, the new location is much more amenable to automation from MSBuild. The most reliable way I’ve found that looks concise is to just grab the value from the VSSDK[version]Install environment variable and use that to build the SDK path:
    
    
    <PropertyGroup Condition="'$(VSSDK)' == ''">
        <VSSDKVar>VSSDK$(VisualStudioVersion.Replace('.', ''))Install</VSSDKVar>
        <VSSDK>$([System.Environment]::ExpandEnvironmentVariables('%$(VSSDKVar)%'))VisualStudioIntegration\Common\Assemblies\</VSSDK>
    </PropertyGroup>
    <PropertyGroup>
        <VSSDK20>$(VSSDK)v2.0\</VSSDK20>
        <VSSDK40>$(VSSDK)v4.0\</VSSDK40>
        <VSToolsPath Condition="'$(VSToolsPath)' == ''">$(MSBuildExtensionsPath32)\Microsoft\VisualStudio\v$(VisualStudioVersion)</VSToolsPath>
    </PropertyGroup>

Note that the [version] in the environment variable does not contain the VS version dot (i.e. 11.0 is 110), so we remove that to build the variable name. We then expand it to get the $(VSSDK). And then I build the lib locations for both 2.0 and 4.0 folders, which contain different sets of assemblies that might be useful when developing an extension.

One final variable which is quite useful to determine the location of PublicAssemblies and PrivateAssemblies (not that you should be using any from there ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) ) is [DevEnvDir](<http://blogs.clariusconsulting.net/kzu/devenvdir-considered-harmful/>). As I explained [elsewhere](<http://blogs.clariusconsulting.net/kzu/devenvdir-considered-harmful/>), that variable is only populated when building from inside VS. We can create it for command line builds using the same technique as above to make it VS version aware:
    
    
    <!-- On build servers and command line, this property is not available, so we redefine it in
             terms of the environment variables created by VS when installed -->
    <PropertyGroup Condition="'$(DevEnvDir)' == ''">
        <VSCommToolsVar>VS$(VisualStudioVersion.Replace('.', ''))COMNTOOLS</VSCommToolsVar>
        <DevEnvDir>$([System.Environment]::ExpandEnvironmentVariables('%$(VSCommToolsVar)%'))..\IDE\</DevEnvDir>
    </PropertyGroup>

And on top of that, we can just create the two additional variables for convenience:
    
    
    <PropertyGroup>
        <PublicAssemblies>$(DevEnvDir)PublicAssemblies\</PublicAssemblies>
        <PrivateAssemblies>$(DevEnvDir)PublicAssemblies\</PrivateAssemblies>
    </PropertyGroup>

So now you need to updated your references to take advantage of those variables, like:
    
    
    <Reference Include="Microsoft.VisualStudio.Shell, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a, processorArchitecture=MSIL">
        <SpecificVersion>False</SpecificVersion>
        <HintPath>..\..\..\Program Files (x86)\Microsoft Visual Studio 2010 SDK SP1\VisualStudioIntegration\Common\Assemblies\v2.0\Microsoft.VisualStudio.Shell.dll</HintPath>
    </Reference>

To:
    
    
    <Reference Include="Microsoft.VisualStudio.Shell, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a, processorArchitecture=MSIL">
        <SpecificVersion>False</SpecificVersion>
        <HintPath>$(VSSDK)v2.0\Microsoft.VisualStudio.Shell.dll</HintPath>
    </Reference>

The final bit is that if your code takes advantage of a particular new feature in a newer version of VS, you’ll need to #ifdef the code (or conditionally include source files). So it’s convenient to have a constant defined too:
    
    
    <DefineConstants>$(DefineConstants);VS$(VisualStudioVersion.Replace('.', ''))</DefineConstants>

You can look at the final [MSBuild properties](<https://github.com/clariuslabs/VisualStudio/blob/master/nuget/build/Clarius.VisualStudio.props>) and [targets files](<https://github.com/clariuslabs/VisualStudio/blob/master/nuget/build/Clarius.VisualStudio.targets>) directly on Github. Or even better, just [install the nuget package](<https://www.nuget.org/packages/clarius.visualstudio>) and get both added to your VSX project automatically ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)
    
    
    Install-Package Clarius.VisualStudio

Enjoy!

Posted by kzu
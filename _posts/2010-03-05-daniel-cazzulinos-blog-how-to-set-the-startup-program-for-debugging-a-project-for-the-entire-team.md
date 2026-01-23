---
layout: post
title: "Daniel Cazzulino's Blog : How to set the startup program for debugging a project for the entire team"
date: 2010-03-05 00:00:00 +0000
---

## How to set the startup program for debugging a project for the entire team 

You surely have set the startup application for a project countless times:

![image](https://web.archive.org/web/20100515023525im_/http://www.clariusconsulting.net/images/blogs/kzu/Howtosetthestartupprogramfordebuggingafo_7BB9/image.png)

But that setting goes your user options file, the rest of the team doesn't get to reuse the setting. And what if you repave your machine or start working on a new virtual machine and just got the sources from source control? You have to re-set this value again and again.

Turns out that this setting goes to a file named after your project file plus the ".user" extension. This file is just a fragment of an MSBuild file, and would look something like:
    
    
    <?xml version="1.0" encoding="utf-8"?>
    <Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
      <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Debug|AnyCPU'">
        <StartAction>Program</StartAction>
        <StartProgram>C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe</StartProgram>
        <StartArguments>/rootSuffix Exp</StartArguments>
      </PropertyGroup>
    </Project>
    

And because this just plain MSBuild properties, you can copy the entire PropertyGroup to your main project file, delete this .user, and check-in your change. From now on, everyone on the team will have this setting enabled, and you will have it too if you get a clean environment eventually :)

/kzu

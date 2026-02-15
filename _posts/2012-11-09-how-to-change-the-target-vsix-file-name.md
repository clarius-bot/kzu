---
layout: post
title: How to change the target VSIX file name
date: 2012-11-09 00:00:00 +0000
tags:
- .NET
- All Technology
- ef
- XML
- nuget
---
When creating a VSIX or VS Package extension to VS, the default .vsix file name matches the project assembly name. Usually this is too long. So if you want to change it to be a short name, you have to edit the project file and add the following property:
    
    
    <PropertyGroup>
      ...
      <TargetVsixContainerName>MyCoolExtension.vsix</TargetVsixContainerName>

Happy extending

/kzu

---
layout: post
title: How to always open the vsixmanifest in XML view
date: 2009-08-16 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/how-to-always-open-the-vsixmanifest-in-xml-view
tags:
- .NET

---

The new [VSIX projects](http://www.clariusconsulting.net/blogs/pga/archive/category/1058.aspx "tons of VSIX information from Pablo Galiano") contain a manifest that is by default opened with a designer. No matter how many times you specify that you want to open it with the XML editor by default, VS will continue to open it with the designer.

The only way to force the change is to manually modify the .csproj as follows:
    
    
    <ItemGroup>
      <None Include="source.extension.vsixmanifest">
        <SubType>~~Designer~~ Code</SubType>
      </None>
    </ItemGroup>
    

(on Beta1, the manifest file name would be just extension.vsixmanifest)

/kzu

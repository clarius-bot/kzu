---
layout: post
title: "How to always open the vsixmanifest in XML view"
date: 2009-08-18 00:00:00 +0000
---

##  [How to always open the vsixmanifest in XML view](<http://blogs.clariusconsulting.net/kzu/how-to-always-open-the-vsixmanifest-in-xml-view/> "How to always open the vsixmanifest in XML view")

August 18, 2009 2:53 am

The new [VSIX projects](<http://www.clariusconsulting.net/blogs/pga/archive/category/1058.aspx> "tons of VSIX information from Pablo Galiano") contain a manifest that is by default opened with a designer. No matter how many times you specify that you want to open it with the XML editor by default, VS will continue to open it with the designer.

The only way to force the change is to manually modify the .csproj as follows:
    
    
    <ItemGroup>
      <None Include="source.extension.vsixmanifest">
        <SubType>~~Designer~~ Code</SubType>
      </None>
    </ItemGroup>
    

(on Beta1, the manifest file name would be just extension.vsixmanifest)

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=165066)

Posted by kzu
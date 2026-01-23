---
layout: post
title: "Daniel Cazzulino's Blog : How to override system default styles in WPF"
date: 2007-08-20 00:00:00 +0000
---

## How to override system default styles in WPF 

You should typically use system defined styles for your controls, such as:
    
    
    <Label FontFamily="{x:Static SystemFonts.MessageFontFamilyKey}" Content="Hello World"/>

[](http://11011.net/software/vspaste)

or:
    
    
      <StackPanel TextBlock.FontSize="{x:Static SystemFonts.MessageFontSize}"
                  TextBlock.FontFamily="{x:Static SystemFonts.MessageFontFamily}">
            <Label Content="Hello World" />
      </StackPanel>

[](http://11011.net/software/vspaste)

When using a static resource binding like this, you're basically giving up the ability to override the styles set by the current OS theme. This may be a good thing in many situations, to have a standard look & feel. 

WPF rich styling allows you to very easily have "[skins](http://msdn2.microsoft.com/en-us/library/bb295250.aspx)" for your app. These are just [resource dictionaries](http://msdn2.microsoft.com/en-us/library/ms750613.aspx) (think CSS style files) that provide the styles for your controls. Moreover, you can switch these styles at run-time. [Microsoft Expression Blend](http://www.microsoft.com/expression/), for example, has a very cool default "Dark" theme and a "Light" one: 

[![image](https://web.archive.org/web/20081121160301im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtooverridesystemdefaultstylesinWPF_E7F2/image_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/HowtooverridesystemdefaultstylesinWPF_E7F2/image.png)

But what if you want to have a differentiating style, yet reuse system styles (maybe one of your skins is "Windows Default Style" which takes the current theme styles)? In this case, you should first turn your static resource bindings into dynamic resource bindings:
    
    
      <StackPanel TextBlock.FontFamily="**{DynamicResource {x:Static SystemFonts.MessageFontFamilyKey}}** ">
            <Label Content="Hello World" />
      </StackPanel>

[](http://11011.net/software/vspaste)

Note that now you need to use the [SystemFonts](http://msdn2.microsoft.com/en-us/library/system.windows.systemfonts.aspx) [resource keys](http://msdn2.microsoft.com/en-us/library/ms741926.aspx "How to: Use System Fonts Keys") instead of the direct resource value. How in order to override the system default from a custom skin, all you need to do is add an entry to your resource dictionary using the same key:
    
    
    <ResourceDictionary
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:System="clr-namespace:System;assembly=mscorlib"
        >
      <System:Double x:Key="{x:Static **SystemFonts.MessageFontSizeKey**}">11</System:Double>
      <FontFamily x:Key="{x:Static **SystemFonts.MessageFontFamilyKey**}">Segoe UI</FontFamily>
      <FontWeight x:Key="{x:Static **SystemFonts.MessageFontWeightKey**}">Normal</FontWeight>
    </ResourceDictionary>

[](http://11011.net/software/vspaste)

WPF is so cool, but until we get our heads around building desktop apps the way we learned (through years of pain) to build web apps (that is, no styles on the UI markup, maximize reuse of markup blocks, etc), it's pretty painful. Specially since WPF takes the web styling concept much further (developers should build the UI with the absolute minimal markup required to implement behavior and a graphics designer should come later and using Blend and styles, completely rework the visuals). 

/kzu

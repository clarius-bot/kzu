---
layout: post
title: "Daniel Cazzulino's Blog : How to override system default styles in WPF"
date: 2007-08-20 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to override system default styles in WPF


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081121160301im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081121160301im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081121160301im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081121160301im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

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

posted on Monday, August 20, 2007 1:14 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20081121160301im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
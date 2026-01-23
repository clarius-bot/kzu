---
layout: post
title: "Daniel Cazzulino's Blog : Leveraging .NET Components and IDE Integration: UI AOP in an MVC use case"
date: 2005-05-24 00:00:00 +0000
---

Daniel Cazzulino's Blog : Leveraging .NET Components and IDE Integration: UI AOP in an MVC use case


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3013'\))| May 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3074'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2005/5/3.aspx "1 Post")  
[4](http://clariusconsulting.net/blogs/kzu/archive/2005/5/4.aspx "1 Post")| 5| 6| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2005/5/9.aspx "1 Post")| 10  
11| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2005/5/13.aspx "1 Post")| 14| 15| 16| 17  
18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2005/5/20.aspx "1 Post")| 21| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2005/5/24.aspx "1 Post")  
25| 26| 27| [28](http://clariusconsulting.net/blogs/kzu/archive/2005/5/28.aspx "2 Posts")| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080522144456im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

[![](https://web.archive.org/web/20080522144456im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080522144456im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080522144456im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Leveraging .NET Components and IDE Integration: UI AOP in an MVC use case 

## Introduction

This post is a summary of a much longer article (~60 pages) that for space reasons does not fit well here in its entirety. 

The full article can be viewed at [CodeProject.](http://www.codeproject.com/csharp/components.asp)~~<http://clariusconsulting.net/articles/components/components.html>.~~

The article discuses:

  * .NET and VS .NET vision of components: the building blocks and how they fit together.
  * The design-time architecture.
  * The MVC pattern: separating concerns and components responsibilities. Brief overview and our proposed architecture. 
  * Aspect Oriented Programming (AOP) in the UI: extending existing components with new features. How to do it without inheritance or containment through VS .NET architecture.
  * Integration of components with the IDE: through the property browser. Converters, editors and designers.
  * Taking advantage of services provided by the host (IDE).
  * How to control code generation. 
  * Design patterns to increase component reuse: making components cross-technology (web and windows-aware)
  * How to provide custom services through the VS .NET architecture.
  * Extending design-time infrastructure at run-time.

## Article Overview

  * **A component-oriented architecture** : an overview of the ComponentModel, how it works in Visual Studio, its implications at design and run time.
  * **Hosted components** : .NET components and how they interact with the ComponentModel architecture, how they access services and publish new ones.
  * **Design-time architecture** : how the Visual Studio designers work, overview of designers, type converters and editors.
  * **Root Components and Designers** : how you can extend the architecture for your own components, to the point of completely replacing the root designer if you wanted to.
  * **MVC: the Model-View-Controller design pattern**. Brief overview of how we plan to apply this pattern to showcase the ComponentModel features.
  * **AOP in the .NET era** : how .NET implements a novel way of doing AOP with UI elements through the IExtenderProvider interface, and how to use it to implement the MVC model in a RAD way. 
    * **Custom Code Serialization: the CodeDom power**. How to customize the code that gets injected in the InitializeComponent method.
    * **CodeDom syntax** : brief walkthrough of the CodeDom syntax.
    * Emitting CodeDom: how to emit the code from your component designers.
    * **Back to simplicity** : components built-in support for CodeDom generation is enough in some cases.
  * **Completing the MVC Component Model** : integrating the component-based model with the toolbox and drag & drop. 
    * **.NET Component Model: a closer look and inheritance problems**. What happens when you drop components on the design surface.
  * **Deep IDE Integration** : improving integration of custom components with the IDE, and playing nice with the built-in services when changing values through the Property Browser. 
    * **Extending the Serviced Architecture** : exposing new services through the IDesignerHost for consumption at design-time. Side-note on how CodeDom serialization of properties happens.
    * **Custom Editors** : creating complex UIs for setting component property values, how to integrate them with the Property Browser and be compatible with Visual Studio monitoring of component changes. 
    * **Custom and Global Commands** : exposing commands or designer verbs on a component, but also how to publish commands that apply on the entire components tray area.
  * **Dealing with different view technologies** : implementing the adapter pattern to abstract Windows and Web UIs without losing *any* RAD features in the IDE. 
    * **Model Behavior, the MVC way** : how the UI communicates with controllers to perform operations on the model.
    * **Connecting the Views** : how to connect controllers’ code with the views, so that updating and synchronization with the model happens automatically. 
  * **Beyond your own components** : how to modify the CodeDom injected when serializing components you don’t own (i.e. controls), and add your own stuff on top of them, without needing inheritance or containment (AOP-style) 
  * **The final message** : what did we learn from this journey on the ComponentModel and the IDE features, useful tips for developing IDe integration code, etc.

## Article Summary

During the article I explore the most advanced features available in .NET and VS .NET for component-based development. I offer deep integration with the IDE, and even expand the model to the run-time. 

I discuss the MVC design pattern, and create a concrete implementation that can make application development substantially faster. Not only that, but I create an implementation that can work with the same code base for both Windows and Web Forms. 

posted on Tuesday, May 24, 2005 12:17 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20080522144456im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
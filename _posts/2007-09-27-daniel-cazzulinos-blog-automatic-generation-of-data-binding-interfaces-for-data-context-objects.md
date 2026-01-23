---
layout: post
title: "Daniel Cazzulino's Blog : Automatic generation of data-binding interfaces for data context objects"
date: 2007-09-27 00:00:00 +0000
---

Daniel Cazzulino's Blog : Automatic generation of data-binding interfaces for data context objects

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20090404055718im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090404055718im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20090404055718im_/http://twitter.com/favicon.ico) ](http://twitter.com/kzu) [kzu in Twitter](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20090404055718im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090404055718im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090404055718im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

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

## Automatic generation of data-binding interfaces for data context objects 

From the new [Clarius Labs release](http://www.codeplex.com/clarius/Release/ProjectReleases.aspx?ReleaseId=7358):

### XamlBinding Custom Tool

This custom tool will generate a partial class file implementing [INotifyPropertyChange](http://msdn2.microsoft.com/en-us/library/system.componentmodel.inotifypropertychanged.aspx) as well as a strongly-typed event for each property declared in the file it's applied to.  
This is very useful when creating models or entities that are used in data-binding scenarios, and where an associated presenter needs to perform certain logic when a given property changes. 

  
Communicating through these strong-typed events prevents tight coupling between the presenter and the UI, which now communicate exclusively through the model/data context.  
A must-have for anyone doing ["Binding Oriented Programming"](http://www.paulstovell.net/blog/index.php/binding-oriented-programming/) ;)

  
The code generator solves the problem of having the presenter attach to the generic [INotifyPropertyChanged.PropertyChanged](http://msdn2.microsoft.com/en-us/library/system.componentmodel.inotifypropertychanged.propertychanged.aspx) event and checking the property by name, which must be kept in sync with the class definition and doesn't participate in refactorings.

  
It will also solve the initialization sequence and validation (post deserialization and afterwards) problem by implementing [ISupportInitialize](http://msdn2.microsoft.com/en-us/library/system.componentmodel.isupportinitialize.aspx), [ISupportInitializeNotification](http://msdn2.microsoft.com/en-us/library/system.componentmodel.isupportinitializenotification.aspx) and [IChangeTracking](http://msdn2.microsoft.com/en-us/library/system.componentmodel.ichangetracking.aspx), which allows it to track changes automatically on its members and nested values. The public interface of your object remains uncluttered by implementing most of these privately. The data context class can simply call the provided `EnsureValid` at the beginning of each method call to make sure that the class has been properly initialized, and that if it's dirty, it's re-validated. 

  
A DoValidate method is added to the main class to implement the actual property validation (where you could use the [Standalone Validation Block](http://www.codeplex.com/entlibcontrib/Wiki/View.aspx?title=Standalone%20Validation%20Block) for example), as well as RaiseXXChanged method calls on each property setter.

  
Finally, the generated code doesn't depend on anything other than `[System.ComponentModel](http://msdn2.microsoft.com/en-us/library/system.componentmodel.aspx)`, so WPF is not even required to use the codegen for other data-binding scenarios (WinForms should work fine).

  
Installation: run the MSI, or compile the included solution.  
Usage: assign the value XamlBinding to any code file in VS. A corresponding file ending in ".XamlBinding.cs" (or .vb) will be generated automatically everytime the main file changes.  

This release supports both VB and C#.

Enjoy!

posted on Thursday, September 27, 2007 10:44 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20090404055718im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
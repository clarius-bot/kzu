---
layout: post
title: "Daniel Cazzulino"
date: 2006-01-06 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : How to get services from the VS DTE (using System.IServiceProvider)

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| 1| 2| 3| 4  
5| [6](http://clariusconsulting.net/blogs/kzu/archive/2006/1/6.aspx "3 Posts")| [7](http://clariusconsulting.net/blogs/kzu/archive/2006/1/7.aspx "2 Posts")| 8| 9| 10| 11  
[12](http://clariusconsulting.net/blogs/kzu/archive/2006/1/12.aspx "2 Posts")| [13](http://clariusconsulting.net/blogs/kzu/archive/2006/1/13.aspx "1 Post")| 14| 15| 16| 17| 18  
19| 20| 21| 22| 23| 24| 25  
26| 27| 28| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060220124713im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## How to get services from the VS DTE (using System.IServiceProvider) 

VS is heavily based on a component model and container hierarchy of services (yes, that's most probably where `System.ComponentModel` came from...). Even though there's no comprehensive documentation of all services available and from which contexts, every now and then I find the need to ask for services, but all I've got at hand is either a `EnvDTE.ProjectItem` or `Project`, or just the DTE. So, how do you use the familiar System.IServiceProvider to ask for services?

The trick is to get the latest VS SDK, add a reference to `Microsoft.VisualStudio.OLE.Interop.dll` and `Microsoft.VisualStudio.Shell.dll` and use the following simple code:
    
    
    EnvDTE.Project project; // this is what you have at hand somehow.  
       
    IServiceProvider serviceProvider = new ServiceProvider(project.DTE as  
        Microsoft.VisualStudio.OLE.Interop.IServiceProvider);  
       
    DynamicTypeService typeService = (DynamicTypeService)  
        serviceProvider.GetService(typeof(DynamicTypeService));

The `ServiceProvider` class in the Shell assembly provides the adapter you need to ask the DTE for services. 

posted on Friday, January 06, 2006 9:11 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/428.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetServiceFromDTE.aspx#430 "permalink") Interesting Finds @ Saturday, January 07, 2006 5:15 AM

[](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://jasonhaley.com/blog/archive/2006/01/07/133652.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetServiceFromDTE.aspx#433 "permalink") re: How to get services from the VS DTE (using System.IServiceProvider) @ Sunday, January 08, 2006 1:34 AM

Hi.   
I tried to implement your advice but with no luck.   
  
I try to invoke "Create Connection" dialog from add-in. So I wrote:   
  
System.Array theProjects = (System.Array)applicationObject.ActiveSolutionProjects;   
EnvDTE.Project theProject = (EnvDTE.Project)theProjects.GetValue(0);   
  
IServiceProvider serviceProvider = new ServiceProvider(theProject.DTE as Microsoft.VisualStudio.OLE.Interop.IServiceProvider);   
System.ComponentModel.Design.Data.IDataEnvironment typeService = (System.ComponentModel.Design.Data.IDataEnvironment)serviceProvider.GetService(typeof(System.ComponentModel.Design.Data.IDataEnvironment));   
typeService.BuildConnection(null, null);   
  
But I get null reference exception on last line:   
typeService is null.   
Did I miss something?   
Thanks. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

Anatoly

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetServiceFromDTE.aspx#435 "permalink") re: How to get services from the VS DTE (using System.IServiceProvider) @ Monday, January 09, 2006 9:38 AM

I never said you were going to get a valid instance of whichever service you happen to ask for. It may very well be the case that the service you're requesting is not available at the DTE level. You must read the documentation for the service in question in order to know who exposes it. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[kzu](http://clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

  

![](/web/20060220124713im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
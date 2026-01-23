---
layout: post
title: "Daniel Cazzulino's Blog : How to get a System.Type from an EnvDTE.CodeTypeRef or EnvDTE.CodeClass"
date: 2007-10-04 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to get a System.Type from an EnvDTE.CodeTypeRef or EnvDTE.CodeClass


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20090409074500im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090409074500im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20090409074500im_/http://twitter.com/favicon.ico) ](http://twitter.com/kzu) [kzu in Twitter](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20090409074500im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090409074500im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090409074500im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## How to get a System.Type from an EnvDTE.CodeTypeRef or EnvDTE.CodeClass 

I have already [hinted at this in a previous post](http://www.clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetTypesFromProject.aspx "Retrieving available types in current project and its references \(withoult locking\)"), but this time it's a bit different. Sometimes it's useful to switch to a full System.Type when you're doing code-generation or general CodeModel navigation within VS in an addin or VSSDK package.

The trick is to retrieve the [ITypeResolutionService](http://msdn2.microsoft.com/en-us/library/system.componentmodel.design.ityperesolutionservice.aspx) from the [DynamicType](http://msdn2.microsoft.com/en-us/library/Microsoft.VisualStudio.Shell.Design.DynamicTypeService.aspx) associated with the current project:
    
    
    private ITypeResolutionService GetResolutionService()
    {
        DynamicTypeService typeService = GetService<DynamicTypeService>();
        Debug.Assert(typeService != null, "No dynamic type service registered.");
    
        IVsSolution sln = GetService<IVsSolution>();
        IVsHierarchy hier;
        sln.GetProjectOfUniqueName(CurrentProject.Project.UniqueName, out hier);
    
        Debug.Assert(hier != null, "No active hierarchy is selected.");
    
        return typeService.GetTypeResolutionService(hier);
    }
    

[](http://11011.net/software/vspaste)

[GetService<T> is just a shorthand to an IServiceProvider.GetService call. The service provider should be the one associated with the current project]

With the resolver at hand, you can simply do:
    
    
    CodeTypeRef type = // some type you got  
    Type t = resolver.GetType(type.AsFullName, true);

or
    
    
    CodeClass cc = // some class you got  
    Type t = resolver.GetType(cc.FullName, true);

One caveat: this is very reliable if the type you're loading is external (i.e. it's CodeClass.InfoLocation == vsCMInfoLocation.vsCMInfoLocationExternal) but for classes on the current project, you'll get a type that contains the code from the last successful compilation. Alternatively, you can force a compilation before going this route, although I'd advise against it: it's not a very good user experience IMO.

posted on Thursday, October 04, 2007 1:20 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20090409074500im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog - Thursday, October 04, 2007 - Posts"
date: 2007-10-18 00:00:00 +0000
---

## Thursday, October 04, 2007 - Posts

#####  [Cool article if you are learning VS SDK](http://clariusconsulting.net/blogs/kzu/archive/2007/10/04/CoolarticleifyouarelearningVSSDK.aspx)

[Pablo](http://clariusconsulting.net/pga) wrote a very cool [article on the CoDe magazine](http://code-magazine.com/Article.aspx?quickid=0710092) which should be very useful to most people developing VS packages. With extensive screenshots and wizards, it should make your VS extensibility life MUCH easier.

Give it a shot!

posted [Thursday, October 04, 2007 3:19 PM](http://clariusconsulting.net/blogs/kzu/archive/2007/10/04/CoolarticleifyouarelearningVSSDK.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2007/10/04/CoolarticleifyouarelearningVSSDK.aspx#comments)

#####  [How to get a System.Type from an EnvDTE.CodeTypeRef or EnvDTE.CodeClass](http://clariusconsulting.net/blogs/kzu/archive/2007/10/04/34019.aspx)

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

posted [Thursday, October 04, 2007 1:20 PM](http://clariusconsulting.net/blogs/kzu/archive/2007/10/04/34019.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2007/10/04/34019.aspx#comments)

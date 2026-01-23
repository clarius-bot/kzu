---
layout: post
title: "Daniel Cazzulino"
date: 2006-01-06 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : How to convert from EnvDTE.Project to IVsHierarchy and IVsProject and viceversa

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060220124637im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## How to convert from EnvDTE.Project to IVsHierarchy and IVsProject and viceversa 

I've long been looking for an answer to how to go from an automation (DTE) project to its corresponding VSIP project instance. I've been given consistently the same non-satisfactory answer: there's no way because they are two fundamentally different object models that VSIP projects may or may not expose, and there's no consistent way of going from one to the other. Or that's what they said to me at the time.

As I'm not keen on accepting a "no" for an answer, I went on to investigate how to do it, and finally got to some working code that does it. It involves the DTE, VSIP and MSBuild. Here's the code:
    
    
    public static class VsHelper  
    {  
        public static IVsHierarchy GetCurrentHierarchy(IServiceProvider provider)  
        {  
            DTE vs = (DTE)provider.GetService(typeof(DTE));  
            if (vs == null) throw new InvalidOperationException("DTE not found.");  
      
            return ToHierarchy(vs.SelectedItems.Item(1).ProjectItem.ContainingProject);  
        }
    
    
        public static IVsHierarchy ToHierarchy(EnvDTE.Project project)  
        {  
            if (project == null) throw new ArgumentNullException("project");  
      
            string projectGuid = null;  
      
            // DTE does not expose the project GUID that exists at in the msbuild project file.  
            // Cannot use MSBuild object model because it uses a static instance of the Engine,   
            // and using the Project will cause it to be unloaded from the engine when the   
            // GC collects the variable that we declare.  
            using (XmlReader projectReader = XmlReader.Create(project.FileName))  
            {  
                projectReader.MoveToContent();  
                object nodeName = projectReader.NameTable.Add("ProjectGuid");  
                while (projectReader.Read())  
                {  
                    if (Object.Equals(projectReader.LocalName, nodeName))  
                    {  
                        projectGuid = projectReader.ReadContentAsString();  
                        break;  
                    }  
                }  
            }  
      
            Debug.Assert(!String.IsNullOrEmpty(projectGuid));  
      
            IServiceProvider serviceProvider = new ServiceProvider(project.DTE as  
                Microsoft.VisualStudio.OLE.Interop.IServiceProvider);  
              
            return VsShellUtilities.GetHierarchy(serviceProvider, new Guid(projectGuid));  
        }
    
    
        public static IVsProject3 ToVsProject(EnvDTE.Project project)  
        {  
            if (project == null) throw new ArgumentNullException("project");  
      
            IVsProject3 vsProject = ToHierarchy(project) as IVsProject3;  
      
            if (vsProject == null)  
            {  
                throw new ArgumentException("Project is not a VS project.");  
            }  
      
            return vsProject;  
        }
    
    
        public static EnvDTE.Project ToDteProject(IVsHierarchy hierarchy)  
        {  
            if (hierarchy == null) throw new ArgumentNullException("hierarchy");  
      
            object prjObject = null;  
            if (hierarchy.GetProperty(0xfffffffe, -2027, out prjObject) >= 0)  
            {  
                return (EnvDTE.Project)prjObject;  
            }  
            else  
            {  
                throw new ArgumentException("Hierarchy is not a project.");  
            }  
        }
    
    
        public static EnvDTE.Project ToDteProject(IVsProject project)  
        {  
            if (project == null) throw new ArgumentNullException("project");  
      
            return ToDteProject(project as IVsHierarchy);  
        }  
      
    }  
    

The code above requires a reference to `Microsoft.Build.Engine.dll`, `EnvDTE.dll` and `Microsoft.VisualStudio.Shell.Interop.dll` (part of the VS SDK).

Now, whenever you have a DTE Project and need a VSIP IVsHierarchy, you just call `VsHelper.ToHierarchy(project)`, and inversely, when you need a DTE project from a hierarchy or VS project, you call the `ToProject` methods.

Enjoy! 

posted on Friday, January 06, 2006 4:11 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/427.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/DteToVSIP.aspx#447 "permalink") re: How to convert from EnvDTE.Project to IVsHierarchy and IVsProject and viceversa @ Friday, January 20, 2006 1:54 PM

You dont need to read the project file to get the Project Guid, you can use the function DteHelper.GetVsHierarchy to get the IVSHierary, This is available in the GAT library. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Oscar Calvo](http://clariusconsulting.net/utility/Redirect.aspx?U=http://blogs.artinsoft.net/ocalvo "Anonymous")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/DteToVSIP.aspx#448 "permalink") re: How to convert from EnvDTE.Project to IVsHierarchy and IVsProject and viceversa @ Friday, January 20, 2006 5:53 PM

Yup, you're right Oscar. Going from a DTE.Project to an IVsHierarchy could also be done by:   
  
1 - Getting the IVsSolution service from the service provider (taken from the project.DTE wrapped in a ServiceProvider)   
2 - Calling IVsSolution.GetProjectOfUniqueName(project.UniqueName, out vsHierarchy) on it. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[kzu](http://clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

  

![](/web/20060220124637im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
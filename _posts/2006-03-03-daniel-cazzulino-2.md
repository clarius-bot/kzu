---
layout: post
title: "Daniel Cazzulino"
date: 2006-03-03 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, January 06, 2006 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2223'\))| March 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
26| 27| 28| 1| 2| 3| 4  
5| [6](http://clariusconsulting.net/blogs/kzu/archive/2006/1/6.aspx "3 Posts")| [7](http://clariusconsulting.net/blogs/kzu/archive/2006/1/7.aspx "2 Posts")| 8| 9| 10| 11  
[12](http://clariusconsulting.net/blogs/kzu/archive/2006/1/12.aspx "2 Posts")| [13](http://clariusconsulting.net/blogs/kzu/archive/2006/1/13.aspx "1 Post")| 14| 15| 16| 17| 18  
19| 20| 21| 22| 23| 24| 25  
26| 27| 28| 29| 30| 31| 1  
2| 3| 4| 5| 6| 7| 8  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060303191228im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Friday, January 06, 2006 - Posts

#####  [How to get services from the VS DTE (using System.IServiceProvider)](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetServiceFromDTE.aspx)

VS is heavily based on a component model and container hierarchy of services (yes, that's most probably where `System.ComponentModel` came from...). Even though there's no comprehensive documentation of all services available and from which contexts, every now and then I find the need to ask for services, but all I've got at hand is either a `EnvDTE.ProjectItem` or `Project`, or just the DTE. So, how do you use the familiar System.IServiceProvider to ask for services?

The trick is to get the latest VS SDK, add a reference to `Microsoft.VisualStudio.OLE.Interop.dll` and `Microsoft.VisualStudio.Shell.dll` and use the following simple code:
    
    
    EnvDTE.Project project; // this is what you have at hand somehow.  
       
    IServiceProvider serviceProvider = new ServiceProvider(project.DTE as  
        Microsoft.VisualStudio.OLE.Interop.IServiceProvider);  
       
    DynamicTypeService typeService = (DynamicTypeService)  
        serviceProvider.GetService(typeof(DynamicTypeService));

The `ServiceProvider` class in the Shell assembly provides the adapter you need to ask the DTE for services. 

posted [Friday, January 06, 2006 9:11 PM](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetServiceFromDTE.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [3 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetServiceFromDTE.aspx#comments)

#####  [Retrieving available types in current project and its references (withoult locking)](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetTypesFromProject.aspx)

One very tricky thing inside VS used to be (at least for me until I found the solution I'm about to show you) to list and work with the types defined in the project as well as its references. The problem was mainly how to properly load the types without locking the project output for compilation, as well as retrieving the types for references that could be also project references. It turns out that there is a very cool and absolutely undocumented service in VS that allows you to do just that, writing no code :)

As a general fan of the `System.ComponentModel`, I noticed the new System.ComponentModel.Design.ITypeDiscoveryService:
    
    
    public interface ITypeDiscoveryService  
    {  
         ICollection GetTypes(Type baseType, bool excludeGlobalTypes);  
    }

Intrigued by the service, I used [Reflector](http://www.aisto.com/roeder/dotnet/)'s excelent analyze feature to find who uses it. And I got to an interesting one in the VS SDK: `Microsoft.VisualStudio.Shell.Design.DynamicTypeService`. Among other very interesting members, you can retrieve the aforementioned `ITypeDiscoveryService` for a given `IVsHierarchy`:
    
    
    public ITypeDiscoveryService GetTypeDiscoveryService(IVsHierarchy hierarchy)

(There's also a `public ITypeResolutionService GetTypeResolutionService(IVsHierarchy hierarchy)` method which should also be very useful)

That looked very promising, and combined with my previous "discovery" of a way to [go from a `EnvDTE.Project` to an `IVsHierarchy`](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/DteToVSIP.aspx), it looked like a very easy approach. So here's the code I used:
    
    
    public Dictionary GetAvailableTypes(IServiceProvider provider, bool includeReferences)  
    {  
         DynamicTypeService typeService = (DynamicTypeService)provider.GetService(typeof(DynamicTypeService));  
         Debug.Assert(typeService != null, "No dynamic type service registered.");  
       
         IVsHierarchy hier = VsHelper.GetCurrentHierarchy(provider);  
         Debug.Assert(hier != null, "No active hierarchy is selected.");  
       
         ITypeDiscoveryService discovery = typeService.GetTypeDiscoveryService(hier);  
         Project dteProject = VsHelper.ToDteProject(hier);  
       
         Dictionary availableTypes = new Dictionary();  
         foreach (Type type in discovery.GetTypes(typeof(object), includeReferences))  
         {  
             // We will never allow non-public types selection, as it's terrible practice.  
             if (type.IsPublic)  
             {  
                 if (!availableTypes.ContainsKey(type.FullName))  
                 {  
                     availableTypes.Add(type.FullName, type);  
                 }  
             }  
         }  
    } 

That simple method will give you a dictionary of all the types in the current project as well as its references, without locking any files, and without you having to worry how to traverse the DTE, references, CodeModel, etc. Very cool, indeed :)

Enjoy!

posted [Friday, January 06, 2006 8:47 PM](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetTypesFromProject.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetTypesFromProject.aspx#comments)

#####  [How to convert from EnvDTE.Project to IVsHierarchy and IVsProject and viceversa](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/DteToVSIP.aspx)

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

posted [Friday, January 06, 2006 4:11 PM](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/DteToVSIP.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [3 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/DteToVSIP.aspx#comments)

  

[![](/web/20060303191228im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
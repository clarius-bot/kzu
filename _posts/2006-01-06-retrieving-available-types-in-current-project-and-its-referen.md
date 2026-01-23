---
layout: post
title: "Retrieving available types in current project and its references (without locking)"
date: 2006-01-06 00:00:00 +0000
---

##  [Retrieving available types in current project and its references (without locking)](<http://blogs.clariusconsulting.net/kzu/retrieving-available-types-in-current-project-and-its-references-withoult-locking/> "Retrieving available types in current project and its references \(without locking\)")

January 6, 2006 8:47 pm

One very tricky thing inside VS used to be (at least for me until I found the solution I’m about to show you) to list and work with the types defined in the project as well as its references. The problem was mainly how to properly load the types without locking the project output for compilation, as well as retrieving the types for references that could be also project references. It turns out that there is a very cool and absolutely undocumented service in VS that allows you to do just that, writing no code ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

As a general fan of the `System.ComponentModel`, I noticed the new System.ComponentModel.Design.ITypeDiscoveryService:
    
    
    public interface ITypeDiscoveryService
    {
         ICollection GetTypes(Type baseType, bool excludeGlobalTypes);
    }

Intrigued by the service, I used [Reflector](<http://www.aisto.com/roeder/dotnet/>)‘s excellent analyze feature to find who uses it. And I got to an interesting one in the VS SDK: `Microsoft.VisualStudio.Shell.Design.DynamicTypeService`. Among other very interesting members, you can retrieve the aforementioned `ITypeDiscoveryService` for a given `IVsHierarchy`:
    
    
    public ITypeDiscoveryService GetTypeDiscoveryService(IVsHierarchy hierarchy)

(There’s also a `public ITypeResolutionService GetTypeResolutionService(IVsHierarchy hierarchy)` method which should also be very useful)

That looked very promising, and combined with my previous "discovery" of a way to [go from a `EnvDTE.Project` to an `IVsHierarchy`](<http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/DteToVSIP.aspx>), it looked like a very easy approach. So here’s the code I used:
    
    
    public IEnumerable<Type> GetAvailableTypes(IServiceProvider provider, bool includeReferences)
    {
         DynamicTypeService typeService = (DynamicTypeService)provider.GetService(typeof(DynamicTypeService));
         Debug.Assert(typeService != null, "No dynamic type service registered.");
    
         IVsHierarchy hier = VsHelper.GetCurrentHierarchy(provider);
         Debug.Assert(hier != null, "No active hierarchy is selected.");
    
         ITypeDiscoveryService discovery = typeService.GetTypeDiscoveryService(hier);
         Project dteProject = VsHelper.ToDteProject(hier);
    
         HashSet<Type> availableTypes = new HashSet<Type>();
         foreach (Type type in discovery.GetTypes(typeof(object), includeReferences))
         {
             // We will never allow non-public types selection, as it's terrible practice.
             if (type.IsPublic)
             {
                 if (!availableTypes.Contains(type))
                 {
                     availableTypes.Add(type);
                 }
             }
         }
    
         return availableTypes;
    }

That simple method will give you a list of all the types in the current project as well as its references, without locking any files, and without you having to worry how to traverse the DTE, references, CodeModel, etc. 

Enjoy!

![](http://clariusconsulting.net/aggbug.aspx?PostID=429)

/kzu

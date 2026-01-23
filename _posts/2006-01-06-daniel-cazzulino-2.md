---
layout: post
title: "Daniel Cazzulino"
date: 2006-01-06 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Retrieving available types in current project and its references (withoult locking)

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060220124719im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Retrieving available types in current project and its references (withoult locking) 

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

posted on Friday, January 06, 2006 8:47 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/429.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetTypesFromProject.aspx#450 "permalink") re: Retrieving available types in current project and its references (withoult locking) @ Saturday, January 21, 2006 11:27 PM

Hi   
  
I am trying to build a CustomControl, one of the property is "ReferencedAssemblies" in the project (Current Project where control is being used). I want to display all the referenced properties as default properties.   
  
  
Here is the code that I wrote and it is not working. Can you tell me why and let me a easier way of doing if any!   
  
Thanks   
Venkat   
  
public class MyTextBox : System.Web.UI.WebControls.TextBox   
{   
private string cReferencedAssemblies = "";   
  
[Category("Data"),   
Description("The Referenced Assemblies ,   
DefaultValue(""), TypeConverter(typeof(CustomRefAssembliesConv))]   
public string ReferencedAssemblies   
{   
get { return this.cReferencedAssemblies; }   
set { this.cReferencedAssemblies = value; }   
}   
  
  
  
}   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
internal class CustomRefAssembliesConv :StringConverter {   
  
public override bool GetStandardValuesSupported(   
ITypeDescriptorContext context)   
{   
return true;   
}   
  
public override bool GetStandardValuesExclusive(   
ITypeDescriptorContext context)   
{   
// returning false here means the property will   
// have a drop down and a value that can be manually   
// entered.   
return false;   
}   
  
public override StandardValuesCollection GetStandardValues(   
ITypeDescriptorContext context)   
{   
//DTE2 dte = (DTE2)context.GetService(typeof(DTE2));   
  
MyTextBox zTextBox = (MyTextBox)context.Instance;   
ISite ZSite = zTextBox.Site;   
DTE dte = (DTE)ZSite.GetService(typeof(DTE));   
Array activeProjects = (Array)dte.ActiveSolutionProjects;   
  
  
Project selectedProject = (Project)activeProjects.GetValue(0);   
  
VSProject selectedVSProject = (VSProject)selectedProject.Object;   
References projreferences = selectedVSProject.References;   
  
string[] editorObjects = new string[projreferences.Count];   
int editObjectLength = 0;   
foreach (Reference prjref in projreferences)   
{   
editorObjects[editObjectLength] = prjref.Name;   
editObjectLength++;   
  
}   
  
  
  
StandardValuesCollection defaultval = new StandardValuesCollection(editorObjects);   
return defaultval;   
  
  
  
  
  
  
  
}   
  
} [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

Venkat

  

![](/web/20060220124719im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
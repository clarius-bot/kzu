---
layout: post
title: "Daniel Cazzulino"
date: 2006-03-03 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Saturday, January 07, 2006 - Posts

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060303191234im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Saturday, January 07, 2006 - Posts

#####  [How to reuse Windows Workflow Foundation (WF) cool type browser editor in your components](http://clariusconsulting.net/blogs/kzu/archive/2006/01/07/WFTypeBrowser.aspx)

Windows Workflow Foundation (WF) comes with a very cool `UITypeEditor` that allows selection of a type in the current project or any of its references:

![Screenshot of WF type browser in action](https://web.archive.org/web/20060303191234im_/http://aspnet2.com/kzu/weblog/WWFTypeBrowser.png)

Its type is `System.Workflow.ComponentModel.Design.TypeBrowserEditor` defined in the `System.Workflow.ComponentModel.dll` assembly. However, if you try to "attach" it directly to one of your components properties, you will get an error saying "The service 'System.Workflow.ComponentModel.Compiler.ITypeProvider' must be installed for this operation to suceeed. Ensure that this service is available.":

![Screenshot of the error you get when using the WF type browser](https://web.archive.org/web/20060303191234im_/http://aspnet2.com/kzu/weblog/WWFTypeBrowserError.png)

Being a general fan of the ComponentModel, I knew what was this about, and started working on providing the WF type browser editor with the services it needs. Here are the implementation steps I used to get it work

  1. It was obvious that I could not use the editor as-is, so the first step was to create a custom `UITypeEditor` that would call the `TypeBrowserEditor` in WF:  

         
         public class TypeBrowser : UITypeEditor   
         {   
             TypeBrowserEditor editor = new TypeBrowserEditor();   
             ContextProxy flyweight;   
            
             public override object EditValue(ITypeDescriptorContext context, IServiceProvider provider, object value)   
             {   
                 // Use flyweight pattern to improve performance. It's guaranteed that no more than one instance of    
                 // this editor can ever be used at the same time. (it's modal)   
                 if (flyweight == null)   
                 {   
                     flyweight = new ContextProxy(context);   
                 }   
                 else   
                 {   
                     flyweight.SetContext(context);       
                 }   
            
                 **return editor.EditValue(flyweight, flyweight, value);**  
             }   
            
             public override UITypeEditorEditStyle GetEditStyle(ITypeDescriptorContext typeDescriptorContext)   
             {   
                 return editor.GetEditStyle(typeDescriptorContext);   
             }   
         }

  2. The code highlighted above shows that I'm passing a custom `ITypeDescriptorContext` to the WF editor. This custom context acts as a proxy to the real one received by the editor, and allows me to provide the additional services required by it. It provides the only service required for the editor to work, `ITypeProvider`:  

         
         private class ContextProxy : ITypeDescriptorContext   
         {   
             ITypeProvider typeProvider;   
             ITypeDescriptorContext realContext;   
            
             public ContextProxy(ITypeDescriptorContext realContext)   
             {   
                 this.realContext = realContext;   
             }   
            
             internal void SetContext(ITypeDescriptorContext realContext)   
             {   
                 this.realContext = realContext;   
             }   
            
             #region ITypeDescriptorContext Members   
             ...   
             #endregion   
            
             #region IServiceProvider Members   
            
             public object GetService(Type serviceType)   
             {   
         **if (serviceType == typeof(ITypeProvider))  
                 {   
                     if (typeProvider == null) typeProvider = new CustomTypeProvider(this);   
            
                     return typeProvider;   
                 }   
         **   
                 return realContext.GetService(serviceType);   
             }   
            
             #endregion   
         }   
         

  3. The custom `ITypeProvider` instantiated and returned from the `GetService` call must give the browser the list of types available in the current project. For that, I took advantage of [VS-provided `DynamicTypeService` and `ITypeDiscoveryService`, as explained in my previous post](http://clariusconsulting.net/blogs/kzu/archive/2006/01/06/GetTypesFromProject.aspx):  

         
         private class CustomTypeProvider : ITypeProvider   
         {   
             Dictionary availableTypes;   
            
             public CustomTypeProvider(IServiceProvider provider)   
             {   
                 DynamicTypeService typeService = (DynamicTypeService)provider.GetService(typeof(DynamicTypeService));   
                 Debug.Assert(typeService != null, "No dynamic type service registered.");   
            
                 IVsHierarchy hier = VsHelper.GetCurrentHierarchy(provider);   
                 Debug.Assert(hier != null, "No active hierarchy is selected.");   
            
                 ITypeDiscoveryService discovery = typeService.GetTypeDiscoveryService(hier);   
                 Project dteProject = VsHelper.ToDteProject(hier);   
            
                 availableTypes = new Dictionary();   
                 foreach (Type type in discovery.GetTypes(typeof(object), false))   
                 {   
                     if (!availableTypes.ContainsKey(type.FullName))   
                     {   
                         if (type.Assembly.GetName().Name != (string)dteProject.Properties.Item("AssemblyName").Value)   
                         {   
                             availableTypes.Add(type.FullName, type);   
                         }   
                         else   
                         {   
                             availableTypes.Add(type.FullName, new ProjectType(type));   
                         }   
                     }   
                 }   
             }   
         }   
         

  
From that point on, all the `ITypeProvider` members use the `availableTypes` field for their implementation. The only caveat was that apparently the WF type browser determines that a type belongs to the current project by the presence of a null value on its `Assembly` property. However, the VS built-in `ITypeDiscoveryService` gives you fully loaded types, complete with `Assembly` property and everything, even for the ones in the current project. Hence, the code above detects if the assembly of a type matches the current and adds to the list a `System.Reflection.TypeDelegator`-derived class (`ProjectType` above instead of the real type:   

         
                             if (type.Assembly.GetName().Name != (string)dteProject.Properties.Item("AssemblyName").Value)   
                             {   
                                 availableTypes.Add(type.FullName, type);   
                             }   
                             else   
                             {   
                                 availableTypes.Add(type.FullName, **new ProjectType(type)**);   
                             }

  
The `TypeDelegator` class is a not-so-known type that allows a very elegant way to proxy calls to the `Type` it's delegating to, effectively allowing a kind of reflection interception. This interception is almost transparent, save for the creation of the type delegator with the real `Type`, as the delegator inherits from `Type` itself. My delegator is simple, and provides what the WF browser expects: a null value for the `Assembly` property:  

         
         private class ProjectType : TypeDelegator   
         {   
             public ProjectType(Type delegatingType) : base(delegatingType) { }   
            
             public override Assembly Assembly   
             {   
                 get { return null; }   
             }   
         }   
         

  
So the relevant members of the ITypeProvider interface take into account this trick as follows:  

         
         #region ITypeProvider Members   
            
         public Type GetType(string name, bool throwOnError)   
         {   
             if (String.IsNullOrEmpty(name))   
             {   
                 return null;   
             }   
            
             if (availableTypes.ContainsKey(name))   
             {   
                 Type type = availableTypes[name];   
         **if (type is TypeDelegator)  
                 {   
                     return ((TypeDelegator)type).UnderlyingSystemType;   
                 }   
                 else   
                 {   
                     return type;   
                 }   
         **    }   
             else   
             {   
                 if (throwOnError)   
                 {   
                     throw new TypeLoadException();   
                 }   
                 else   
                 {   
                     return null;   
                 }   
             }   
         }   
            
         public Type GetType(string name)   
         {   
             return GetType(name, false);   
         }   
            
         public Type[] GetTypes()   
         {   
             Type[] result = new Type[availableTypes.Count];   
             availableTypes.Values.CopyTo(result, 0);   
            
             return result;   
         }   
         

  
The `GetType` method is called by the WF browser when you select a type in the listview, and for setting the final return value. So, I achieve the browser requirements for display, but get a fully qualified type name (or the Type itself, depending on the type of the property/value being edited) as an output. 

With that code in-place, you can simply annotate your component members as follows:
    
    
    public partial class MyComponent : Component   
    {   
        public MyComponent()   
        {   
            InitializeComponent();   
        }   
       
        public MyComponent(IContainer container)   
        {   
            container.Add(this);   
       
            InitializeComponent();   
        }   
       
        private Type someType;   
       
        **[Editor(typeof(TypeBrowser), typeof(UITypeEditor))]  
    **    public Type DataContractType   
        {   
            get { return someType; }   
            set { someType = value; }   
        }   
    }

This could also be a property on a user control, of course. With that simple attribute you can now get the cool WF type editor for your property too:

![Screenshot of a working component reusing the WF type browser](https://web.archive.org/web/20060303191234im_/http://aspnet2.com/kzu/weblog/WWFTypeBrowserCustom.png)

In the above screenshot you see:

  * A simple Class Library project containing a component that launches the WF type browser (no need for a WF project!!!) 
  * The component we showed previously in source form, being dropped on a WinForm, and its `DataContractType` property having the "..." for launching the editor 
  * The editor with the proper value selected (the one that was already set on the property) as well as the property in the property grid reflecting this value (serialization to code works flawlessly)

What you also see above that I have not explained yet is how to filter the dialog. In the screenshot you see a custom label with the text "Showing types that have DataContractAttribute.", and also from all the types defined in the project or its references, only a few are shown in the treeview/listview. You can achieve this by providing custom filters that implement the `ITypeFilterProvider` interface. For example, the filter in action above is coded as follows:
    
    
    public class DataContractFilter : ITypeFilterProvider   
    {   
        public DataContractFilter()   
        {   
        }   
       
        public DataContractFilter(IServiceProvider provider)   
        {   
            // Constructor required by the dialog.   
        }   
       
        #region ITypeFilterProvider Members   
       
        public bool CanFilterType(Type type, bool throwOnError)   
        {   
            bool isDataContract = type.IsPublic && Attribute.IsDefined(type, typeof(DataContractAttribute));   
            if (throwOnError && !isDataContract)   
            {   
                throw new ArgumentException("Type is not a data contract.");   
            }   
       
            return isDataContract;   
        }   
       
        public string FilterDescription   
        {   
            get { return "types that have DataContractAttribute"; }   
        }   
       
        #endregion   
    }   
    

Finally, you apply the filter to your property with another attribute:
    
    
    **[TypeFilterProvider(typeof(DataContractFilter))]  
    **  [Editor(typeof(TypeBrowser), typeof(UITypeEditor))]   
      public Type DataContractType   
    

It took quite some time and reflectoring, but I'm very satisfied with the result :D  
Enjoy!

**Update** : download the sample code from [CodeProject](http://www.codeproject.com/csharp/WFTypeBrowser.asp).

posted [Saturday, January 07, 2006 12:14 PM](http://clariusconsulting.net/blogs/kzu/archive/2006/01/07/WFTypeBrowser.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [2 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/01/07/WFTypeBrowser.aspx#comments)

#####  [XInclude breaks VS 2005 XML editor intellisense](http://clariusconsulting.net/blogs/kzu/archive/2006/01/07/XIncludeBreaksIntellisense.aspx)

A while back I've reported as a [bug that VS XML editor breaks if you use XInclude elements](http://lab.msdn.microsoft.com/productfeedback/viewfeedback.aspx?feedbackid=FDBK42576) in the document. You may ask: "who cares? .NET does not support XInclude anyway!". It just so happens that the recently released version of the [Guidance Automation Extensions (GAX)](http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/) include the [Mvp.Xml library](http://www.xmlmvp.org/), which adds support for [XInclude](http://www.w3.org/TR/xinclude/) in your guidance package configuration file.

So, in order to benefit from the better manageability and modularity of you guidance package configuration, you have to pay the price of losing intellisense :(... As a workaround, you can keep a dummy XML file around in the solution that you use for authoring the recipe with full intellisense, before you split it in multiple files. However, once you need to start editing it, you're again stuck. I believe the added flexibility is worth the price anyway, but that's just me....(and I'm an XML MVP, so I may be biased ;))

posted [Saturday, January 07, 2006 11:48 AM](http://clariusconsulting.net/blogs/kzu/archive/2006/01/07/XIncludeBreaksIntellisense.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/01/07/XIncludeBreaksIntellisense.aspx#comments)

  

[![](/web/20060303191234im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
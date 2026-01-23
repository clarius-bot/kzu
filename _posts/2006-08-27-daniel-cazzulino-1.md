---
layout: post
title: "Daniel Cazzulino"
date: 2006-08-27 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Wednesday, December 14, 2005 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))| August 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2435'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2005/12/1.aspx "1 Post")| 2| 3| 4| 5  
6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2005/12/8.aspx "2 Posts")| 9| 10| 11| 12  
13| [14](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14.aspx "2 Posts")| 15| 16| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2005/12/19.aspx "1 Post")  
20| 21| 22| 23| 24| 25| 26  
27| 28| 29| 30| 31| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060827132611im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Wednesday, December 14, 2005 - Posts

#####  [Upgrading from GAT May CTP and December CTP](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/UpgradingGAT.aspx)

These are roughly the things that you need to change in your current package:

  1. Search replace "50505" with "51206" in the entire solution. This is the changed assembly version number that appears in all your .vstemplates. 
  2. Delete all references from all projects to Microsoft.Practices.* and re-add them pointing to the new version of the binaries. 
  3. Search replace "igt" with "gax" (for XML and .vstemplate files) 
  4. All T3 templates need to be updated to the [T4 syntax](http://www.google.com/url?sa=t&ct=res&cd=1&url=http%3A//blogs.msdn.com/garethj/archive/2005/09/26/473929.aspx&ei=49yhQ8WYB7n84AGUy7GtDw&sig2=07iUPYS4EcanO4WB8xPzAw) shared with the DSL tools 
  5. Search & replace: **Microsoft.Practices.RecipeFramework.Library.Actions.T3Action, Microsoft.Practices.RecipeFramework.Library** with **Microsoft.Practices.RecipeFramework.VisualStudio.Library.Templates.TextTemplateAction, Microsoft.Practices.RecipeFramework.VisualStudio.Library**
  6. DteHelper class now lives in the Microsoft.Practices.RecipeFramework.Library namespace and assembly. 
  7. In .vstemplate files, you could previously specify initial state for your recipes with the following syntax:

    
    
        <TemplateReference Name="Projects\ServiceAgent\ServiceAgent.vstemplate" Target="\ServiceAgents">  
          <XmlSerializableHashtable xmlns="<http://schemas.microsoft.com/pag/igt-xmlhashtable>" xmlns:xsi="<http://www.w3.org/2001/XMLSchema-instance>" xmlns:xs="<http://www.w3.org/2001/XMLSchema>">  
           <Entries>  
            <Entry>  
             <Key xsi:type="xs:string">Key1</Key>  
             <Value xsi:type="xs:string">Value1</Value>  
            </Entry>  
           </Entries>  
          </XmlSerializableHashtable>  
         </InitialState>-->  
        </TemplateReference>

That has been replaced by the much simpler format: 
    
    
        <TemplateReference Name="Items\SerializableClass.vstemplate" Target="/" >  
         <InitialState xmlns:xsi="<http://www.w3.org/2001/XMLSchema-instance>" xmlns:xs="<http://www.w3.org/2001/XMLSchema>">  
          <Entry>  
           <Key>SerializableField</Key>  
           <Value>Name</Value>  
          </Entry>  
         </InitialState>  
        </TemplateReference> 

Of course, you can still use xsi:type just like the XmlSerializer does to get strongly typed initial values. You can put pretty much whatever you want there, as long as the value is compatible with the corresponding arguments defined for the recipe. 

I think that's all, but let me know if you find anything that's missing or not working!

posted [Wednesday, December 14, 2005 10:51 AM](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/UpgradingGAT.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/UpgradingGAT.aspx#comments)

#####  [patterns & practices Guidance Automation released for Whidbey RTM!](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/gatrtm.aspx)

The [Guidance Automation Extensions (GAX) and Toolkit (GAT)](http://msdn.microsoft.com/vstudio/teamsystem/Workshop/gat/) have been updated for Visual Studio 2005 RTM. As [Tom describes it](http://blogs.msdn.com/tomholl/archive/2005/12/13/503461.aspx):

> At long last, the Guidance Automation Toolkit (GAT) and Guidance Automation Extensions (GAX) have been updated for the final version of Visual Studio 2005. For those that came in late, GAT allows developers and architects to integrate guidance deliverables such as blocks, frameworks and patterns into the Visual Studio environment, using mechanisms such as templates, wizards and code generation. GAT is targeted at people authoring these "guidance packages", while GAX is the runtime component required by anyone consuming guidance packages. You'll be seeing quite a few p&p deliverables built using GAT (and hence requiring GAX) over the next year, so this would be a great time to get up to speed on this exciting technology.

Just as a quick list of things that GAX/GAT enables you to do, *very* easily:

  1. Create reusable actions that automate VS using either the DTE or the VSIP interfaces. 
  2. Create rich argument collection strategies for use in wizards using .NET standard [TypeConverter](http://weblogs.asp.net/cazzu/admin/msdn2.microsoft.com/en-us/library/system.componentmodel.typeconverter.aspx) and [UITypeEditor](http://weblogs.asp.net/cazzu/admin/msdn2.microsoft.com/en-us/library/system.drawing.design.uitypeeditor.aspx) base classes. This also means that you get the built-in ones supported in your wizards for free!! 
  3. Create automatic argument calculation strategies, that can determine (default) argument values from the environment (such as the opened solution, currently selected project properties, VS state, etc.) 
  4. Declaratively design wizards using XML, by specifying the arguments that need to be collected, their .NET type and converters/editors to use to assist the user and validate the input, and even custom pages (a special kind of user control) for advanced input scenarios! 
  5. Group the arguments used by the actions, the automatic argument collection strategies, the wizard to manually them from the user, and the set of actions to perform on the environment in so-called _recipes_. 
  6. Easily associate recipes to item, project or solution templates, so that additional arguments can be collected for the VS template expansion and parameter replacement, as well as to execute actions after the unfold operation finishes. 
  7. Easily expose those recipes as commands in main or context menus. Assign icons to them simply by pointing to an image file! (no more unmanaged VC++ resources for icons or those ugly .CTC files defining commands in VSIP!!!) 
  8. Create code generation templates using a text templating language code-named T4 that is shared with the DSL Tools (similar in spirit to classic ASP, CodeSmith, NVelocity, etc.) 
  9. Easily contextualize the recipes and templates so that they appear only for: 
     * A particular element in the solution (i.e. a specific project, item, solution folder, etc.) 
     * Elements that satisfy a given condition, coded easily in any .NET language (i.e. all XML files, XML files whose root element belongs to a given namespace, all C# projects that are class libraries and have a reference to Indigo, etc.) 
  10. Easily create and package code snippets with your guidance 
  11. Automatically create an MSI setup file to include all the above!

If the above list grabbed your interest, go and [download GAX and GAT](http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/download.aspx) and start playing with it! Don't forget to ask your questions either on the [MSDN forum](http://forums.microsoft.com/msdn/ShowForum.aspx?ForumID=78) or the [GuidanceAutomation.net](http://guidanceautomation.net/) community site.

Read the [following entry on how to upgrade](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/UpgradingGAT.aspx) from Beta2-based GAT packages and the new version.

posted [Wednesday, December 14, 2005 10:42 AM](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/gatrtm.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [2 Comments](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/gatrtm.aspx#comments)

  

[![](/web/20060827132611im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
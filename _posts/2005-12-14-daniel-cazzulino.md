---
layout: post
title: "Daniel Cazzulino"
date: 2005-12-14 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : patterns & practices Guidance Automation released for Whidbey RTM!

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| [1](http://clariusconsulting.net/blogs/kzu/archive/2005/12/1.aspx "1 Post")| 2| 3| 4| 5| 6  
7| [8](http://clariusconsulting.net/blogs/kzu/archive/2005/12/8.aspx "2 Posts")| 9| 10| 11| 12| 13  
[14](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14.aspx "2 Posts")| 15| 16| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2005/12/19.aspx "1 Post")| 20  
21| 22| 23| 24| 25| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060515091150im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## patterns & practices Guidance Automation released for Whidbey RTM! 

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

posted on Wednesday, December 14, 2005 10:42 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/417.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/gatrtm.aspx#420 "permalink") re: patterns &amp;amp; practices Guidance Automation released for Whidbey RTM! @ Wednesday, December 14, 2005 2:34 PM

would like to get my hands on it but all links are gone:   
  
The download you requested is unavailable.   
  
cheers..   
  
Frank [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Frank](http://clariusconsulting.net/utility/Redirect.aspx?U=http://dotnetpret.blogspot.com/ "Anonymous")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14/gatrtm.aspx#421 "permalink") re: patterns &amp;amp; practices Guidance Automation released for Whidbey RTM! @ Thursday, December 15, 2005 9:10 AM

This is great news. Congratulations Kzu! Will the GAT Hands On Lab be updated as well? I found it to be extremely useful for learning what GAT is and how it works. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Martin Danner](http://clariusconsulting.net/utility/Redirect.aspx?U=http://blog.arrowrock.com/sourceart/ "Anonymous")

  

[![](/web/20060515091150im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
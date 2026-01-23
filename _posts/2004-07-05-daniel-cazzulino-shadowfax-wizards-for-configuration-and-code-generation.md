---
layout: post
title: "Daniel Cazzulino : Shadowfax Wizards for configuration and code generation"
date: 2004-07-05 00:00:00 +0000
---

Daniel Cazzulino : Shadowfax Wizards for configuration and code generation


### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2131'\))| December 2005| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| 3  
4| [5](http://clariusconsulting.net/blogs/kzu/archive/2004/7/5.aspx "2 Posts")| [6](http://clariusconsulting.net/blogs/kzu/archive/2004/7/6.aspx "1 Post")| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/7/9.aspx "2 Posts")| 10  
11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/7/12.aspx "1 Post")| 13| 14| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/7/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/7/16.aspx "3 Posts")| 17  
18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/7/20.aspx "1 Post")| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/7/21.aspx "2 Posts")| 22| 23| 24  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
  

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

## Shadowfax Wizards for configuration and code generation 

The cornerstone of any highly extensible and pluggable framework is configuration. This is even more important in SOA architectures like [ Shadowfax](http://www.gotdotnet.com/Community/Workspaces/workspace.aspx?id=9c29a963-594e-4e7a-9c45-576198df8058) (Sfx), because business actions (BA), service interface and implementation, pipelines, etc., must be configured. Configuring BAs is specially critical since a typical enterprise application will contain hundreds of them. A set of wizards for Sfx were released for that purpose.

First, what you'll see: after installing both MSIs in the distro, you'll have new items in the Add New Project and Add New Item dialogs, as well as some additional context menus.

![](https://web.archive.org/web/20051225224734im_/http://aspnet2.com/kzu/weblog/addnewproject.gif)

All wizards can generate either VB.NET or C# code. Note that both language categories exist inside a new folder at the left called Microsoft IPE Wizard Framework. That's the framework these wizards are built on top, which I'll discuss in another post.

The Word document bundled with the distribution shows all wizards and the actions they perform. You have worked with wizards in the past, so I'll save you the hassle of reading how to use these ones. There's, however, a very interesting feature: you can modify the generated code for the classes, thanks to a template transformation engine (code-named T3 - Templated Text Transformantions) that is distributed with the wizard framework.

Under the wizard framework installation folder, by default `C:\Program Files\Microsoft Application Blocks For .Net\Microsoft IPE Wizard Framework`, you'll find a `Templates` folder, containing `ProjectItems`, `Projects`, and `Transformations` subfolders. The last is the one containing templates used for code generation. The templates are named after the assembly using them (for Sfx wizards it's the `Microsoft.ReferenceArchitecture.Wizards` ) plus the concrete wizard resource name. For example, the one used to generate the BA class definition in C# for context invocation is: `Microsoft.ReferenceArchitecture.Wizards.AddBusinessAction.CreateClass.InvocationContext-cs.ipe`

If you have used [CodeSmith](www.ericjsmith.net/codesmith/), you'll find the template syntax inmediately familiar, which is also similar to ASP.NET one. Everything between `<#` and `#/>` (just like their `<%` and `%>` counterparts) is considered code that must be executed at template-rendering time. The language for this code is specified through the `<#@ Template Language= "C#|VB" #/>` template directive. Everything else, is just text that is emited as-is. Here's the BA class creation template:

#region info //=============================================================================== // Microsoft Services Reference Architecture // http:// // // .cs // // This file contains the implementation of the class // //=============================================================================== // Copyright (C) 2003-2004 Microsoft Corporation // All rights reserved. // THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY // OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT // LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR // FITNESS FOR A PARTICULAR PURPOSE. //============================================================================== #endregion info #region using using System; using Microsoft.ReferenceArchitecture.Services; #endregion using namespace { /// /// Summary description for . /// public class : IBusinessAction { #region IBusinessAction Members void IBusinessAction.Validate(IContext context) { // TODO: add semantic validation implementation } void IBusinessAction.Execute(IContext context) { // TODO: add code to set the context.Response.Payload } #endregion IBusinessAction Members } }

Parameters received by the template at run-time, depending on user input, are retrieved at the beginning of the template through a service exposed by the container. You can add your own methods or change the base class of all generated BAs simply by modifying this template.

Wizards are deeply integrated with the IDE and the Sfx configuration file. Therefore, in order to run the wizards you must specify where's the configuration file. You do so by right-clicking the `ServicesReferenceArchitecture.config` file in the `Solution Items` folder, and selecting `Set as configuration file`:

![](https://web.archive.org/web/20051225224734im_/http://aspnet2.com/kzu/weblog/setasconfigurationfile.gif)

Wizards will show relevant information from both the current solution as well as the configuration file when necessary. For example, in the screenshot above you see a `Configure pipeline` menu option. If you select it, you'll enter a wizard that allows you to modify existing pipelines in the file. (I have to show this because I like how it looks) 

![](https://web.archive.org/web/20051225224734im_/http://aspnet2.com/kzu/weblog/configurepipeline.jpg)

On the next step, you'll have the option of editing either a service interface or implementation pipeline. The dropdown below shows the actual pipeline names in the configuration file for the joinpoint you chose!

![](https://web.archive.org/web/20051225224734im_/http://aspnet2.com/kzu/weblog/editpipeline.gif)

And in the next step, you get the current configuration, including handlers associated with the pipeline. You can add/remove handlers too, from a list that is also pulled from the config file:

![](https://web.archive.org/web/20051225224734im_/http://aspnet2.com/kzu/weblog/edithandlers.gif)

This can be a real time-saver, and avoids occasional typos. 

Currently, the following wizards are supported:

  * Add Business Action: creates a new BA and optionally adds a new project for it.
  * Expose Business Action as new Service Action: allows you to develop BAs and later configure and expose them as service actions in Sfx.
  * Configure Pipeline: the one you saw above.
  * Add New Service: this is probably the first one you should run. It goes through all the steps to setup all projects that will be needed for developing for Sfx. This includes creating a folder for the service you're creating (i.e. Accounting), creating or selecting the project that will hold message definitions, and the one for BAs, creating a new BA (this is basically the same as the first wizard, embedded in this one), configuring it with Sfx, exposing it through a WebService interface (creates the WebService class as well), and updating deploy scripts. 
  * Add Custom Handler: creates skeleton implementations of the three types of handlers, Atomic, Stateful around and Stateless around.
  * Create Service Gateway Class: creates either a MSMQ or Remoting client proxy class. Specially for MSMQ, this is a huge plus!

What other wizards would you like to have?

In a future post, I'll discuss the architecture and integration features of the Wizard Framework that backs all these wizards, which are 100% .NET code (no HTML or JS!), are defined in XML and customized through well known TypeConverter and UITypeEditor classes.

posted on Monday, July 05, 2004 12:34 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/257.aspx) :: 

  

![](/web/20051225224734im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
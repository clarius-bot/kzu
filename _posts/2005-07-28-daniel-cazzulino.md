---
layout: post
title: "Daniel Cazzulino"
date: 2005-07-28 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Enter Guidance Automation Toolkit (and who you should blame ;))

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))| August 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2435'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2005/7/1.aspx "3 Posts")| 2| 3| 4| 5  
6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2005/7/8.aspx "2 Posts")| 9| 10| 11| 12  
13| 14| 15| 16| 17| 18| 19  
20| 21| [22](http://clariusconsulting.net/blogs/kzu/archive/2005/7/22.aspx "1 Post")| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2005/7/26.aspx "2 Posts")  
[27](http://clariusconsulting.net/blogs/kzu/archive/2005/7/27.aspx "1 Post")| [28](http://clariusconsulting.net/blogs/kzu/archive/2005/7/28.aspx "2 Posts")| 29| 30| 31| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060827015457im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Enter Guidance Automation Toolkit (and who you should blame ;)) 

Probably you head about [GAT](http://weblogs.asp.net/cazzu/posts/GATTechPreview.aspx), the Guidance Automation Toolkit. The reason [p&p](http://microsoft.com/practices) decided to create it was that packaging the guidance they ship (app. blocks, books, etc.) in a more interactive form, directly in VS was simply too costly. Creating and maintaining add-ins or VSIP packages is not only costly but also requires quite deep knowledge of VS intricacies. They needed a better way of doing VS integration. And GAT was born.   
  
I had developed add-ins in the past, and I knew exactly the things that I hated (and you probably also do). As part of my job in realizing GAT, I wanted it to be very simple and straightforward for what we call _guidance package authors_. So, besides Wojtek designing a very simple conceptual model, I strove to make the programming model as easy as possible. You can judge the results for yourself, after going through the [LAB that we created for TechEd](http://guidanceautomation.net/library/View.aspx?Id=7).   
  
Speaking of TechEd, here's Wojtek and myself getting ready for the presentation: 

[![](https://web.archive.org/web/20060827015457im_/http://aspnet2.com/kzu/weblog/TechEd1-small.jpg)](http://aspnet2.com/kzu/weblog/TechEd1.jpg "Click to enlarge")

And here are we giving the actual presentation to a fairly big audience who asked very interesting questions and seemed to liked what we showed. GAT is a very cool technology that will play an increasingly important role under the Software Factory initiative.

[![](https://web.archive.org/web/20060827015457im_/http://aspnet2.com/kzu/weblog/TechEd2-small.jpg)](http://aspnet2.com/kzu/weblog/TechEd2.jpg "Click to enlarge")

Now, without getting into the buzzword-marketing stuff, what's GAT, after all? If you were evaluating writing an Add-in to automate some of the developer tasks that you repeatedly do in your company, what features in GAT would make you choose it instead? From my point of view, here are the main points that I consider critical in the decision:  

  1. _Automatic generation of wizard UI on top of a robust Wizard Framework_ : creating a wizard "by hand", ensuring that the appropriate validation is performed, that no required fields are left incomplete before the next/finish button is enabled, building richer field-editing experiences, etc., is a tough job that almost everybody hates. And if you have an automatic wizard generation process, most people almost inmediately assume that it will look terrible or will not be suitable for complex scenarios. Guess what, GAT not only provides automatic wizard generation from an XML configuration file, but it also looks great, enables extensions that can make your wizards very user friendly, but at the same time encourages the development of reusable UI components/logic in the form of .NET TypeConverters and UITypeEditors. This means that over time, your wizards will look better and better, and they will be increasingly easier to build, as you create an increasingly big library of reusable components.  
Also, the wizard generation uses a brand-new wizard framework developed entirely from scratch for Whidbey, that is the core component that will unify all the wizard needs across teams in Microsoft developing VS integration packages. What this means to you is that you can rest assured that your packages will always be aligned with the best practices with regards to wizard UI layout and style, but also that it's a very robust and tested component that will take care of the complexities inherent to wizard UIs. And all that without taking away the ultimate flexibility point that allows you to simply develop a user control to use on a wizard page that is too complex to fit in the automatic UI generation features.  
  

  2. _Abstraction from VS complexities_ : you will never again need to worry about QueryStatus, loading logic, command creation, etc. GAT takes care of all that for you. You just tell it where you want things to appear, and when. That's it. It will take care of hiding commands when they are not relevant, it will add tasks to the Task List, remove them when necessary, etc. Your core development task as the guidance package author is to create _Actions_ that will be executed when the data (or argument) gathering phase is done (the Wizard). Just like the UI components mentioned above, GAT encourages a development style where actions (very simple classes with input/output properties and Execute/Undo methods) are small and reusable, and are chained to perform more complex tasks. These will also develop into libraries that you will start reusing more and more, further reducing the cost of creating integrated guidance in VS. Here at p&p we're already doing that, and the results are amazing.  
  

  3. _Integration with VS or code templates the "right" way_ : one way of significatly increasing developer productivity is by providing templates or starting points for different development tasks, such as starting a new "my-company-standard-project-type", creating a new "business-entity" class, and so on. But with VS templates alone, you have several limitations:  

     * Control over availability depending on context: you cannot control where the templates can be used. If your company uses the "Data Access Component" template for your data layer, you don't want your devs using that template on the WinForms/UI project. 
     * Collection of argument for use by template: by default, you can only collect the item/project name from the user, via the Add New dialog. This is clearly insufficient for all but the most trivial cases (where a code snippet would perform almost as well, if not better). Consider a project that needs a database connection string, a project name, default namespace, and so on.   

     * Creation of more complex code templates with dynamic code generation: VS templates only allow for very simple code templates that simply perform parameter replacement on the data passed by the Add New dialog. Even if you solved the problem and could get to pass more arguments/parameters to the template unfolding process, you still have just that, replacement of tokens in the files' content with the values of the arguments (such as public class $safeitemname$). But what happens when you need to generate more complex code depending on the values of the arguments, iterate them to generate repeated sections (i.e. one field for each received value in a list of database table columns)? 

GAT solves these problems with the following features: 

     * Automatic filtering of templates according to the context. Templates will only appear where you say they apply to. 
     * Integration of argument gathering (wizard) with the Templates, so that selecting a template can result in a full-blown wizard coming up and guiding the user though several steps to complete the "setup" for the template to unfold. But this integration goes further than just collecting arguments, it's a close integration that also allows execution of the full set of actions that your so-called Recipes defines. So unfolding a template can result in much more than just a bunch of files being copied from some place into your application. All kinds of complex things can also happen, only limited by your requirements and imagination (i.e. registering the project with a central SCC repository like Team System, start tracking of working time with a project management server, setup of test and staging server environments for the project, etc.). The full power of .NET is at your hands and you can do pretty much whatever you need at this point. 
     * Dynamic templates through the Text Templating Tranformations Toolkit (T4), an engine designed along the lines of templating engines like NVelocity, CodeSmith or the defunct GenX, to aid in generating code (or other text-based outputs such as XML, HTML, SQL scripts, etc.) from text templates that make use of the input arguments collected form the user or the environment (through so-called Value Providers).

Right now these are the ones that I consider the more important reasons to move to GAT. There are a lot of other features that I love, and probably as you get used to the above, you will find that some others turn out to be even better arguments for moving forward. But for now, I think you can get an idea of what you could have and you're probably missing ;)  

posted on Thursday, July 28, 2005 2:33 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/366.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/07/28/GATAdvantages.aspx#404 "permalink") re: Add-ins are *dead*. Enter Guidance Automation Toolkit (and who you should blame ;)) @ Wednesday, November 30, 2005 2:15 AM

How does this sit with legacy platforms?   
  
We have to support customers using everything from VS6 through to VS2005, and while we wouldn't expect you to support VS6 anymore, VS2002 and VS2003 are a different case entirely.   
  
Supporting different codebases for each product is a luxury we just *can't* afford, so unless you plan to support legacy platforms I'm afraid GAT is going to be an impractical technology for us until the earlier versions have died out (2012?).   
  
Will you be making this toolkit available in a form which supports these platforms? If not, how do you intend to deal with this issue? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anna-Jayne Metcalfe](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.riverblade.co.uk "Anonymous")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/07/28/GATAdvantages.aspx#406 "permalink") re: Add-ins are *dead*. Enter Guidance Automation Toolkit (and who you should blame ;)) @ Thursday, December 01, 2005 7:15 AM

How does this sit with legacy platforms?   
  
We have to support customers using everything from VS6 through to VS2005, and while we wouldn't expect you to support VS6 anymore, VS2002 and VS2003 are a different case entirely.   
  
Supporting different codebases for each product is a luxury we just *can't* afford, so unless you plan to support legacy platforms I'm afraid GAT is going to be an impractical technology for us until the earlier versions have died out (2012?).   
  
Will you be making this toolkit available in a form which supports these platforms? If not, how do you intend to deal with this issue? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anna-Jayne Metcalfe](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.riverblade.co.uk "Anonymous")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/07/28/GATAdvantages.aspx#533 "permalink") re: Add-ins are *dead*. Enter Guidance Automation Toolkit (and who you should blame ;)) @ Thursday, June 01, 2006 7:44 AM

Versions prior to VS2005 will not be supported. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Daniel Cazzulino](http://clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "Anonymous")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/07/28/GATAdvantages.aspx#577 "permalink") Enter Guidance Automation Toolkit (and who you should blame ;)) @ Wednesday, June 28, 2006 10:19 AM

Note: this entry has moved.Probably you head about GAT, the Guidance Automation Toolkit. The reason p&amp;amp;p... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2005/07/28/GATAdvantages.aspx "TrackBack")

  

[![](/web/20060827015457im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
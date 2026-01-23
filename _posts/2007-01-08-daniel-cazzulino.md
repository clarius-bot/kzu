---
layout: post
title: "Daniel Cazzulino"
date: 2007-01-08 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Building Software Factories Today

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2588'\))| March 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2647'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 1| 2| 3  
4| 5| 6| 7| [8](http://www.clariusconsulting.net/blogs/kzu/archive/2007/1/8.aspx "1 Post")| 9| [10](http://www.clariusconsulting.net/blogs/kzu/archive/2007/1/10.aspx "1 Post")  
[11](http://www.clariusconsulting.net/blogs/kzu/archive/2007/1/11.aspx "1 Post")| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| 22| 23| 24  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070323152806im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Building Software Factories Today 

Software factories is an elusive concept nowadays. In this article, I will try to help you understand which technologies can be used **today** to build production-quality factories and the reasons for the perceived inconsistency in the tools and the vision on Microsoft's part.

None of what follows is speculation: I've been a main developer on one of the two core technologies that realize today' software factories (patterns & practices Guidance Automation Toolkit or GAT), and as such I've been in close contact with the teams and architects building the technologies I will explain here (including [Jack Greenfield](http://blogs.msdn.com/jackgr/), [Wojtek Kozaczynski](http://blogs.msdn.com/wojtek/), [Mauro Regio](http://blogs.msdn.com/mauroregio/) and others). Also, my company is a leader in software factory development, providing most of the people that build the factories coming out of the most active practitioner in the area today: the Microsoft patterns & practices group. We also have several customers around the world that we helped reap the amazing productivity boost that today's factory tools can bring. 

First and foremost: this article is NOT about the grand vision (still underway, rest assured, but nevertheless in the realm of the future) outlined in The Book: [Software Factories: Assembling Applications with Patterns, Models, Frameworks, and Tools](http://www.amazon.com/dp/0471202843?tag=clarius-20) by Jack Greenfield, Keith Short et all. I will talk about technologies that are ready for production **today**. This also means that the strict concept itself of a SF outlined in the book needs to relaxed for what's currently possible with the available tools. You can think of today's factories as infants that will grow with features as times goes by and the end-to-end SF vision becomes a reality. That doesn't prevent the "infant" from giving you a big boost in terms of productivity and software quality.

You can build SF today by using a combination of the following two tools:

  * [DSL Tools](http://msdn2.microsoft.com/en-us/vstudio/aa718368.aspx): or Domain Specific Language Tools. This is a toolkit for creating VS-integrated graphical notations for a given model that you basically make up. It allows you to construct a custom-tailored designer for a model for your problem domain.
  * [GAT/GAX](http://msdn2.microsoft.com/en-us/teamsystem/aa718948.aspx): or Guidance Automation Toolkit/Extensions. This is a toolkit for extending VS with solution, project and item templates, code snippets and so-called recipes (or developer use cases) exposed as context menus within VS, that guide the developer in completing a complex task.

The problem is that integrating the two is not a trivial task. Why you may ask? Aren't they both coming from Microsoft? And how does GAT/GAX fit in the SF vision? After all it's not even mentioned in The Book!

Glad you asked ;). In order to understand this "mess", and figure out how to make it work for you, you need to understand a little bit of the background behind the two technologies. The DSL Tools is basically the first step in the road to realizing the full SF vision outlined in The Book. Hence, if you try to build a real-world factory just using DSLs, you will find it fairly incomplete and not supporting typical scenarios such as providing an initial solution structure where you will put your DSLs, etc. The missing features, though, are most probably those that will come (or become unnecessary) as the full vision is implemented. In the meantime, it feels lacking.

On the other hand, Microsoft patterns & practices (p&p) is NOT about building a compelling but somewhat distant feature, but about solving customers' problems **today**. p&p follows a process called "Customer Connected Engineering", which means customers get to influence what we do. Delivering guidance on how to best use the platform has been p&p traditional focus, but as guidance became more and more complex, thicker books and more complex libraries (think CAB and EntLib) just didn't cut it anymore. Customers were not getting the guidance in an easy to consume way. Hence, we set out to find a way to bring the guidance into Visual Studio, in a way that was easy to author (not only for p&p but for other companies delivering guidance internally) and contextual. The readily available VS extensibility mechanisms (add-ins and VSIP packages) did not satisfy either requirement, so we built our own framework on top of VSIP to allow for easier extensibility. And GAX was born. As the name implies, it's a mechanism for automating the guidance that you would have to otherwise perform manually by following a book's instructions. 

You may notice that p&p software factories do not contain DSLs. This is in part because the goals of p&p SF are somewhat different than The Book SF. Their main purpose is to guide the developer through the best practices for implementing a given solution. In the end, it's the developer himself who implements the solution. It just so happens that he does so much faster and in a predictable way because he uses automated guidance within VS that generates code, unfolds boilerplate projects and solutions, provides code snippets, etc.

Given the different origins and goals of the two technologies, it may seem that they are hopelessly irreconcilable. Fortunately, that's not necessarily the case, and there are many ways in which they can be integrated. My partner [Victor Garcia Aprea](http://clariusconsulting.net/vga) and [Mauro Regio](http://blogs.msdn.com/mauroregio/) have published [an article on MSDN about integration scenarios](http://msdn2.microsoft.com/en-us/library/aa905334.aspx "Guidance Automation Toolkit and Domain-Specific Language Tools for Visual Studio 2005: Integration Scenarios") that include integrating the two.

A number of integration points are particularly critical:

  * An initial solution structure is generally required: this can be done with GAX.
  * Typically at a specific location in the solution, a domain model/designer could be added to design some area of the application (i.e. a business entities domain model, that generates business entities + data transfer objects + data access layer code + SQL files with stored procs for the DB). This needs to be done with a combination of DSL and GAX if you want the DSL to only be available at a specific location in the solution. (remember, GAX is about context)
  * With the DSL in place, you may want to generate multiple code files (as in the case of the business entities model I mentioned above), maybe even in different projects, and maybe you even need to generate the projects themselves. Again, DSL tools alone is not enough. By default, it will do two things that are pretty bad for a real-world factory:
    1. The code (a [T4 template](https://blogs.msdn.com/garethj/archive/2005/04/07/marchtexttemplatingsyntax.aspx)) that transforms the domain model in a designer into actual code for your project is expected to live in the same project as the domain model file. You are given a custom tool that runs the transformation, and a solution explorer toolbar icon to run all the transformations in the solution/project ("Transform All Templates"). What kind of guidance are you giving your developers if they can modify it at will just by modifying the T4 template that generates their code? It's more like giving them an example that they can tweak, and typically you don't want your developers modifying the templates for code generation that your architects together with your senior devs have created to ensure quality code. 
    2. Each T4 template results in exactly one big file with the output of running the codegen against the domain model. If your model designs business entities, you will end up with a huge file with all the entities in the model. Generally not a good idea, and certainly goes against the typical .NET coding practice of using one file per class. 

> And it will not do the other two things that you need: generate new projects, and generate files that target multiple projects. You can supplement the DSL with GAX in order to achieve all of this. Achieving the above two goals requires deep understanding of how both technologies work at a very granular level, though, but it's definitely possible (more on this later).

  * You may want to launch recipes/execute actions from specific shapes in the domain model diagram (i.e. "Configure Security for Entity" or something like that, maybe even regenerate code for a specific model entity and not all of them). You can [hook GAX](http://www.clariusconsulting.net/blogs/pga/archive/2006/10/09/4300.aspx "Integrating DSL RTM and GAX part one") recipes to the [context menus](http://www.clariusconsulting.net/blogs/pga/archive/2006/10/09/4302.aspx "Integrating DSL RTM and GAX part two") on [DSL diagrams pretty easily](http://www.clariusconsulting.net/blogs/pga/archive/2006/10/18/4740.aspx "Integrating DSL RTM and GAX part three"), and with some more work you can make it contextual enough to provide very granular visibility (i.e. only model entities that have property Foo = true). 

Of course, the integration is not as seamless as it could have been. But I hope I shed some light on the current situation by sharing the background and how the two tools came to be. Moving forward, you can expect the [experience to become much better](http://blogs.msdn.com/wojtek/archive/2006/08/06/690319.aspx "Wojtek's comment that the two teams \(p&p and DSL/Software Factories\) have joined forces"), as the scenarios that led to GAT/GAX are integrated into the SF toolkit. 

As you might have guessed, we ([Clarius](http://www.clariusconsulting.net/ "Clarius Consulting home page")) have gone over each and every hop in this integration that you can possibly imagine. We have recently released a CTP of our [Software Factories Toolkit](http://softwarefactoriestoolkit.net/), which helps integrate the two technologies, and which you can download for free. 

posted on Monday, January 08, 2007 10:09 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070323152806im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
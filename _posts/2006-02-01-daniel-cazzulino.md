---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-01 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Guidance Automation in the development process

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2006/2/1.aspx "1 Post")| 2| 3| 4  
5| 6| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2006/2/9.aspx "1 Post")| 10| 11  
[12](http://clariusconsulting.net/blogs/kzu/archive/2006/2/12.aspx "1 Post")| 13| 14| 15| 16| 17| 18  
19| 20| 21| 22| 23| 24| 25  
26| 27| 28| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060220124701im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Guidance Automation in the development process 

What follows are some thoughts regarding the authoring of guidance that we have learned during practical experience. The following applies to both [DSL](http://msdn.microsoft.com/vstudio/DSLTools/ "DSL tools homepage") and [GAX](http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/default.aspx "GuidanceAutomation homepage") toolkits.  

  

Developing guidance should be an iterative process, and we're still exploring it and how it fits in the overall development process. Intuitively and based on previous experience building several guidance packages, I'd say the process is more or less as follows: 

  

### Phase 1: Define End Product

1\. Use intensive TDD and short iteration cycles to develop the end "product" you'd like to guidance-enable (i.e. code, application structure and architecture, etc.)  
2\. During 1), you will end up with a process that takes you from a scenario/use case to an implementation using the architecture/structure you designed (ideally via TDD) 

### Phase 2: Define Guidance Process and Flow

3\. From that process, figure out which are the variability points, where the user should be involved in decisions that affect what the code/solution looks like, as well as the dependencies between them (user does A and only then can do B)  
4\. Understand and clarify the roles, personas, concerns and use cases the guidance should express  
5\. Based on the previous two findings, define the launch points for those user interactions (recipe/template/dsl launching points)  
6\. Mock-up the recipes and UI required for the entire package, and document the steps and input required for each  
7\. Analyze the mocks, go through them, and evaluate whether the input information, the process flow, and the launch points follow a natural progression that is likely to be intuitive enough for users. Also, think of potential missing pieces of input that may be needed to get to the end result from there 

### Phase 3: Implement Guidance

8\. Finally, add the actions to the recipes so that they generate the code

a) Optionally, the recipes may generate tests that exercise the features in the end result (code/application). I say this is optional, because this is a process that should have been previously exercised and sufficiently proven during steps 1 and 2. Generating from the same recipe, code and its tests is not TDD at all, and if steps 1 and 2 are well done, may be a waste of time, as you already know that the code you will emit will adhere to the architecture and design principles outlined there.  

9\. Test the generated code and the whole process. Once this is OK (or if you have spare time in the meantime), do the next step.  
10\. Improve the UI by adding type converters and UI editors

  
Unless you do Phase 1, the optional 8.a step becomes more important, but I think it is far worse as a testing approach, and will never be as comprehensive as a well done Phase 1.  
Phase 1 and 3 are the most likely to consume the most time. I believe in the majority of cases (unless you already know very well you want the guidance to do up-front, or the scope well defined and not too big), the former will be longer than the latter. However, depending on the nature of the tooling part, and the complexity/lack of documentation/unforeseen bugs-issues with VS/integration with Beta-quality products/etc., Phase 3 may become a big part of the work too (we faced this a number of times, where something was supposed to take a few hours and we ended up spending at least a couple days chasing a bug or erratic behavior in VS). Any kind of integration with VS is bound to be unpredictable to a certain extent in that front for the foreseeable future, I'm afraid :(

What raises considerable the bar for phase 3 is if you introduce a meta-guidance in the picture (i.e. you want a guidance package to help people build guidance packages in a certain area).

posted on Wednesday, February 01, 2006 10:25 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/454.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/02/01/GuidanceProcess.aspx#455 "permalink") Interesting Finds @ Thursday, February 02, 2006 4:25 AM

[](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://jasonhaley.com/blog/archive/2006/02/02/136178.aspx "TrackBack")

  

![](/web/20060220124701im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
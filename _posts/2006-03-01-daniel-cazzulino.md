---
layout: post
title: "Daniel Cazzulino"
date: 2006-03-01 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : How to add a VS assembly reference without hardcoding its path

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| [1](http://clariusconsulting.net/blogs/kzu/archive/2006/3/1.aspx "1 Post")| 2| 3| 4| 5| 6  
7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2006/3/9.aspx "1 Post")| 10| 11| 12| 13  
14| 15| 16| 17| 18| 19| 20  
21| 22| 23| 24| 25| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060515091544im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## How to add a VS assembly reference without hardcoding its path 

Sometimes, you want to add a reference to an assembly provided by VS (that is, something inside the `%ProgramFiles%\Microsoft VisualStudio 8.0` folder) that doesn't show up in the Add Reference dialog (there are lots of very interesting stuff you can use that fall under these category, such as Microsoft.Data.ConnectionUI which I used in the [GAX](http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat "Guidance Automation Toolkit homepage") [TechEd HoL](http://guidanceautomation.net/cs/library/View.aspx?tab=3&Id=40 "Get the GAT Hands-on-Lab we did for TechEd 2005") and allows you to create an "Add Data Connection" clone complete with support for .NET providers, connection string builders, test connection, etc.). 

The trick is to browse for the reference as usual using the Add Reference dialog, save the project and open it in notepad (or your favorite [XML editor](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnxmlnet/html/xmltools.asp "Visual Studio 2005 XML tools overview")). Look for your reference, and replace the hardcoded path to the IDE folder with the `$(DevEnvDir)` macro variable, like so:
    
    
    <Reference Include="Microsoft.Data.ConnectionUI, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a, processorArchitecture=MSIL">  
      <HintPath>**$(DevEnvDir)** Microsoft.Data.ConnectionUI.dll</HintPath>  
      <SpecificVersion>False</SpecificVersion>  
      <Private>False</Private>  
    </Reference>

The `$(DevEnvDir)` variable points to the %ProgramFiles%\Microsoft VisualStudio 8.0\Common7\IDE folder, but you can always use relative path “movements” to go up and around other folders under the root VS install path.

Yes, I know… VS should do that automatically… Go [vote the bug so that we have it fixed in Orcas](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?feedbackid=FDBK46646) ;-)

**Update:** I’ve just found that you can also use $(VsInstallDir), which points to %ProgramFiles%\Microsoft VisualStudio 8.0

posted on Wednesday, March 01, 2006 9:47 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/474.aspx) :: 

  

[![](/web/20060515091544im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
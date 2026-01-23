---
layout: post
title: "Daniel Cazzulino"
date: 2006-07-26 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : How to setup continous integration with team foundation build

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))| August 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2435'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| [5](http://clariusconsulting.net/blogs/kzu/archive/2006/7/5.aspx "1 Post")  
[6](http://clariusconsulting.net/blogs/kzu/archive/2006/7/6.aspx "1 Post")| 7| 8| 9| 10| 11| 12  
13| 14| 15| 16| 17| 18| 19  
20| 21| 22| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2006/7/26.aspx "1 Post")  
27| 28| 29| 30| 31| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060821191150im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## How to setup continous integration with team foundation build 

First, I followed the instructions and used the code from the [Vertigo Software guys](http://blogs.vertigosoftware.com/teamsystem/archive/2006/07/14/3075.aspx "How to setup TFS continous integration"). 

Next, the issue is that to configure a new project for continuous integration, you have to modify manually the web.config of the CI service as follows:

< appSettings >

< add key = " 1 " value = " TeamProjectName=MyProject;BuildType=MyBuildType " />

</ appSettings >

Yuck!   
What I wanted was a UI that would automatically populate dropdowns with the available projects in TFS, as well as their configured Build Types, which is the information you need to setup a new continuous integration build using this solution. Here's the UI I built:

![a screenshot of the CI setup page](/web/20060821191150im_/http://clariusconsulting.net/ImageGallery/kzu/TFS_CI2.png)

To set it up, you just need to [unzip these files](http://clariusconsulting.net/kzu/TFS_CI.zip "Download TFS UI") to the same location of the CI service (by default C:\Program Files\Microsoft Visual Studio 2005 Team Foundation Server\Web Services\CI), and add an entry in the web.config with the Url of your TFS:

< appSettings >

< add key = " ServerUrl " value = " http://tfs:8080 " />

</ appSettings >

The web.config also contains the references that are needed to connect to the TFS using the client APIs:

< compilation debug = " true " >

< assemblies >

< add assembly = " System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089 " />

< add assembly = " Microsoft.TeamFoundation, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A " />

< add assembly = " Microsoft.TeamFoundation.Build.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A " />

< add assembly = " Microsoft.TeamFoundation.Client, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A " />

< add assembly = " Microsoft.TeamFoundation.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A " />

< add assembly = " Microsoft.TeamFoundation.VersionControl.Client, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A " />

< add assembly = " Microsoft.TeamFoundation.VersionControl.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A " />

</ assemblies >

</ compilation >

Connecting to the server is actually pretty easy:

TeamFoundationServer server = TeamFoundationServerFactory.GetServer(ConfigurationManager.AppSettings["ServerUrl"]);

server.Authenticate();

Then, to retrieve the source control projects in TFS, you request the VersionControlServer service from the server instance:

VersionControlServer vcs = (VersionControlServer)server.GetService(typeof(VersionControlServer));

Retrieving the configured build types can be done performing a query to retrieve items from the well-known path they are stored on the server, after getting an instance of the owning project:

VersionControlServer vcs = GetSCC();

TeamProject project = vcs.GetTeamProject(projectList.SelectedValue);

ItemSet items = vcs.GetItems("$/" \+ project.Name + "/TeamBuildTypes/*");

List < string > buildTypes =  new List < string >(items.Items.Length);

foreach (Item item in items.Items)

{

buildTypes.Add(item.ServerItem.Replace(items.QueryPath, "").Substring(1));

}

Note that I'm removing the query path from the ServerItem property, as it contains the full server-side path to it. I must say that even without looking at the documentation, 10' of Google search, and [Reflector](http://www.aisto.com/roeder/dotnet/ "Lutz Roeder Reflector") was all I needed to get it done. A fairly intuitive API in general.

Again, here's the [link to the download](http://clariusconsulting.net/kzu/TFS_CI.zip "Download TFS UI"). Enjoy!

posted on Wednesday, July 26, 2006 9:14 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/628.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/07/26/TFS_CI.aspx#629 "permalink") How to setup continous integration with team foundation build @ Wednesday, July 26, 2006 10:04 AM

Note: this entry has moved.First, I followed the instructions and used the code from the Vertigo Software [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2006/07/26/How-to-setup-continous-integration-with-team-foundation-build.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/07/26/TFS_CI.aspx#630 "permalink") How to setup continous integration with team foundation build @ Wednesday, July 26, 2006 10:04 AM

Note: this entry has moved.First, I followed the instructions and used the code from the Vertigo Software [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2006/07/26/How-to-setup-continous-integration-with-team-foundation-build.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/07/26/TFS_CI.aspx#631 "permalink") How to setup continous integration with team foundation build @ Wednesday, July 26, 2006 10:04 AM

Note: this entry has moved.First, I followed the instructions and used the code from the Vertigo Software [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2006/07/26/TFS_5F00_CI.aspx "TrackBack")

  

[![](/web/20060821191150im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
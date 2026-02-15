---
layout: post
title: How to setup continous integration with team foundation build
date: 2006-07-26 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/TFS_5F00_CI
tags:
- .NET

---

First, I followed the instructions and used the code from the [Vertigo Software guys](<http://blogs.vertigosoftware.com/teamsystem/archive/2006/07/14/3075.aspx> "How to setup TFS continous integration"). 

Next, the issue is that to configure a new project for continuous integration, you have to modify manually the web.config of the CI service as follows:

<  
appSettings  
>

<  
add  
  
  
key  
=  
“  
1  
“  
  
  
value  
=  
“  
TeamProjectName=MyProject;BuildType=MyBuildType  
“  
/>

</  
appSettings  
>

Yuck!   
What I wanted was a UI that would automatically populate dropdowns with the available projects in TFS, as well as their configured Build Types, which is the information you need to setup a new continuous integration build using this solution. Here’s the UI I built:

![a screenshot of the CI setup page](http://www.clariusconsulting.net/ImageGallery/kzu/TFS_CI2.png)

To set it up, you just need to [unzip these files](<http://www.clariusconsulting.net/kzu/TFS_CI.zip> "Download TFS UI") to the same location of the CI service (by default C:\Program Files\Microsoft Visual Studio 2005 Team Foundation Server\Web Services\CI), and add an entry in the web.config with the Url of your TFS:

<  
appSettings  
>

<  
add  
  
  
key  
=  
“  
ServerUrl  
“  
  
  
value  
=  
“  
http://tfs:8080  
“  
/>

</  
appSettings  
>

The web.config also contains the references that are needed to connect to the TFS using the client APIs:

<  
compilation  
  
  
debug  
=  
“  
true  
“  
>

<  
assemblies  
>

<  
add  
  
  
assembly  
=  
“  
System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089  
“  
/>

<  
add  
  
  
assembly  
=  
“  
Microsoft.TeamFoundation, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A  
“  
/>

<  
add  
  
  
assembly  
=  
“  
Microsoft.TeamFoundation.Build.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A  
“  
/>

<  
add  
  
  
assembly  
=  
“  
Microsoft.TeamFoundation.Client, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A  
“  
/>

<  
add  
  
  
assembly  
=  
“  
Microsoft.TeamFoundation.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A  
“  
/>

<  
add  
  
  
assembly  
=  
“  
Microsoft.TeamFoundation.VersionControl.Client, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A  
“  
/>

<  
add  
  
  
assembly  
=  
“  
Microsoft.TeamFoundation.VersionControl.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A  
“  
/>

</  
assemblies  
>

</  
compilation  
>

Connecting to the server is actually pretty easy:

TeamFoundationServer server = TeamFoundationServerFactory.GetServer(ConfigurationManager.AppSettings["ServerUrl"]);

server.Authenticate();

Then, to retrieve the source control projects in TFS, you request the VersionControlServer service from the server instance:

VersionControlServer vcs = (VersionControlServer)server.GetService(typeof(VersionControlServer));

Retrieving the configured build types can be done performing a query to retrieve items from the well-known path they are stored on the server, after getting an instance of the owning project:

VersionControlServer vcs = GetSCC();

TeamProject project = vcs.GetTeamProject(projectList.SelectedValue);

ItemSet items = vcs.GetItems(“$/” \+ project.Name + “/TeamBuildTypes/*”);

List  
<  
string  
> buildTypes =   
new  
List  
<  
string  
>(items.Items.Length);

foreach (Item item in items.Items)

{

buildTypes.Add(item.ServerItem.Replace(items.QueryPath, “”).Substring(1));

}

Note that I’m removing the query path from the ServerItem property, as it contains the full server-side path to it. I must say that even without looking at the documentation, 10′ of Google search, and [Reflector](<http://www.aisto.com/roeder/dotnet/> "Lutz Roeder Reflector") was all I needed to get it done. A fairly intuitive API in general.

Again, here’s the [link to the download](<http://www.clariusconsulting.net/kzu/TFS_CI.zip> "Download TFS UI"). Enjoy!

![](http://clariusconsulting.net/aggbug.aspx?PostID=628)

/kzu

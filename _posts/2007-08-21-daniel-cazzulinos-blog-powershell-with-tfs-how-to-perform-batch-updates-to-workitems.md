---
layout: post
title: "Daniel Cazzulino's Blog : PowerShell with TFS: how to perform batch-updates to WorkItems"
date: 2007-08-21 00:00:00 +0000
---

Daniel Cazzulino's Blog : PowerShell with TFS: how to perform batch-updates to WorkItems


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3043'\))| June 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3104'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 29| 30| 31  
1| 2| [3](http://www.clariusconsulting.net/blogs/kzu/archive/2007/8/3.aspx "1 Post")| 4| [5](http://www.clariusconsulting.net/blogs/kzu/archive/2007/8/5.aspx "1 Post")| 6| 7  
8| 9| 10| 11| 12| 13| 14  
15| 16| 17| 18| 19| [20](http://www.clariusconsulting.net/blogs/kzu/archive/2007/8/20.aspx "1 Post")| [21](http://www.clariusconsulting.net/blogs/kzu/archive/2007/8/21.aspx "2 Posts")  
22| 23| [24](http://www.clariusconsulting.net/blogs/kzu/archive/2007/8/24.aspx "2 Posts")| 25| 26| 27| 28  
29| 30| 1| 2| 3| 4| 5  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080614042412im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080614042412im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080614042412im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080614042412im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## PowerShell with TFS: how to perform batch-updates to WorkItems 

In this post, I'll show how you can use Powershell to perform one of the most annoying and (currently impossible) tasks in an iteration planning using TFS: batch update of all non-completed items so that they are moved to the next iteration.

The end result (which I'm using very effectively weekly :)) will be to be able to issue the following commands:
    
    
    PS C:\> $tfs = Connect-Tfs tfs  
    PS C:\> $tfs.WorkItems.FindAll("[System.TeamProject] = 'MyProject' and [System.State] != 'Closed' and [System.IterationPath] = 'MyProject\Iteration 1'") | %{ $_.Open; $_.Fields["System.IterationPath"].Value = "MyProject\Iteration 2"; $_.Save(); write-host Updated $_.Title; } | out-null

and have all work items in "MyProject" from iteration 1 that haven't been closed, moved to iteration 2.

This even works with [CodePlex](http://www.codeplex.com/)-hosted projects :)

So, the first thing is to get connected to TFS. For this, I'm using the Microsoft.TeamFoundation.Client.dll API. The only [farily undocumented](http://msdn2.microsoft.com/en-us/library/microsoft.teamfoundation.client.uicredentialsprovider%28VS.80%29.aspx "useless MSDN documentation") caveat is that you need to pass a [UICredentialsProvider](http://blogs.msdn.com/buckh/archive/2006/03/17/credentialprovider.aspx) when connecting:
    
    
    				using System;
    using System.Collections.Generic;
    using System.Net;
    using System.Text;
    using System.Management.Automation;
    using Microsoft.TeamFoundation.Client;
    
    namespace Clarius.PowerShell.TeamFoundation
    {
        [Cmdlet(VerbsCommunications.Connect, "Tfs")]
        publicclassConnectCmdlet : Cmdlet
        {
            privatestring server;
    
            [Parameter(Mandatory = true, Position=0, HelpMessageResourceId="Parameter_ServerName")]
            publicstring Server
            {    
                get { return server; }
                set { server = value; }
            }
    
            protectedoverridevoid ProcessRecord()
            {
                TeamFoundationServer tfs = newTeamFoundationServer(server, newUICredentialsProvider());
                tfs.EnsureAuthenticated();
    
                WriteObject(tfs);
                base.ProcessRecord();
            }
        }
    }
    

With that in place, and [after registering your snap-in](http://www.clariusconsulting.net/blogs/pga/archive/2006/08/08/643.aspx), you can issue the first command and get a full [TeamFoundationServer](http://msdn2.microsoft.com/en-us/library/microsoft.teamfoundation.client.teamfoundationserver%28VS.80%29.aspx) object back. Now, that object's API is not very script-friendly. You have to use [GetService](http://msdn2.microsoft.com/en-us/library/microsoft.teamfoundation.client.teamfoundationserver.getservice%28VS.80%29.aspx) to achieve anything. In order to expose the WorkItems service in a script-friendly way, you can [leverage PowerShell's](http://blogs.msdn.com/powershell/archive/2006/06/24/644987.aspx) type [extension mechanism](http://msdn2.microsoft.com/en-us/library/ms714419.aspx):
    
    
    				<?
    				xml
    				
    				
    				version
    				="1.0"encoding="utf-8" ?>
    <Types>
      <Type>
         <Name>Microsoft.TeamFoundation.Client.TeamFoundationServer</Name>
         <Members>
            <ScriptProperty>
              <Name>WorkItems</Name>
              <GetScriptBlock>
                 [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Client") | out-null
                 [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.WorkItemTracking.Client") | out-null
                 [Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore]$this.GetService([type]"Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore")
              </GetScriptBlock>
            </ScriptProperty>
         </Members>
      </Type>
    </Types>

[ ](http://11011.net/software/vspaste)

With that extension in place, we can now access the service just using $tfs.WorkItems. Note that I'm loading the necessary assemblies before invoking the APIs, so that the relevant types are available to PS. But of course, the really interesting stuff is getting the nice FindAll() .NET 2.0-ish member working:

PS C:\> $tfs.WorkItems.FindAll("[System.TeamProject] = 'MyProject'") 

This time it's a type extension on the WorkItemStore type:
    
    
    				  <
    				Type
    				>
         <
    				Name
    				>Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore</Name>
         <Members>
            <ScriptMethod>
              <Name>FindAll</Name>
              <Script>
                 $private:fields = @();
                 foreach ($field in $this.FieldDefinitions)
                 {
                 $fields += ("[" + $field.Name + "]");
                 }
                 $private:all = [string]::Join(",", $fields);
    
                 if ($args[0] -is [ScriptBlock])
                 {
                 $private:predicate = $args[0];
                 $private:result = $this.Query("SELECT " + $all + " FROM WorkItems");
                 foreach($item in $result)
                 {
                 if ([bool](&amp;$predicate $item))
                 {
                 write-output $item;
                 }
                 }
                 }
                 elseif ($args[0] -is [string])
                 {
                 $this.Query("SELECT " + $all + " FROM WorkItems WHERE " + $args[0]);
                 }
              </Script>
            </ScriptMethod>
         </Members>
      </Type>

[ ](http://11011.net/software/vspaste)

Note that because of a pretty [annoying "bug" (will be fixed in Orcas + 1, aka Rosario)](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=232220), you can't actually issue a SELECT * query using the [WorkItem Query Language](http://msdn2.microsoft.com/en-us/library/bb140399%28VS.80%29.aspx) (WIQL) and instead you need to explicitly pass all fields you're interested in retrieving. Because you may want to later update any of the fields, I'm just building the entire list of all fields and passing that to the service. 

Note that you can either pass a predicate to be evaluated for each item, or a string with the WHERE clause, which is what I did at the beginning. 

With all that in place, all that's left is to pipe the items resulting from the query and perform any operation you like on them!

Enjoy.

posted on Tuesday, August 21, 2007 4:38 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/30032.aspx) :: 

  

[![](/web/20080614042412im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
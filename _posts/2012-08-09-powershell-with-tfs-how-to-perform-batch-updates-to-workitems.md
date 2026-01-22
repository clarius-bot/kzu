---
layout: post
title: "PowerShell with TFS: how to perform batch-updates to WorkItems"
date: 2012-08-09 00:00:00 +0000
---

##  [PowerShell with TFS: how to perform batch-updates to WorkItems](<http://blogs.clariusconsulting.net/kzu/powershell-with-tfs-how-to-perform-batch-updates-to-workitems/> "PowerShell with TFS: how to perform batch-updates to WorkItems")

August 21, 2007 11:38 pm

In this post, I’ll show how you can use Powershell to perform one of the most annoying and (currently impossible) tasks in an iteration planning using TFS: batch update of all non-completed items so that they are moved to the next iteration.

The end result (which I’m using very effectively weekly ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) ) will be to be able to issue the following commands:
    
    
    PS C:\> $tfs = Connect-Tfs tfsPS C:\> $tfs.WorkItems.FindAll("[System.TeamProject] = 'MyProject' and [System.State] != 'Closed' and [System.IterationPath] = 'MyProject\Iteration 1'") | %{ $_.Open; $_.Fields["System.IterationPath"].Value = "MyProject\Iteration 2"; $_.Save(); write-host Updated $_.Title; } | out-null

and have all work items in “MyProject” from iteration 1 that haven’t been closed, moved to iteration 2.

This even works with [CodePlex](<http://www.codeplex.com/>)-hosted projects ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

So, the first thing is to get connected to TFS. For this, I’m using the Microsoft.TeamFoundation.Client.dll API. The only [farily undocumented](<http://msdn2.microsoft.com/en-us/library/microsoft.teamfoundation.client.uicredentialsprovider%28VS.80%29.aspx> "useless MSDN documentation") caveat is that you need to pass a [UICredentialsProvider](<http://blogs.msdn.com/buckh/archive/2006/03/17/credentialprovider.aspx>) when connecting:
    
    
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
    

With that in place, and [after registering your snap-in](<http://www.clariusconsulting.net/blogs/pga/archive/2006/08/08/643.aspx>), you can issue the first command and get a full [TeamFoundationServer](<http://msdn2.microsoft.com/en-us/library/microsoft.teamfoundation.client.teamfoundationserver%28VS.80%29.aspx>) object back. Now, that object’s API is not very script-friendly. You have to use [GetService](<http://msdn2.microsoft.com/en-us/library/microsoft.teamfoundation.client.teamfoundationserver.getservice%28VS.80%29.aspx>) to achieve anything. In order to expose the WorkItems service in a script-friendly way, you can [leverage PowerShell’s](<http://blogs.msdn.com/powershell/archive/2006/06/24/644987.aspx>) type [extension mechanism](<http://msdn2.microsoft.com/en-us/library/ms714419.aspx>):
    
    
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

[  
](<http://11011.net/software/vspaste>)

With that extension in place, we can now access the service just using $tfs.WorkItems. Note that I’m loading the necessary assemblies before invoking the APIs, so that the relevant types are available to PS. But of course, the really interesting stuff is getting the nice FindAll() .NET 2.0-ish member working:

PS C:\> $tfs.WorkItems.FindAll("[System.TeamProject] = 'MyProject'") 

This time it’s a type extension on the WorkItemStore type:
    
    
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

[  
](<http://11011.net/software/vspaste>)

Note that because of a pretty [annoying “bug” (will be fixed in Orcas + 1, aka Rosario)](<https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=232220>), you can’t actually issue a SELECT * query using the [WorkItem Query Language](<http://msdn2.microsoft.com/en-us/library/bb140399%28VS.80%29.aspx>) (WIQL) and instead you need to explicitly pass all fields you’re interested in retrieving. Because you may want to later update any of the fields, I’m just building the entire list of all fields and passing that to the service. 

Note that you can either pass a predicate to be evaluated for each item, or a string with the WHERE clause, which is what I did at the beginning. 

With all that in place, all that’s left is to pipe the items resulting from the query and perform any operation you like on them!

Enjoy.

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=30032)

Posted by kzu
---
layout: post
title: "Daniel Cazzulino's Blog : PowerShell with TFS: how to perform batch-updates to WorkItems"
date: 2007-08-21 00:00:00 +0000
---

## PowerShell with TFS: how to perform batch-updates to WorkItems 

In this post, I'll show how you can use Powershell to perform one of the most annoying and (currently impossible) tasks in an iteration planning using TFS: batch update of all non-completed items so that they are moved to the next iteration.

The end result (which I'm using very effectively weekly :)) will be to be able to issue the following commands:
    
    
    PS C:\> $tfs = Connect-Tfs tfs  
    PS C:\> $tfs.WorkItems.FindAll("[System.TeamProject] = 'MyProject' and [System.State] != 'Closed' and [System.IterationPath] = 'MyProject\Iteration 1'")                  [Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore]$this.GetService([type]"Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore")
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

/kzu

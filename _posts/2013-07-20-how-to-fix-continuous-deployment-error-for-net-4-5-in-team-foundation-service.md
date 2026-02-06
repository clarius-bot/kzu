---
layout: post
title: "How to fix continuous deployment error for .NET 4.5 in Team Foundation Service"
date: 2013-07-20 00:00:00 +0000
---


If you’re configuring [continuous deployment on Team Foundation Service](<http://www.windowsazure.com/en-us/develop/net/common-tasks/publishing-with-tfs/>) for a .NET 4.5, you may get an error like the following in the build log:
    
    
    Exception Message: The application pool that you are trying to use has the 'managedRuntimeVersion' property set to 'v4.0'. This application requires 'v4.5'.
      Learn more at: http://go.microsoft.com/fwlink/?LinkId=221672#ERROR_APPPOOL_VERSION_MISMATCH. (type DeploymentDetailedException)

I don’t recall exactly where ([may have been here](<http://connect.microsoft.com/VisualStudio/feedback/details/526963/unable-to-correctly-set-managedruntimeversion-in-msdeploy-package>)), but the solution is to simply add the following property to the project file:
    
    
    <IgnoreDeployManagedRuntimeVersion>True</IgnoreDeployManagedRuntimeVersion>

/kzu

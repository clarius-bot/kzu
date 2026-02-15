---
layout: post
title: How to get services from the VS DTE (using System.IServiceProvider)
date: 2006-01-07 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/GetServiceFromDTE
tags:
- .NET
- All Technology

---

## How to get services from the VS DTE (using System.IServiceProvider)

VS is heavily based on a component model and container hierarchy of services (yes, that's most probably whereSystem.ComponentModelcame from...). Even though there's no comprehensive documentation of all services available and from which contexts, every now and then I find the need to ask for services, but all I've got at hand is either aEnvDTE.ProjectItemorProject, or just the DTE. So, how do you use the familiar System.IServiceProvider to ask for services?

```
System.ComponentModel
```

```
EnvDTE.ProjectItem
```

```
Project
```

The trick is to get the latest VS SDK, add a reference toMicrosoft.VisualStudio.OLE.Interop.dllandMicrosoft.VisualStudio.Shell.dlland use the following simple code:

```
Microsoft.VisualStudio.OLE.Interop.dll
```

```
Microsoft.VisualStudio.Shell.dll
```

```
EnvDTE.Project project; // this is what you have at hand somehow. IServiceProvider serviceProvider = new ServiceProvider(project.DTE as    Microsoft.VisualStudio.OLE.Interop.IServiceProvider); DynamicTypeService typeService = (DynamicTypeService)    serviceProvider.GetService(typeof(DynamicTypeService));
```

TheServiceProviderclass in the Shell assembly provides the adapter you need to ask the DTE for services.

```
ServiceProvider
```

posted on Friday, January 06, 2006 9:11 PM
						bykzu

/kzu

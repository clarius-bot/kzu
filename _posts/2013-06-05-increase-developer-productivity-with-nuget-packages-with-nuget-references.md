---
layout: post
title: "Daniel Cazzulino's Blog - Increase developer productivity with NuGet packages with NuGet References"
date: 2013-06-05 00:00:00 +0000
---

##  [Increase developer productivity with NuGet packages with NuGet References](<http://blogs.clariusconsulting.net/kzu/increase-developer-productivity-with-nuget-packages-with-nuget-references/> "Increase developer productivity with NuGet packages with NuGet References")

June 5, 2013 5:35 pm

A typical solution usually has many projects, and many more NuGet packages in use:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image.png)

How do you get a glance of what packages are installed on each project? Typically, you’d just open each of the packages.config XML files, or worse, go to the “Manage NuGet Packages…” dialog:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image1.png)

Which brings up a pretty daunting dialog:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image2.png)

If you wanted to uninstall a particular package, you could alternatively just type in the package manager console, but many developers aren’t as familiar with the available commands, or simply prefer to work in a more visual way. What if you could just expand the packages.config node, find the package you want to uninstall and click a context menu to do so?

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image3.png)

That’s precisely what the NuGet References extension provides. All packages.config nodes in the solution explorer can now be expanded and all installed packages inspected. Not only can you directly update or uninstall the extension right from the solution explorer, but you can also search a given package to see which projects use it and may need updates!

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image4.png)

You can also get information like the version and install path for a particular package by just selecting it and inspecting the properties window:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image5.png)

You can save valuable time by just checking for updates on specific packages, or uninstalling just what you want, right from the solution explorer.

In the future, if there’s enough demand, the extension could even show a sub-menu of Update that lists the last few available versions so that you can upgrade/downgrade quickly to try out how things work out before committing to a specific version. 

You can get a free version of the extension from the [Visual Studio Gallery](<http://visualstudiogallery.msdn.microsoft.com/e8d1fcad-5fa5-4353-ba9c-90f4b6a68154>). This version randomly disables the Uninstall/Update commands to encourage you to purchase the full version via the [DevStore](<http://blog.devstore.com/2013/05/how-to-purchase-extensions-in-devstore.html>), which is also embedded in the free version.

Please report issues or suggestions at the [Issue Tracker](<https://github.com/danielkzu/NuGetReferences/issues>).

Enjoy!

/kzu

---
layout: post
title: "Daniel Cazzulino's Blog : How to create lightweight reusable source code with NuGet"
date: 2010-12-08 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to create lightweight reusable source code with NuGet

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

Source code published in this blog is [public domain](http://en.wikipedia.org/wiki/Public_domain) unless otherwise specified.

[![](https://web.archive.org/web/20101212111242im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20101212111242im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20101212111242im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20101212111242im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20101212111242im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20101212111242im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[Translate this page](http://www.microsofttranslator.com/bv.aspx?a=http%3a%2f%2fwww.clariusconsulting.net%2f)  
Powered by [Microsoft® Translator](http://www.microsofttranslator.com/)

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

## How to create lightweight reusable source code with NuGet 

Sometimes, you just have a reusable helper that you bring in to every project (i.e. an argument validation thingy, or the [static reflection stuff](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/30/49063.aspx), [useful extension methods](http://social.msdn.microsoft.com/forums/en-US/linqprojectgeneral/thread/fe3d441d-1e49-4855-8ae8-60068b3ef741/), and so on). You don't always need them all, they are generally single-file utilities, and having a Common.dll looks overkill or dumb.

Loose source file sharing has always been problematic, though: no packaging and versioning mechanism (unlike an assembly), hard to integrate with source control systems (SVN has external repository mappings, but nothing like that exists in TFS or Mercurial, AFAIK), and so on. I tried [source files reuse before](http://code.google.com/p/netfx/), with somewhat poor results.

In a recent project I wanted to reuse (again) that darn useful [Guard.cs](http://code.google.com/p/moq/source/browse/trunk/Source/Guard.cs) file. But I set to do it differently this time, and see if my "dream" for lightweight loose source file reuse could still be achieved.

Two key technologies enable some pretty cool and robust source file reuse nowadays:

  * [NuGet](http://nuget.codeplex.com/): unless you've been living under a rock, you probably heard all the [big](http://weblogs.asp.net/scottgu/archive/2010/10/06/announcing-nupack-asp-net-mvc-3-beta-and-webmatrix-beta-2.aspx)[names](http://www.hanselman.com/blog/IntroducingNuPackPackageManagementForNETAnotherPieceOfTheWebStack.aspx)[talking](http://haacked.com/archive/2010/10/06/introducing-nupack-package-manager.aspx) about it. I'll save the introductions. But for our particular case, it's the perfect mechanism to deploy simple "content" files to the user's project. When you "install" the loose source file package, you essentially get the file added automatically to the project. When you "uninstall" it, the file gets removed. Clean, x-copy. 
  * Mercurial: versioning of loose files can be a bit of nightmare. If everyone has a copy of the file, how do we evolve the helpers, how to we build a community around it? Mercurial and in particular [CodePlex](http://blogs.msdn.com/b/codeplex/archive/2010/01/22/using-mercurial-on-codeplex.aspx) implementation, allows dead-easy forking, updating and contributing back (sending "pull requests") to the original author. 

So let's get started and create the Guard package

## Creating the reusable source file

I just want to be able to install the Guard package and get the following simple file in my project:
    
    
    using System;
    using System.Diagnostics;
    using System.Linq.Expressions;
    
    /// 
    /// Common guard class for argument validation.
    /// 
    [DebuggerStepThrough]
    internal static class Guard
    {
        /// 
        /// Ensures the given  is not null.
        /// Throws  otherwise.
        /// 
        public static void NotNull(Expression> reference, T value)
        {
            if (value == null)
                throw new ArgumentNullException(GetParameterName(reference), "Parameter cannot be null.");
        }
    
        /// 
        /// Ensures the given string  is not null or empty.
        /// Throws  in the first case, or 
        ///  in the latter.
        /// 
        public static void NotNullOrEmpty(Expression> reference, string value)
        {
            NotNull(reference, value);
            if (value.Length == 0)
                throw new ArgumentException(GetParameterName(reference), "Parameter cannot be empty.");
        }
    
        private static string GetParameterName(Expression reference)
        {
            var lambda = reference as LambdaExpression;
            var member = lambda.Body as MemberExpression;
    
            return member.Member.Name;
        }
    }

Simple enough. Note the class is internal, as it's intended to be added to the project where it will be used.

## Creating the NuGet package

There are two pieces to creating a package: 

  * [Creating the spec file](http://nuget.codeplex.com/documentation?title=Creating%20a%20Package) and laying out its content 
  * [Publish the spec file and content](http://nupackpackages.codeplex.com/) to the temporary NuGet package repository

To streamline the second part, I created a NuGet folder under the mercurial code repository, with the following structure:
    
    
    \NuGet
        \content
            Guard.cs
        Guard.nuspec
    

That's all we need for the first cut.

The nuspec file is a very simple to author XML file, mine looking as follows:
    
    
    				
    						
    								Guard
    								1.0.0.0
    								Guard Argument Validation Class
    								The only argument validation file you need, with full refactoring support and strong-typing.
    
    Examples: 
      Guard.NotNull(() => value, value)
      Guard.NotNullOrEmpty(
        () => stringValue, stringValue)
            
    								
    										Daniel Cazzulino
    								
    								en-US
    								http://guard.codeplex.com
    								http://www.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=guard&DownloadId=177040
    								http://guard.codeplex.com/license
    						
    				
    		

Nothing out of the ordinary there.

And, believe it or not, that's all we need.

## Testing the package

In order to test the package, we need to download the [NuGet Command Line Tool](http://nuget.codeplex.com/releases/view/52017). I put it outside of the NuGet folder I created above. Now I just need to run the following command to generate the actual package:
    
    
    NuGet.exe pack NuGet\Guard.nuspec -BasePath NuGet
    

Note that I use the BasePath option so that all the NuGet conventions kick in from the right place, automatically embedding the content folder, which is used for files that are added as-is to the project where the package is installed.

After running the command, we just need to add the path to it via Tools | Options | Package Manager:

![image](/web/20101212111242im_/http://www.clariusconsulting.net/images/blogs/kzu/6274f92c8a73_14C0E/image.png)

Now we can just create a test project (ConsoleApplication23 or whatever) and click View | Other Windows | Package Manager Console. The console window has a dropdown that will show the names we saw in the above dialog, and once we pick our Guard package "repository", we can issue a Get-Package command to list what's there:

![image](/web/20101212111242im_/http://www.clariusconsulting.net/images/blogs/kzu/6274f92c8a73_14C0E/image_3.png)

And if we now type: 
    
    
    PM> Install-Package Guard
    

sure enough, we get the Guard.cs file in our project! yay!

![image](/web/20101212111242im_/http://www.clariusconsulting.net/images/blogs/kzu/6274f92c8a73_14C0E/image_4.png)

Note that there's also a NuGet configuration file that allows it to track what packages have been installed on that project.

And typing: 
    
    
    PM> Uninstall-Package Guard
    

removes it. 

## Publishing the package

Currently, there's a temporary repository provided by the NuGet team at <http://nupackpackages.codeplex.com/>. The instructions in that main page are very straight forward and easy to follow. Essentially:

  * Sign-in with to CodePlex.com, open the [Source Code](http://nupackpackages.codeplex.com/SourceControl/list/changesets) page for NuGet Packages and click the [Create a fork](http://nupackpackages.codeplex.com/SourceControl/network/create/fork) under Code Contributions on the right. 
  * If you have [TortoiseHg](http://mercurial.selenic.com/wiki/TortoiseHg) installed, you can just right-click on any folder, select Clone, and enter the clone Url you got in the previous step. 
  * Wait for all packages in the world to download to your machine ![Winking smile](/web/20101212111242im_/http://www.clariusconsulting.net/images/blogs/kzu/6274f92c8a73_14C0E/wlEmoticon-winkingsmile.png)
  * Add the contents of our NuGet folder (the one with Guard.nuspec) to the PackageSources we just downloaded, under Guard\1.0.0.0 
  * Commit those newly added files, and push them to the server. 
  * Back in CodePlex, go to the [Forks](http://nupackpackages.codeplex.com/SourceControl/network) tab, and click the Send Pull Request for your fork.

That's it. We just need to wait for the cool guys in the NuGet team to merge our package definition.

## Deploying code snippets with our package

In order to add a little usability twist to our loose source file reuse, we will add two code snippet to our package. notnull and notempty. The former for reference types, and the latter specifically for strings that must not be empty or null. So we'll enable this code snippet experience for our users:

![image](/web/20101212111242im_/http://www.clariusconsulting.net/images/blogs/kzu/6274f92c8a73_14C0E/image_5.png)

A walkthrough on [how to create code snippets](http://msdn.microsoft.com/en-us/library/ms165393\(VS.80\).aspx) is out of scope for this blog, but it's an easy task. Here's the notnull one:
    
    
    				
    				
    						
    								
    										Guard null argument
    										notnull
    										Call Guard.NotNull for the given argument
    										Daniel Cazzulino
    										
    												Expansion
    										
    								
    								
    										
    												
    														argument
    														Name of the argument to guard
    														value
    												
    										
    										 $argument$, $argument$);
                $end$]]>
    								
    						
    				
    		

The [other one](http://guard.codeplex.com/SourceControl/changeset/view/eee302ffd284#NuGet%2ftools%2fnotempty.snippet) is pretty much the same. 

Stuff that is not assembly references neither source files go into the `tools` folder for the package. In our case, we will need to copy the two snippet files over to the user's profile directory, under `Visual Studio 2010\Code Snippets\Visual C#\My Code Snippets`. The place to hook this kind of install (copy) and uninstall (delete) automation is a couple of powershell scripts, named install.ps1 and uninstall.ps1.

So under our Guard source control root folder, we end up with:
    
    
    \NuGet
        \content
            Guard.cs
        \tools
            install.ps1
            uninstall.ps1
            notempty.snippet
            notnull.snippet
        Guard.nuspec
    

The install.ps1 file contains:
    
    
    param($installPath, $toolsPath, $package, $project)
      copy-item $toolsPath\*.snippet -destination ([System.Environment]::ExpandEnvironmentVariables("%VisualStudioDir%\Code Snippets\Visual C#\My Code Snippets\"))
    

The received parameters are self-explanatory, except for $project, which is the [EnvDTE.Project](http://msdn.microsoft.com/en-us/library/envdte.project\(v=VS.100\).aspx) where the package is being installed. Here I'm using the VS-only environment variable %VisualStudioDir%, which points to the user profile location used by VS.

and uninstall.ps1:
    
    
    param($installPath, $toolsPath, $package, $project)
      remove-item ([System.Environment]::ExpandEnvironmentVariables("%VisualStudioDir%\Code Snippets\Visual C#\My Code Snippets\notnull.snippet"))
      remove-item ([System.Environment]::ExpandEnvironmentVariables("%VisualStudioDir%\Code Snippets\Visual C#\My Code Snippets\notempty.snippet"))
    

Now that's it! Just re-building the package is enough to get the changes in, and sure enough, our code snippets will get deployed and removed as necessary.

posted on Wednesday, December 08, 2010 6:23 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/301006.aspx) :: 

  

[![](/web/20101212111242im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
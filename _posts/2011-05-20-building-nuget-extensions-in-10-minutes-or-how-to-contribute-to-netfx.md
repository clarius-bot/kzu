---
layout: post
title: "Building NuGet extensions in 10 minutes, or how to contribute to NETFx"
date: 2011-05-20 00:00:00 +0000
---

##  [Building NuGet extensions in 10 minutes, or how to contribute to NETFx](<http://blogs.clariusconsulting.net/kzu/building-nuget-extensions-in-10-minutes-or-how-to-contribute-to-netfx/> "Building NuGet extensions in 10 minutes, or how to contribute to NETFx")

May 20, 2011 2:45 pm

From the [documentation](<https://bit.ly/netfx-contribute>):

## How to contribute

[NETFx](<http://netfx.codeplex.com/>) relies on the [CodePlex mercurial fork/pull process](<http://codeplex.codeplex.com/wikipage?title=Forks>) for contributions. The explanation on [how to contribute to NuGet](<http://docs.nuget.org/docs/contribute/contributing-to-nuget>) applies roughly in its entirety to NETFx.

Install the [NETFx Contributor VSIX](<https://bit.ly/netfx_vsix>) from the Extension Manager. 

Restart VS, and now you’ll get the NETFx Extension template:

![netfx-new](http://blogs.clariusconsulting.net/kzu/files/2011/05/netfx-new.png)

Things to note:

  * The Location MUST be under the netfx\Extensions folder 
  * The directory structure following Extensions is used to make up your extension id, in the above case, it will be “netfx-System.Net.Http.HttpResponseExtensions” 
  * UNCHECK the “Create directory for solution” option, or otherwise you’ll end up with a duplicate name in the package ID and the folder structure. If you make this mistake (I do it all the time ![Smile](http://blogs.clariusconsulting.net/kzu/files/2011/05/wlEmoticon-smile4.png)), the easiest is to just kill the folder and start again. 
  * Pick a name that is very specific to the helper/extension method you’re creating. For example, instead of “StringExtensions”, create a “StringNamedFormatExtension” if you’re creating an extension to System.String that allows named parameters to be passed. (that one already exists, it’s [netfx-System.StringFormatWith](<http://nuget.org/List/Packages/netfx-System.StringFormatWith>) ![Winking smile](http://blogs.clariusconsulting.net/kzu/files/2011/05/wlEmoticon-winkingsmile.png)).   
This rule minimizes the chances of a single extension becoming too big and evolving into its own Common.cs hell. 

The resulting structure is as follows:

![netfx-source](http://blogs.clariusconsulting.net/kzu/files/2011/05/netfx-source.png)

The Package.tt is important. Here’s how the one for [HttpClientQuery](<http://nuget.org/List/Packages/netfx-System.Net.Http.HttpClientQuery>) [looks like](<http://netfx.codeplex.com/SourceControl/changeset/view/d5725543d01b#Extensions%2fSystem%2fNet%2fHttp%2fHttpClientQuery%2fBuild%2fNuGet%2fPackage.tt>):

![netfx-packagett](http://blogs.clariusconsulting.net/kzu/files/2011/05/netfx-packagett.png)

Note that the version is dynamic, and every time you build or save the manifest, you get the build version incremented. So you never forget to push new versions ![Winking smile](http://blogs.clariusconsulting.net/kzu/files/2011/05/wlEmoticon-winkingsmile.png). If you want to make your package version 2.0.*, just open the dependent .nuspec file, make the major version 2.0, and let the .tt regenerate again. It will now increment the build of the version you specified, i.e. 2.0.0.1.

After you’ve gone through the red/green/refactor and you’re happy with your extension, building the Build project results in something like:
    
    
    ------ Build started: Project: Build, Configuration: Debug Any CPU ------
      Transforming template NuGet\Package.tt...
      Transforming template Pack.tt...
      Transforming template Push.tt...
      Attempting to build package from 'Package.nuspec'.
      Successfully created package 'Extensions\System\Net\Http\HttpClientQuery\Build\bin\netfx-System.Net.Http.HttpClientQuery.1.0.0.12.nupkg'.

Now you can open another instance of VS (or VS Experimental if you have the VSSDK), and add the [bin path as a new package source for testing](<http://preview.docs.nuget.org/docs/start-here/using-the-add-library-package-reference-dialog-box>) install/uninstall. 

Now you can commit your extension, send a pull request, and for the NETFx team is just a matter of running your Push.ps1 ![Smile](http://blogs.clariusconsulting.net/kzu/files/2011/05/wlEmoticon-smile4.png)
    
    
    D:\..> powershell .\Push.ps1
    Pushing netfx-System.Net.Http.HttpClientQuery 1.0.0.12 to 'http://packages.nuget.org/v1/'...
    Publishing netfx-System.Net.Http.HttpClientQuery 1.0.0.12 to 'http://packages.nuget.org/v1/'...
    Your package was published.

Would be surprised if your extension doesn’t show up in mere minutes after approval of the pull request.

Now go and build your cool extension ![Smile](http://blogs.clariusconsulting.net/kzu/files/2011/05/wlEmoticon-smile4.png)

Posted by kzu
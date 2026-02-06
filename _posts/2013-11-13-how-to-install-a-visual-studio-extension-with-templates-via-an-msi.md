---
layout: post
title: "How to install a Visual Studio extension with templates via an MSI"
date: 2013-11-13 00:00:00 +0000
---

The original story around [VSIX deployment via an MSI](<http://blogs.msdn.com/b/visualstudio/archive/2009/10/27/vsix-and-msi.aspx>) was that simply copying it to the %VSInstallDir%\Common7\Ide\Extensions\Your Company\Your Product\Version was enough. But alas, devil is in the details, and a fairly complex [matrix of supported and unsupported features](<http://msdn.microsoft.com/en-us/library/vstudio/dd393694\(v=vs.100\).aspx>) depending on the deployment style is also available on MSDN. 

However, whenever templates are involved, the [general advise](<http://social.msdn.microsoft.com/Forums/vstudio/en-US/5d8abfdc-f31c-4a9f-b4da-bfdaee141734/can-devenv-updateconfiguration-be-used-instead-of-devenv-setup-after-installing-vspackage-by?forum=vsx>) from Microsoft was to just run devenv /setup at the end of your MSI installation. This might have been fine when you were only targeting VS2010, but now with 2010, 2012 and 2013 potentially installed on the machine, running devenv /setup three times in a row can take a LOOONG time (we’re talking several minutes here). And this was unavoidable if you are deploying your templates to Common7\IDE\ProjectTemplates or Common7\IDE\ItemTemplates.

But how does VS work its magic when you install a VSIX file? It’s super fast, so it surely doesn’t run devenv /setup! In a VSIX extension, templates are deployed together with the extension content, and VS just picks them up automatically on VS restart.

So here’s the trick:

  1. Install via your MSI all the templates under the same path of your extension, like %VSInstallDir%\Common7\Ide\Extensions\Your Company\Your Product\Version\ItemTemplates | ProjectTemplates
  2. For VS2010, you will need to deploy the zipped template files. For VS2012+ you can deploy the content files directly. In both cases, the folder structure will represent the subcategories under which they will appear in the Add New dialogs.
  3. Remember to point your vsixmanifest to that relative path, like: 
         
         <ItemTemplate>ItemTemplates</ItemTemplate>
         <ProjectTemplate>ProjectTemplates</ProjectTemplate>
             

  4. On your MSI project, all you need is a custom action (both install and uninstall) that touches the file %VSInstallDir%\Common7\Ide\Extensions\extensions.configurationchanged. This is the key thing that allows you to avoid running devenv /setup and lets VS know there are new extensions to update. In WIX, the custom action would look like this: 
         
         <CustomAction Id='VS2012TouchExtensions'
                       Directory='VS2012_EXTENSIONS_DIR'
                       Execute="deferred"
                       Impersonate="no"
                       ExeCommand='[SystemFolder]cmd.exe /c &quot;copy /b extensions.configurationchanged +,,&quot;'
                       Return='ignore' />
             

You’d have one such custom action for each VS version, and that’s it ![:\)](/img/2013-11-13-1.gif)

Enjoy!

/kzu

---
layout: post
title: "How to compile and run ALL WPF samples in the Windows SDK with a single command"
date: 2007-11-16 00:00:00 +0000
---

##  [How to compile and run ALL WPF samples in the Windows SDK with a single command](<http://blogs.clariusconsulting.net/kzu/how-to-compile-and-run-all-wpf-samples-in-the-windows-sdk-with-a-single-command/> "How to compile and run ALL WPF samples in the Windows SDK with a single command")

November 16, 2007 4:13 am

Just issue the following PowerShell one-liner, and you’ll compile and run each sample in the SDK (enter all in one line; broken here for readability): 
    
    
    PS C:\WinFx Samples\WPFSamples\AppModel\>         gci -i *.csproj -r |         foreach         {            pushd ([System.IO.Path]::GetDirectoryName($_.FullName));            msbuild $_.fullname;            (gci -i *.exe -r |                %{ &$_.fullname; read-host; });           popd;            $_;        }

“WinFx Samples” is the folder where you installed the samples. It also works from a subdirectory, as you can see, so that you only run the subset of samples you’re interested in. Executables may launch twice (from obj and bin outputs) and in some cases a dependent project might not get built before the main one, but hey, it’s just a quick trick ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) . The process will pause after executing each sample.

Very useful if you’re just playing with the technologies and want to get a quick overview through samples of what’s possible.

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=41645)

Posted by kzu
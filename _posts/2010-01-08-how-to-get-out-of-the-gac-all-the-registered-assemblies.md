---
layout: post
title: "How to get out of the GAC all the registered assemblies"
date: 2010-01-08 00:00:00 +0000
---

##  [How to get out of the GAC all the registered assemblies](<http://blogs.clariusconsulting.net/kzu/how-to-get-out-of-the-gac-all-the-registered-assemblies/> "How to get out of the GAC all the registered assemblies")

January 8, 2010 3:06 pm

You know how annoying the GAC shell extension makes it to access the actual assemblies:

![image](http://www.clariusconsulting.net/images/blogs/kzu/HowtogetoutoftheGACalltheregisteredassem_AA28/image.png)

Utterly useless. 

Of course, you surely know that you can get to those elusive assemblies via the command-line and side-step the shell extension:

[![image](http://www.clariusconsulting.net/images/blogs/kzu/HowtogetoutoftheGACalltheregisteredassem_AA28/image_thumb.png)](<http://www.clariusconsulting.net/images/blogs/kzu/HowtogetoutoftheGACalltheregisteredassem_AA28/image_3.png>)

But, now you need to go to each assembly folder, then its version, and so the actual assemblies are scattered through various locations.

This one-liner powershell command will get them all out in a folder of your choosing for easy Reflector-ing (create the target before running it):
    
    
    Get-ChildItem C:\Windows\assembly\GAC_MSIL -filter *.dll -recurse | Copy-Item -destination C:\GAC

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=201121)

Posted by kzu
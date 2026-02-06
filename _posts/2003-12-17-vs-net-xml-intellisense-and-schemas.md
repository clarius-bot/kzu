---
layout: post
title: "VS.NET Xml Intellisense and Schemas"
date: 2003-12-17 00:00:00 +0000
---

As most people know, in order to get intellisense for an "xmlnamespaced" document inside the IDE, the schema defining that namespace either has to be in the same project/folder or in `c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Packages\schemas\xml` (default VS installation folder). Therefore, if you have multiple projects, where one of them provides the schemas and another uses them in a document, you have to duplicate the file into the VS folder, and then you can forget copying it back when you change it in the project, etc... a mess. 

Well, if you use Windows XP and NTFS volumes, there's a cool workaround, which involves creating a [ "hard link"](http://www.microsoft.com/technet/treeview/default.asp?url=/TechNet/prodtechnol/winxppro/reskit/prkc_fil_baey.asp) inside the VS folder to the real file location. This way the file is not duplicated, but VS still finds it and keeps in sync with the real file location. It's easy to achieve: go to the VS folder aforementioned, and use the following command:

`
    
    
    fsutil hardlink create {new filename} {existing filename}

`

Enjoy! 

/kzu

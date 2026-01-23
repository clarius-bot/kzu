---
layout: post
title: "Daniel Cazzulino"
date: 2006-06-08 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : VS2005 XML Editor rocks! Navigating type definitions from instance documents!

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2312'\))| June 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
28| 29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2006/6/1.aspx "1 Post")| 2| 3  
4| 5| 6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2006/6/8.aspx "2 Posts")| [9](http://clariusconsulting.net/blogs/kzu/archive/2006/6/9.aspx "2 Posts")| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| 22| 23| 24  
25| 26| 27| 28| 29| 30| 1  
2| 3| 4| 5| 6| 7| 8  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060613121724im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## VS2005 XML Editor rocks! Navigating type definitions from instance documents! 

Today, I was working on some [GAX](http://lab.msdn.microsoft.com/teamsystem/workshop/gat/ "Guidance Automation Toolkit homepage")[software factory](http://practices.gotdotnet.com/mobile "Mobile Client Software Factory home page") stuff. I just couldn't remember if a particular element I had at hand in an instance document supported xs:anyAttribute or not in the corresponding schema. So I though "how handy it would be if I could press F12 (Go to Definition) and be taken to the schema for it". I tried it:

![XmlEditorGoToDefinition.png](/web/20060613121724im_/http://clariusconsulting.net/ImageGallery/kzu/XmlEditorGoToDefinition.png)

Imagine my surprise when I saw:

![XmlEditorGoToDefinition2.png](/web/20060613121724im_/http://clariusconsulting.net/ImageGallery/kzu/XmlEditorGoToDefinition2.png)

Quite unexpected for me, I was presented with the XSD for the document with the relevant element definition focused under the cursor! Now, the element happens to he a ref to the definition which is somewhere else. So I thought "how handy it would be if I could press F12 and be taken to the definition of that referenced element". I tried it:

![XmlEditorGoToDefinition3.png](/web/20060613121724im_/http://clariusconsulting.net/ImageGallery/kzu/XmlEditorGoToDefinition3.png)

And I was inmediately taken to:

![XmlEditorGoToDefinition4.png](/web/20060613121724im_/http://clariusconsulting.net/ImageGallery/kzu/XmlEditorGoToDefinition4.png)

Simply amazing. I didn't know about this feature. What's more, you can use Ctrl+[minus sign] to navigate back, just like you do when you F12 to definitions in any code window. 

Impressive job, XML team. Thank again!!!!!!

posted on Thursday, June 08, 2006 8:36 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/540.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/06/08/XmlGoToDefinition.aspx#541 "permalink") VS2005 XML Editor rocks! Navigating type definitions from instance documents! @ Thursday, June 08, 2006 9:00 PM

Note: this entry has moved.   
Today, I was working on some GAX&amp;nbsp;software factory stuff. I just couldn't... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2006/06/09/XmlGoToDefinition.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/06/08/XmlGoToDefinition.aspx#550 "permalink") VS 2005 Xml Editor Coolness @ Monday, June 12, 2006 8:50 AM

Kzu has a top tip for the Xml Editor in Visual Studio 2005.   
F12 for “Go to definition” works in instance... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://blogs.msdn.com/garethj/archive/2006/06/12/628290.aspx "TrackBack")

  

[![](/web/20060613121724im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
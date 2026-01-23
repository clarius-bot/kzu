---
layout: post
title: "Daniel Cazzulino : How To Destroy Your Web Developer Reputation in One Line, Guaranteed"
date: 2004-07-15 00:00:00 +0000
---

Daniel Cazzulino : How To Destroy Your Web Developer Reputation in One Line, Guaranteed


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2131'\))| December 2005| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| 3  
4| [5](http://clariusconsulting.net/blogs/kzu/archive/2004/7/5.aspx "2 Posts")| [6](http://clariusconsulting.net/blogs/kzu/archive/2004/7/6.aspx "1 Post")| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/7/9.aspx "2 Posts")| 10  
11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/7/12.aspx "1 Post")| 13| 14| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/7/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/7/16.aspx "3 Posts")| 17  
18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/7/20.aspx "1 Post")| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/7/21.aspx "2 Posts")| 22| 23| 24  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
  

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## How To Destroy Your Web Developer Reputation in One Line, Guaranteed 

Please, make sure these words get deep in your mind the next time you write an ASP.NET application: 

**If you're using`Response.Write`, you're a dreadful citizen of the ASP.NET world.**

As my friend [Victor](http://weblogs.asp.net/vga) said, "Response.Write is there just for compatibility reasons and for old script programmers to not feel lonely".   
An app written in such a way will not only be difficult to maintain and evolve, it will be almost impossible to customize (specially its layout), will never catch up with the upcoming mobile features and just hurts the eye.   
Everytime I see a `Response.Write`, and specially if it's not even kind enough to use `[HtmlTextWriterTag](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwebuihtmltextwritertagclasstopic.asp)`, `[HtmlTextWriterAttribute](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfSystemWebUIHtmlTextWriterAttributeClassTopic.asp)` and `[HtmlTextWriterStyle](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwebuihtmltextwriterstyleclasstopic.asp)`, the developer who wrote it is instantly removed from my in-memory list of good ASP.NET programmers. 

Bottom line: you should always design your web apps as reusable components and user or custom controls, so that they can be easily rearranged, styled and plugged into existing apps.

posted on Thursday, July 15, 2004 11:07 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

![](/web/20051223210206im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
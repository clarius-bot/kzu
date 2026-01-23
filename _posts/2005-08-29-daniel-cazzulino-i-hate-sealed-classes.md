---
layout: post
title: "Daniel Cazzulino : I hate sealed classes!!!"
date: 2005-08-29 00:00:00 +0000
---

Daniel Cazzulino : I hate sealed classes!!!


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2131'\))| December 2005| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2005/8/2.aspx "3 Posts")| [3](http://clariusconsulting.net/blogs/kzu/archive/2005/8/3.aspx "1 Post")  
[4](http://clariusconsulting.net/blogs/kzu/archive/2005/8/4.aspx "1 Post")| 5| 6| 7| 8| 9| 10  
11| [12](http://clariusconsulting.net/blogs/kzu/archive/2005/8/12.aspx "2 Posts")| 13| 14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2005/8/16.aspx "1 Post")| 17  
18| 19| 20| 21| 22| 23| 24  
25| 26| 27| 28| [29](http://clariusconsulting.net/blogs/kzu/archive/2005/8/29.aspx "1 Post")| 30| 31  
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

## I hate sealed classes!!! 

Sealed keyword is by far the most annoying showstopper to extensibility. I hate it so much. I wish there was an FxCop rule that would enforce that:  
1 - If a class is sealed, then it *must* implement an interface that extenders can implement to hook custom implementations.   
2 - The sealed class cannot be used *anywhere* in an "if (foo is MyDamnSealedClass)" statement. The required interface from 1) must be used instead.  
3 - If a method is sealed, the class should be sealed too, or an equivalent method called from the sealed one is provided for inheritors (implementation of the template method pattern). There's no point in providing a non-sealed class where it's most important behavior (say an Execute method in a Command class or something like that) is sealed and there's no way to change its core behavior.  
  
Although the third one is a little bit extreme, the first two are a **MUST**. Another day I'll tell you where I found a few key such annoying combinations...  

posted on Monday, August 29, 2005 4:50 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

![](/web/20051224100413im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
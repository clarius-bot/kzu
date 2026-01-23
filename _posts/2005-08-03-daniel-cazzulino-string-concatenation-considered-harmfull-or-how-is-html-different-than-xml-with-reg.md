---
layout: post
title: "Daniel Cazzulino : String concatenation considered harmfull (or how is HTML different than XML with regards to creating it)"
date: 2005-08-03 00:00:00 +0000
---

Daniel Cazzulino : String concatenation considered harmfull (or how is HTML different than XML with regards to creating it)


### Subscriptions

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
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## String concatenation considered harmfull (or how is HTML different than XML with regards to creating it) 

From [Brad](http://www.agileprogrammer.com/dotnetguy/archive/2005/07/28/6459.aspx), I got to [Craig](http://pluralsight.com/blogs/craig/)'s post about the [bad things that happen when you build XML by string concatenation](http://pluralsight.com/blogs/craig/archive/2005/07/28/13549.aspx). His core statement is: 

> The moral of the story here is that if you find yourself doing something like this:   
>  xml = "<FOO>" + fooContents + "</FOO>";  
> then you should lose points on your programming license. 

Now, I wonder how is XML different than HTML with regards to creating it. After all, you should probably be creating *X*HTML anyway, as it's the most compatible way of doing it. So, you should * **also** * lose points if you're doing the following: 
    
    
    output.WriteLine("<FIELDSET><LEGEND>Federation namespace list</LEGEND></FIELDSET>");

Guess [where you will find ****TONS**** of code like that](http://www.flexwiki.com/). This is so [1996 of them](http://en.wikipedia.org/wiki/Active_Server_Pages)!! 

posted on Wednesday, August 03, 2005 1:28 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/371.aspx) :: 

  

![](/web/20051224100737im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
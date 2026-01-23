---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-06 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Monday, December 01, 2003 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2003/12/1.aspx "1 Post")| [2](http://clariusconsulting.net/blogs/kzu/archive/2003/12/2.aspx "1 Post")| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2003/12/4.aspx "1 Post")  
5| 6| 7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/12/11.aspx "2 Posts")  
[12](http://clariusconsulting.net/blogs/kzu/archive/2003/12/12.aspx "1 Post")| 13| 14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2003/12/16.aspx "1 Post")| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/12/17.aspx "2 Posts")| [18](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18.aspx "2 Posts")  
[19](http://clariusconsulting.net/blogs/kzu/archive/2003/12/19.aspx "1 Post")| 20| 21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/12/22.aspx "1 Post")| 23| 24| 25  
26| 27| 28| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060206231829im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Monday, December 01, 2003 - Posts

#####  [Strange bug in XML Serialization/Mapping classes](http://clariusconsulting.net/blogs/kzu/archive/2003/12/01/109.aspx)

While trying to customize the generated code for an XmlSchema, using the technique explained in a [previous post](http://weblogs.asp.net/cazzu/posts/33302.aspx), I came to a point where I can't advance any further as the framework classes are throwing an exception where they shouldn't.   
The customization process basically involves using the `XmlSchemaImporter` class and using its `ImportTypeMapping()` method. To further customize it, I wanted to modify the type members, therefore, I tried to use the `ImportMembersMapping()` with exactly the same (working) `XmlQualifiedName` used for the previous method. I got an `InvalidCastException` thrown in the face :S. Here's the damn stack trace:

`
    
    
    System.InvalidCastException: Specified cast is not valid.
      at System.Xml.Serialization.XmlMembersMapping..ctor(TypeScope scope, ElementAccessor accessor)
      at System.Xml.Serialization.XmlSchemaImporter.ImportMembersMapping(XmlQualifiedName name)

`

MS, help!!! Calling code is simple:

`
    
    
    // Works
    XmlTypeMapping map = imp.ImportTypeMapping( element.QualifiedName );
    // Blows
    XmlMembersMapping members = imp.ImportMembersMapping( element.QualifiedName );

`

posted [Monday, December 01, 2003 6:06 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/12/01/109.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/12/01/109.aspx#comments)

  

![](/web/20060206231829im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
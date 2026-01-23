---
layout: post
title: "Daniel Cazzulino"
date: 2004-07-12 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Cursor-style iteration pattern

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| [5](http://clariusconsulting.net/blogs/kzu/archive/2004/7/5.aspx "2 Posts")| [6](http://clariusconsulting.net/blogs/kzu/archive/2004/7/6.aspx "1 Post")  
7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/7/9.aspx "2 Posts")| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/7/12.aspx "1 Post")| 13  
14| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/7/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/7/16.aspx "3 Posts")| 17| 18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/7/20.aspx "1 Post")  
[21](http://clariusconsulting.net/blogs/kzu/archive/2004/7/21.aspx "2 Posts")| 22| 23| 24| 25| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060511235308im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Cursor-style iteration pattern 

The usual enumeration pattern in .NET is either of these:
    
    
    foreach (string value in values)
    {
      // do something.  
    }
    
    // or
    for (int i = 0; i < values.Length; i++)
    {
      string value = values[i];
      // do something.
    }

When working with cursor-style APIs like the XmlReader or XPathNavigator, the pattern usual becomes something like this (note this is the same code for both APIs): 
    
    
    if (nav.MoveToFirstAttribute())
    {
      do
      {
        // Do something with nav.Current.
      } while (nav.MoveToNextAttribute();
    }

This is not as readable or compact as the usual approach. One solution to get back the `for` style of iteration, which I use all the time, is the following:
    
    
    for (bool go = nav.MoveToFirstAttribute(); go; go = nav.MoveToNextAttribute())
    {
      // Do something with nav.Current.
    }

With this approach, you can the usual iteration pattern again, and have more compact and readable code. It can be used with all XPathNavigator methods that use MoveToFirst/MoveToNext:
    
    
    // To process namespaces
    for (bool go = nav.MoveToFirstNamespace(XPathNamespaceScope.Local); go; 
      go = nav.MoveToNextNamespace(XPathNamespaceScope.Local))
    {
    }
    
    // To process all child elements of current
    for (bool go = nav.MoveToFirstChild(); go; go = nav.MoveToNext())
    {
    }

posted on Monday, July 12, 2004 12:17 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/266.aspx) :: 

  

[![](/web/20060511235308im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
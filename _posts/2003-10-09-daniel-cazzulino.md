---
layout: post
title: "Daniel Cazzulino"
date: 2003-10-09 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : High-performance XML (II): XPath execution tips

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/10/3.aspx "1 Post")| 4| [5](http://clariusconsulting.net/blogs/kzu/archive/2003/10/5.aspx "1 Post")| 6  
[7](http://clariusconsulting.net/blogs/kzu/archive/2003/10/7.aspx "1 Post")| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2003/10/9.aspx "2 Posts")| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11.aspx "1 Post")| [12](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12.aspx "2 Posts")| 13  
14| 15| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17.aspx "2 Posts")| 18| 19| 20  
[21](http://clariusconsulting.net/blogs/kzu/archive/2003/10/21.aspx "1 Post")| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2003/10/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2003/10/25.aspx "1 Post")| [26](http://clariusconsulting.net/blogs/kzu/archive/2003/10/26.aspx "1 Post")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/10/27.aspx "1 Post")  
[28](http://clariusconsulting.net/blogs/kzu/archive/2003/10/28.aspx "1 Post")| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502031422im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## High-performance XML (II): XPath execution tips 

As I programmed an XPath-only implementation of the [ Schematron](http://schematron.com/) specification (soon an ISO standard and very cool XML validation language, incredibly flexible and powerfull), called (surprisingly) [ Schematron.NET](https://sourceforge.net/projects/dotnetopensrc/), and part of the NMatrix project, I found many interesting things about the internals of XPath execution.  
And I needed to dig deep inside it because my implementation had to be more performant than the [reference implementation based on XSLT](). And it ended being an average 50% faster than the fastest-XSLT-engine-executed version. During that trip, I found the following useful tips: 

  * At first I was worried about the amount of `XPathNavigator.Clone()` that goes on during execution. Further research showed that the method only creates a new object and saves the references to the document, the node and parentOfNs (don't know where it's used) variables. So it's really fast and doesn't have any perf. impact. So, clone the navigator at will! 
  * The only way to get at the xml contents of a navigator (i.e. node) is to check whether it implements `IHasXmlNode`, which is only true if the navigator was constructed from an `XmlDocument`. If it does, you can access the underlying `XmlNode` with the following code: 

`
        
        if (navigator is IHasXmlNode) 
          node = ((IHasXmlNode) nav).GetNode();

`

  * When we use an `XPathNodeIterator`, its `Current` object is always the same, that is, a single object is created, and its internal values changed to reflect the undelying current node. Therefore, if we want to track already-processed nodes, we can't use its hashcode or reference. The only (standard) way to compare navigators is through the use of their `IsSamePosition(XPathNavigator other)` method. So, if you need such a mechanism (process some node only once), your only way (in principle) is to iterate through a collection of previously saved navigators and compare them one by one with the current one. Note that you must clone the `Current` element (the `XPathNavigator` itself), or the position will be changed as you move on in the iteration. 
~~
  * `XPathNavigator.Evaluate()` produces a movement in the cursor position! So always remember to clone before doing anything against a navigator, or clone once, and later use `MoveTo(XPathNavigator original)` to reposition again to the original place. 
~~
  * For all but the smallest documents (or very few child nodes from the current position), `XPathNavigator.SelectChildren` and `XPathNavigator.SelectDescendents` are 35-45% slower than `XPathNavigator.Select` with an equivalent precompiled expression. 
  * Adding the string values (tokens, such as element and attribute names) that are expected in the instance document to the navigator's `NameTable` property, prior to executing the queries, offers a marginal performance gain of 4-8%.

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted on Thursday, October 09, 2003 4:41 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/83.aspx) :: 

  

[![](/web/20060502031422im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
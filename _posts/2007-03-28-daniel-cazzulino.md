---
layout: post
title: "Daniel Cazzulino"
date: 2007-03-28 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, February 09, 2007 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2588'\))| March 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2647'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 1| 2| 3  
4| 5| 6| 7| 8| [9](http://www.clariusconsulting.net/blogs/kzu/archive/2007/2/9.aspx "1 Post")| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| [20](http://www.clariusconsulting.net/blogs/kzu/archive/2007/2/20.aspx "1 Post")| 21| 22| 23| 24  
25| 26| 27| [28](http://www.clariusconsulting.net/blogs/kzu/archive/2007/2/28.aspx "1 Post")| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070328073025im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Friday, February 09, 2007 - Posts

#####  [Linq to XSD: strong-typed XML data models!](http://www.clariusconsulting.net/blogs/kzu/archive/2007/02/09/18339.aspx)

I'm very pleased to see the direction the XML team took with the new [Linq to XSD preview](http://www.microsoft.com/downloads/details.aspx?FamilyID=f83e69dd-ef73-49c5-9b3a-ee0c61e68a20&DisplayLang=en). Basically, it's xsd.exe, but generating classes on top of Linq to XML (or XLinq, XElement and friends). This is pretty cool, because it gives you all the power and productivity of a strong-typed object model, while still allowing for the freedom of manipulating the underlying untyped XML. 

The crucial point there is that the typed model is pretty much an adapter on top of untyped XML, therefore both will always be in sync. The semantics for the insertion and appending of content data to the underlying untyped model is sound and I'm sure it will be even better by the time it ships. 

You can now transform the following:
    
    
    (from item in purchaseOrder.Elements("Item") 
     select (double)item.Element("Price") * (int)item.Element("Quantity") 
    ).Sum(); 
    

into:
    
    
    (from item in purchaseOrder.Item 
     select item.Price * item.Quantity  
    ).Sum(); 
    

The code generation is done with an MSBuild task, so you can always be sure that the XSD and its object model adapters are in sync, and your code always complies with it.

One question that remains to be seen is how/if this plays with the XStreamElement support. I guess they are orthogonal, but haven't checked.

Congrats to the team for a step in one very useful direction!

posted [Friday, February 09, 2007 8:38 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2007/02/09/18339.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070328073025im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
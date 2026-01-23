---
layout: post
title: "Daniel Cazzulino"
date: 2004-06-25 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : High-performance XML (V): in-memory XML Schema validation without re-parsing

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2557'\))| February 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2616'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/6/9.aspx "1 Post")| 10  
11| 12| 13| 14| 15| 16| 17  
18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/6/19.aspx "1 Post")| 20| 21| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2004/6/24.aspx "2 Posts")  
[25](http://clariusconsulting.net/blogs/kzu/archive/2004/6/25.aspx "2 Posts")| 26| 27| 28| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070228135849im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## High-performance XML (V): in-memory XML Schema validation without re-parsing 

I may have not stressed enough one of the most important features enabled by the [XPathNavigatorReader](http://clariusconsulting.net/blogs/kzu/archive/2004/04/19/213.aspx): **in-memory (without reparsing) XML Schema validation of arbitrary sources exposed as`XPathNavigator`.**

When XML editing is required, developers typically resort to OuterXml->new XmlTextReader->new XmlValidatingReader->Validate (and re-parse!):

XmlDocument doc = GetModifiedDocument(); // Get the modified doc somehow. // Create the reader from the XML string taken through OuterXml. XmlValidatingReader vr = new XmlValidatingReader( new XmlTextReader(new StringReader(node.OuterXml)));

There is an absolutely unnecessary re-parsing step that degrades performance. The same scenario can be solved trivially with the [ XPathNavigatorReader](http://clariusconsulting.net/blogs/kzu/archive/2004/04/19/213.aspx):

XmlDocument doc = GetModifiedDocument(); // Get the modified doc somehow. // Create the validating reader with the new reader over the root document navigator XmlValidatingReader vr = new XmlValidatingReader( new XPathNavigatorReader(doc.CreateNavigator()));

That "simple" change completely bypases the need to re-parse the document. Needless to say, the bigger the document, the higher the cost. In my tests with a fairly small document (~50kb) I could save about **30-40% processing time**. And if you use an `XPathDocument` instead, the processing **saving skyrockets to more than 60%**! As usual, this shows the superiority of the `XPathDocument` as a generic XML in-memory store. I can't wait for Whidbey release, when it will offer all of XmlDocument features and more.

As I explained [in my previous post](http://clariusconsulting.net/blogs/kzu/archive/2004/04/19/213.aspx), there's another interesting story for the `XPathNavigatorReader`, and that's about document fragment validation. As the reader considers the navigator's current position as the root node, you can validate a subset against a refined schema. Specially with complex documents and schemas, this can significantly improve performance too.

The full project source code can be downloaded from [ SourceForge](http://prdownloads.sourceforge.net/mvp-xml/Mvp.Xml.zip?download) . 

Enjoy and please give us feedback on the project!

Check out the [Roadmap to high performance XML](http://clariusconsulting.net/blogs/kzu/archive/2004/07/09/HiPerfXML.aspx).

posted on Friday, June 25, 2004 1:03 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070228135849im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
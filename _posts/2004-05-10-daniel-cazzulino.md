---
layout: post
title: "Daniel Cazzulino"
date: 2004-05-10 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Subset document loading and transformation with XPathNavigatorReader

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| 5| 6  
[7](http://clariusconsulting.net/blogs/kzu/archive/2004/5/7.aspx "1 Post")| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/5/8.aspx "1 Post")| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/5/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2004/5/11.aspx "1 Post")| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/5/13.aspx "1 Post")  
[14](http://clariusconsulting.net/blogs/kzu/archive/2004/5/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/5/15.aspx "1 Post")| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/5/17.aspx "2 Posts")| 18| 19| 20  
21| 22| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/5/26.aspx "2 Posts")| 27  
28| 29| 30| [31](http://clariusconsulting.net/blogs/kzu/archive/2004/5/31.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060511235435im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Subset document loading and transformation with XPathNavigatorReader 

Thanks to Tom Smalley who pointed it, I fixed a bug that prevented the [XPathNavigatorReader](http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx) from being used for loading a new `XmlDocument` or `XPathDocument`. This feature is very useful if you have to apply a transformation to a subset of a document. For this purpose, the [MSDN documentation](http://msdn.microsoft.com/library/en-us/cpguide/html/cpconXslTransformClassImplementsXSLTProcessor.asp) suggests using `XmlDocument` both for the entire document loading as well as the subset, which is the most inefficient way of performing transformations in .NET.

The code suggested for this scenario is (I modified it to print each child of the root which is more useful):

XslTransform xslt = new XslTransform();   
xslt.Load("print_root.xsl");  
// Load the entire doc.  
XmlDocument doc = new XmlDocument();  
doc.Load("library.xml");  
  
// Create a new document for each child  
foreach (XmlNode testNode in doc.DocumentElement.ChildNodes)  
  
{  
XmlDocument tmpDoc = new XmlDocument();   
tmpDoc.LoadXml(testNode.OuterXml);  
  
// Transform the subset.  
xslt.Transform(tmpDoc, null, Console.Out, null);  
}

Note that there's double parsing for each node to be transformed as the temporary document is loaded from the raw string returned by the `OuterXml` property. With the `XPathNavigatorReader` you can avoid this parsing cost altogether, and work with the XSLT-optimized `XPathDocument` using the following code:

XslTransform xslt = new XslTransform();  
// Always pass evidence!  
xslt.Load("print_root.xsl", null, this.GetType().Assembly.Evidence);  
// Load the entire doc.  
XPathDocument doc = new XPathDocument("library.xml");  
  
// Create a new document for each child  
XPathNodeIterator books = doc.CreateNavigator().Select("/library/book");  
while (books.MoveNext())  
{  
// Load a doc from the current navigator using a reader over it.  
XPathDocument tmpDoc = new XPathDocument(  
new XPathNavigatorReader(books.Current));   
  
// Transform the subset.  
xslt.Transform(tmpDoc, null, Console.Out, null);  
}

Note that XML parsing happens only once, when the full doc is loaded. For a dsPubs database dump relatively large (300Kb), and a little less trivial stylesheet, the later approach yields 2X performance increase (you already know you gain about 30% from using `XPathDocument` alone).

`XPathNavigatorReader` is part of the opensource [ Mvp.Xml project](http://sf.net/projects/mvp-xml). The full project source code can be downloaded from [ SourceForge](http://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234).

Enjoy and please give us feedback on the project!

**Update** : this technique does incur the cost of an additional parse step. Check [High-performance XML (III): subtree transformations without re-parsing](http://weblogs.asp.net/cazzu/archive/2004/06/24/164243.aspx) for a better approach.

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted on Monday, May 10, 2004 1:15 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/224.aspx) :: 

  

[![](/web/20060511235435im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
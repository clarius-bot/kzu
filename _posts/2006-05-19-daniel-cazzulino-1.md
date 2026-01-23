---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-19 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Thursday, June 24, 2004 - Posts

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
7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/6/9.aspx "1 Post")| 10| 11| 12| 13  
14| 15| 16| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/6/19.aspx "1 Post")| 20  
21| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2004/6/24.aspx "2 Posts")| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/6/25.aspx "2 Posts")| 26| 27  
28| [29](http://clariusconsulting.net/blogs/kzu/archive/2004/6/29.aspx "1 Post")| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060519104229im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Thursday, June 24, 2004 - Posts

#####  [Minimalist Virtual CDRom](http://clariusconsulting.net/blogs/kzu/archive/2004/06/24/252.aspx)

For my own future reference, the link to the [MS VirtualCD](http://download.microsoft.com/download/7/b/6/7b6abd84-7841-4978-96f5-bd58df02efa2/winxpvirtualcdcontrolpanel_21.exe) tool. 

posted [Thursday, June 24, 2004 1:23 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/06/24/252.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/06/24/252.aspx#comments)

#####  [High-performance XML (IV): subtree transformations without re-parsing](http://clariusconsulting.net/blogs/kzu/archive/2004/06/24/251.aspx)

In a [previous post](http://weblogs.asp.net/cazzu/archive/2004/05/10/129101.aspx) I showed how to load and transform subsets of a document with the [XPathNavigatorReader](http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx). In the example I used, which follows the [MSDN documentation](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpguide/html/cpconXslTransformClassImplementsXSLTProcessor.asp?frame=true&hidetoc=true) one (under the section "Transforming a Section of an XML Document"), XML parsing is happening once, but in-memory document building is happening for each subtree being transformed, effectively loading those fragments in memory twice. The relevant piece of code is: 

`
    
    
    XPathNodeIterator books = doc.CreateNavigator().Select("/library/book");  
     while (books.MoveNext())  
     {  
     // There's no XML re-parsing, but a new XPathDocument is loaded!  
     XPathDocument tmpDoc = new XPathDocument(  
     new XPathNavigatorReader(books.Current));   
     ...

`

As [Oleg](http://www.tkachenko.com/blog/) apropriately [pointed out](http://www.tkachenko.com/blog/archives/000234.html), the definite solution (and the one he used for the [Mvp.Xml project](http://sf.net/projects/mvp-xml) [XmlNodeNavigator](http://www.tkachenko.com/blog/archives/000117.html)) is to have a wrapper navigator that doesn't allow an `XPathNavigator` to go outside a certain scope. Now the [Mvp.Xml project](http://sf.net/projects/mvp-xml) has that solution for all `XPathNavigator` implementations, the `SubtreeXPathNavigator`. This class is very similar in nature and implementation to Oleg's. Usage is straightforward: you just pass a newly constructed `SubtreeXPathNavigator` to the `XslTransform` class, and it will work on the subtree starting at the navigator received in the constructor, which is considered the new root. 

Again, I'll follow the [MSDN documentation](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpguide/html/cpconXslTransformClassImplementsXSLTProcessor.asp?frame=true&hidetoc=true) example. Check my [previous post](http://weblogs.asp.net/cazzu/archive/2004/05/10/129101.aspx) for the original code. In the new version, only a single line of code is changed. Inside the `while` loop, instead of loading a new `XPathDocument` to perform the transformation, a new `SubtreeXPathNavigator` instance constructed:

`
    
    
    XslTransform xslt = new XslTransform();  
     // Always pass evidence!  
     xslt.Load("print_root.xsl", null, this.GetType().Assembly.Evidence);  
     // Load the entire doc.  
     XPathDocument doc = new XPathDocument("library.xml");  
       
     // Create a new document for each child  
     XPathNodeIterator books = doc.CreateNavigator().Select("/library/book");  
     while (books.MoveNext())  
     {  
     // Transform the subtree defined by the current navigator scope.  
     xslt.Transform(new SubtreeeXPathNavigator(books.Current),  
     null, Console.Out, null);  
     }

`

Ignoring the time it takes to load the stylesheet and the XPath expression compilation (which should both be cached), this yields an **amazing 3.5X performance boost** , for this simple example. And it uses an XML input of 200 bytes, and a really trivial transformation!

Transforming subtrees may also be useful to reduce the complexity of your stylesheets, and help the XSLT processor in .NET (which is not the fastest in the world) to perform better.

The full [Mvp.Xml project](http://sf.net/projects/mvp-xml) source code can be downloaded from [SourceForge](https://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234).

Enjoy and please give us feedback on the project!

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted [Thursday, June 24, 2004 12:53 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/06/24/251.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/06/24/251.aspx#comments)

  

[![](/web/20060519104229im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
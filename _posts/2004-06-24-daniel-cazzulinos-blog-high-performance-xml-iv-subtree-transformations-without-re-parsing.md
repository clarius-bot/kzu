---
layout: post
title: "Daniel Cazzulino's Blog : High-performance XML (IV): subtree transformations without re-parsing"
date: 2004-06-24 00:00:00 +0000
---

## High-performance XML (IV): subtree transformations without re-parsing 

In a [previous post](http://weblogs.asp.net/cazzu/archive/2004/05/10/129101.aspx) I showed how to load and transform subsets of a document with the [XPathNavigatorReader](http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx). In the example I used, which follows the [MSDN documentation](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpguide/html/cpconXslTransformClassImplementsXSLTProcessor.asp?frame=true&hidetoc=true) one (under the section "Transforming a Section of an XML Document"), XML parsing is happening once, but in-memory document building is happening for each subtree being transformed, effectively loading those fragments in memory twice. The relevant piece of code is: 

` `
    
    
    XPathNodeIterator books = doc.CreateNavigator().Select("/library/book");  
     while (books.MoveNext())  
     {  
     // There's no XML re-parsing, but a new XPathDocument is loaded!  
     XPathDocument tmpDoc = new XPathDocument(  
     new XPathNavigatorReader(books.Current));   
     ...

As [Oleg](http://www.tkachenko.com/blog/) apropriately [pointed out](http://www.tkachenko.com/blog/archives/000234.html), the definite solution (and the one he used for the [Mvp.Xml project](http://sf.net/projects/mvp-xml) [XmlNodeNavigator](http://www.tkachenko.com/blog/archives/000117.html)) is to have a wrapper navigator that doesn't allow an `XPathNavigator` to go outside a certain scope. Now the [Mvp.Xml project](http://sf.net/projects/mvp-xml) has that solution for all `XPathNavigator` implementations, the `SubtreeXPathNavigator`. This class is very similar in nature and implementation to Oleg's. Usage is straightforward: you just pass a newly constructed `SubtreeXPathNavigator` to the `XslTransform` class, and it will work on the subtree starting at the navigator received in the constructor, which is considered the new root. 

Again, I'll follow the [MSDN documentation](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpguide/html/cpconXslTransformClassImplementsXSLTProcessor.asp?frame=true&hidetoc=true) example. Check my [previous post](http://weblogs.asp.net/cazzu/archive/2004/05/10/129101.aspx) for the original code. In the new version, only a single line of code is changed. Inside the `while` loop, instead of loading a new `XPathDocument` to perform the transformation, a new `SubtreeXPathNavigator` instance constructed:

` `
    
    
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

Ignoring the time it takes to load the stylesheet and the XPath expression compilation (which should both be cached), this yields an **amazing 3.5X performance boost** , for this simple example. And it uses an XML input of 200 bytes, and a really trivial transformation!

Transforming subtrees may also be useful to reduce the complexity of your stylesheets, and help the XSLT processor in .NET (which is not the fastest in the world) to perform better.

The full [Mvp.Xml project](http://sf.net/projects/mvp-xml) source code can be downloaded from [SourceForge](https://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234).

Enjoy and please give us feedback on the project!

Check out the [Roadmap to high performance XML](http://clariusconsulting.net/blogs/kzu/archive/2004/07/09/HiPerfXML.aspx).

/kzu

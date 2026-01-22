---
layout: post
title: "Reading XML document fragments in .NET"
date: 2020-05-14 00:00:00 +0000
---

##  [Reading XML document fragments in .NET](<http://blogs.clariusconsulting.net/kzu/reading-xml-document-fragments-in-net/> "Reading XML document fragments in .NET")

August 4, 2007 12:28 am

A document fragment is an XML file that doesn’t have a root element:
    
    
    <E2ETraceEvent xmlns="http://schemas.microsoft.com/2004/06/E2ETraceEvent">
      <System xmlns="http://schemas.microsoft.com/2004/06/windows/eventlog/system">    ...
      </System>
      <ApplicationData>    ...
      </ApplicationData>
    </E2ETraceEvent>
    <E2ETraceEvent xmlns="http://schemas.microsoft.com/2004/06/E2ETraceEvent">
      <System xmlns="http://schemas.microsoft.com/2004/06/windows/eventlog/system">    ...
      </System>
      <ApplicationData>    ...
      </ApplicationData>
    </E2ETraceEvent>
    ...
    
    
    
     
    

In order to read this with plain XmlReader code, you can do the following:
    
    
    
    
    
    XmlReaderSettings settings = new XmlReaderSettings();
    settings.ConformanceLevel = ConformanceLevel.Fragment;
    
    using (XmlReader reader = XmlReader.Create("tracelog.xml", settings))
    {
        while (reader.Read())
        {
            // Process each node of the fragment,
            // possibly using reader.ReadSubtree()
        }
    }
    

[](<http://11011.net/software/vspaste>)

It may be the case that instead of the more performant (and definitely suggested approach if the file is big) XmlReader API, you may want to use XmlDocument or XPathDocument to be able to query the file using full XPath. In .NET 2.0, the XPathDocument class will successfully load an xml fragment, which was kind of surprising to me as I’m pretty sure it was not a supported feature in .NET 1.1. The surprising part is because technically, a fragment is NOT a document. The way the XPathDocument does its magic is by creating a “transparent” root node, and holding the fragments from it. I say it’s transparent because your XPath queries can use the root node axis and still get properly resolved to the fragments:
    
    
    private void LoadXPath(object sender, EventArgs e)
    {
        string xml = @"<item id='1' /><item id='2'/>";
    
        XmlReaderSettings set = new XmlReaderSettings();
        set.ConformanceLevel = ConformanceLevel.Fragment;
    
        XPathDocument doc = new XPathDocument(
            XmlReader.Create(new StringReader(xml), set));
    
        XPathNavigator nav = doc.CreateNavigator();
    
        Debug.Assert(nav.Select("/item").Count == 2);
    }
    

[](<http://11011.net/software/vspaste>)

Note how the query is "/item", which would return the single root element in a regular XML document, but here it returns the two items which are hanging from the "transparent" root (that's why I call it such, as there's no way to "see" it, not even by using the OuterXml on an XPathNavigator sitting on the root). 

If you're more of an XmlDocument guy, or maybe you need to perform updates to the fragments using random access via XPath queries too, then you're pretty much out of luck, as the XmlDocument will fails with a "System.Xml.XmlException: There are multiple root elements. Line x, position y." exception if you try to load an xml fragment (via string or XmlReader, doesn't matter). 

Here’s where a new class we added to the [Mvp.Xml](<http://www.codeplex.com/MVPXML> "MVP XML Library at CodePlex") library can help: XmlFragmentReader. This is an XmlReader-derived class which receives a root element name (and optionally a namespace) to fake a root node. Because it's an XmlReader class, it does so in a streaming fashion, and shouldn't have an impact in reading performance, as all its members just pass-through to the base reader (the one reading the fragments) except on the initial state and the ending one (where the fake root is reported). Usage is straighforward:
    
    
    private void LoadXml(object sender, EventArgs e)
    {
        string xml = @"<item /><item/>";
    
        XmlDocument doc = new XmlDocument();
    
        XmlReaderSettings set = new XmlReaderSettings();
        set.ConformanceLevel = ConformanceLevel.Fragment;
    
        using (XmlReader reader = **new XmlFragmentReader("root",**
            XmlReader.Create(new StringReader(xml), set)))
        {
            doc.Load(reader);
        }
    
        Debug.Assert(doc.SelectNodes("/root/item").Count == 2);
    }
    

Note that the root node is not transparent as is the case with the XPathDocument, so you have to include it in your XPath queries.

[Get the Mvp.Xml library](<http://www.codeplex.com/MVPXML>) and enjoy! 

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=29281)

Posted by kzu
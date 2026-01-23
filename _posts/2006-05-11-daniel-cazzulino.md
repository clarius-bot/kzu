---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-11 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Monday, May 31, 2004 - Posts

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060511072952im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Monday, May 31, 2004 - Posts

#####  [High-performance XML (III): returning well-formed XML from WebServices without XmlDocument](http://clariusconsulting.net/blogs/kzu/archive/2004/05/31/241.aspx)

Recently, [Matt Powell](http://blogs.msdn.com/mpowell) [wrote about returning XML from webservices](http://blogs.msdn.com/mpowell/archive/2004/05/12/130637.aspx), and I certainly agree with him that returning it as an opaque string is really bad. Later on, [Matevz Gacnik](http://www.request-response.com/blog/) [suggested a couple points to consider](http://www.request-response.com/blog/PermaLink.aspx?guid=40377625-162c-4072-a5f2-8cde75d3231a) when to choose one or the other. Matt [continued his rant ](http://blogs.msdn.com/mpowell/archive/2004/05/13/131377.aspx) this time tackling at the heart of the problem: why do you need to load a full-blown DOM just to get the nice XML returned from the webservice? At this point, I felt I should kick in. 

You see, one of the greatest things about having a fully OO platform is that you can easily complement what's missing by simply inheriting a couple classes, plugging your stuff in the infrastructure. So, let me state it clear and loud: you don't have to load an XmlDocument to return well-formed XML from webservices. Let's see how this is accomplished.

As you may already know, the ASP.NET WebMethod framework uses the XmlSerializer to convert arguments and return values to their XML representations. When your webmethod returns an XmlDocument, it will serialize the XmlDocument.DocumentElement, effectively the root element. If you return an XmlNode, it will simply serialize it. So, you could either return an XmlDocument *if you already have it at hand*, or an XmlNode (this could even be the DocumentElement of the previous one). The client will see the same WSDL and the Visual Studio Add Web Reference feature will generate a proxy returning an XmlNode in either case. So, *both* methods below result in the same proxy class:

`
    
    
    [WebMethod]   
    public XmlDocument MyDocumentMethod()   
    {   
     //...   
    }  
       
      
      
    [WebMethod] public XmlNode MyNodeMethod()   
    {   
     //...   
    }  
       
      
    // Proxy code   
    MyService proxy = new MyService();   
    XmlNode xml = proxy.MyDocumentMethod();   
    // or xml = proxy.MyNodeMethod(); 

`

When the XmlSerializer used to build the SOAP Body for our return value realizes it's an XmlDocument/XmlNode, it will simply call its WriteTo(XmlWriter w) method. So, what can we do with all this knowledge? Well, we can leverage it to avoid loading full DOMs when we have other (better IMO) representations such as an XmlReader or an XPathNavigator. The process is simply to create a special-purpose XmlNode-derived class that will serve as our trojan horse (very appropriate now that [Troy](http://www.imdb.com/title/tt0332452/) is in vogue ;)) into the webservice serialization infrastructure.

## Implementation

Implementing the XmlNode.WriteTo() method with an XmlReader is all too easy:

`
    
    
    private class XmlReaderNode : SerializableNode   
    {   
     private XmlReader _reader;   
     private bool _default;   
       
     public XmlReaderNode() {}   
     public XmlReaderNode(XmlReader reader, bool defaultAttrs)   
     {   
     _reader = reader;   
     _reader.MoveToContent();   
     _default = defaultAttrs;   
     }   
       
     public override void WriteTo(XmlWriter w)   
     {   
     w.WriteNode(_reader, _default);   
     _reader.Close();   
     }   
    } 

`

Note that we need to move the reader to the actual content, because we don't have to serialize the document declaration again, because the result is placed inside the SOAP body. We'll get to the base SerializableNode class in a minute. Basically it overrides everything and throws NotSupportedExceptions.

Implementing the XmlNode.WriteTo() method with an XPathNavigator is also easy, as we can take advantage of the [Mvp.Xml project](http://sf.net/projects/mvp-xml) [XPathNavigatorReader](http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx):

`
    
    
    private class XPathNavigatorNode : SerializableNode   
    {   
     private XPathNavigator _navigator;   
       
     public XPathNavigatorNode() {}   
     public XPathNavigatorNode(XPathNavigator navigator)   
     {   
     _navigator = navigator;   
     }   
       
     public override void WriteTo(XmlWriter w)   
     {   
     w.WriteNode(new XPathNavigatorReader(_navigator), false);   
     }   
    } 

`

Note that in both cases, we use the built-in infrastructure by calling the XmlWriter.WriteNode() method. Specially in the case of the XmlReaderNode, that means we're never building an in-memory DOM. In the case of the XPathNavigatorNode it means that we're working with the existing in-memory infoset, and we're not loading another one for the serialization.

The only "trick" in the base SerializableNode is in its constructor, because the base XmlNode and XmlElement don't allow empty constructors. The workaround was to create an element with a dummy name and an empty owner document:

`
    
    
    private abstract class SerializableNode : XmlElement   
    {   
     public SerializableNode() : base("", "dummy", "", new XmlDocument()) {}   
       
     public override XmlNode AppendChild(XmlNode newChild)   
     {   
     throw new NotSupportedException(SR.XmlDocumentFactory_NotImplementedDOM);   
     }   
     //...all other members...  
    } 

`

At this point you may be wondering why all these classes are private. Well, in order to isolate the user from the internal implementation details of these classes, I prefer to create a factory class that simply returns XmlNode values:

`
    
    
    public class XmlNodeFactory   
    {   
     private XmlNodeFactory() {}

``
    
    
     public static XmlNode Create(XPathNavigator navigator)   
     {   
     return new XPathNavigatorNode(navigator);   
     }   
     public static XmlNode Create(XmlReader reader)   
     {   
     return Create(reader, false);   
     }   
     public static XmlNode Create(XmlReader reader, bool defaultAttrs)   
     {   
     return new XmlReaderNode(reader, defaultAttrs);   
     }   
     //...private inner classes follow...   
    } 

`

## Usage

Now, let's get back to your webservice code. Most probably, specially if you have been reading my weblog and many others that advice against the XmlDocument, you'll already have an XmlReader or XPathNavigator you got from your business classes or your data access layer. With that at hand, you can simply use the following code:

`
    
    
    [WebMethod]   
    public XmlNode GetFromNavigator()   
    {   
     XPathNavigator nav;   
     // Get your navigator...   
     return XmlNodeFactory.Create(nav);   
    } 

``
    
    
    [WebMethod]   
    public XmlNode GetFromReader()   
    {   
     XmlReader reader;   
     // Get your reader, maybe even from SQL Server?...   
     return XmlNodeFactory.Create(reader);   
    } 

`

Note that I mention getting the reader from SQL Server. If you look at the XmlReaderNode code shown in the previous section, you'll notice that once the WriteTo() serialization method is invoked, the reader is closed.

The interesting thing in the XPathNavigator case is that you can position the navigator on the node you want to return, and have only that "fragment" serialized. For example:

`
    
    
    [WebMethod]   
    public XmlNode GetFromNavigator()   
    {   
     string xml = "<customer><order>25</order><info>Daniel Cazzulino</info></customer>";   
     XPathDocument doc = new XPathDocument(new StringReader(xml));   
     XPathNavigator nav = doc.CreateNavigator();   
     //Move to the customer node   
     nav.MoveToFirstChild();   
     //Move to the order node   
     nav.MoveToFirstChild();   
     return XmlNodeFactory.Create(nav);   
    } 

`

The returned data will be only the `<order>25</order>` element (and any children it may have). Cool, huh? That's XPathNavigatorReader courtesy ;)

The full project source code belongs to the [Mvp.Xml project](http://sf.net/projects/mvp-xml) and can be downloaded from [SourceForge](https://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234). Enjoy!

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted [Monday, May 31, 2004 1:18 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/05/31/241.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/05/31/241.aspx#comments)

  

[![](/web/20060511072952im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
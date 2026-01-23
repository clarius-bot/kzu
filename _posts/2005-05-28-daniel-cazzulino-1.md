---
layout: post
title: "Daniel Cazzulino"
date: 2005-05-28 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : High-performance XML (V): Increase performance on message-based web services by avoiding XmlDocument creation when using XmlSerializer

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2005/5/3.aspx "1 Post")| [4](http://clariusconsulting.net/blogs/kzu/archive/2005/5/4.aspx "1 Post")| 5| 6  
7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2005/5/9.aspx "1 Post")| 10| 11| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2005/5/13.aspx "1 Post")  
14| 15| 16| 17| 18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2005/5/20.aspx "1 Post")  
21| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2005/5/24.aspx "1 Post")| 25| 26| 27  
[28](http://clariusconsulting.net/blogs/kzu/archive/2005/5/28.aspx "2 Posts")| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502002023im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## High-performance XML (V): Increase performance on message-based web services by avoiding XmlDocument creation when using XmlSerializer 

In a previous post, [I discussed the way coarse-grained web service interfaces can be used in a strongly typed way](http://weblogs.asp.net/cazzu/archive/2005/04/12/VersioningWebMethods.aspx) by resorting to the xsd.exe or a [cool custom tool](http://weblogs.asp.net/cazzu/archive/2004/05/14/XsdCodeGenTool.aspx). The only problem with that approach is that in order to communicate with the service, you need to pass an `XmlNode`, when you actually have an instance of an object. People will usually write code like the following to call the service:

`
    
    
     // Customer is an XmlSerializer-friendly class  
    Customer cust = new Customer("Daniel", "Cazzulino", new DateTime(1974, 4, 9));
    
     
    
    // "Convert" the object to an XmlNode  
    XmlSerializer ser = new XmlSerializer(typeof(Customer));  
    XmlNode customerNode;
    
     
    
    using (MemoryStream mem = new MemoryStream())  
    {  
        ser.Serialize(mem, cust);  
        mem.Position = 0;  
        XmlDocument doc = new XmlDocument();  
        doc.Load(mem);
    
     
    
        customerNode = doc.DocumentElement;  
    }
    
     
    
    service.Execute(customerNode);

`

All the code to perform the XML serialization is so standard and repetitive that most developers will already have some sort of helper class with a single method that receives an objects and gives them back an `XmlNode` "view" of it. 

There are several problems with this approach, though, all of them affecting the performance of your application:

  * Even if the information of the object is already in memory in the typed class, a new "copy" is generated through the `XmlSerializer`, consuming more memory as a consequence (the MemoryStream). 
  * XML must be parsed from the stream, now consuming CPU processing
  * An `XmlDocument` with its entire object graph is built from the parsing process (that happens automatically when you call Load on it), which is now a different "view" of your object, but in terms of the DOM, which you will not use at all in your application

Interestingly, none of that is necessary, if you know the internal workings of the web service infrastructure used on the client-side proxy, which doesn't differ much from the one used on the server (asmx) side. 

The `XmlNode` you pass to the service method call must be serialized and embedded as the body of the SOAP message to send to the server. Just like I explained a while back that it happens on the server side, the infrastructure will call `XmlNode.WriteTo(XmlWriter w)` passing a writer to emit content to the body of the SOAP message. So all we need to do is hold a "faked" `XmlNode` until that method is called, and serialize the object graph directly to that writer instead:

`
    
    
    public class ObjectNode : XmlElement  
    {  
        private object serializableObject;
    
     
    
        // All arguments for the base class are irrelevant.  
        public ObjectNode(object serializableObject)  
            : base("mvp", "xml", string.Empty, new XmlDocument())  
        {  
            this.serializableObject = serializableObject;  
        }
    
     
    
        public override void WriteTo(XmlWriter w)  
        {  
            XmlSerializer ser = new XmlSerializer(serializableObject.GetType());  
            ser.Serialize(w, serializableObject);  
        }  
    }

`

Now your client code will look like the following:

`
    
    
    // Customer is an XmlSerializer-friendly class  
    Customer cust = new Customer("Daniel", "Cazzulino", new DateTime(1974, 4, 9));

`

service.Execute(new XmlObjectNode(cust));

Now your client application will never consume resources for copying the object to a stream, parsing and loading an `XmlDocument` just to make a web service call. This will result in a significant performance increment, which will depend on the kind of object graphs you usually serialize. 

For consistency with the approach I explained before for increasing the performance in this kind of scenario on the server side, the [Mvp.Xml](http://mvp-xml.sf.net/) project implements this as another overload on the `XmlNodeFactory` class, so that your code is completely isolated from the implementation (which could even be based on the inefficient one explained before). Consuming code is equally simple, though:

`
    
    
    service.Execute(XmlNodeFactory.Create(cust));
    
     
    
    The internal implementation is just another overload returning a custom SerializableNode type:
    
     
    
      
    public class XmlNodeFactory  
    {  
        public static XmlNode Create(object serializableObject)  
        {  
            return new ObjectNode(serializableObject);  
        }  
        ….  
        private class ObjectNode : SerializableNode  
        {  
            private object serializableObject;
    
     
    
            public ObjectNode() {}
    
     
    
            public ObjectNode(object serializableObject)  
            {  
                this.serializableObject = serializableObject;  
            }
    
     
    
            public override void WriteTo(XmlWriter w)  
            {  
                XmlSerializer ser = new XmlSerializer(serializableObject.GetType());  
                ser.Serialize(w, serializableObject);  
            }  
    }

`

You can [download the Mvp.Xml project (binary and sources) from SourceForge](http://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234&release_id=330695).

This post is part of the [XML Performance series](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted on Saturday, May 28, 2005 6:17 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/344.aspx) :: 

  

[![](/web/20060502002023im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
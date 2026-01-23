---
layout: post
title: "Daniel Cazzulino"
date: 2005-04-12 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Versioning messages in WebServices using XmlSerializer (was One parameter to rule them all)

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))| August 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2435'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| 7| 8| 9| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2005/4/12.aspx "1 Post")  
13| 14| 15| 16| 17| 18| 19  
[20](http://clariusconsulting.net/blogs/kzu/archive/2005/4/20.aspx "1 Post")| 21| [22](http://clariusconsulting.net/blogs/kzu/archive/2005/4/22.aspx "1 Post")| 23| 24| 25| 26  
[27](http://clariusconsulting.net/blogs/kzu/archive/2005/4/27.aspx "1 Post")| [28](http://clariusconsulting.net/blogs/kzu/archive/2005/4/28.aspx "1 Post")| [29](http://clariusconsulting.net/blogs/kzu/archive/2005/4/29.aspx "1 Post")| 30| 31| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060831004719im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Versioning messages in WebServices using XmlSerializer (was One parameter to rule them all) 

Some time ago, there was an exchange of opinions between [Don Smith](http://dev4net.com/blog/archive/2004/11/29/902.aspx) and [Dare Obasanjo](http://blogs.msdn.com/dareobasanjo/archive/2004/11/30/272113.aspx) about the merits of having coarse-grained web service interfaces (e.g. `XmlNode Execute(XmlNode message)`). Many believe this is an approach that eases long-term versioning of your service. The reason is that you can simply have a version number on the message itself and follow one of the following approaches when messages arrive (and you already support multiple message versions):

  1. Apply a transformation on the fly based on the message version: this can be done to upgrade an incoming version to the one that is supported by a single internal implementation, and/or to downgrade the response so that an older client can understand it.
  2. Route the message to the internal implementation that understands that particular message version.

Dare argued that this was pretty much a question of usability, as having an untyped interface receiving an `XmlNode` doesn’t make for a good API for your clients. I partly agree, but he was neglecting the existence of the xsd.exe/XmlSerializer combo. The way I see it, nobody will ever want to code against an untyped `XmlDocument`. For these coarse-grained web service methods, I’d distribute the corresponding schema that the payload is expected to comply with, which would be used on the client side to generate the .NET classes for a friendlier API. So the process would be:

  1. Service-side:
     1. Create the XSD
     2. Provide a version number to be specified at the message level
     3. Create the web service method receiving an XmlNode
  2. Client-side:
     1. Use the XSD distributed by the service provider to generate .NET classes with xsd.exe (or [the other cool custom tool ;)](http://weblogs.asp.net/cazzu/archive/2004/05/14/XsdCodeGenTool.aspx))
     2. Implement the client calls using the generated classes
     3. Generate the proxy for the service
     4. Create a helper class that generates an `XmlNode` given the `XmlSerializable` model
     5. Call the proxy with the node.

Given that doing 1.a. first is the recommended way of doing web services (a.k.a. contract-first), it seems not only logical but also something you would like to encourage your developers to do. Providing a version number at the message level is just a matter of adding a new attribute, which I like to call `SchemaVersion` (to avoid conflicts with potential payload `Version` attribute that may also be required, like `Product.Version`)

On the client side, if you’re using the [custom tool](http://weblogs.asp.net/cazzu/archive/2004/05/14/XsdCodeGenTool.aspx) the process is trivial. The helper class would simply serialize the object to a stream that you can later load into an `XmlDocument` ready to pass to the proxy. Note that the client API will remain strongly-typed until that last step of getting an `XmlNode` view of the object:
    
    
    MessageRoot root = new MessageRoot();  
     root.SchemaVersion = "1.0";   
        
     // Build other objects/properties required by the message.  
        
     proxy.Execute(XmlHelper.GetNode(root));

Of course if the service returns a node in turn, another call to the helper could give you back a strongly typed object again. 

NOTE: in another post I’ll show you how to avoid constructing an `XmlDocument` just to get an `XmlNode` view of an `XmlSerializable` object to pass to a web service.

## What’s missing

Ideally, I would have defined the `SchemaVersion` attribute on the message root to have a required fixed value:
    
    
    <xs:attribute;   
     name="SchemaVersion" type="xs:string" fixed="1.0";   
     use="required" />

When you do this, the `xsd.exe` tool will generate a property like the following:
    
    
    public MessageRoot() {   
         this.schemaVersionField = "1.0";   
     }   
     /// <remarks/>   
     [System.Xml.Serialization.XmlAttributeAttribute()]   
     [System.ComponentModel.DefaultValueAttribute("1.0")]   
     public string SchemaVersion {   
         get {   
             return this.schemaVersionField;   
         }   
         set {   
             this.schemaVersionField = value;   
         }   
     }

This implies that you wouldn’t need the line in the client that sets the version:
    
    
    root.SchemaVersion = "1.0";

This would imply that when a new version of the schema is redistributed, the client wouldn’t need to go and change that line according to the new version. Failure to do so will cause the message to be processed as an older version, so it becomes a very important detail.

The only problem is that, as [I reported a while back](http://labs.msdn.microsoft.com/productfeedback/viewfeedback.aspx?feedbackid=e9fa2f82-42cd-4d48-90b1-35211c8913d7), the `XmlSerializer` will NOT serialize the `SchemaVersion` as it’s annotated with the `DefaultValueAttribute` and it happens to match the current value of the property. 

So the only way (as of v1.x and until the [bug I reported](http://labs.msdn.microsoft.com/productfeedback/viewfeedback.aspx?feedbackid=e9fa2f82-42cd-4d48-90b1-35211c8913d7) is fixed) is to define the `SchemaVersion` as a required attribute, with a simple type with a pattern that validates the version we want to ensure:
    
    
    <xs:attribute   
     name="SchemaVersion" type="SchemaVersionType"   
     use="required" />   
     <xs:simpleType name="SchemaVersionType">   
          <xs:restriction base="xs:string">   
               <xs:pattern value="1.0" />   
          </xs:restriction>   
     </xs:simpleType>

The only problem is that now the generated class contains no hint whatsoever about the specific version that needs to be assigned to the property. Moreover, it’s up to the client code to go find the particular value, and set it to the object before passing it to the proxy. Not good at all, right?

It’s not too late to get this bug fixed in time for v2 and improve the versioning story for message-based web services, so hurry up and [vote for the bug](http://labs.msdn.microsoft.com/productfeedback/viewfeedback.aspx?feedbackid=e9fa2f82-42cd-4d48-90b1-35211c8913d7)!

posted on Tuesday, April 12, 2005 1:03 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/328.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/04/12/VersioningWebMethods.aspx#701 "permalink") re: Versioning messages in WebServices using XmlSerializer (was One parameter to rule them all) @ Thursday, August 10, 2006 3:11 PM

I have been tossing this idea around for the past couple of days. A couple of things come to mind. Your MessageRoot will need to be able to generically handle ISerializable types of objects (XmlNodes since you can't Serialize an Interface) AKA your Payload. This means you will need to convert your Serializable object into an XmlNode then add/set it to your MessageRoot. (fyi you can't use an object as DataSets will through fits when you try to serialize them as objects). Now you will need to create an XmlDocument for your Payload and also for your MessageRoot. Granted using your HelperFunction you will be able to speed up the Serialization of you MessageRoot but not the Payload. The second thing is when you get your XmlNode object from your WebService Execute() method, you will then have to convert the Node back to a MessageRoot object (or a RecieveObject of some sort), then parse the Return Payload out of an XmlNode Property. Both of these will require the creation of an XmlDocument which slows down processing. I like the theory, but I'm having a heck of a time with the execution, not to mention the issues with Generics in 2.0 and the problem debugging the webservice by stepping into it using your XmlNodeFactory used to speed up the XmlNode processing. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

Dex

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/04/12/VersioningWebMethods.aspx#719 "permalink") funny ringtones @ Saturday, August 19, 2006 6:30 AM

[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)/mp3/">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)/mp3/ ringtones site. [URL=[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)]qwest ringtones[/URL]: ringtones site free, ringtones site, Free nokia ringtones here. [url=[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)]nextel ringtones[/url] from website . [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[funny ringtones](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.la-ringtones.com "Anonymous")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/04/12/VersioningWebMethods.aspx#720 "permalink") funny ringtones @ Saturday, August 19, 2006 6:31 AM

<http://www.la-ringtones.com/mp3/> ringtones site. ringtones site free, ringtones site, Free nokia ringtones here. from website . [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[funny ringtones](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.la-ringtones.com "Anonymous")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/04/12/VersioningWebMethods.aspx#721 "permalink") mp3 ringtones @ Saturday, August 19, 2006 6:31 AM

<a href='[http://www.yahoo.com](http://www.yahoo.com/)'></a> [http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)/tones/">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)/tones/ <a href='[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)'>real ringtones</a>. <a href="[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/) ">motorola ringtones</a>: ringtones site free, ringtones site, Free nokia ringtones here. [url][http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)/ring/[/url] [link=[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)">[http://www.la-ringtones.com](http://www.la-ringtones.com/)]tracfone ringtones[/link] from site . [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

[mp3 ringtones](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.la-ringtones.com "Anonymous")

  

[![](/web/20060831004719im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
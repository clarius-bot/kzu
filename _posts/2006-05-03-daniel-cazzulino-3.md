---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-03 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, April 16, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2004/4/2.aspx "1 Post")| 3| 4| 5| 6  
7| 8| 9| 10| 11| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/4/13.aspx "2 Posts")  
[14](http://clariusconsulting.net/blogs/kzu/archive/2004/4/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/4/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/4/16.aspx "3 Posts")| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/4/19.aspx "2 Posts")| 20  
21| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/4/23.aspx "1 Post")| 24| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/4/25.aspx "1 Post")| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/4/26.aspx "2 Posts")| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060503165831im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Friday, April 16, 2004 - Posts

#####  [Damn Windows Application default solution item](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/208.aspx)

Finally I got tired of creating Windows Forms applications by mistake. You know, when you select Add New Project to a solution, it's the first item. I create FAR more class library projects than UI clients! 

So, I went to the C:\Program Files\Microsoft Visual Studio .NET 2003\VC#\CSharpProjects folder, open CSharp.vsdir in notepad, and switch the priority of CSharpEXE.vsz with the one for CSharpDLL.vsz. This is the fouth component of each line. It should look like the following:

`CSharpEXE.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2318|20|#2319|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4554| |WindowsApplication  
CSharpDLL.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2322|10|#2323|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4547| |ClassLibrary`

That's it. It will be the first item in the list forever... (until I hit [ one of those mondays at least](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=5b933df8-5d1b-49eb-a34f-29b61e188622))

BTW, there's no magic hacking here, it's [documented](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vsintro7/html/vxconvsdirfiles.asp). 

posted [Friday, April 16, 2004 8:42 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/208.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/208.aspx#comments)

#####  [Configuration, extensibility and namespaces](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/207.aspx)

The whole week I've been digging into a pretty large configuration file and its schema. It's [ Shadowfax](http://www.gotdotnet.com/Community/Workspaces/workspace.aspx?id=9c29a963-594e-4e7a-9c45-576198df8058) (Sfx), which I already introduced in a [ previous post](http://weblogs.asp.net/cazzu/archive/2004/04/16/114753.aspx). I see some points that allow for improvements, which mainly have to do with namespaces and extensibility.   
Let's recap about what namespaces are for. Here's what the [ W3C Namespaces in XML](http://www.w3.org/TR/REC-xml-names/#sec-intro) specification says in the motivation section: 

> We envision applications of Extensible Markup Language (XML) where a single XML document may contain elements and attributes (here referred to as a "markup vocabulary") that are defined for and used by multiple software modules. One motivation for this is modularity; if such a markup vocabulary exists which is well-understood and for which there is useful software available, it is better to re-use this markup rather than re-invent it. 
> 
> Such documents, containing multiple markup vocabularies, pose problems of recognition and collision. Software modules need to be able to recognize the tags and attributes which they are designed to process, even in the face of "collisions" occurring when markup intended for some other software package uses the same element type or attribute name. 

So, namespaces should be used when you expect a document to be extended by aggregating elements from multiple disparate schemas. This motivation has to drive the design of the schema, to allow for easy extensibility while retaining XML-friendliness with regards to the format. The following concrete points could be improved:

  1. Element prefixing: this is just a fragment of the file as it is now:  
Clearly, using a prefix is not necessary here. The Sfx namespace is the only one used in the whole document, so a default unprefixed namespace could be used on the root of the hierarchy, and the namespace rules of XML would propagate it to its children. Therefore, the fragment above is absolutely equivalent from the point of view of XML to the following one:  Consistency of namespaces and their use is also desired across the schemas for <referenceArchitecture>, <businessActionsDefinition>, <eventConfiguration>, etc. 
  2. Attributes with namespace: attributes shouldn't be assigned namespaces. It's common practice (and the W3C default) to leave attributes without namespaces. This also makes for more readable files. This default is changed in the Sfx schema by setting the `attributeFormDefault= "qualified"`. What this means is that all attributes in the instance document (the actual configuration file) must be prefixed, as the attributes are now part of the ` targetNamespace`:  ... This is pretty cumbersome to read and author, and doesn't really add value to the extensibilty/usability of the schema and the config file. This may be a valid (and even necessary) approach for a highly composed document such as a SOAP message is, where every WS-* spec defines its own attributes and elements, and almost everything is prefixed. But I wonder if this actually necessary in a config file... Leaving the default `attributeFormDefault` (or omitting it) in the schema, gives you the following valid instance:  ...  I believe this is far better and more familiar. Extensibility isn't hurt, as the `xs:anyAttribute` can still be used, but now you only force attribute prefixing on extensions, not built-in values, which are the more commonly used. This brings us to the last point. 
  3. Schema and configuration extensibility: Sfx is meant to be flexible and allow a wide range of applications. With this idea in mind, almost everything is configurable... to an extent. One of the key pieces in this architecture (and any other SOA-like) is to provide a platform of common services where your services (let's call them business actions -BA- as in Sfx) run. I envision that some BAs may need additional configuration in order to perform their work. I've worked on such an architecture and BA developers started developing custom configuration mechanisms for their libraries because the infrastructure didn't provide it, which led to serious maintenance and deploy problems.   
So, the schema for BA configuration should allow for open content in order to accomodate extensibility elements/attributes. 
  4. Configuration versioning: given the current target namespace for the configuration schema (`http://www.microsoft.com/practices/referencearchitecture/services/03-08-2004/ReferenceArchitectureSection.xsd`) it's only natural to infer that versioning will be handled through namespace changes, according to the release date. There's a [ lot of discussion in the community](http://www.google.com/search?q=xml+schema+versioning) about schema versioning, but most agree that versioning through namespace changes is not recommended. [ This document](http://www.xfront.com/Versioning.pdf) explains in a short and consice manner the available options. My suggesion to make the migration path in the future when configuration is upgraded as easy as possible for developers (and an optional upgrade tool) is to use the optional XSD version attribute in the schema, together with a new schemaVersion attribute in the configuration file. The schema would look like the following:  ...etc...  While the configuration would include the appropriate version attribute:  Now when v2 comes out, a tool can detect the version in the configuration file, and perform any relevant upgrade (for example through an XSLT transformation to accommodate elements to the new format). 

Finally, special care should be taken to specify the `type` attribute on all attribute declarations. 

Of course configuration is just the tip of the iceberg of such a comprehensive product. Shadowfax is a very interesting architecture to build applications on top. MS is very open on feedback from the community, so I expect it to become more and more polished and sleek over time. These are my 2 cents with regards to its configuration file.

If I misunderstood some points in the schema design, I'd be glad to hear from the Sfx dev guys! 

posted [Friday, April 16, 2004 7:25 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/207.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/207.aspx#comments)

#####  [Shadowfax: getting my hands dirty with a SOA-like architecture](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/206.aspx)

Recently, I started working with [ Shadowfax](http://www.gotdotnet.com/Community/Workspaces/workspace.aspx?id=9c29a963-594e-4e7a-9c45-576198df8058), a reference architecure coming from the [ Patterns & Practices](http://microsoft.com/practices) group at Microsoft. You have a look at an overview of the architecture at the GDN workspace home. I also recommend [ Hernan de Lahitte](http://weblogs.asp.net/hernandl)'s blog, one of the guys working on it. He has a nice [ introduction](http://weblogs.asp.net/hernandl/archive/2004/02/23/shadowfaxintro.aspx) as as well as a [ closer inspection](http://weblogs.asp.net/hernandl/archive/2004/03/01/82051.aspx) of the processing pipeline. 

I don't to repeat those intros. I'll just say that if you're developing SOA-like architectures, or you need one for your project, you should definitely take a look. It's being developed in a very open manner, with source releases pretty often, with open feedback through the workspace, and even if it's not ready for prime time yet, it's a good indication of where MS thinks you should be going with your projects. It closely follows the advises from [Application Architecture for .NET: Designing Applications and Services](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnbda/html/distapp.asp), and generally represents a pretty good compendium of best practices. It makes heavy use of several application blocks from PAG, su as [ Configuration Management Application Block](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnbda/html/cmab.asp), [ Authorization and Profile Application Block](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnpag/html/authpro_ch_04.asp) an the [ Logging Application Block](http://msdn.microsoft.com/library/en-us/dnpag/html/Logging.asp). 

As this is going to take most of my working day now, I'll start a new category for these posts. ~~I hope[ScottW](http://scottwater.com/) adds support for subscribing to a single category soon (as [dasBlog](http://www.dasblog.net/) does since quite a while...)~~. This way, you can subscribe to this single category if you want. 

I have the task of helping developers have a smooth experience when programming against Shadowfax. I'll drop my ideas here, as well as the dev. aids I think could be useful. Even if you don't use Shadowfax, it would be cool to get your feedback... because it's possible that some of my ideas seem useful only to me! Stay tunned, lots of posts are coming ;)

posted [Friday, April 16, 2004 3:57 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/206.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/04/16/206.aspx#comments)

  

[![](/web/20060503165831im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
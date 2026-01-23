---
layout: post
title: "Daniel Cazzulino's Blog : QNames in attribute values considered useful"
date: 2007-07-16 00:00:00 +0000
---

Daniel Cazzulino's Blog : QNames in attribute values considered useful

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081011144532im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081011144532im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081011144532im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081011144532im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## QNames in attribute values considered useful 

Quite some time ago (around XML raise as a universal data format), the W3C seemed to be in doubt of the value of QNames (prefix + local name) in attribute values. 

One very clean evidence of this inconsistency around the best practice on QNames on attribute values is the W3C XML Schema specification, which was pretty happy with QNames in attributes:
    
    
    <?xml version="1.0" encoding="utf-8"?>  
    <xs:schema targetNamespace="my-schema"   
                  xmlns="my-schema"  
                  xmlns:xs="<http://www.w3.org/2001/XMLSchema">>  
      <xs:element name="element1" type="xs:string" />  
    </xs:schema>

At the same time and in the complete opposite direction, the RDF specification, developed around the same time as XML itself, clearly favors XML entities instead of allowing QNames on attributes:
    
    
    <?xml version="1.0"?>
    **<!DOCTYPE rdf:RDF [<!ENTITY xsd "http://www.w3.org/2001/XMLSchema#">]>
    **
    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
             xmlns:exterms="http://www.example.org/terms/">
    
      <rdf:Description rdf:about="http://www.example.org/index.html">
        <exterms:creation-date **rdf:datatype=" &xsd;date"**>1999-08-16</exterms:creation-date>
      </rdf:Description>
    
    </rdf:RDF>

(from the [RDF Primer](http://www.w3.org/TR/rdf-primer/#rdfxml))

RDF explicitly forces the [rdfs:datatype](http://www.w3.org/TR/rdf-schema/#ch_datatype) and other attributes to be full [URI References](http://www.w3.org/TR/2004/REC-rdf-concepts-20040210/#section-Graph-URIref), which is why the only abbreviation mechanism is through XML entities. I find it hard to see why the above is any better than:
    
    
    <?xml version="1.0"?>
    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"  
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
             xmlns:exterms="http://www.example.org/terms/">
    
      <rdf:Description rdf:about="http://www.example.org/index.html">
        <exterms:creation-date **rdf:datatype="xsd:date"** >1999-08-16</exterms:creation-date>
      </rdf:Description>
    
    </rdf:RDF>

Given that XML Schema, SOAP, even XAML heavly uses QNames in attributes, I believe RDF is now in an awkward position maitaining that annoying restriction. It would be as simple to solve as saying "when a QName is used, it will be expanded using the XML prefix mapping in scope, plus the fragment identifier '#' plus the local name", so that xsd:date becomes <http://www.w3.org/2001/XMLSchema#date>.

posted on Monday, July 16, 2007 7:21 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/28626.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/07/16/QNamesinattributevaluesconsidereduseful.aspx#28627 "permalink") QNames in attribute values considered useful @ Monday, July 16, 2007 7:27 AM

Quite some time ago (around XML raise as a universal data format), the W3C seemed to be in doubt of the [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/07/16/qnames-in-attribute-values-considered-useful.aspx "TrackBack")

  

[![](/web/20081011144532im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
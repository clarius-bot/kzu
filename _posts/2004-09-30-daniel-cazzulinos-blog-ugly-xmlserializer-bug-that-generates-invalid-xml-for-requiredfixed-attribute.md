---
layout: post
title: "Daniel Cazzulino's Blog : Ugly XmlSerializer bug that generates invalid XML for required+fixed attributes."
date: 2004-09-30 00:00:00 +0000
---

Daniel Cazzulino's Blog : Ugly XmlSerializer bug that generates invalid XML for required+fixed attributes.


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081122061659im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081122061659im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081122061659im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081122061659im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Ugly XmlSerializer bug that generates invalid XML for required+fixed attributes. 

One common way of signaling the version of a configuration file that the processor of that file understands, is having an attribute (i.e. SchemaVersion) with the attributes use="required"fixed="[required version]". This way, all config files need to include such an attribute. When you evolve the schema, you can allow say "2.0" and most probably have XSLTs that automatically upgrades older versions, based on the version number you receive.

But this will not work with the XmlSerializer, not in Everett, neither in Whidbey so far.

The XSD 2 classes conversion process transforms an attribute that is both required and has a fixed value into the following class member (will be just a public field in v1.x):

` `

[System.ComponentModel.DefaultValueAttribute("1.0")]  
public string SchemaVersion {  
get {  
return this.schemaVersionField;  
}  
set {  
this.schemaVersionField = value;  
}  
}

The class constructor will initialize the field value to the fixed value specified in the XSD (and the serialization attribute).

When the XmlSerializer finds such a property, it generates the following code:

` `

if (((global::System.String)o.@SchemaVersion) != @"1.0") {  
WriteAttribute(@"SchemaVersion", @"", ((global::System.String)o.@SchemaVersion));  
}

This means that it will only serialize the attribute to the XML output if it was given a value other than the required one. This rule doesn't make sense. This means it will generate XML that doesn't validate against the schema it was created from. 

So if you create an instance of the class (or deserialize from a valid XML file), assign the required property to the required value (which isn't necessary because it will already have the initialized value), that property it will never get serialized, no matter what. 

This effectively means that you not roundtrip: valid XML -> Object Model -> valid XML. The third step will always be invalid, as the attribute is not emited.

Repro:

  1. Create an XSD file with an element that has an attribute required and with a fixed value. 
  2. Call XSD.EXE /c with it to generate the class. 
  3. Create an XML that is valid according to the schema. 
  4. Create a console app that uses the XmlSerializer to deserialize the XML into the classes, using XSD validating reader 
  5. Use the serializer to serialize the in-memory representation of the XML into a stream again 
  6. Try to deserialize again with this new stream, using an XSD validating reader.

Solution to the problem may be to have a new XML Serialization attribute which signals the attribute has a fixed value (so it should always be emited, unlike the DefaultValue one). 

Please [vote for this bug](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=e9fa2f82-42cd-4d48-90b1-35211c8913d7), I think it's an important one.

**Update:** the bug has been fixed in .NET 2.0, and now you should be able to have a fixed value serialized properly. Great!!!

posted on Thursday, September 30, 2004 8:50 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20081122061659im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
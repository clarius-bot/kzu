---
layout: post
title: "Daniel Cazzulino's Blog : Typed XmlReaders: bridging the gap between streaming and object model APIs."
date: 2004-03-12 00:00:00 +0000
---

Daniel Cazzulino's Blog : Typed XmlReaders: bridging the gap between streaming and object model APIs.


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081121212555im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081121212555im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081121212555im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081121212555im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Typed XmlReaders: bridging the gap between streaming and object model APIs. 

When dealing with XML in .NET, you're mostly faced with two options:

  * Streaming API: the XmlReader. 
  * Object model API: either XmlDocument, XPathDocument or an XmlSerializer-aware custom object model.

Several reasons can lean you towards any of the later ones, such as strong typing (XmlSerializer), flexibility and XPath querying (XmlDocument and XPathDocument), etc. Any of the three object model API approaches, however, require the entire XML input to be parsed and loaded to memory. Therefore, when you're presented with large documents, or need the fastest processing, all you're left with is the XmlReader. If you worked with it doing anything but the most trivial XML processing, you know how ugly it can become. Lots of string comparison, endless switch, if, loops, whatever. 

From my point of view, working against a custom object model is best, as it gives you a level of abstraction from the wire format, and you get to work with OO classes and properties, which is far more comfortable than dealing with InnerXml, Value, etc. If you haven't tried the XmlSerializer approach before, you definitely should. 

When you move to streaming processing, you lose all that. And you don't lose it because the abstractions of your entities have disappeared, as you most probably have an XML Schema defining what the XML must look like. You just lose it because of the API. You can still use the XML Schema to validate as you read, and get some (very little) extra functionality from the `XmlValidatingReader.ReadTypedValue()` method. If you're like me, you may be asking: given that I know the schema at design time, isn't there a way to use it to make things **easier for me**?

And that's not the only issue. Validating against an XML Schema, even if it's absolutely a really good idea to keep your application data consistent and considerably reduce your own validation code, is not for free. According to tests I've done with the (fairly simple) purchase order schema and instance document in [XML Schema Part 0: Primer](http://www.w3.org/TR/xmlschema-0/), `XmlValidatingReader` is between 10X and 12X slower than the `XmlTextReader`. Not that this is a bad number, just that you need to have that in mind. And why is it so costly? Well, mostly because it's a generic XML Schema validator, which means as it parses, it checks valid transition between states, data types, facets, etc. And again, given that I know the schema at design time, isn't there a way to use it to make things **easier for the parser**? 

## Typed readers

Just as typed datasets build upon the generic DataSet to bring strong-typing and validation to the game, based on an XML Schema, wouldn't it be great if the same existed for readers?   
A typed reader should be built upon the XmlReader and provide the same validation capabilities as XmlValidatingReader, but at a fraction of the cost, because it would already know all the elements, attributes and types, and it would also be able to read and validate an specific schema.

Given [a purchase order](http://www.w3.org/TR/xmlschema-0/#po.xml) document, I could write code as follows: 

poReader r = new poReader( inputStream ); if (r.Read()) { // Typed date for the orderDate attribute. Console.WriteLine( r.orderDate.ToShortDateString() ); shipToReader shipto = r.ReadshipTo(); // Country attribute turned into an Enum if (shipto.country == shipToCountry.US) Console.WriteLine( "US!!" ); // An inner simple-typed element is made a property // In OO, there's no distinction between this and an attribute. Console.WriteLine( shipto.name ); }

Maybe it should be something more like this:

poReader r = new poReader( inputStream ); while (r.Read()) { if (r.TypedReader is shipToReader) { shipToReader shipto = (shipToReader) r.TypedReader(); // Work against the typed one now. } else if (r.TypedReader is itemsReader) { // Do so for items. } }

I sort of prefer the later. The `TypedReader` property would contain the instance used to read (and validate) the current element content model, which would be the current [ strategy](http://www.dofactory.com/patterns/PatternStrategy.aspx) being applied. With the advent of generics, maybe I should even be allowed to pass the typed reader I want... 

r.Read();

I guess in Whidbey that would be way to implement it internally, anyways....

Another possible use is dynamic run-time generation of these typed readers for a schema. If we can prove that performance will increase, we could use the typed readers not to gain usability but to gain speed. This could be a specialized factory that emits the code (the same your would get at design time) to execute:

XmlSchema sch = new XmlSchema.Read(theFile, null); XmlReader r = XmlTypedFactory.CreateReader( sch );

The factory itself would keep cached versions of the Types it has already generated from a certain schema...

So, what do you think about such an idea? Is it useful? Would you use it? What should the API look like?

This may be part of the new [Mvp.Xml](http://sf.net/projects/mvp-xml) project most XML MVPs (including me, of course) are heading.

posted on Friday, March 12, 2004 11:32 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20081121212555im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
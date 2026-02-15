---
layout: post
title: W3C XML Schema type system &amp;lt; - &amp;gt; CLR type system
date: 2004-02-20 00:00:00 +0000
tags:
- XML
- .NET
- ef
- All Technology
- ASP.NET
---
I've had some discussions with co-workers and colleages about the WXS (W3C XML Schema) type system and its relation with the CLR one. We all agree that many concepts in WXS don't map to anything existing in OO languages, such as derivation by restriction, content-ordering (i.e. sequence vs choice), etc. However, in the light of the tools the .NET Framework makes available to map XML to objects, we usually have to analyze WXS (used to define the structure of that very XML instance to be mapped) and its relation with our classes. 

When you use the XmlSerializer to get a CLR object filled with data in the XML, you're actually mapping it to the CLR type system. Moreover, when you use xsd.exe /classes tool, you're effectively translating WXS types to CLR ones. You get classes with `System.String` type corresponding to `xs:string`, and the like. Dare explains this in [ his article in MSDN](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnexxml/html/xml01202003.asp?frame=true&hidetoc=true). The .NET Framework documentation about the [ XmlSerializer](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfSystemXmlSerializationXmlSerializerClassTopic.asp?frame=true&hidetoc=true) class explicitly states: 

> To transfer data between objects and XML requires a mapping from the programming language constructs to XML Schema and vice versa. The XmlSerializer, and related tools like Xsd.exe, provide the bridge between these two technologies at both design time and run time.

Even the [ XmlValidatingReader.ReadTypedValue](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfSystemXmlXmlValidatingReaderClassReadTypedValueTopic.asp) performs this map transparently for simple types, which is thoroughly documented in the product documentation under the title [ Data Type Support between XML Schema (XSD) Types and .NET Framework Types](http://msdn.microsoft.com/library/en-us/cpguide/html/cpcondatatypesupportbetweenxsdtypesnetframeworktypes.asp). At the PDC, [new and even more comprehensive mapping tools/approaches](http://weblogs.asp.net/dmarsh/articles/34308.aspx) were shown.

But let's go beyond the simpleType (almost) natural mapping between WXS and the CLR. We can have an abstract complexType in WXS named Person, and derive by extension Employee and Customer ones. Our root element, which will be a list of the contacts we know about, can be a choice of any of them, like so: 

Now, what do you think such types would look in .NET world? Well, I don't think it takes an expert in WXS to realize that these types map nicely with an abstract Person class, and Employee and Customer derived types. We can confirm that by running `xsd.exe /classes` with this schema, and we will get the following .NET classes:

/// [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://aspnet2.com/xsdvsclr")] [System.Xml.Serialization.XmlRootAttribute(Namespace="http://aspnet2.com/xsdvsclr", IsNullable=false)] public class Contacts { /// [System.Xml.Serialization.XmlElementAttribute("Employee", typeof(Employee))] [System.Xml.Serialization.XmlElementAttribute("Customer", typeof(Customer))] public Person[] Items; } /// [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://aspnet2.com/xsdvsclr")] [System.Xml.Serialization.XmlIncludeAttribute(typeof(Customer))] [System.Xml.Serialization.XmlIncludeAttribute(typeof(Employee))] public abstract class Person { /// public string FirstName; /// public string LastName; } /// [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://aspnet2.com/xsdvsclr")] public class Employee : Person { /// public string EmployeeID; } /// [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://aspnet2.com/xsdvsclr")] public class Customer : Person { /// public string CustomerID; }

Note that the XSD tool was even smart enough to realize that as both expected elements in the WXS choice for the `Contact` element inherit from the same Person type, they can actually be part of the same array type, which is defined as `Person[] Items`. That looks like a pretty nice fit. 

In this light, I'm conducting a survey about developer's view on the relation of the XSD type system and the .NET one. Ignoring some of the more advanced (I could add cumbersome and confusing) features of WXS, would you say that both type systems fit nicely with each other? 

Valid votes (through comments, will be summed up in this post description) are: YES (they fit nicely) and NO (they don't). 

The later sort of implies that you think MS is pushing the similarities too far, and that it's not good. I look forward your comments and votes!

Current votation: YES=13, NO=0 

/kzu

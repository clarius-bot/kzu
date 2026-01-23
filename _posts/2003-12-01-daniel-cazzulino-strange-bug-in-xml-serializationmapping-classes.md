---
layout: post
title: "Daniel Cazzulino : Strange bug in XML Serialization/Mapping classes"
date: 2003-12-01 00:00:00 +0000
---

## Strange bug in XML Serialization/Mapping classes 

While trying to customize the generated code for an XmlSchema, using the technique explained in a [previous post](http://weblogs.asp.net/cazzu/posts/33302.aspx), I came to a point where I can't advance any further as the framework classes are throwing an exception where they shouldn't.   
The customization process basically involves using the `XmlSchemaImporter` class and using its `ImportTypeMapping()` method. To further customize it, I wanted to modify the type members, therefore, I tried to use the `ImportMembersMapping()` with exactly the same (working) `XmlQualifiedName` used for the previous method. I got an `InvalidCastException` thrown in the face :S. Here's the damn stack trace:

`
    
    
    System.InvalidCastException: Specified cast is not valid.
      at System.Xml.Serialization.XmlMembersMapping..ctor(TypeScope scope, ElementAccessor accessor)
      at System.Xml.Serialization.XmlSchemaImporter.ImportMembersMapping(XmlQualifiedName name)

`

MS, help!!! Calling code is simple:

`
    
    
    // Works
    XmlTypeMapping map = imp.ImportTypeMapping( element.QualifiedName );
    // Blows
    XmlMembersMapping members = imp.ImportMembersMapping( element.QualifiedName );

`

posted on Monday, December 01, 2003 6:06 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

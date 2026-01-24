---
layout: post
title: "Daniel Cazzulino's Blog - XmlSerializer and open content models"
date: 2003-12-22 00:00:00 +0000
---

## XmlSerializer and open content models 

Using the built-in code generation features (let's say xsd.exe or the approach I've [outlined](http://weblogs.asp.net/cazzu/posts/33302.aspx)), the generated classes use the `System.Xml.Serialization.XmlAnyElementAttribute` and `System.Xml.Serialization.XmlAnyAttributeAttribute` to capture the foreign elements and attributes in an instance document. Unfortunately, this is not enough.

Let me explain: one cool thing about the `XmlSerializer` is that you can trap "unknown" (i.e. not belonging to the XSD schema for the document) nodes (either elements or attributes) by attaching to the `UnknownNode`, `UnknownAttribute` or `UnknownElement` events. This may be useful if you want to trap these elements and do something with them. For example, I could attach an `my:postProcessor="My.PostProcessorClass, My"` attribute to an element and provide custom post-deserialization processing for it. To allow that, you have to make the content model (at least for attributes) open, so that the XSD validation won't fail when it finds such an attribute. The usual way is to add the following to a complex type definition:

`
    
    
    <xs:anyAttribute namespace="##other" processContents="skip" />

`

/kzu

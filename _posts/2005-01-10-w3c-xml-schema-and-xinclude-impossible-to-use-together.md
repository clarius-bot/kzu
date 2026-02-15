---
layout: post
title: 'W3C XML Schema and XInclude: impossible to use together???'
date: 2005-01-10 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/XsdAndXInclude
tags:
- .NET
- All Technology
- XML

---

On a project I'm working on for [MS Patterns & Practices](http://www.microsoft.com/practices), we were excited about the [XInclude spec becoming a recomendation](http://www.w3.org/2004/11/xinclude-pr) and anxious about using it in our project, which is quite heavy on XML usage for configuration. The modularization that could be introduced transparently by XInclude was very compelling. Even if it [will hardly be implemented in .NET v2](http://weblogs.asp.net/cazzu/posts/XIncludeRec.aspx), we could still take advantage of the [Mvp.Xml](http://mvp-xml.sf.net/) project [XInclude.NET](http://mvp-xml.sourceforge.net/xinclude/index.html) implementation [Oleg ](http://www.tkachenko.com/blog/)did. But apparently it's almost impossible to use XInclude and XSD validation together :(  
  
The problem stems from the fact that XInclude (as per the spec) [adds the xml:base attribute to included elements](http://www.w3.org/TR/2004/REC-xinclude-20041220/#base) to signal their origin, and the same can potentially happen with xml:lang. Now, the W3C XML Schema spec says:  

#### 3.4.4 Complex Type Definition Validation Rules

#### 

****Validation Rule: Element Locally Valid (Complex Type)  
...  
********

3 For each attribute information item in the element information item's [[attributes]](http://www.w3.org/TR/xml-infoset/#infoitem.element) excepting those whose [[namespace name]](http://www.w3.org/TR/xml-infoset/#infoitem.attribute) is identical to `http://www.w3.org/2001/XMLSchema-instance` and whose [[local name]](http://www.w3.org/TR/xml-infoset/#infoitem.attribute) is one of `type`, `nil`, `schemaLocation` or `noNamespaceSchemaLocation`, the appropriate **case** among the following must be true:

And then goes on to detailing that everything else needs to be declared explicitly in your schema, including xml:lang and xml:base, therefore :S:S:S.   
  
So, either you modify all your schemas to that each and every element includes those attributes (either by inheriting from a base type or using an attribute group reference), or you validation is bound to fail if someone decides to include something. Note that even if you could modify all your schemas, sometimes it means you will also have to modify the semantics of it, as a simple-typed element which you may have (with the type inheriting from xs:string for example), now has to become a complex type with simple content model only to accomodate the attributes. Ouch!!! And what's worse, if you're generating your API from the schema using tools such as xsd.exe or the much better [XsdCodeGen custom tool](http://weblogs.asp.net/cazzu/posts/XsdCodeGenTool.aspx), the new API will look very different, and you may have to make substancial changes to your application code.  
  
This is an important issue that should be solved in .NET v2, or XInclude will be condemned to poor adoption in .NET. I don't know how other platforms will solve the W3C inconsistency, but [I've logged this as a bug](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?FeedbackId=29376d16-5e56-47d5-a239-f2add05e78bc) and I'm proposing that a property is added to the [XmlReaderSettings](http://msdn2.microsoft.com/library/tyt9ka3c.aspx) class to specify that XML Core attributes should be ignored for validation, such as XmlReaderSettings.IgnoreXmlCoreAttributes = true. Note that [there are a lot of Ignore* properties already](http://msdn2.microsoft.com/library/t4hts0ce.aspx) so it would be quite natural.  
  
Please [vote the bug if](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?FeedbackId=29376d16-5e56-47d5-a239-f2add05e78bc) you feel it's important, and better yet, think of a better solution to it!!! ;)  
  
  

/kzu

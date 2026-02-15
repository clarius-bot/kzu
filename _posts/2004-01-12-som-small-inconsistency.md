---
layout: post
title: SOM small inconsistency
date: 2004-01-12 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/57794
tags:
- XML

---

Have you noticed that even if the [W3C WXS spec](http://www.w3.org/TR/2001/REC-xmlschema-1-20010502/#element-schema) allows annotations in the root `<xs:schema>` element, the corresponding .NET class [XmlSchema](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemxmlschemaxmlschemaobjectclasshierarchy.asp) does not inherit from [XmlSchemaAnnotated](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemxmlschemaxmlschemaannotatedclasshierarchy.asp) as almost every other element does?  
Looks like an "inheritance bug" to me ;) 

[Update]: [Dare](http://weblogs.asp.net/cazzu/archive/2004/01/12/57794.aspx#58080) corrected my mistake by clarifying that there can be multiple annotations, unlike the other SchemaAnnotated-derived classes. However, I couldn't find any [XmlSchema member](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemxmlschemaxmlschemamemberstopic.asp) exposing such information. Therefore, the only workaround seems to be to keep an XPathDocument for the schema too.

/kzu

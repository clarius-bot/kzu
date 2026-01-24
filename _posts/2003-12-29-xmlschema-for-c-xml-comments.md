---
layout: post
title: "Daniel Cazzulino's Blog - XmlSchema for C# XML Comments"
date: 2003-12-29 00:00:00 +0000
---

## XmlSchema for C# XML Comments 

[Sometime ago](http://groups.google.com/groups?q=daniel+cazzulino&hl=en&lr=&ie=UTF-8&selm=%23QJg1ulSCHA.1672%40tkmsftngp12&rnum=7), I created this schema to perform some extra validation on the comments, as well as use it as a starting point to adding my own required elements for all projects. This was mainly a "need" for the [NMatrix](http://sf.net/projects/dotnetopensrc) project, for example, requiring an `<author name="Daniel Cazzulino" mail="kazzupepe@hotmail.com" />` tag in all public classes I create. 

I think it may be useful to someone, so [here it is again](http://dotnetopensrc.sf.net/CsComments.xsd). A valid cool XML comment that many ignore is `<see langword="[c# language keyword]" />` that automatically gets italicized and shows the appropriate VB.NET equivalent. Look for `<!-- undocumented element -->"` in the schema for other interesting ones. 

/kzu

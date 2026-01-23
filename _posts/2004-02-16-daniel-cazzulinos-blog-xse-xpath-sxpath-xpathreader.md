---
layout: post
title: "Daniel Cazzulino's Blog : XSE != XPath != SXPath != XPathReader"
date: 2004-02-16 00:00:00 +0000
---

## XSE != XPath != SXPath != XPathReader 

[Dare](http://www.25hoursaday.com/weblog/CommentView.aspx?guid=a333b9f4-0a67-45fd-913d-3b9bc37cf4b6) argues that my [Xml Streaming Events](http://weblogs.asp.net/cazzu/posts/XseIntro.aspx) API can't support queries like the following:

/r:feeds/r:feed[count(r:stories-recently-viewed)>10]/r:title

And argues that I'm adding extensions to XPath. I've mentioned in [a previous post](http://weblogs.asp.net/cazzu/posts/PseudoXPath.aspx) that I'm not doing that. I'm not *supporting* XPath. Therefore, the query testing for count of children won't work (for now). But the issue is a different one: XSE is not about querying with an specific expression language/format (i.e. XPath or SXPath). XSE is just a mechanism for encapsulating state machines checking for matches against a given expression. What the expression looks like depends on the factory that creates the strategy.   
Therefore, the factories I showed (i.e. my RootedPath and RelativePath) are only encapsulating code generation for different FSMs, based on an expression language that fits a need. Therefore, I could even create a factory implementing SXPath and still remain in Xml Streaming Events land. The XSE idea is to provide a callback metaphor to XML parsing, instead of the pull-model of the XmlReader. In fact, it's a sort of evolution over SAX, in that at the same time it offers both worlds: pull model directly from the XseReader, events-based for your registered handlers.

/kzu

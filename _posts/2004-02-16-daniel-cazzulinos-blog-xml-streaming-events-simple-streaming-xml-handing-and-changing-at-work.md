---
layout: post
title: "Daniel Cazzulino's Blog : Xml Streaming Events: simple streaming Xml handing (and changing) at work."
date: 2004-02-16 00:00:00 +0000
---

Daniel Cazzulino's Blog : Xml Streaming Events: simple streaming Xml handing (and changing) at work.

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081122015235im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081122015235im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081122015235im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081122015235im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

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

## Xml Streaming Events: simple streaming Xml handing (and changing) at work. 

I presented XSE (Xml Streaming Events) in [ a previous post](http://weblogs.asp.net/cazzu/posts/XseIntro.aspx). In this post I will show some examples of what can be acomplished with it in a streaming (therefore performant) way. 

IMPORTANT NOTICE: for anyone not playing with Whidbey, all statements that look like `delegate { ... //.net code ... }` can be replaced with the usual v1.x `new EventHandler( yourMethod )` where the method implements the code inside the brackets.

## Upgrading namespaces

Sometimes there's a need to perform some on-the-fly change in a document stream. For example, imagine you have upgraded your schemas to a different namespace (i.e. from `xmlns:kzu="http://kzu.aspnet2.com/2003/schematron"` to ` xmlns:kzu="http://kzu.aspnet2.com/2004/schematron")`. I know there are several discussions all over the web (see [Dare's post](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=4d18d061-8895-46e0-b5b5-7d51c7fb8898), [David Orchad's](http://www.pacificspirit.com/blog/2004/01/19/providing_compatible_schema_evolution), etc.) on schema versioning, and most (including me) agree that changing the namespace name is not versioning at all. It's a whole new schema. Aside from that, there are concrete cases where this has happened and will happen, as well as your own business requirements. Right now I can think of WXS and SOAP as two concrete examples. With XSE, it can be achieved easily at the reader level (that is, BEFORE you even load a `SoapMessage`, `XPathDocument` or whatever): 

// Upgrading namespaces TransformingXseReader xr = new TransformingXseReader(new XmlTextReader(input)); XmlNamespaceManager mgr = new XmlNamespaceManager(xr.NameTable); mgr.AddNamespace("kzu", "http://kzu.aspnet2.com/2003/schematron"); xr.AddHandler(new RelativePath().Create("kzu:*", mgr), delegate { // Upgrade to 2004 namespace. Keep original element name. xr.ChangeName(xr.LocalName, "http://kzu.aspnet2.com/2004/schematron"); });

Note that the transformation feature is layered on top of the base `XseReader` so that I only have to pay the performance cost for what I use. If I don't need modifications to the InfoSet, I don't have to pay for the cost of checks for transformations. A document loaded with this reader will see an infoset complying with the new namespace. I can hand this reader to an `XmlValidatingReader` and have it validated against the new schema (remember there's a [known](http://weblogs.asp.net/cazzu/archive/2003/11/06/36209.aspx) [bug]() in v1.x validating reader that prevents this, but it has been fixed in v2). Note that because we're matching with a wildcard, this works at any level in the document. For example, the following document: 

Is upgraded as follows:

Note that a root-element namespace change alone is not enough. So, in order to achieve similar functionality today, a full string loading and find&replace would need to be issued. Again, full streaming support is a top priority for XSE.

## Simple element name transformations

Another common use case is simple name changes in a document. For example, an incoming document may have a `<customer>` element when you expect a `<person>`, or an `<orderDate>` when you need an `<ordered>` element. XSE removes the need for full document loading and XSLT stylesheet creation and processing that would be required for such a simple case:

// Changing names TransformingXseReader xr = new TransformingXseReader(new XmlTextReader(input)); XmlNamespaceManager mgr = new XmlNamespaceManager(xr.NameTable); mgr.AddNamespace("crm", "http://thirparty.crm.com/"); xr.AddHandler(new RelativePath().Create("crm:customer", mgr), delegate { // Upgrade our person element and namespace xr.ChangeName(xr.NameTable.Add("person"), "http://kzu.aspnet2.com/"); });

Note that I changed at the same time the element name and namespace. 

## Simple content adaptation

In the above example, I showed changing a `<customer>` element name and namespace to the expected `<person> `one. Combined with node skipping, I can adapt (sort-of downgrade in this case) the former element to your desired representation. For example, if the `<customer>` element includes a `<contact>` children that our `<person>` element doesn't expect, I can simply skip it:

TransformingXseReader xr = new TransformingXseReader(new XmlTextReader(input)); XmlNamespaceManager mgr = new XmlNamespaceManager(xr.NameTable); mgr.AddNamespace("crm", "http://thirparty.crm.com/"); xr.AddHandler(new RelativePath().Create("crm:customer", mgr), delegate { // Upgrade our person element and namespace xr.ChangeName(xr.NameTable.Add("person"), "http://kzu.aspnet2.com/"); }); xr.AddHandler(new RelativePath().Create("crm:contact", mgr), delegate { // Skip this element as I'm not interested in it or it's unsupported in my schema xr.Skip(); });

## Transparent elements and namespaces

James Clark [has proposed](http://www.idealliance.org/papers/dx_xml03/papers/04-05-03/04-05-03.html) what he calls Transparent namespaces in his [Namespace Routing Language (NRL)](http://xml.coverpages.org/Clark-NRL-Announce.html) proposal, which may make it into the [ISO/IEC 19757 Document Schema Definition Languages (DSDL)](http://www.dsdl.org/). He gives examples where it is useful to have an element ignored from the stream, as if it didn't exist at all, but without losing its content. This is different than `XmlReader.Skip()` method in that the later stops parsing the skipped element's children. He gives as an example an XSLT stylesheet containing XHTML, for example:

  * 

It's impossible to validate the XHTML against the corresponding schema, unless you modify it accordingly to include extension points all over the place. The proposed solution is to make the xsl:* elements transparent for the validation process, while retaining their children. James proposes this "transparentizing" at the namespace level. This can be easily achieved with XSE: 

// Transparentize TransformingXseReader xr = new TransformingXseReader(new XmlTextReader(input)); XmlNamespaceManager mgr = new XmlNamespaceManager(xr.NameTable); mgr.AddNamespace("xsl", "http://www.w3.org/1999/XSL/Transform"); xr.AddHandler(new RelativePath().Create("xsl:*", mgr), delegate { // Turns all XSLT elements transparent. xr.MakeTransparent(); });

Note that I'm using a special wildcard supported by XSE. Wildcard options are: 

  * * : mathes any element in any namespace. Is equivalent to `*:*`.
  * *:item : matches an item with a `LocalName="item"`, irrespective of namespace.
  * kzu:* : matches any element in the namespace mapped to the "kzu" prefix by the `XmlNamespaceManager`.
  * :* : matches any element with a `NamespaceURI=""`. Note that this is not the same as `*:*` (first option). 

Therefore, making elements transparent is supported at a more granular level than that proposed by James. If a document is loaded (or a `ReadOuterXml()` is performed on the reader), the following infoset is seen: 

  * 

And of course, as the implementation supports streaming scenarios, you can pass it to the next processing hop without ever loading the entire stream. Another example is processing the body of a SOAP message:

TransformingXseReader xr = new TransformingXseReader(new XmlTextReader(input)); XmlNamespaceManager mgr = new XmlNamespaceManager(xr.NameTable); mgr.AddNamespace("soap", "http://schemas.xmlsoap.org/soap/envelope/"); IStrategyFactory relative = new RelativePath(); xr.AddHandler(new RootedPath().Create("soap:Envelope", mgr), delegate { // Preserve the envelope contents. xr.MakeTransparent(); }); xr.AddHandler(relative.Create("soap:Header", mgr), delegate { // Don't bother about headers. xr.Skip(); }); xr.AddHandler(relative.Create("soap:Body", mgr), delegate { // Definitely keep the body content. xr.MakeTransparent(); });

Handing this reader to the processing phase will result in only the contents of the `soap:Body` to be seen.

## Skip irrelevant content

Finally, if we're processing XML with mixed namespaces, it may be the case that our application only cares about elements from our own namespace. In such cases, loading irrelevant nodes in a document is a clear waste of resources. We can choose to make those other nodes transparent or skip them altogether:

TransformingXseReader xr = new TransformingXseReader(new XmlTextReader(input)); XmlNamespaceManager mgr = new XmlNamespaceManager(xr.NameTable); mgr.AddNamespace("dc", "http://purl.org/dc/elements/1.1/"); mgr.AddNamespace("rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#"); IStrategyFactory relative = new RelativePath(); xr.AddHandler(relative.Create("dc:*", mgr), delegate { // Skip Dublin Core elements. xr.Skip(); }); xr.AddHandler(relative.Create("rdf:*", mgr), delegate { // Make RDF elements transparent. xr.MakeTransparent(); });

I still have to decide on what syntax would be the most convenient way to say "match everthing that is NOT in this namespace". Options I can think of are:

  1. ^kzu:* 
  2. !kzu:* 
  3. Create another strategy factory that interprets the matches as negative asserts instead of positives. i.e.: IMatchStrategy nonblank = new NegativeRelativePath().Create(":*"); Instead of matching anything with a blank namespace would match anything with a non-blank NamespaceURI. 

As usual, I look forward your feedback as I finish setting up the opensource project for this.

**Update: read these follow-up:**

  * [XPath queries without namespace: XSE to the rescue](http://weblogs.asp.net/cazzu/archive/2004/02/16/XPathNonNS.aspx)
  * [XPath vs pseudo-XPath](http://weblogs.asp.net/cazzu/archive/2004/02/16/PseudoXPath.aspx)
  * [XSE Initial Release](http://weblogs.asp.net/cazzu/archive/2004/02/16/XSERelease.aspx)
  * [XSE != XPath != SXPath != XPathReader](http://weblogs.asp.net/cazzu/archive/2004/02/16/XseNotXPath.aspx)

posted on Monday, February 16, 2004 9:47 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/158.aspx) :: 

  

[![](/web/20081122015235im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
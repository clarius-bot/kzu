---
layout: post
title: "Daniel Cazzulino's Blog : XPath queries without namespace: XSE to the rescue"
date: 2004-02-16 00:00:00 +0000
---

## XPath queries without namespace: XSE to the rescue 

[Dare](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=cd6f9ffd-5149-4872-b48c-0f95f4fdd3bf) has posted about issues with XPath and namespaces in documents. I'm by no means encouraging this, but if you don't care about namespaces, here's a solution for you.

[Using the](http://weblogs.asp.net/cazzu/posts/XseTransformations.aspx) [XSE reader](http://weblogs.asp.net/cazzu/posts/XseIntro.aspx) I proposed (~~and will upload real soon~~[ see the release post](http://weblogs.asp.net/cazzu/posts/XSERelease.aspx)), you can setup a handler to catch all elements and remove any namespaces whatsoever, at reading time (i.e. long before the document is loaded), as follows:

public class MyLoader { public XPathDocument Load(string uri) { TransformingXseReader xr = new TransformingXseReader(new XmlTextReader(uri)); XmlNamespaceManager mgr = new XmlNamespaceManager(xr.NameTable); xr.AddHandler(new RelativePath().Create("*", mgr), new EventHandler(OnElement)); XPathDocument doc = new XPathDocument(xr); return doc; } private void OnElement(object sender, EventArgs e) { TransformingXseReader tr = (TransformingXseReader) sender; tr.ChangeName(tr.LocalName, String.Empty); } }

The Whidbey version looks more compact:

public class MyLoader { public XPathDocument Load(string uri) { TransformingXseReader xr = new TransformingXseReader(new XmlTextReader(uri)); XmlNamespaceManager mgr = new XmlNamespaceManager(xr.NameTable); xr.AddHandler(new RelativePath().Create("*", mgr), delegate { xr.ChangeName(xr.LocalName, String.Empty); } XPathDocument doc = new XPathDocument(xr); return doc; } }

What you effectively get loaded is an infoset without element namespaces, therefore your XPath queries don't need to care about them anymore.

**Update: read these follow-up:**

  * [XPath vs pseudo-XPath](http://weblogs.asp.net/cazzu/archive/2004/02/16/PseudoXPath.aspx)
  * [XSE Initial Release](http://weblogs.asp.net/cazzu/archive/2004/02/16/XSERelease.aspx)
  * [XSE != XPath != SXPath != XPathReader](http://weblogs.asp.net/cazzu/archive/2004/02/16/XseNotXPath.aspx)

posted on Monday, February 16, 2004 9:49 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

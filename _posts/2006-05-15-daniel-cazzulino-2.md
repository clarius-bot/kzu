---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-15 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, February 13, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2004/2/2.aspx "3 Posts")| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2004/2/4.aspx "2 Posts")| 5| 6  
7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/2/10.aspx "2 Posts")| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/2/12.aspx "1 Post")| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/2/13.aspx "1 Post")  
14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/2/16.aspx "7 Posts")| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/2/17.aspx "2 Posts")| [18](http://clariusconsulting.net/blogs/kzu/archive/2004/2/18.aspx "1 Post")| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/2/20.aspx "3 Posts")  
21| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/2/23.aspx "1 Post")| [24](http://clariusconsulting.net/blogs/kzu/archive/2004/2/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/2/25.aspx "1 Post")| 26| [27](http://clariusconsulting.net/blogs/kzu/archive/2004/2/27.aspx "1 Post")  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060515183329im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Friday, February 13, 2004 - Posts

#####  [An alternative API for performant streaming XML processing: XSE (Xml Streaming Events)](http://clariusconsulting.net/blogs/kzu/archive/2004/02/13/XseIntro.aspx)

As a followup to my previous posts ( [ part I](http://weblogs.asp.net/cazzu/archive/2003/10/07/30888.aspx) and [ part II](http://weblogs.asp.net/cazzu/archive/2003/10/09/31294.aspx)), I have been thinking if there's a way to completely avoid the cost intrinsically associated with XPath, that is, the need to load a complete XML document in-memory (be it an `XmlDocument` or an `XPathDocument`, it's the same problem basically). Of course there's a way, I almost hear you say, use an `XmlReader`! There are a lot of scenarios where it makes perfect sense to do so. However, I've (unfortunately) found that most developers get easily tired of writing the same code performing the `Read()` calls, endless switch/if statements checking the current reader's Depth, maintaining flags to signal processed elements (basically building a primitive state machine which is required whenever you need more flexibility than simple element name/namespace lookup), etc.   
Typical code looks pretty ugly. For example, imagine I wanted to count the number of items I have viewed recently with [ RssBandit](http://www.rssbandit.org/ow.asp?DownLoad) (by querying the file used by its cool Remote Storage feature). The corresponding XPath expression would be: `count(/r:feeds/r:feed/r:stories-recently-viewed/r:story)`, where `xmlns:r="http://www.25hoursaday.com/2003/RSSBandit/feeds/"`. Pretty simple to use with an XPathNavigator or XmlDocument, right? Well, the unbeatable-fast approach looks acceptably bad: 

XmlTextReader tr = new XmlTextReader(input); bool feeds = false; bool feed = false; bool stories = false; bool story = false; int count = 0; while (tr.Read()) { if (tr.NodeType == XmlNodeType.Element) { if (tr.Depth == 0) { feed = false; stories = false; story = false; feeds = (tr.LocalName == "feeds" && tr.NamespaceURI == RssBanditNamespace); } else if (tr.Depth == 1) { stories = false; story = false; feed = (tr.LocalName == "feed" && tr.NamespaceURI == RssBanditNamespace); } else if (tr.Depth == 2) { stories = (tr.LocalName == "stories-recently-viewed" && tr.NamespaceURI == RssBanditNamespace); } else if (tr.Depth == 3) { story = (tr.LocalName == "story" && tr.NamespaceURI == RssBanditNamespace); } if (feeds && feed && stories && story) count++; } } Console.WriteLine("Stories viewed: {0}", count); 

In case you doubt my word that this IS the fastest approach, here are the numbers, for a 77kb file, where I didn't measure the time it takes to pre-compile the XPath expression:  
XmlTextReader: 28  
XPathDocument: 562

Now imagine that you also need to build stats about `dc:creator` (where `xmlns:dc="http://purl.org/dc/elements/1.1/"`), you have to process ` xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"` elements, etc. Well, most probably, you will give up to the unbeatable-fast approach and load an `XPathDocument` (I hope) and start executing **pre-compiled** `XPathExpression` instances against it. Well, it's my personal experience that not even the example I showed above is tackled with the XmlReader approach. Believe me, I've seen developers load an *`XmlDocument`* just to issue an `//Error` (?!) XPath query just to determine if there was an error after some processing!! Unfortunately, except for the most simple cases, using the `XmlReader` is pretty difficult and leads to code that is hard to maintain and extend.

What's more, there are a LOT of scenarios when there's not even a chance to know ahead of time what needs to be processed. For example, think about a webservice that receives a multi-namespaced XML file and processes information items from each namespace with different modules, specified through configuration. You want one example? RSS: there are a buch of namespaces that can go in there. The same goes for any other service that allows extensibility through namespaces, such as SOAP. Another example are XPath-based rules languages ( one such is [Schematron](http://www.ascc.net/xml/resource/schematron/schematron.html) ). But not only complex cases apply here, even loading deeply nested configuration files is extremely cumbersome without the help of XPath or XmlSerializer. 

## Alternatives in alternate worlds: SAX?

Java developers would say: "if you only had SAX...". Well, I'm no experienced Java developer, so if there's anybody out there reading this: first, you're in the wrong place, second, feel free to correct me in this section. In order to get a good feeling of what we are missing with SAX, I downloaded one cool (I thought it was, at least) piece of java code, SAX-creator [ David Megginson](http://www.megginson.com/Software/)'s [RdfFilter](http://rdf-filter.sourceforge.net/), which is a concrete use case of SAX2-based processing and extensibility to handling XML. First let me say that I doubt most java developers take the approach of creating such a cool XMLFilterImpl (the SAX filters that expose events in a more usable way to the developer) for regular needs. However, it does show what SAX-based programming looks like. Guess what, it doesn't look very different than XmlReader:

public void startElement (String uri, String localName, String rawName, Attributes atts) throws SAXException { if (!rdfProcessing) { super.startElement(uri, localName, rawName, atts); return; } pushState(); String xml_lang = atts.getValue(XMLNS, "lang"); if (xml_lang != null) { currentState.lang = xml_lang; } switch (currentState.state) { case TOP_LEVEL: if (RDFNS.equals(uri)) { if ("RDF".equals(localName)) { currentState.state = IN_RDF; } else { error("Unknown or out of context RDF element " + localName); } } else { currentState.state = TOP_LEVEL; super.startElement(uri, localName, rawName, atts); } break; case IN_RDF: currentState.state = IN_DESCRIPTION; startResource(uri, localName, atts); break; case IN_DESCRIPTION: case IN_COMPOSITE_PROPERTY: // Imagine the rest!! 

I removed comments to clarify the code. Of course, it has a more cool state machine than our example's 4 bool variables, but you get the idea. Looking at this code, however, I learned a cool thing about SAX: specialized filters can expose more specific events than the `startElement`, and that would make the client code far easier to write. However, most Java developers (again, correct me if I'm wrong, but I asked a couple ones' opinion only) simply create a new empty filter and implement the method they are interested in, more often with much less elegancy than the code above. Just the quick and dirty way to get the job done. That leads, of course, to equally difficult to maintain/extend code as the `XmlReader` approach does. 

The idea of having a specialized strategy (filter in SAX) process and expose higher-level events is appealing. The developer of this strategy could have optimized the state machine it uses, has already debugged the code, etc. However, the strategy has to be manually created, and it only serves the single purpose it was created for. For example, there's no way we can use the RDFFilter to aid us in processing anything else than RDF (of course we can still get the lower-level SAX events, but how is that any useful at all?).

## Enter the XSE: Xml Streaming Events

The solution I'm thiking of (and activily coding), is based on an improvement of SAX and the XmlReader. Main requirements are:

  * Streaming processing: I don't want to pay the price of full XML loading. 
  * Support for dynamic expressions: I don't want to code a new filter/strategy/handler/whatever class for each new type of element to match. 
  * Callbacks for matched/subscribed elements: I just want to get called when something I'm interested in was found. For example, it's completely useless for me to get called by an `ElementStarted` event when the element is not in the namespace I expect (or the path, or has the attribute, or...). 
  * Compiled code: the price to support dynamic expressions shouldn't be performance. I want the same performance I can get by manually coding the ugliest switch statement required to get the job done, FAST. 
  * Support for pre-compilation and reuse of expressions: I want to increase performance by caching and thread-safely reusing expresions I know ahead of time.

Given the first requirement, it's pretty obvious that the solution will be XmlReader-based. The following are a number of code samples showing usage of XSE in Whidbey (I've back-ported to v1.x too, don't worry):

// Setup the namespaces XmlNamespaceManager mgr = new XmlNamespaceManager(temp.NameTable); mgr.AddNamespace("r", RssBanditNamespace); // Precompile the strategy used to match the expression IMatchStrategy st = new RootedPathFactory().Create( "/r:feeds/r:feed/r:stories-recently-viewed/r:story", mgr); int count = 0; // Create the reader. XseReader xr = new XseReader( new XmlTextReader( inputStream ) ); // Add our handler, using the strategy compiled above. xr.AddHandler(st, delegate { count++; }); while (xr.Read()) { } Console.WriteLine("Stories viewed: {0}", count); 

The "strange" syntax following the delegate keyword is the new SUPER cool anonymous methods feature of C# v2. Equivalent v1.x code only needs to change that single line:

xr.AddHandler(st, new EventHandler(OnStoryViewed));

If you want to process all elements in a certain namespace (let's say, the Dublin Core), irrespective of its location, you would use something like this:

IMatchStrategy st = new RelativePathFactory().Create("dc:*", mgr); // Create the reader. XseReader xr = new XseReader( new XmlTextReader( inputStream ) ); xr.AddHandler(st, delegate { // Process Dublin Core elements }); while (xr.Read()) { } 

The compiled strategy can be cached statically and reused by multiple threads simultaneously, as a call to `XseReader.AddHandler` performs a `Clone` on it.   
By now you may have realized that the real secret of all this are the concrete factories. Each factory is able to create strategies to match a specific expression language. The two I showed are XPath-like or subsets of it. You can even come up with your own expression format, given you provide an appropriate factory for it. 

You may have noted that the expression from the last example above is not valid according to XPath syntax. The equivalent in XPath would be: //*[namespace-uri(.)='the-namespace-to-match'] It's far more intuitive, I think, to write `dc:*`. If you wanted to process all elements from all namespaces, my syntax is simply `*`.   
And to process an element from any namespace, you use `*:item`, instead of the XPath //*[local-name=['item'] Again, my syntax looks more straightforward to me. Of course, like I said, you can come up with your own syntax, or even support the full XPath one, by providing an appropriate factory. However, I don't think the complete XPath specification can be supported in streaming scenarios. 

The most important piece here is what does the strategy returned from the factory look like. Well, for the two ones above, what I basically did is analyze the expression and emit the ugliest-unbeatable-fast-if-else implementation you can think of. Almost exactly the one I showed at the beginning. Now for the numbers, which is the main reason I started this project:

Everett:   
XmlTextReader: 28   
XseReader: 38   
XPathDocument: 562 

Whidbey:  
XmlTextReader: 18   
XseReader: 23   
XPathDocument: 478   
XPathDocument2: 234 

These are the tests for each approach, against the story count test expression discussed at the beginning. Quite impressive, right? Note that even when `XPathDocument2` in Whidbey performs a superb job at improving the `XPathDocument` performance, it's still an order of magnitude slower that the XSE approach. Here we can also appreciate the good work of the XML team in improving even the raw XML parser, by an important percentage (28 vs 18, wow). That directly benefits XSE too. Tests were as fair as I could make them: all XPath expressions are precompiled, XmlNameTable pre-cached, etc. I made the biggest effort to make XPath numbers do better, but that's honestly its limit. When I post the tests code, you'll believe me, hopefully ;).  
The code is being polished now, and I'm trying to come up with more factories that may be useful, specially adding attribute and child element value evaluation, but that requires a little bit more work to achieve with only a reader at hand :o). I'm also trying to use direct Reflection.Emit instead of CodeDom for compiling the strategy, but I still have to measure the perf. improvement that would yield in expression compilation. You can infer that caching the compiled strategy (just like XPathExpressions, but much more in this case) greately improves performance. I haven't implemented an internal strategy cache yet, which would also help there.   
I'm doing some major rearrangements in my NMatrix opensource project so that I can concentrate all my XML-related efforts in a single NMatrix.Xml assembly, such as Schematron.NET, XSE and others. 

As you can see, flexibility and performance are two cornerstones of this approach. I wanted both, and I think it delivers. In the upcoming posts I will discuss how it's implemented, and I welcome everyone interested in improving it or making suggestions, to make comments to this post, so that we can finally say to Java developers: "If you only had XSE...". 

**Update: read these follow-up:**

  * [Xml Streaming Events: simple streaming Xml handing (and changing) at work](http://weblogs.asp.net/cazzu/archive/2004/02/16/XseTransformations.aspx)
  * [XPath queries without namespace: XSE to the rescue](http://weblogs.asp.net/cazzu/archive/2004/02/16/XPathNonNS.aspx)
  * [XPath vs pseudo-XPath](http://weblogs.asp.net/cazzu/archive/2004/02/16/PseudoXPath.aspx)
  * [XSE Initial Release](http://weblogs.asp.net/cazzu/archive/2004/02/16/XSERelease.aspx)
  * [XSE != XPath != SXPath != XPathReader](http://weblogs.asp.net/cazzu/archive/2004/02/16/XseNotXPath.aspx)

posted [Friday, February 13, 2004 5:23 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/02/13/XseIntro.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/02/13/XseIntro.aspx#comments)

  

[![](/web/20060515183329im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
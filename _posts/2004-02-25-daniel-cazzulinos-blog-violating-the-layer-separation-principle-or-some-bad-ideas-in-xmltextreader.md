---
layout: post
title: "Daniel Cazzulino's Blog : Violating the layer separation principle (or some bad ideas in XmlTextReader)"
date: 2004-02-25 00:00:00 +0000
---

Daniel Cazzulino's Blog : Violating the layer separation principle (or some bad ideas in XmlTextReader)


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080827161313im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080827161313im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080827161313im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080827161313im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Violating the layer separation principle (or some bad ideas in XmlTextReader) 

Most of the APIs in .NET have a layered design, most notably the IO classes. System.Xml namespace builds on this layered design, but falls short, IMO. Basically, you have the following layers in a typical XML parsing activity:

  1. Input: a `System.IO.Stream` implementation, such as a `FileStream`, `BufferedStream`, `NetworkStream` and so on, or directly a string passed to the next layer. 
  2. Basic reader: most probably a `System.IO.StreamReader`, or a `StringReader` if the previous layer is skipped. 
  3. XmlReader: the actual parser implementation. In .NET, the XML parser is the `XmlTextReader` class.

Maybe it's just me, but isn't there a layer missing there? The "Lexical Analyzer" or "Scanner"? Well, it turns out that's it's missing to the public, but the XmlTextReader of course uses one, its `XmlScanner`. Wouldn't it be cool if this layer was exposed explicitly, so that you could tell the parser which scanner to use? Imagine that an imaginary scanner could present as XML tokens some binary stuff comming from the basic reader layer... I know all the discussions about binary XML, I'm just thinking about the clever solution for SVG, SVGZ or "zipped SVG". I don't have to tell you how well the zip algorithm is in general, but with highly redundant data such as XML (i.e. all the repeated tag names) the size reduction is really awesome. 

Back to the topic, however, the `XmlTextReader` violates this separation with its internal `XmlScanner` class. Namely, the scanner BUFFERS its reads, instead of delegating this responsibility to the appropriate layer, which already implements such funcionality in the `BufferedStream` class. One consequence of this violation is that the stream position is no longer relevant as you will never know how far the internal scanner has gone. Have you ever dreamed of a "ResetableReader"? You can kiss that dream goodbye for now. 

If the scanner didn't violate the separation, we could implement such a reader as follows:

  * Read until some arbitrary point. 
  * Store current stream position. 
  * Create a new reader to read starting from current position (one that stops reading when it finds elements "outside" its scope), and use it internally instead of advancing the "real" one. 
  * Upon a call to a `Reset()` method, discard the "inner" reader and reposition the stream.

So, we could confidently hand such a reader to some arbitrary component to do whatever it has to do with the data, without risking our own positioning in the reader. This is typical in XML processing pipelines. You don't want the previous pipeline to mess with the "real" reader and break processing in later ones. Similarly, if you configure components to handle processing of certain elements (for example, with the handler registration mechanism allowed by [Xml Streaming Events](http://weblogs.asp.net/cazzu/posts/XseTransformations.aspx)), you don't want one handler to screw the reader and forbid other handlers from doing their work. You could have the following syntatic sugar also:

ReseteableReader rr; //Initialize somehow // Do some reading // We're about to hand the reader to some other component using (rr.CreateResetPoint()) { Process(rr); } // Now we're exactly where we left before entering the "using"

But as the scanner is buffering (something that should be left to the lower layer, as stated), the only way to get "what's left" in the stream without losing what has already been buffered is to use the [ XmlTextReader.GetRemainder()](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemxmlxmltextreaderclassgetremaindertopic.asp) method. Guess what, after calling that method, you have effectively screwed your "main" reader. And as the XmlTextReader doesn't support ICloneable either, you can't even store/clone/keep its internal state before screwing it. I heard someone suggesting that one *hack* would be to store the element qname and depth, construct a new reader and read again until its met again. This is clearly an unnacceptable hack: we would be parsing multiple times the same thing, wasting processing time by reading useless nodes, etc. 

What's the moral of the story: cleaner separation allows for novel uses not foreseen originally. Violations lend in the best case to ugly hacks, in the worst case (as in the XmlTextReader) to plain impossibility. Let's keep dreaming about the ResetableReader (or thinking about alternative XML parsers for .NET...).

posted on Wednesday, February 25, 2004 12:39 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20080827161313im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-02 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Saturday, May 08, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| 5| 6  
[7](http://clariusconsulting.net/blogs/kzu/archive/2004/5/7.aspx "1 Post")| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/5/8.aspx "1 Post")| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/5/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2004/5/11.aspx "1 Post")| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/5/13.aspx "1 Post")  
[14](http://clariusconsulting.net/blogs/kzu/archive/2004/5/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/5/15.aspx "1 Post")| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/5/17.aspx "2 Posts")| 18| 19| 20  
21| 22| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/5/26.aspx "2 Posts")| 27  
28| 29| 30| [31](http://clariusconsulting.net/blogs/kzu/archive/2004/5/31.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502132054im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Saturday, May 08, 2004 - Posts

#####  [Cool XPathReader, but...](http://clariusconsulting.net/blogs/kzu/archive/2004/05/08/223.aspx)

Congrats to Dare and Howard about the [ release of the XPathReader](http://msdn.microsoft.com/XML/BuildingXML/XMLColumns/default.aspx?pull=/library/en-us/dnexxml/html/xml05192004.asp) on the [MSDN XML DevCenter](http://msdn.microsoft.com/XML/)! 

But (there's always a but), I don't think it will actually reach mainstream usage. The idea and implementation is really interesting, but it is "derivative work" (in legal terms) of the [ SSCLI](http://www.microsoft.com/downloads/details.aspx?FamilyId=3A1C93FA-7462-47D0-8E56-8DD34C6292F0&displaylang=en) which explicitly states:

> You may use this Software for any non-commercial purpose, subject to the restrictions in this license. Some purposes which can be non-commercial are teaching, academic research, and personal experimentation.

It even shares a typo existing in .NET v1.0, XPathScanner.CurerntChar property... :S.

This renders an exciting piece of software in a pretty useless thing, at least from where I see it: either as something we could take advantage of in the opensource [Mvp.Xml project](http://sf.net/projects/mvp-xml) or for use in real-world production (i.e. *not* personal experimentation) systems :(.

On the technical side, the implementation uses the same mechanism (obviously, as it's based on the same code) as the v1.x XPath: build an AST, the dynamically move through it. What's more, it makes the same mistake (IMO) than it: make the expression itself (in this case the XPathCollection class) stateful with regards to the query evaluation and the reader, which is not good as it's impossible to cache it neither it's thread-safe. It's even worse than XPathExpression because it doesn't even implement ICloneable. Building ASTs may be fancy, but it's far from performant if they are used at runtime. The XML team learned this the hard way from the v1.x XSLT implementation, whose performance is far from that achieved by the award-winning MSXML. The brand-new v2 impl. (still an XSLT 1.0 one, remember) now takes the right approach: generating compiled IL. This makes for awesome performance that I believe will surpass any other existing XSLT processor. The same approach is taken for XQuery. So, if you ask me, I'm not excited at all about XPath 1.0 approach in current .NET technologies (not even the XPathReader for the added license reason).

Three links from [Juan Wajnerman](http://weblogs.manas.com.ar/waj) got me thinking again about streaming full-compliant XPath (and if it's possible at all): 

  * [XPath Evaluation on XML Streams](http://www.pms.informatik.uni-muenchen.de/forschung/xpath-eval.html)
  * [XSQ: A Streaming XPath Engine](http://www.cs.umd.edu/projects/xsq/)
  * [XPath: Looking Forward](http://www.csd.uch.gr/~hy561/Papers/looking_forward.pdf)

I'll definitely do more research in this area...

BTW, this is what I meant when asked "so an XPathReader could be the solution?". I have doubts with regards to calling "XPath" to such a limited subset... I also don't see how this approach is much better than alternatives such as [ XSE (Xml Streaming Events)](http://weblogs.asp.net/cazzu/archive/2004/02/13/XseIntro.aspx), which is opensource in addition, other than it uses the word XPath :o) (you still have to learn all those rules that are no longer valid, hence you're in the presence of another vocabulary). My current thinking is that pull-based APIs may not be that good for streaming (complex) scenarios... maybe a combination like XSE, definitely NOT [a straight port of SAX](http://weblogs.asp.net/cazzu/archive/2004/03/29/101437.aspx), don't know...  
We need to move forward... in a streaming, compiled and performant way ;)

posted [Saturday, May 08, 2004 2:38 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/05/08/223.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/05/08/223.aspx#comments)

  

[![](/web/20060502132054im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
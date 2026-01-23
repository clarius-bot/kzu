---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-07 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, October 17, 2003 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/10/3.aspx "1 Post")| 4  
[5](http://clariusconsulting.net/blogs/kzu/archive/2003/10/5.aspx "1 Post")| 6| [7](http://clariusconsulting.net/blogs/kzu/archive/2003/10/7.aspx "1 Post")| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2003/10/9.aspx "2 Posts")| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11.aspx "1 Post")  
[12](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12.aspx "2 Posts")| 13| 14| 15| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17.aspx "2 Posts")| 18  
19| 20| [21](http://clariusconsulting.net/blogs/kzu/archive/2003/10/21.aspx "1 Post")| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2003/10/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2003/10/25.aspx "1 Post")  
[26](http://clariusconsulting.net/blogs/kzu/archive/2003/10/26.aspx "1 Post")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/10/27.aspx "1 Post")| [28](http://clariusconsulting.net/blogs/kzu/archive/2003/10/28.aspx "1 Post")| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060207043348im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Friday, October 17, 2003 - Posts

#####  [Optimal string manipulation in XmlTextWriter?](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17/94.aspx)

Lately I've been digging inside the `XmlTextWriter` class. I'm working on an alternate implementation to the traditional state machine based on arrays, one based on a mix of hierarchical state machines and DOM-like events propagation, for an XmlWriter-inherited class.   
During this investigation, I found several places where string manipulation is not optimal in aforementioned class. Specifically, even if it uses the `StringBuilder` class, it mixes calls to it with `String.Concat`, which is completely useless. Look at the following example taken from the `StartDocument` method (called by `WriteStartDocument`): 

`
    
    
    builder1.Append(string.Concat(" encoding=", this.quoteChar));

`

This is functionally equivalent to:

`
    
    
    builder1.Append(" encoding=").Append(this.quoteChar);

`

So, why are the strings concatenated? Even temporary arrays of strings are built only to be concatenated and passed to the `Append` method later. Do these guys now something about string handling we don't or is this just a bit more inefficient code?

References: 

  * [Hierarchical State Machines](http://www.accu-usa.org/Slides/samek0311.pdf)
  * [Quantum Hierarchical State Machine - Port to C#](http://www.quantum-leaps.com/qf.code/qhsm_csharp.PDF)
  * [Hierarchical State Machine Design Pattens](http://www.scs.carleton.ca/~francis/Courses/304/Slides/304P2S7-HSMPatterns.pdf)

posted [Friday, October 17, 2003 1:35 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17/94.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17/94.aspx#comments)

#####  [Blow XmlTextWriter](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17/93.aspx)

Mmm... the following code causes a `System.NullReferenceException`: 

`
    
    
    using (FileStream fs = new FileStream(@"e:\xmltextwriter.xml", FileMode.Create))
    {
      XmlTextWriter tw = new XmlTextWriter(fs, System.Text.Encoding.UTF8);
      tw.WriteDocType("html", 
          "-//W3C//DTD XHTML 1.0 Transitional//EN", 
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd", 
          null);
      tw.WriteStartDocument();
      tw.Flush();
    }

`

The exception is thrown at the `WriteStartDocument()` call. Of course the document being written is not valid according to the [Prolog and DTD Declaration](http://www.w3.org/TR/REC-xml#sec-prolog-dtd) specification in XML, but we should get a meaningful exception, right? 

posted [Friday, October 17, 2003 12:57 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17/93.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17/93.aspx#comments)

  

![](/web/20060207043348im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
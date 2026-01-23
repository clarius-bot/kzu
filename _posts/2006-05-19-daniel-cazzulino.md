---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-19 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Saturday, June 19, 2004 - Posts

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
7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/6/9.aspx "1 Post")| 10| 11| 12| 13  
14| 15| 16| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/6/19.aspx "1 Post")| 20  
21| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2004/6/24.aspx "2 Posts")| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/6/25.aspx "2 Posts")| 26| 27  
28| [29](http://clariusconsulting.net/blogs/kzu/archive/2004/6/29.aspx "1 Post")| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060519104207im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Saturday, June 19, 2004 - Posts

#####  [XML Performance Checklist, and some issues on XPath evaluation](http://clariusconsulting.net/blogs/kzu/archive/2004/06/19/249.aspx)

[DonXML](http://donxml.com/) [pointed some issues with regards to the [ Checklist: XML Performance](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnpag/html/scalenetcheck10.asp) article. I believe the checklist (and the corresponding "full-length" explanations) could have benefit from more space to cover the topic. I agree with most of Don's comments. The only one I'm not so sure about is his assertion: ](http://donxml.com/allthingstechie/archive/2004/06/16/828.aspx)

> By implementing #1 (Use XPathDocument to process XPath statements), it forces you to break #2 (Avoid the // operator by reducing the search scope), since XPathNavigator.Select() always evaluates from the root, not from the context of the current cursor location. 

This observation is partially true. I say partially because you can reduce the scope of a search by explicitly addressing the full hierarchy of nodes, instead of the "//" which is a shortcut for "descendant-of-self". The real cost of "//" is that all nodes being matched must not be duplicated in the resulting node-set, and this incurrs an additional calculation cost. For example, let's say you have an XHTML document, and you want to process all links that exist inside a paragraph. The XPath could be something like: //p//a. Well, as you know, a <p> can be nested in other <p> elements, so that an <a> can be determined to (initially) satisfy the "//a" for two <p> that happen to be parent and child. At this point, the XPath evaluator must skip those <a> that have already been matched. This is what makes the process much more slower.   
So, if you positively know that all your <a>s happen as a direct child of <p>, and your <p>s you want to process always appear inside the <body>, you could get an amazing speed boost by replacing the query with "/html/body/p/a". And I really mean *amazing*. Try for yourself with an XHTML version of a long spec, for example the XML Schema part 2. 

But, going back to the main point raised by Don (and which helped me remember those ugly days when I stumbled with it), the core issue is that there's a conscious design decision of making the overload to Evaluate that receives an XPathNodeIterator as the context, absolutely useless. Let me explain (and what follows is exactly the use case I explained in [ the public newsgroup](http://www.dotnet247.com/247reference/msgs/24/122009.aspx)). 

Let's say you have the Pubs database as XML. Now you have selected (for whatever reason) all titles with "//publishers/titles". This will be an XPathNodeIterator with the results:

XPathNavigator nav = document.CreateNavigator(); XPathNodeIterator nodes = nav.Select("//publishers/titles");

At some point, let's say you need to work with all prices from that set of nodes. The navigator exposes an overload for the Evaluate method that receives an XPathNodeIterator object as the context to execute the evaluation on. It seems natural, then, to think that the following code would yield the results we expect:

XPathExpression expr = nav.Compile("price"); object allprices = nav.Evaluate(expr, nodes);

The result I expect is a node-set (XPathNodeIterator) for each price child of the titles I passed as the second argument to Evaluate. Well, that isn't happening, because the "price" expression is being evaluated from the document root. So, what's this overload useful for?

The code [ Oleg](http://donxml.com/allthingstechie/archive/2004/06/16/828.aspx#830) used doesn't test the problem, as he's iterating each node (i.e. the nodes variable above) and evaluating on each of them without using the other overload. This works, just as the regular Select method does. 

posted [Saturday, June 19, 2004 3:59 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/06/19/249.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/06/19/249.aspx#comments)

  

[![](/web/20060519104207im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
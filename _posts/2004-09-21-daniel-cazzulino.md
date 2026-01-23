---
layout: post
title: "Daniel Cazzulino"
date: 2004-09-21 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : A different paradigm for XML validation: all about Schematron

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
7| 8| 9| 10| [11](http://clariusconsulting.net/blogs/kzu/archive/2004/9/11.aspx "1 Post")| 12| 13  
14| 15| 16| 17| 18| 19| 20  
[21](http://clariusconsulting.net/blogs/kzu/archive/2004/9/21.aspx "1 Post")| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/9/23.aspx "1 Post")| [24](http://clariusconsulting.net/blogs/kzu/archive/2004/9/24.aspx "2 Posts")| 25| 26| 27  
28| 29| [30](http://clariusconsulting.net/blogs/kzu/archive/2004/9/30.aspx "1 Post")| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060527015003im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## A different paradigm for XML validation: all about Schematron 

In a very timely article, [Dare Obasanjo](http://www.25hoursaday.com/weblog) introduces [Schematron](http://xml.ascc.net/resource/schematron/schematron.html) in an MSDN article entitled [Improving XML Document Validation with Schematron](http://msdn.microsoft.com/XML/BuildingXML/XMLSchemas/default.aspx?pull=/library/en-us/dnxml/html/schematron.asp). 

I discovered Schematron [two years ago](http://xml.coverpages.org/clippings200209.html#clip2002-09-21-a), and decided to develop a pure XPath-based implementation in C#, which was also an amazing project to learn System.Xml in depth. In November that year, I presented the project in .NET ONE 2002 in Frankfurt (in an really surprising move and amazing lack of netiquette, the company organizing the event has simply removed all previous conferences materials, so I could only find a link to last year's [.NET ONE 2003](http://web.sigs-datacom.de/sd/kongresse/dotnet_2003/index.htm). Maybe I should let [Ralf](http://clariusconsulting.net/ralfw/) know, he was one of the organizers...). 

I found Schematron to be an amazing extension to my XML toolbox. It makes it very easy to declaratively specify rule-based conditions that must be satisfied in a document in order to be valid. But not only that, it allows natural language reporting of errors in the document, which makes it far more user friendly than XSDs criptic (for an end-user) error messages. Schematron is already on [Dare's list of nice-to-have features for System.Xml v3](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=e9e50539-501d-4f3a-9639-91ef4cff6354).

[Aaron Skonnard](http://www.pluralsight.com/blogs/aaron/default.aspx) has already shown the power of XPath-based rules for XML validation and [how it can be integrated with the WebMethod framework](http://msdn.microsoft.com/msdnmag/issues/03/08/businessrules/default.aspx), although this approach is fundamentally flawed, as it puts again business rules in the compiled code, removing all benefits of a declarative language as XML and XPath. 

This year it's time to present Schematron at [Applied XML Developer's Conference](http://www.sellsbrothers.com/conference/). Besides showing the basis of Schematron, and what it's good for and how it can suplement XSDs, I'll show cool WebMethod framework integration, which allows you to specify a schema, phase, and output format for Schematron validation of incoming messages. I'll also discuss the future of Schematron and its upcoming ISO standarization (there's [a prelimiar draft of the spec](http://www.dsdl.org/0524.pdf)). 

So, if you want to lean more about it, or if you engage with a [bunch of amazing industry-renowned professionals in the XML field](http://www.sellsbrothers.com/conference/) (not that I consider myself one, of course), [register for the conference ASAP](https://www.pluralsight.com/events/devcon/secure/register.aspx), as all previous DevCons were sold out. You should really hurry up, as [there's little extra space left](http://www.sellsbrothers.com/news/showTopic.aspx?ixTopic=1517).

posted on Tuesday, September 21, 2004 1:54 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/287.aspx) :: 

  

[![](/web/20060527015003im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
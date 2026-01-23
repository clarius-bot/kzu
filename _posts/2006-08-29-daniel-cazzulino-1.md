---
layout: post
title: "Daniel Cazzulino"
date: 2006-08-29 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Monday, January 19, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))| August 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2435'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/1/8.aspx "1 Post")| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/1/9.aspx "2 Posts")| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/1/12.aspx "1 Post")  
13| 14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/1/16.aspx "1 Post")| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/1/19.aspx "1 Post")  
[20](http://clariusconsulting.net/blogs/kzu/archive/2004/1/20.aspx "2 Posts")| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/1/21.aspx "1 Post")| [22](http://clariusconsulting.net/blogs/kzu/archive/2004/1/22.aspx "1 Post")| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/1/23.aspx "1 Post")| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/1/26.aspx "2 Posts")  
27| 28| 29| 30| 31| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060829185553im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Monday, January 19, 2004 - Posts

#####  [Business Rules, OCL, XML and Schemas](http://clariusconsulting.net/blogs/kzu/archive/2004/01/19/137.aspx)

[DonXML](http://donxml.com/allthingstechie/archive/2004/01/15/314.aspx) is proposing extensions to OCL to express business rules that can be used at code-gen time and at run-time.   
He mentions my [Schematron](http://www.ascc.net/xml/resource/schematron/schematron.html) implementation called [Schematron.NET](http://sf.net/projects/dotnetopensrc), which allows many business rules to be expressed simply in terms of standard XPath expressions. I believe such an XPath-based language is good enough to express almost every business rule. 

[Udi Dahan](http://donxml.com/allthingstechie/archive/2004/01/15/314.aspx#316) commented as an example, a rule "only a bank manager can authorize a loan above X" which he said couldn't be expressed with Don's idea. It could, indeed, with something along these lines (XPath-like):

`
    
    
    <assert test="sec:principal-role('BankManager') and po:Loan/@Amount < 1000">
      Only a BankManager can place a loan of more than $1000.
    </assert>

`

Note that XPath extensibility allows for more domain-specific extensions to be active, which can even check against databases, etc. For example, something like this: 

`
    
    
    <assert test="crm:customer-id(po:CustomerId)" />

`

in this case, the application would map the "crm" prefix to the business objects that contain the logic, and register the "customer-id" extension function to ensure the Id is a valid one. This way, you can change business rules based on a (well documented) set of extensions, and you can let managers handle them, instead of programmers.   
These schemas are easy enough for an advanced user to edit.   
In [Schematron.NET](http://sf.net/projects/dotnetopensrc), I'm implementing quite a few extensions, including XSLT-specific ones, and adding the full [EXSLT](http://www.exslt.org/) [for .NET](http://workspaces.gotdotnet.com/exslt) implemented by [Dare Obasanjo](http://www.25hoursaday.com/weblog/). It's not impossible to think about a set of domain-specific standard specs (like EXSLT itself) that would aid in business rules expression. 

posted [Monday, January 19, 2004 1:13 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/01/19/137.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/01/19/137.aspx#comments)

  

[![](/web/20060829185553im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
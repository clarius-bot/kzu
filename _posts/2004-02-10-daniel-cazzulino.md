---
layout: post
title: "Daniel Cazzulino"
date: 2004-02-10 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Making RegEx more readable

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))| July 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2404'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 29| 30| 1  
[2](http://clariusconsulting.net/blogs/kzu/archive/2004/2/2.aspx "3 Posts")| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2004/2/4.aspx "2 Posts")| 5| 6| 7| 8  
9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/2/10.aspx "2 Posts")| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/2/12.aspx "1 Post")| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/2/13.aspx "1 Post")| 14| 15  
[16](http://clariusconsulting.net/blogs/kzu/archive/2004/2/16.aspx "7 Posts")| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/2/17.aspx "2 Posts")| [18](http://clariusconsulting.net/blogs/kzu/archive/2004/2/18.aspx "1 Post")| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/2/20.aspx "3 Posts")| 21| 22  
[23](http://clariusconsulting.net/blogs/kzu/archive/2004/2/23.aspx "1 Post")| [24](http://clariusconsulting.net/blogs/kzu/archive/2004/2/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/2/25.aspx "1 Post")| 26| [27](http://clariusconsulting.net/blogs/kzu/archive/2004/2/27.aspx "1 Post")| 28| 29  
30| 31| 1| 2| 3| 4| 5  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060719165525im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Making RegEx more readable 

Compare the following code statements defining the same regular expression in .NET: static readonly Regex ParameterReference = new Regex(@"(?\\)|\\[^\\]+)\>|(?\\]*(?!\>))", RegexOptions.Compiled | RegexOptions.IgnorePatternWhitespace);    
static readonly Regex ParameterReference = new Regex(@" # Matches invalid empty brackets # (?\\)| # Matches a valid parameter reference # \\[^\\]+)\>| # Matches opened brackes that are not properly closed # (?\\]*(?!\>))", RegexOptions.Compiled | RegexOptions.IgnorePatternWhitespace); 

While the former is still understandable for a fairly regex-aware developer, the later is far more explicit about the purpose of each part of it. The ability to place comments inside the expression is enabled by the `RegexOptions.IgnorePatternWhitespace`, which is not used enough by developers. In the case of this pretty simple expression this may seem unnecessary, but imagine a regex-based parser that processes ([CodeSmith](http://www.ericjsmith.net/codesmith/)-like) template files:

static Regex CodeExpression = new Regex(@" # First match the full directives # \w*)(?.*?)\\#\/>(?:\W*\n)?| # Match open tag # (?\\#\/>)| # This is a simple expression that is outputed as-is to output.Write(); # (?:=)(?.*?)(?;.*?)?(?=\\#\/>)| # Anything previous or after a code tag # (?`.*?)(?=)| # Finally, match everything else that is written as-is # (?.*[\r\n]*)", RegexOptions.IgnorePatternWhitespace | RegexOptions.Compiled | RegexOptions.Singleline); `

It's pretty obvious that not commenting such complex expressions makes them almost unreadable except for the guy who wrote them (and even to him after some time!). Bottom line: ALWAYS comment your expressions in-line!!!

posted on Tuesday, February 10, 2004 11:07 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/153.aspx) :: 

  

[![](/web/20060719165525im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino"
date: 2006-06-09 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : .NET Regex bug causes application to hang!!!

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2312'\))| June 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
28| 29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2006/6/1.aspx "1 Post")| 2| 3  
4| 5| 6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2006/6/8.aspx "2 Posts")| [9](http://clariusconsulting.net/blogs/kzu/archive/2006/6/9.aspx "2 Posts")| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| 22| 23| 24  
25| 26| 27| 28| 29| 30| 1  
2| 3| 4| 5| 6| 7| 8  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060613000417im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## .NET Regex bug causes application to hang!!! 

Today [I reported a bug](http://connect.microsoft.com/feedback/ViewFeedback.aspx?FeedbackID=128105&SiteID=210 "How to hang an application/site usign a regular expression") on the new [Microsoft Connect](http://connect.microsoft.com/) site (replacement for [Product Feedback](http://lab.msdn.microsoft.com/productfeedback)), which I had in the pipeling for quite a while. 

Turns out that if you have a fairly complex regex (like the ones typically used for parsing small custom languages), you can easily kill your application, because the regex engine will hang completely evaluating even fairly small strings. Here's my repro regex:

static readonly Regex ReferenceExpression = new Regex(@"

# Matches invalid empty brackets #

(?<empty>\$\\(\\)) |

# Matches a valid argument reference with potencial method calls and indexer accesses #

(?<reference>\$\\(([^\\(]+([\\(\\[][^\\)\\]]*[\\)\\]])?)+\\)) |

# Matches opened brackes that are not properly closed #

(?<opened>\$\\([^\\)\$\\(]*(?!\\)))",

RegexOptions.Compiled | RegexOptions.Multiline | RegexOptions.IgnorePatternWhitespace);

and this is the string I'm parsing (part of the Mobile Client Software Factory guidance package, which uses these kind of pseudo-MSBuild syntax):

static void Main(string[] args)

{

string hangString = @"DisconnectedAgents\$(CurrentItem.Name)\$(ProxyType.Name)AgentCallback.cs\$(ProxyType.Name)AgentCallbackBase.cs";

Console.WriteLine(ReferenceExpression.IsMatch(hangString));

}

If a site allows evaluations of arbitrary regex patterns using the .NET engine, they should be careful as this can easily bring the site down.

Please [vote the bug](http://connect.microsoft.com/feedback/ViewFeedback.aspx?FeedbackID=128105&SiteID=210) if you also think it's critical.

posted on Friday, June 09, 2006 8:21 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/546.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/06/09/RegexBug.aspx#547 "permalink") .NET Regex bug causes application to hang!!! @ Friday, June 09, 2006 8:32 AM

Note: this entry has moved.   
Today I reported a bug on the new Microsoft Connect site (replacement for... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2006/06/09/RegexBug.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/06/09/RegexBug.aspx#548 "permalink") re: .NET Regex bug causes application to hang!!! @ Sunday, June 11, 2006 11:49 PM

Are you sure it is hung.. and not just stuck in O(e^n) backtracking.   
  
Having one qualifier over a group with another qualifier can easily lead to this happening. The answer can be to use minimal match ("*?" rather than "*") or otherwise refactoring the regex.   
  
See the usual references for all the details. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

Richard

  

[![](/web/20060613000417im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino"
date: 2006-06-15 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, June 09, 2006 - Posts

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060615045857im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Friday, June 09, 2006 - Posts

#####  [.NET Regex bug causes application to hang!!!](http://clariusconsulting.net/blogs/kzu/archive/2006/06/09/RegexBug.aspx)

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

posted [Friday, June 09, 2006 8:21 AM](http://clariusconsulting.net/blogs/kzu/archive/2006/06/09/RegexBug.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [2 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/06/09/RegexBug.aspx#comments)

#####  [Ajax is no silver bullet. Even Google knows it. Flash is sometimes better.](http://clariusconsulting.net/blogs/kzu/archive/2006/06/09/GoogleAnalyticsFlash.aspx)

I recently subscribed ([with 2 lines of web.config](http://clariusconsulting.net/blogs/kzu/archive/2006/06/08/InstantGoogleAnalytics.aspx "Setting up Google Analytics with 2 lines of web.config using an IHttpModule")) a couple sites with [Google Analytics](http://www.google.com/analytics/), which is very cool. 

Now, to those who didn't believe my statement from a few days ago, that [Ajax was a waste of time if you want to get advanced UIs](http://clariusconsulting.net/blogs/kzu/archive/2006/05/24/AjaxIsDead.aspx), even **Google knows it**. Take a look at this cool visualization of some stats:

![GoogleAnalyticsFlash.png](/web/20060615045857im_/http://clariusconsulting.net/ImageGallery/kzu/GoogleAnalyticsFlash.png)

What you cannot see in that static screenshot, is that when you click in one of the legends in a pie chart, the corresponding pie "piece" moves away from the rest, as you can see above in Visits by Source, for google itself. The Geo Map overlay is awesome too.

Guess what's all that. Yes, Flash!!!

I hope Google continues this trend complementing the unbelievable cool Ajax stuff they are doing with things like the [Google Spreadsheets](http://google.com/googlespreadsheets/try_out.html):

![GoogleSpreadsheets.png](/web/20060615045857im_/http://clariusconsulting.net/ImageGallery/kzu/GoogleSpreadsheets.png)u

posted [Friday, June 09, 2006 6:32 AM](http://clariusconsulting.net/blogs/kzu/archive/2006/06/09/GoogleAnalyticsFlash.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [2 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/06/09/GoogleAnalyticsFlash.aspx#comments)

  

[![](/web/20060615045857im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
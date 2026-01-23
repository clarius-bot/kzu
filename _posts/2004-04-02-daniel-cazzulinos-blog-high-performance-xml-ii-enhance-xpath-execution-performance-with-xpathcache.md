---
layout: post
title: "Daniel Cazzulino's Blog : High-performance XML (II'): Enhance XPath execution performance with XPathCache"
date: 2004-04-02 00:00:00 +0000
---

Daniel Cazzulino's Blog : High-performance XML (II'): Enhance XPath execution performance with XPathCache


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2708'\))| July 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2769'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
24| 25| 26| 27| 28| 29| 30  
1| [2](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/2.aspx "1 Post")| 3| 4| 5| 6| 7  
8| 9| 10| 11| 12| [13](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/13.aspx "2 Posts")| [14](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/14.aspx "1 Post")  
[15](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/15.aspx "1 Post")| [16](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/16.aspx "3 Posts")| 17| 18| [19](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/19.aspx "2 Posts")| 20| 21  
22| [23](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/23.aspx "1 Post")| 24| [25](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/25.aspx "1 Post")| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2004/4/26.aspx "2 Posts")| 27| 28  
29| 30| 31| 1| 2| 3| 4  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070715180512im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20070715180512im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20070715180512im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20070715180512im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## High-performance XML (II'): Enhance XPath execution performance with XPathCache 

Just about a month ago, most XVPs (XML MVPs) started the opensource [Mvp.Xml project](http://sf.net/projects/mvp-xml) aimed at providing a single point of entry for all our efforts in advancing XML processing and APIs in .NET. By having a single project to look for, you can take advantage of the implementation of most stuff you read regularle though the MVPs weblogs, including this one. The code will contain references to the appropriate weblog posts whenever they're available. 

So, here comes the turn for the first contribution to the project. Some time ago, I explained [how to take advantage of XPath expression precompilation](http://weblogs.asp.net/cazzu/archive/2003/10/07/30888.aspx), even in the face of dynamic values that change at run-time. This post gave birth to the `DynamicContext` class which implements this functionality. 

This time, I'll tackle the "problem" about precompiling XPath expressions: there's just so many lines of code to use! (I don't care about that, but you may). Besides that, you have to remember to keep these expressions in memory to gain some more performance, etc. Typically, compiling, setting the context (`XmlNamespaceManager`) and selecting some nodes looks like the following:
    
    
     string expr = "//mvp:titles[mvp:price > 10]";  
       
     XPathDocument doc = new XPathDocument(source);  
     XPathNavigator docnav = doc.CreateNavigator();  
     XPathExpression xpath = docnav.Compile(expr);  
       
     XmlNamespaceManager mgr = new XmlNamespaceManager(docnav.NameTable);  
     mgr.AddNamespace("mvp", "mvp-xml");  
     xpath.SetContext(mgr);  
       
     int count = doc.CreateNavigator().Select(xpath).Count;

Note: I always clone/create new navigators whenever I'm about to use them, because as explained in a [previous post](http://weblogs.asp.net/cazzu/archive/2003/10/09/31294.aspx) it's very cheap operation, and XPath expression compilation causes cursor movements. So, to ensure the cursor is always at the starting point, I get a fresh one from the `XPathDocument`. 

The expression used above is not being reused. We would have to put it in some static variable, initialize it upon first use, and so on. This is where the `XPathCache` comes in handy. You can replace all the above code with:
    
    
     string expr = "//mvp:titles[mvp:price > 10]";  
       
     XPathDocument doc = new XPathDocument(source);  
       
     XmlNamespaceManager mgr = new XmlNamespaceManager(docnav.NameTable);  
     mgr.AddNamespace("mvp", "mvp-xml");  
       
     int count = XPathCache.Evaluate(expr, doc.CreateNavigator(), mgr);

Ok, you don't get so many lines less, but XPathCache will automatically precompile the expression the first time it's used, and store it for later. Whenever you pass the same XPath query string, you'll be reusing the cached precompiled version. Now, this wouldn't be at all efficient if (just as in the case shown), we are passing the price to query appended directly to the string, such as:
    
    
    public int GetExpensiveBooks(IXPathNavigable doc, int minPrice)  
    {  
     string expr = "//mvp:titles[mvp:price > " + minPrice + "]";  
     ...  
     return XPathCache.Select(expr, doc.CreateNavigator(), mgr).Count;  
    }

In this case, we would be compiling and caching an expression for each distinct value received by the method! Not good at all! Here's where the integration between utilities released through weblog posts enters the scene. I talked about dynamic compilation before. That class is included in the Mvp.Xml project. Therefore, the cache also takes advantage of it. Among the many overloads, there's one that allows you to pass variables, as a struct with a name and a value to use:
    
    
    public int GetExpensiveBooks(IXPathNavigable doc, int minPrice)  
    {  
     string expr = "//mvp:titles[mvp:price > $price]";  
     ...  
     return XPathCache.Select(expr, doc.CreateNavigator(), mgr,   
     new XPathVariable("price", minPrice)).Count;  
    }

Now you're effectively using a single compilation for all possible values. What's more, the last parameter, the variable, is defined in the method with the keyword `params`, so you can pass as many variables as you need. There are many overloads, which also allow you to `Evaluate` an expression. 

Finally, there's the case with `XmlDocument` and the different handling about iteration over results. I discussed this in a [previous article](http://weblogs.asp.net/cazzu/archive/2004/03/09/86609.aspx) also, where I show the problem, and how to solve it. It turns out that I didn't chose the optimal solution to it. I created a class that only implemented `IEnumerable`, and therefore wasn't compatible with `XmlNodeList` you could be expecting. I fixed that for this initial contribution to the [Mvp.Xml project](http://sf.net/projects/mvp-xml), and directly inherited the abstract `XmlNodeList` class and implemented the iteration so that you don't have to change your code currently consuming it. I implemented the public interface as a factory method, so that the API isn't poluted with the implementation classes. It's called XmlNodeListFactory and it's used simply with: 
    
    
     XPathNodeIterator it; // from a query  
     XmlNodeList nodes = XmlNodeListFactory.CreateNodeList(it);  
       
     foreach (XmlNode node in nodes)  
     //do your stuff  
     

Internally, the implementation is similar to that (hidden) in .NET.

With this implementation at hand, I could extend the `XPathCache` to support `SelectNodes` and `SelectSingleNode`, while still reusing the XPath compilation and caching. The methods have different signature in order to account for the fact that they can only be executed against an `XmlNode`:
    
    
     public XmlNodeList GetExpensiveBooks(XmlNode doc, int minPrice)  
    {  
     string expr = "//mvp:titles[mvp:price > $price]";  
     ...  
     return XPathCache.SelectNodes(expr, doc, mgr, new XPathVariable("price", minPrice));  
    }

The overloads allow you to execute each query (`Evaluate`, `Select`, `SelectNode` and `SelectSingleNode`) with the following parameters (source can be `XPathNavigator` or `XmlNode` depending on the method):

  * string expression, source 
  * string expression, source, XmlNamespaceManager context 
  * string expression, source, params XPathVariable[] args 
  * string expression, source, XmlNamespaceManager context, params XPathVariable[] args

That accounts for all use cases I could think of. The full project source code (including the entire XPathCache class) can be downloaded from [SourceForge](http://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234).

Enjoy and please give us feedback on the project!

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted on Friday, April 02, 2004 5:22 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/198.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2004/04/02/198.aspx#19537 "permalink") Roadmap to high performance XML @ Wednesday, February 14, 2007 6:49 PM

Note : this entry has moved . I&amp;#39;ll keep the updated list of posts relating to performance in XML [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2004/07/09/HiPerfXML.aspx "TrackBack")

  

[![](/web/20070715180512im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
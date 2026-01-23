---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-07 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Tuesday, October 07, 2003 - Posts

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060207043255im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Tuesday, October 07, 2003 - Posts

#####  [High-performance XML (I): Dynamic XPath expressions compilation](http://clariusconsulting.net/blogs/kzu/archive/2003/10/07/82.aspx)

"Everybody" knows that precompiling your XPath expressions ahead of time, usually in static .ctors, improves execution performance. But what's actually happening at that "compilation" time? Unlike what many believe, compiled IL is NOT being generated, neither on-the-fly assemblies or anything like it. It's NOT like `RegEx` compilation, sadly. But what's going on is important for performance because it involves parsing, AST (abstract syntax tree) building, etc. 

Executing an XPath expression involves the following:

  * Creating an XPathNavigator (if it's not executed directly against one) 
  * Compiling the expression, which in turn involves: 
    * Building an IQuery which consists of: 
      * Parsing the expression: XPathParser.ParseXPathPattern (using a parser and a scanner) 
      * Processing the AstNode built in the previous step: nodes, axis, operators, etc. Objects for each of them.
    * Initializing an CompiledXPathExpr object from the previous ones.
  * Constructing an XPathSelectionIterator with the expression, which involves: 
    * Cloning the source navigator 
    * Retrieving the query from the compiled expression 
    * Setting the query context to another clone of the source navigator
  * On iteration through the list, the query is advanced until it reaches the end. Each advance returns a new XPathNavigator node which is used afterwards (or null if nothing else is found).

If the expression is s executed through an `Evaluate` and its `ReturnType` is not a `ReturnType.NodeSet`, in which case, the last 2 steps are ommited, and the expression is directly evaluated to an object (the IQuery built in this case can be an AndExpr, LogicalExpr, NumberFunctions, NumericExpr, etc). 

It's important to realize that whether you use `XmlDocument.Select` or `XmlDocument.SelectSingleNode`, or you use an `XPathNavigator`, if you don't use a "precompiled" `XPathExpression` you will pay the expression validation and parsing each time you execute it.  
As you can see from the process described above, the compilation step has nothing to do with validity of the expression with respect to an instance document (the actual XML to be queried). It's all about the expression itself, irrespective of the document. So, if your argument against precompiling the expression is that you need the document to call `XmlDocument.CreateNavigator().Compile(expression)`, you're wrong. You don't need it. In fact, not only is the document irrelevant but also namespaces, custom functions and variables resolving, etc. So, you  CAN precompile ALWAYS by doing something like this: 

``
    
    
    public class ExpressionsCache  
    {  
     static ExpressionsCache()  
     {  
     XmlDocument doc = new XmlDocument();  
     XPathNavigator nav = doc.CreateNavigator();  
       
     _cachedExpr = nav.Compile("/dsPubs/publishers/titles");  
     }  
    }

The other usual excuse for not compiling the expressions is that you have dynamic values that are appended at run-time that built the expression. For example:

``
    
    
    private void DoSomethingWithExpensivePublisherBooks(  
     XPathNavigator document, string publisherId, double price)  
    {  
     string path = String.Concat("/dsPubs/publishers/titles[pub_id = ",   
     id, " and price < ", price.ToString(), "]");  
       
     XPathNodeIterator titles = document.Select(path);  
    }

(Note: incredibly long function names seem to be in vogue lately, haven't you noticed? Internal `System.Web.FileChangesMonitor` class has a method named `StartMonitoringDirectoryRenamesAndBinDirectory`. It clearly wins the price AFAIK!)

It seems unavoidable to build the string representing the XPath expression at run-time, right? WRONG. Extensibility in XPath classes and evaluation allows you to write expressions like the following:

``
    
    
    "/dsPubs/publishers/titles[pub_id = $id and price < $price]"

Where the `$id` and `$price` variables are provided and resolved at evaluation time. This is achieved by building a custom `XsltContext`-derived class and providing the support for variables. This is explained in [ MSDN](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnexxml/html/xml10212002.asp) and in a [ rather brief](http://support.microsoft.com/default.aspx?scid=KB;EN-US;Q324462%07d) how-to MS document. The catch, then, is having a programmer-friendly custom context that allows us to add variables to it, set it as the context of the precompiled expression (after cloning it to avoid threading issues) and execute the expression, having the variables evaluated at run-time:

``
    
    
    // Expression precompiled somewhere else  
    XPathExpression expr =   
     DynamicContext.Compile("/dsPubs/publishers/titles[pub_id = $id and price < $price]");  
      
    // Using the expression with variables supplied  
    DynamicContext ctx = new DynamicContext();  
    ctx.AddVariable("id", id);  
    ctx.AddVariable("price", price);  
      
    // Clone expression for thread-safety  
    XPathExpression cloned = expr.Clone();  
    cloned.SetContext(ctx);  
      
    // Execute expression with variables!  
    XPathNodeIterator it = nav.Select(cloned);

The new code involves creating the `DynamicContext` class and adding the variables, and potentially the namespaces in use (just as you would do with an XmlNamespaceManager normally). With the new approach, you get between  1.5X and 2X performance boost!.

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

The full project source code belongs to the [ Mvp.Xml project](http://sf.net/projects/mvp-xml) and can be downloaded from [ SourceForge](http://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234). Enjoy!

posted [Tuesday, October 07, 2003 12:20 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/07/82.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/07/82.aspx#comments)

  

![](/web/20060207043255im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
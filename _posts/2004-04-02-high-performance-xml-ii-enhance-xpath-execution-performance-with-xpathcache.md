---
layout: post
title: 'High-performance XML (II''): Enhance XPath execution performance with XPathCache'
date: 2004-04-02 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/106667
tags:
- .NET
- Mvp.Xml project
- XML
- XML Performance

---

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

/kzu

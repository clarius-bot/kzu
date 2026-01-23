---
layout: post
title: "Daniel Cazzulino"
date: 2003-09-22 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : WebService proxy bug?: &quot;Web Service method name is not valid.&quot;

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
7| 8| 9| 10| 11| 12| 13  
14| 15| 16| 17| 18| 19| 20  
21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/9/22.aspx "2 Posts")| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2003/9/26.aspx "1 Post")| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060531072717im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## WebService proxy bug?: &quot;Web Service method name is not valid.&quot; 

Let's suppose you create a proxy for a webservice. Assume that you KNOW that only certain (signed) code should use your proxy, then, it's only natural that you add a `[StrongNameIdentityPermission](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfSystemSecurityPermissionsStrongNameIdentityPermissionClassTopic.asp)` to its declaration: 

`
    
    
    [StrongNameIdentityPermission(SecurityAction.LinkDemand,PublicKey="your_trusted_key")] 
    public class MyWebService : SoapHttpClientProtocol 
    

`

When you try to call any method with such a proxy, you'll get a pretty strange error: 

`[your_webmethod] Web Service method name is not valid.`

It turns out to be that because of the permission, the internal classes that reflect your type can't get the methods in the class. And when the method to call is looked-up in an internal list and not found, that exception is thrown. However, there's nothing wrong with the method name. The method that throws the exception is `[SoapHttpClientProtocol](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwebservicesprotocolssoaphttpclientprotocolclasstopic.asp).BeforeSerialize`, which performs the lookup against a private instance of the type `SoapClientType`.   
The proxy initialization code involves the following steps before that failure: 

  1. Proxy constructor initializes a `SoapClientType`: it passes the current proxy type so that it is reflected to get the web methods.
  2. `SoapClientType` constructor calls `[LogicalMethodInfo.Create](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwebservicesprotocolslogicalmethodinfoclasscreatetopic.asp)` passing all the proxy public methods, retrieved using `[Type.GetMethods(BindingFlags.Instance | BindingFlags.Public)](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfSystemTypeClassGetMethodsTopic.asp)`. This method checks for asynchronous methods and does some other trivial work.
  3. `SoapClientType` constructor calls `SoapReflector.ReflectMethod` with each `[LogicalMethodInfo](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwebservicesprotocolslogicalmethodinfoclasstopic.asp)` constructed in the previous step.

I've tracked down the bug by making extensive use of reflection. I've executed each of the methods above, which I identified as the hot-spots for the bug, using trusted code (the assembly signed with the key required by the proxy) and then with untrusted code, which will always be the case for System.Web.Services.dll. Here are the results: 
  * `SoapClientType` constructor: it works as expected, but its internal list of methods available is empty when the constructor is run without the required public key: 

`
        
        Type t = ReflexHelper.LoadPrivateType(
            "System.Web.Services.Protocols.SoapClientType, System.Web.Services");
        object sct = Activator.CreateInstance(
              t, BindingFlags.Instance | BindingFlags.NonPublic, null, 
                new object[] { typeof(Messaging.MessagingWebService) }, null, null);
        FieldInfo fi = t.GetField("methods", 
              BindingFlags.Instance | BindingFlags.NonPublic);
        Hashtable methods = fi.GetValue(sct) as Hashtable;

`

Note that I access a private field called `methods` which contains the list loaded by the constructor code.   
I went deeper as the `methods` hastable I got was always empty when I run the unsigned version. The following method is called inside this constructor, and is the next hot-spot. 
  * `LogicalMethodInfo.Create`: it correctly returns the list of methods irrespective of the signature of the calling code. Therefore, the bug isn't here: 

`
        
        MethodInfo[] mis = typeof(MyWebService).GetMethods(
                BindingFlags.Instance | BindingFlags.Public);
        LogicalMethodInfo[] li = LogicalMethodInfo.Create(mis, LogicalMethodTypes.Sync);

`

So I went further to the call on `SoapReflector`. 
  * `SoapReflector.ReflectMethod`: I couldn't go any further than this because the dependecies are too deep with other private and internal types. However, this method IS the one to blame for the strange error. It fails to reflect the methods on the type because of the `[StrongNameIdentityPermission](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfSystemSecurityPermissionsStrongNameIdentityPermissionClassTopic.asp)`, but does not throw any exceptions, thus swallowing the fact that it's a security permission that is failing, instead of the unrelated exception thrown at the moment we actually perform the WebMethod call on the proxy.   
Here's the code that proves it: 

`
        
        ArrayList list = new ArrayList();
        t = ReflexHelper.LoadPrivateType(
                "System.Web.Services.Protocols.SoapReflector, System.Web.Services");
        MethodInfo reflect = t.GetMethod("ReflectMethod", 
                BindingFlags.Static | BindingFlags.NonPublic);
        
        foreach (LogicalMethodInfo i in li)
        {
            //This always returns null if we're not signed with the key required 
            //(always the case for System.Web.Services.dll)
            object m = reflect.Invoke(
                null, BindingFlags.Static | BindingFlags.NonPublic, null, 
                new object[] { 
                    i, true, new XmlReflectionImporter(), 
                    new SoapReflectionImporter(), "default-namespace" }, 
                    null);
            if (m != null)
                list.Add(m);
        }
        
        Console.WriteLine(list.Count);

`

Signing this test console project with the public key required by the proxy results in the correct list of webmethods being loaded into the `list` object. The object returned by the `ReflectMethod` is checked in the `SoapClientType` constructor, but only for non-null returns. If the returned object is null, nothing is done and the internal list of available methods will silently remain empty. 

So, how do you protect the class now? Well, put your demand in the class constructor instead of the definition, and nobody will be able to instantiate your proxy unless it's signed with the trusted key. What's more, it makes the code more performant because it avoids the check for each member used (as is the case for the class-level demand). 

posted on Monday, September 22, 2003 1:49 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/77.aspx) :: 

  

[![](/web/20060531072717im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
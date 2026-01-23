---
layout: post
title: "Daniel Cazzulino"
date: 2003-12-10 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : ASP.NET low-level fun

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| [1](http://clariusconsulting.net/blogs/kzu/archive/2003/12/1.aspx "1 Post")| [2](http://clariusconsulting.net/blogs/kzu/archive/2003/12/2.aspx "1 Post")| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2003/12/4.aspx "1 Post")| 5| 6  
7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/12/11.aspx "2 Posts")| [12](http://clariusconsulting.net/blogs/kzu/archive/2003/12/12.aspx "1 Post")| 13  
14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2003/12/16.aspx "1 Post")| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/12/17.aspx "2 Posts")| [18](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18.aspx "2 Posts")| [19](http://clariusconsulting.net/blogs/kzu/archive/2003/12/19.aspx "1 Post")| 20  
21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/12/22.aspx "1 Post")| 23| 24| 25| 26| 27  
28| [29](http://clariusconsulting.net/blogs/kzu/archive/2003/12/29.aspx "2 Posts")| [30](http://clariusconsulting.net/blogs/kzu/archive/2003/12/30.aspx "1 Post")| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060530105558im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## ASP.NET low-level fun 

Sometimes you need low level information about the current request in a web application, such as the IP address of the physical network adapter the request came through (cool in clustered multi-NIC servers), or some other weird stuff you can't find in the higher-level view provided by `HttpRequest`, ` HttpResponse`and friends.  
Luckily, the `HttpContext` implements `IServiceProvider`, which means you can ask for services with the following code:

`
    
    
    IServiceProvider provider = (IServiceProvider) HttpContext.Current;
    // Get the request
    HttpRequest util = (HttpRequest)
      provider.GetService(typeof(HttpRequest));

`

OK, I know... who on earth would use that instead of simply calling `HttpContext.Current.Request`??? Well, THE one thing you can get that there's absolutely NO other way of getting, is the current `[ HttpWorkerRequest](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemwebhttpworkerrequestclasstopic.asp)`:

`
    
    
    // Get the worker
    HttpWorkerRequest wr = (HttpWorkerRequest)
      provider.GetService(typeof(HttpWorkerRequest));
    // Get the NIC address!!!!
    string addr = wr.GetLocalAddress();

`

Another very cool use is to retrieve known header values. Usually, you just get the header from the `Request.Header` collection by its name:

`
    
    
    // Would return "Keep-Alive" if enabled.
    string cn = Request.Headers["Connection"]; 
    // Would return "gzip, deflate" for example.
    string enc = Request.Headers["Accept-Encoding"];

`

but that's prone to errors, and you have to sort of guess the casing, etc. This is the cool way: 

`
    
    
    // Get the worker
    HttpWorkerRequest wr = (HttpWorkerRequest)
      provider.GetService(typeof(HttpWorkerRequest));
    
    string cn = wr.GetKnownRequestHeader(HttpWorkerRequest.HeaderConnection); 
    string enc = wr.GetKnownRequestHeader(HttpWorkerRequest.HeaderAcceptEncoding);

`

Have a look at the [ class members](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemwebhttpworkerrequestmemberstopic.asp) , there are quite a few interesting things, now that you can call them ;)... and use them NOW, before they regret making such a beast available...

posted on Wednesday, December 10, 2003 8:01 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/115.aspx) :: 

  

[![](/web/20060530105558im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
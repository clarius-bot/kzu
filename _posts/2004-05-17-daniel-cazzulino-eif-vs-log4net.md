---
layout: post
title: "Daniel Cazzulino : EIF vs log4net"
date: 2004-05-17 00:00:00 +0000
---

Daniel Cazzulino : EIF vs log4net

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * 

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2100'\))| November 2005| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2161'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| [7](http://clariusconsulting.net/blogs/kzu/archive/2004/5/7.aspx "1 Post")| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/5/8.aspx "1 Post")| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/5/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2004/5/11.aspx "1 Post")| 12  
[13](http://clariusconsulting.net/blogs/kzu/archive/2004/5/13.aspx "1 Post")| [14](http://clariusconsulting.net/blogs/kzu/archive/2004/5/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/5/15.aspx "1 Post")| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/5/17.aspx "2 Posts")| 18| 19  
20| 21| 22| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/5/26.aspx "2 Posts")  
27| 28| 29| 30| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
  

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## EIF vs log4net 

I've been doing a comparison of both products recently. Before you read, I must say that I used [log4net](http://logging.apache.org/log4net/) a lot (I even appear as a contributor :o), so I may be biased. On the other hand, I only evaluated EIF, looked at how it's used in a real world product, and read the documentation provided, as well as built the examples. 

Here are my conclusions.

Conventions:

· x: feature is supported equally.

· -: feature is supported/implemented, but is not as good as the other product

· +: feature is better supported/implemented than the other product

**Feature** |  **EIF** |  **log4net**  
---|---|---  
General  
Decoupling of event source and event sink |  x |  x  
Arbitrary target event sinks |  x |  x  
Number of built-in event sinks supported |  3 |  20  
Extensible |  x |  x  
Configuration |  - (quite complex) |  + (very simple)  
WMI supported built-in |  x |   
Arbitrary log data |  + |  - (built-in just text)  
Multiple logging "domains" (ability to configure the framework by modules, i.e. each logical feature has its own config, repository and sinks) |  |  +++ (a BIG plus for highly composed and pluggable apps)  
Installation |  - (mostly requires admin permissions) |  + (xcopy)  
Support |  ? |  x (excelent peer support)  
Source provided |  |  +  
Supported Platforms |  .NET |  .NET, CF, Mono, SSCLI  
|  |   
Runtime |  |   
Performance with logging enabled |  x |  x  
Performance with logging disabled for a certain event |  - |  ++ (orders of magnitude faster)  
Reconfiguration |  - (only possible with WMI or Windows Trace) |  + (full configuration monitoring & reloading)  
|  |   
API - Dev friendliness |  |   
Event (source) categorization |  - (uses the event Type. leads to increasingly big hierarchies of event types) |  ++ (combination of log level + logger name -dotted notation-)  
Event source inheritance |  |  ++ (filters and sinks applied to all descendant sources)  
Customization |  x |  + (everything)  
|  |   
  
One of the "distinguishing" features of EIF is request tracing, but it is mostly irrelevant as it only works using the remoting CallContext, which reduces its applicability considerably. And remoting is not a long-term platform to rely on either... For request-like tracing on a single thread (important when there're multiple components involved in an operation happening on a single machine/thread) log4net offers similar functionality through its Nested Diagnostics Context.

For business events that rely on arbitrary objects being send, EIF has a clear advantage. I wonder, however, how many business notification scenarios are actually handled through logging... Through customization similar functionality could be implemented in log4net, however.

**Overall** : both seem like good logging packages. EIF may be more manageable as it has strong relationship with WMI. log4net, on the other hand, clearly wins on simplicity and in my opinion satisfies most common logging and tracing needs. 

Except for the extra WMI stuff (which can also be implemented as custom extensions to log4net - I've done it) and arbitrary objects publication (also achievable, but requiring more work), I'd choose log4net. 

## Side Note

**log4net "event source" (loggers)** : in log4net, you ask for a logger to the LogManager. Using a simple dotted syntax, you create hierarchycal loggers that inherit sinks, filters and threshold very easily. For example, the following code asks for a logger and logs an informational message:
    
    
    ILog log = LogManager.GetLogger("Finance.Accounting.Customers.Administration");
    
    
    if (Log.IsInfoEnabled)
    
    
    {
    
    
      log.Info("Adding user " + _userId);
    
    
    }

some other component in the same module may use the following:
    
    
    ILog log = LogManager.GetLogger("Finance.Accounting.Orders");
    
    
    if (Log.IsInfoEnabled)
    
    
    {
    
    
      log.Info("Adding order " + _orderId);
    
    
    }

All the "Finance" application, or the "Accounting" module can be configured in a single place, and affect both components. A common use is to pass the current component type to the GetLogger() method, therefore making the logger match class full names, which is also an easy way to configure groups of components or modules in an application. For example:
    
    
    <!-- Enables all logging events in finance application (both components above) -->
    
    
    <logger name="Finance ">
    
    
      <level value="ALL" />
    
    
    </logger>
    
    
     
    
    
    <!-- Enables INFO logging events in accounting module (both components above) -->
    
    
    <logger name="Finance.Accounting">
    
    
      <level value="INFO" />
    
    
    </logger>
    
    
     
    
    
    <!-- Enables INFO logging events in Orders module (only for the last code above) -->
    
    
    <logger name="Finance.Accounting.Orders">
    
    
      <level value="INFO" />
    
    
    </logger>

Custom logger levels can be used directly, without previous definition, for example "BusinessEvent" or "CriticalOperation". This functionality, combined with hierarchycal loggers is very flexible and completely removes the need in EIF for defining custom types for every event. In addition, arbitrary key-value (only strings) can be logged by using a so-called Mapped Diagnostics Context. Functionality similar to request tracing in EIF is available through Nested Diagnostic Context, that is threads-specific. 

I'd love to hear arguments in favor of EIF. I may be missing some other features it has to offer, or I may have misunderstood some of its functionality, as (like I said) I haven’t used it before. 

Have you used both products? What do you think about the points made above? 

posted on Monday, May 17, 2004 12:32 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/235.aspx) :: 

  

![](/web/20051125134706im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
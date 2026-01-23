---
layout: post
title: "Daniel Cazzulino"
date: 2005-12-01 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : MS doing the wrong thing because of the wrong backwards compatibility reasons (TypeConverter.IsValid story)

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| [1](http://clariusconsulting.net/blogs/kzu/archive/2005/12/1.aspx "1 Post")| 2| 3| 4| 5| 6  
7| [8](http://clariusconsulting.net/blogs/kzu/archive/2005/12/8.aspx "2 Posts")| 9| 10| 11| 12| 13  
[14](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14.aspx "2 Posts")| 15| 16| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2005/12/19.aspx "1 Post")| 20  
21| 22| 23| 24| 25| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060515091041im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## MS doing the wrong thing because of the wrong backwards compatibility reasons (TypeConverter.IsValid story) 

About a year ago (feb-22-2005) [I reported a bug in the implementation of most built-in TypeConverters](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?feedbackid=FDBK21792), which is that even if the value you pass to `IsValid` is invalid for the target type, it will return true. To better understand the issue (which is fairly trivial anyway), say you have code like the following that performs validation on a property value before setting it:
    
    
    object theObject;        // Received somehow  
    object theValue;         // Received somehow  
    PropertyInfo property;   // Get the property info using reflection for the property we're about to set.  
      
    TypeConverter converter = TypeDescriptor.GetConverter(property.PropertyType);  
    if (!converter.IsValid(theValue))  
    {  
        throw new ArgumentException();  
    }  
    else  
    {  
        property.SetValue(theObject, theValue, null);  
    }  
    

Now, because of the bug I mentioned, the if will never enter as the built-in converters will always report a valid value even if you pass an "asdf" for an integer property, for example. So, obviously my code has a bug that I still didn't realize (assuming I didn't do any TDD, of course, as otherwise I'd already know there's no way that code would work as expected).

Someone on the .NET team decided that it was going to be a breaking change to fix it. In their words, two months after I reported the bug, they said:

> "Since TypeConverters are used so widely, changing the Int32Converter (and the other TypeConverters mentioned) to override IsValid will likely break applications, ..."

Now, how can an application be broken if a piece of functionality is not usable because it never behaves as expected? Clearly the application is already broken (if it uses code like the one I showed above) and probably the developers didn't realize yet. 

After I reopened the bug so that it gets considered for post-Whidbey, I got the following answer:

> "We do not have the luxury of making that risky assumption that people will not be affected by the potential change."

And closed as won't fix. I think this is a clear case where the back-compat issue is taken too far and clearly hinders the usability and quality of the platform. 

If you agree, [go vote the bug](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?feedbackid=FDBK21792). The .NET platform CAN be better.

posted on Thursday, December 01, 2005 11:20 AM by [admin](http://clariusconsulting.net/user/Profile.aspx?UserID=1000)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/407.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/12/01/BackCompatSucks.aspx#411 "permalink") re: MS doing the wrong thing because of the wrong backwards compatibility reasons (TypeConverter.IsValid story) @ Friday, December 02, 2005 10:10 AM

Eso te demuestra con quien tratamos. No les postees mas bugs y a la lona.   
  
Saludos [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

Dario K!

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2005/12/01/BackCompatSucks.aspx#412 "permalink") re: MS doing the wrong thing because of the wrong backwards compatibility reasons (TypeConverter.IsValid story) @ Friday, December 02, 2005 10:15 AM

Acabo de entrar al link que pusiste. simplemente terrible. Son duros los tipos eh? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

Dario K!

  

[![](/web/20060515091041im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
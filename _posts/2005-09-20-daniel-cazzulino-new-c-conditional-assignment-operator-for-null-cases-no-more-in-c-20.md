---
layout: post
title: "Daniel Cazzulino : New C# conditional assignment operator ?? for null cases!! (no more ? .. : in C# 2.0)"
date: 2005-09-20 00:00:00 +0000
---

Daniel Cazzulino : New C# conditional assignment operator ?? for null cases!! (no more ? .. : in C# 2.0)

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2131'\))| December 2005| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| 3  
4| 5| 6| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2005/9/9.aspx "2 Posts")| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2005/9/20.aspx "2 Posts")| 21| 22| 23| 24  
[25](http://clariusconsulting.net/blogs/kzu/archive/2005/9/25.aspx "1 Post")| 26| 27| [28](http://clariusconsulting.net/blogs/kzu/archive/2005/9/28.aspx "1 Post")| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
  

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

## New C# conditional assignment operator ?? for null cases!! (no more ? .. : in C# 2.0) 
    
    
    object obj = canBeNull ?? alternativeObj;
    
    // equals:
    
    object obj = canBeNull != null ? canBeNull : alternativeObj;

And it can be nested!   
I love it!  
  
[see [MSDN](http://msdn2.microsoft.com/en-us/library/ms173224)]  
[via [BradWilson](http://www.agileprogrammer.com/dotnetguy/) code]  

posted on Tuesday, September 20, 2005 5:36 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/383.aspx) :: 

  

![](/web/20051224100251im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
---
layout: post
title: "Daniel Cazzulino"
date: 2004-01-09 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Make first letter uppercase

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
7| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/1/8.aspx "1 Post")| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/1/9.aspx "2 Posts")| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/1/12.aspx "1 Post")| 13  
14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/1/16.aspx "1 Post")| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/1/19.aspx "1 Post")| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/1/20.aspx "2 Posts")  
[21](http://clariusconsulting.net/blogs/kzu/archive/2004/1/21.aspx "1 Post")| [22](http://clariusconsulting.net/blogs/kzu/archive/2004/1/22.aspx "1 Post")| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/1/23.aspx "1 Post")| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/1/26.aspx "2 Posts")| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502021432im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Make first letter uppercase 

The traditional way of doing this is suming the difference between letter "A" and "a" to the first character. However, this will not work in internationalized scenarios. [Here](http://www.hackcraft.net/xmlUnicode/#sect40) are the good reasons together with a great article on Unicode in general.  
So I use the following approach, which is I18N-ready: 

`
    
    
    private string MakeFirstUpper~~MakePascalCase~~( string name )
    {
            if ( name.Length return Char.ToUpper( name[0] ).ToString() + name.Substring( 1 );
            Char[] letters = name.ToCharArray();
            letters[0] = Char.ToUpper( letters[0] );
            return new string( letters );
    }

`

We don't need to pass the current culture to both `String.ToUpper` and `Char.ToUpper()` as they already do that internally.  
Do you think there's a more efficient/cleaner way of doing this?

posted on Friday, January 09, 2004 10:07 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/133.aspx) :: 

  

[![](/web/20060502021432im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
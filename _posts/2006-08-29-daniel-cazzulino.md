---
layout: post
title: "Daniel Cazzulino"
date: 2006-08-29 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, January 16, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))| August 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2435'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/1/8.aspx "1 Post")| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/1/9.aspx "2 Posts")| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/1/12.aspx "1 Post")  
13| 14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/1/16.aspx "1 Post")| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/1/19.aspx "1 Post")  
[20](http://clariusconsulting.net/blogs/kzu/archive/2004/1/20.aspx "2 Posts")| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/1/21.aspx "1 Post")| [22](http://clariusconsulting.net/blogs/kzu/archive/2004/1/22.aspx "1 Post")| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/1/23.aspx "1 Post")| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/1/26.aspx "2 Posts")  
27| 28| 29| 30| 31| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060829211637im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Friday, January 16, 2004 - Posts

#####  [MakePascal identifier (the XmlSerializer way)](http://clariusconsulting.net/blogs/kzu/archive/2004/01/16/136.aspx)

[In a previous post](http://weblogs.asp.net/cazzu/archive/2004/01/09/48987.aspx), I proposed an implementation of a simple method to make the first letter of an identifier uppercase, to get a pseudo PascalCase from an xml name. I've found that a better and more consistent way is to reuse the method used by the XmlSerializer to build the code identifiers, which is `System.Xml.Serialization.CodeIdentifier.MakePascal(string identifier)`

The class also exposes `MakeValid` and `MakeCamel` methods, which are usefull too. `MakeValid` is automatically called by the other two.

The pascal casing implementation is the following (reflectoring - that is, using Reflector):

`
    
    
    public static string MakePascal(string identifier)
    { 
      char ch1;
      identifier = CodeIdentifier.MakeValid(identifier);
      if (identifier.Length 

`

Using [the ToCharArray()](http://weblogs.asp.net/cazzu/archive/2004/01/09/48987.aspx) approach looks to me like a little more efficient string handling. The code above, near the end concatenates two strings, building a third one which is returned. If it used something like the following, it would save those two temporary strings:

`
    
    
      if (char.IsLower(identifier.Chars[0]))
      {
        Char[] letters = identifier.ToCharArray();
        letters[0] = Char.ToUpper( letters[0] );
        return new string( letters );
      }
    }

`

By the way, it looks like [readers' concerns](http://weblogs.asp.net/cazzu/archive/2004/01/09/48987.aspx#FeedBack) with regards to I18N are non-issues, as the .NET class uses the same approach I showed, basically making a unicode Char uppercase. Finally, note that this is not actually PascalCase, but only FirstLetterUpperCase, although such a method name wouldn't be cool at all... 

posted [Friday, January 16, 2004 10:47 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/01/16/136.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/01/16/136.aspx#comments)

  

[![](/web/20060829211637im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog : How to hide System.Object members from your interfaces"
date: 2008-03-10 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to hide System.Object members from your interfaces


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3013'\))| May 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3074'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| [3](http://www.clariusconsulting.net/blogs/kzu/archive/2008/3/3.aspx "1 Post")  
4| [5](http://www.clariusconsulting.net/blogs/kzu/archive/2008/3/5.aspx "1 Post")| 6| 7| 8| 9| [10](http://www.clariusconsulting.net/blogs/kzu/archive/2008/3/10.aspx "1 Post")  
11| 12| [13](http://www.clariusconsulting.net/blogs/kzu/archive/2008/3/13.aspx "2 Posts")| 14| 15| 16| [17](http://www.clariusconsulting.net/blogs/kzu/archive/2008/3/17.aspx "1 Post")  
18| [19](http://www.clariusconsulting.net/blogs/kzu/archive/2008/3/19.aspx "1 Post")| 20| 21| 22| 23| [24](http://www.clariusconsulting.net/blogs/kzu/archive/2008/3/24.aspx "1 Post")  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080503122031im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080503122031im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080503122031im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080503122031im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## How to hide System.Object members from your interfaces 

Sometimes, [System.Object](http://msdn2.microsoft.com/en-us/library/system.object.aspx) methods ([Equals](http://msdn2.microsoft.com/en-us/library/system.object.equals.aspx), [GetHashCode](http://msdn2.microsoft.com/en-us/library/system.object.gethashcode.aspx), [GetType](http://msdn2.microsoft.com/en-us/library/system.object.gettype.aspx) and [ToString](http://msdn2.microsoft.com/en-us/library/system.object.tostring.aspx)) only contribute clutter to VS intellisense. Everyone knows those members are always there, yet they are seldom used explicitly. This is especially important (and annoying) for fluent APIs that define the flow of invocations in terms of interfaces and usually have few members at each "step" of the statement.

For example, in the following [Moq](http://code.google.com/p/moq/ "A Moq framework powered by C# 3.5 and lambda expressions") expectation, at the particular step in the statement, there are only two "real" invocations that make sense. However, they are obscured by the [System.Object](http://msdn2.microsoft.com/en-us/library/system.object.aspx) members, which even outnumber them:

![image](https://web.archive.org/web/20080503122031im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtohideSystem.ObjectmembersfromAPIs_CE56/image.png)

A much cleaner intellisense is possible though:

![image](https://web.archive.org/web/20080503122031im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtohideSystem.ObjectmembersfromAPIs_CE56/image_3.png)

The trick comes from the [System.ComponentModel.EditorBrowsableAttribute](http://msdn2.microsoft.com/en-us/library/System.ComponentModel.EditorBrowsableAttribute.aspx), which controls visibility of members in VS intellisense. To hide a member from intellisense, you apply the following attribute to it:
    
    
    [EditorBrowsable(EditorBrowsableState.Never)]

[](http://11011.net/software/vspaste)

Now, you don't want to have to override all four object members in every type just to apply the attribute. A quite elegant solution exists, which involves taking advantage of implicit interface implementation. In particular, you can define an interface that re-defines all object members and applies the attribute:
    
    
        [EditorBrowsable(EditorBrowsableState.Never)]
        public interface IHideObjectMembers
        {
            [EditorBrowsable(EditorBrowsableState.Never)]
            Type GetType();
    
            [EditorBrowsable(EditorBrowsableState.Never)]
            int GetHashCode();
    
            [EditorBrowsable(EditorBrowsableState.Never)]
            string ToString();
    
            [EditorBrowsable(EditorBrowsableState.Never)]
            bool Equals(object obj);
        }
    

[](http://11011.net/software/vspaste)

Now you simply add this interface to all your classes or interfaces where you want to hide these members. Starting in [Moq v2](http://code.google.com/p/moq/downloads/list "Current Moq downloads"), we've done this with all the interfaces in our fluent API so that they don't clutter your discovery of the expected flow:
    
    
    public interface IVerifies : IHideObjectMembers

[](http://11011.net/software/vspaste)

Sometimes I do love VS :)

posted on Monday, March 10, 2008 9:59 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/58301.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/03/10/58301.aspx#58302 "permalink") How to hide System.Object members from your interfaces @ Monday, March 10, 2008 10:04 AM

Sometimes, System.Object methods ( Equals , GetHashCode , GetType and ToString ) only contribute clutter [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/03/10/how-to-hide-system-object-members-from-your-interfaces.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/03/10/58301.aspx#58360 "permalink") Interesting Finds: 2008.03.13 @ Wednesday, March 12, 2008 7:17 PM

Other:ImdbServices-searchmoviesbycode,title,actors,directors,etconimdb.comWeb:ProtoFlow... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.cnblogs.com/gOODiDEA/archive/2008/03/13/1103277.html "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/03/10/58301.aspx#58361 "permalink") Interesting Finds: 2008.03.13 @ Wednesday, March 12, 2008 7:18 PM

Other: Imdb Services - search movies by code,title,actors,directors,etc on imdb.com Web: ProtoFlow: Coverflow [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/yuanjian/archive/2008/03/12/interesting-finds-2008-03-13.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/03/10/58301.aspx#58462 "permalink") Hiding Members in Intellisense @ Sunday, March 16, 2008 9:53 AM

Hiding Members in Intellisense [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://code.bravo9.net/code/post/2008/03/Hiding-Members-in-Intellisense.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/03/10/58301.aspx#58950 "permalink") How to hide System.Object members from your interfaces @ Wednesday, March 26, 2008 4:03 AM

You've been kicked (a good thing) - Trackback from DotNetKicks.com [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl4$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.dotnetkicks.com/csharp/How_to_hide_System_Object_members_from_your_interfaces "TrackBack")

  

[![](/web/20080503122031im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
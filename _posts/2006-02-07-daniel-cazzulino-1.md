---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-07 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Saturday, October 11, 2003 - Posts

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060207043326im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Saturday, October 11, 2003 - Posts

#####  [Implementing public interfaces in protected &quot;mode&quot;](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11/88.aspx)

Quite often, we create interfaces as a way to allow extensibility in our OO projects. But as you know, all the members of the interface are public. So, if we don't want to polute our objects public members with the implementation of an interface that was intended for extenders and not the regular user, we can simply make the interface implementation explicit, effectively hiding the member from the class public interface: 

`
    
    
    public interface IExtensible
    {
      void Extend( object other );
    }		
    
    public Customer : IExtensible
    {
      void IExtensible.Extend( object other )
      {
        // Do something really cool.
      }
    }

`

So far so good. Now the `Extend` method will no longer appear in intellisense nor will it be available directly. To use it, it has to be casted to the `IExtensible` interface, but that isn't a problem at all, since most probably, the feature is intended to be used by a method that receives a parameter of type `IExtensible` anyways.   
But now the interface implementation can't be extended by inheritors of `Customer`! A pattern I've seen quite often throughout the .NET Framework to solve this is doing a double implementation of the method, one private (the explicit interface implementation) and another protected and virtual, so that inheritors can effectively override the base class' private interface implementation behavior: 

`
    
    
    public class Customer : IExtensible
    {
      protected virtual void Extend( object other )
      {
        // Do something really cool, but let inheritors change that.
      }
    
      void IExtensible.Extend( object other )
      {
        // Passthrough to the "real" implementation.
        Extend( other );
      }
    }
    

`

What we got now, is a non-poluted public interface for our class, yet inheritors have full access to features that were intended for their use, such as our interface that allows extensibility. If they don't want to inherit our implementations, they can always implement the interface directly, of course:

`
    
    
    public class ExtendedCustomer : Customer
    {
      protected override void Extend( object other )
      {
        // Stop doing cool things and just do the work.
      }
    }

`

posted [Saturday, October 11, 2003 6:55 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11/88.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11/88.aspx#comments)

  

![](/web/20060207043326im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
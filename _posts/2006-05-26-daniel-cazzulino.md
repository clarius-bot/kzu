---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-26 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, August 22, 2003 - Posts

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
21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/8/22.aspx "3 Posts")| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2003/8/26.aspx "3 Posts")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/8/27.aspx "1 Post")  
[28](http://clariusconsulting.net/blogs/kzu/archive/2003/8/28.aspx "1 Post")| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060526143909im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Friday, August 22, 2003 - Posts

#####  [Incredibly real, exciting and possible story!](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/69.aspx)

I can't stress enough how great [Neuromancer](http://www.amazon.com/exec/obidos/ASIN/0441569595/deverest-20/) is. I read it twice in a month... it is THAT good.  
The author, [William Gibson](http://www.amazon.com/exec/obidos/tg/browse/-/1044186/ref=br_dp__4/102-2085274-9847359), wrote this book back in 1985, when there was no Internet, no virtual reality, no Matrix movie!! Yet, he is the father of the "cyberspace" word, you can recognize a yet-to-be-created virtual reality device that "transmits" not only images but the full 5 senses to the user (the simestim), and he even mentions (and gives birth to) the Matrix! Yes... exactly with that name...   
A must-read for Matrix lovers, technology fans and those who wonder what the near future may look like.... 

posted [Friday, August 22, 2003 3:45 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/69.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/69.aspx#comments)

#####  [Using WSE (1.x) on a per-WebMethod basis](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/68.aspx)

WSE is great for several things, but as stated in [Programming with WSE 1.0](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnwebsrv/html/progwse.asp), you have to add the extension in the Web.config. However, this causes ALL exposed WebMethods to require WSE processing, thus, you can't secure some of them and leave others as "plain" ASP.NET WebServices. 

The solution is to use the other type of web service extension available on ASP.NET, an `SoapExtensionAttribute`-inherited class that can be applied to each desired attribute. The code for such an attribute class, allowing you to use WSE only on specific methods, follows:

`
    
    
    [AttributeUsage(AttributeTargets.Method, AllowMultiple=false)]
    public class WseExtensionAttribute : SoapExtensionAttribute
    {
    	public override Type ExtensionType
    	{
    		get { return typeof(WebServicesExtension); }
    	}
    
    	public override int Priority
    	{
    		get { return _priority; }
    		set { _priority = value;    }
    	} int _priority = 0;
    }
    

`

Now you can use the attribute only on the methods that require WSE processing:

`
    
    
    [WebMethod]
    [WseExtension]
    public void WseSecuredMethod()
    {
    }
    
    [WebMethod]
    public void NonWseMethod()
    {
    }
    

`

By looking at the [WSE 2.0 Technical Preview](http://microsoft.com/downloads/details.aspx?FamilyId=21FB9B9A-C5F6-4C95-87B7-FC7AB49B3EDD&displaylang=en) "code", I can say this still holds true, so you will need this code anyway (except if they happen to add it!).

posted [Friday, August 22, 2003 12:45 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/68.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/68.aspx#comments)

#####  [Introduction](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/67.aspx)

I think it's time to start for me too :). I'm Daniel, a big fan of .NET, C#, XML and design patterns. I wrote 4 books for the extint Wrox Press (about ASP.NET and Server Controls), as well as some articles for C# Today and ASP Today. I was a speaker at the [.NET ONE 2002](http://www.sigs-datacom.de/sd/kongresse/dotnet_2002/program/sessions.htm) conference also ([slides](http://www.sigs.de/download/dotnet_02/)), where I presented the [NMatrix](http://sf.net/projects/dotnetopensrc) project, a personal endeavour I started back in May 2001, in a joined effort with my german friend Rainer and [Paul Speranza](http://weblogs.asp.net/Psperanza/) to contribute to the OpenSource community.

Almost a year ago, I joined [Lagash](http://www.lagash.com/) (spanish), the company started by four brilliant and excelent people [DiegoG](http://weblogs.asp.net/dgonzalez/posts/22746.aspx), DiegoB, Pablo and Julian. They really created a company that is the ideal of every entrepreneur: a frienly ambience, cool and smart people, a strong sense of teamwork and collaboration, and they are really superb in building a strong feeling of belonging and community among us. It's really great and I'm very lucky they found me. Thanks God for that one ;)

Before Lagash, I tried to start my own company, [DEVerest](http://deverest.com.ar/), but it got mixed with my efforts with NMatrix, and later Lagash turned out to be everything I ever wanted from my own company, so why start from scratch? I perceive myself an integral part of Lagash, share its goals and put all my energies in it. I only wish I was there when they founded it :(.

Recently, [VGA](http://weblogs.asp.net/vga) also joined us, another clever guy I met in the Wrox days.  
I will be posting some code, and thoughts about programming, movies and books I read. 

Let's start the real blogging now... 

Cazzu 

posted [Friday, August 22, 2003 11:15 AM](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/67.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/08/22/67.aspx#comments)

  

[![](/web/20060526143909im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
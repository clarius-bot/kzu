---
layout: post
title: "Daniel Cazzulino"
date: 2004-05-13 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : ASP.NET Providers, reloaded

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2526'\))| January 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2588'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
31| 1| 2| 3| 4| 5| 6  
[7](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/7.aspx "1 Post")| [8](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/8.aspx "1 Post")| 9| [10](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/10.aspx "3 Posts")| [11](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/11.aspx "1 Post")| 12| [13](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/13.aspx "1 Post")  
[14](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/14.aspx "1 Post")| [15](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/15.aspx "1 Post")| 16| [17](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/17.aspx "2 Posts")| 18| 19| 20  
21| 22| 23| 24| 25| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/26.aspx "2 Posts")| 27  
28| 29| 30| [31](http://www.clariusconsulting.net/blogs/kzu/archive/2004/5/31.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070112033646im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## ASP.NET Providers, reloaded 

[Rob Howard](http://weblogs.asp.net/rhoward/) wrote the [ second part](http://msdn.microsoft.com/asp.net/default.aspx?pull=/library/en-us/dnaspnet/html/asp04212004.asp) on the provider design pattern they are using in Whidbey, and how to implement it in v1.x. An interesting reading. First of all, I'm really amazed at how open these guys are to good feedback from the community. Rob even dedicated a paragraph named "Extending configuration" that explains why they chose a `NameValueCollection` for provider initialization over an `XmlNode`, as [ I suggested](http://weblogs.asp.net/cazzu/archive/2004/03/22/93838.aspx) (I'm sure other did too, it's a pretty obvious thing to ask). I really don't share the feeling that a `NameValueCollection` is *sooo much* easier than an `XmlNode` and its added flexibility, but at least I understand now why they did so: they expect complex providers to have their own section handler with all the information they need to work, which makes perfect sense! 

There's a major performance issue in the implementation he suggests for v1.x, though, that has to do with the actual creation of the specific provider instance. There's a sort of mess in the naming and wording when this feature is explained. The article says:

> When calling routines on the **Membership** class, internally it will always forwards those calls to an instance of the **MembershipProvider** —first creating an instance of **MembershipProvider** using a factory method, **Instance()** , and then calling the appropriate base class method on the retrieved instance. 

Well, from the naming point of view, if Instance() is employed as a factory method, it should be called CreateProvider() or something like that, to denote that an instance will be created each time the method is called. And here comes the confusion, because Instance() more closely resembles the Singleton pattern rather than the Factory Method. If you think about it, there's no reason why we should instantiate a new membership object all the time. Not even the dynamic nature of providers justify this, because switching providers in the config file will cause an app restart anyway, loading the appropriate one afterwards.

And this is even more important than a mere wording because instantiating the provider dynamically requires using reflection. The abbreviated method shown in the article is:

public static MembershipProvider Instance() { // Use the cache because the reflection used later is expensive ...etc... // Load the configuration settings object[] paramArray = new object[1]; paramArray[0] = membershipProvider.Attributes["connectionString"]; return (MembershipProvider)( ((ConstructorInfo)cache[cacheKey]).Invoke(paramArray) ); }

Note that by caching only the constructor information, you're not earning much anyways. You end up using reflection at each method call anyway. So, if you convert this method from a factory method into a singleton, you directly cache the provider instance you create the first time the method is accessed. Furthermore, I'd directly move this singleton instance creation to the Membership (or similar for other provider-enabled features) altogether:

public class Membership { static MembershipProvider _instance; static Membership() { // Get the names of the providers MembershipConfiguration config = MembershipConfiguration.GetConfig(); // Read the configuration specific information for this provider Provider provider = (Provider) config.Providers[config.DefaultProvider]; // The assembly should be in \bin or GAC try { Type type = Type.GetType( provider.Type ); _instance = (MembershipProvider) Activator.CreateInstance( type ); // Initialize the provider with the attributes. _instance.Initialize( provider.Name, provider.Attributes ); } catch (Exception e) { throw new Exception("Unable to load provider", e); } } public static bool Validate( string username, string password ) { return _instance.Validate( username, password ); } public static void CreateUser( string username, string password ) { return _instance.CreateUser( username, password ); } }

You may have noticed that the original method in the article wrongly calls a special constructor passing a specific hardcoded attribute, "connectionString":

paramArray[0] = membershipProvider.Attributes["connectionString"]; // Special ctor?! return (MembershipProvider)( ((ConstructorInfo)cache[cacheKey]).Invoke(paramArray) );

It's obvious that by doing so the `Instance()` method is no longer generic, as it's expecting a provider to implement a specific ctor overload and receive a connection string! What if I have an `XmlMembershipProvider`? Given the base `ProvideBase` class all providers must implement, and what is explained in the article it makes much more sense to use the `ProviderBase.Initialize` method for provider initialization, as I did in the static ctor above:

Type type = Type.GetType( provider.Type ); _instance = (MembershipProvider) Activator.CreateInstance( type ); // Initialize the provider with the attributes. _instance.Initialize( provider.Name, provider.Attributes );

Anyway, it's good that we're having these discussions. The ASP.NET community needs these concepts to turn web applications into well architected solutions, leaving the ASP spaghetti programming style behind once and for all.

posted on Thursday, May 13, 2004 12:56 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070112033646im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
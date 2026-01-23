---
layout: post
title: "Daniel Cazzulino"
date: 2004-10-21 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Boost XmlSerializer usability and performance by using strongly-typed serializers

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))| April 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2312'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
26| 27| 28| 29| 30| 31| 1  
2| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2004/10/4.aspx "1 Post")| 5| 6| [7](http://clariusconsulting.net/blogs/kzu/archive/2004/10/7.aspx "1 Post")| 8  
9| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/10/12.aspx "1 Post")| 13| 14| 15  
16| 17| 18| 19| 20| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21.aspx "4 Posts")| 22  
[23](http://clariusconsulting.net/blogs/kzu/archive/2004/10/23.aspx "1 Post")| 24| 25| 26| 27| 28| 29  
30| 1| 2| 3| 4| 5| 6  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060418071503im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Boost XmlSerializer usability and performance by using strongly-typed serializers 

The XmlSerializer has a farily well-known problem: the first time you use it, it will generate a class to read instances of the received type, compile it, and then load it. Of course, this can take considerable time, directly related to the complexity of the type and all its members and member types.  
  
Unlike common wisdom, this is something that can be avoided and I have explained (albeit rather confusingly) in a [previous post](http://weblogs.asp.net/cazzu/posts/SGen.aspx). The usage was not great, though, as it was a command-line tool: ouch!  
  
So, the [Mvp.Xml](http://sourceforge.net/projects/mvp-xml) project debuts with a new package: [Mvp.Xml.Design](https://sourceforge.net/project/showfiles.php?group_id=102352&package_id=133415). Now, in order to get a design-time version of a custom XmlSerializer for a type, you just assign the Mvp.Xml.XGen (renamed from the old SGen name that could be confused with a Whidbey tool of the same name), and you'll get a class to perform serialization of the type. The custom tool will take the first type in the file if multiple classes exist in it. Here's how it will look like:  
  
![A screenshot from VS using the tool](https://web.archive.org/web/20060418071503im_/http://aspnet2.com/kzu/weblog/Mvp.Xml.XGen.png)  
  
The package comes in two flavors: an MSI installer or the raw source. The former also installs the sources besides the custom tool.  
  
[Go download it!](https://sourceforge.net/project/showfiles.php?group_id=102352&package_id=133415)  

posted on Thursday, October 21, 2004 8:03 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/296.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21/XGenToolRelease.aspx#393 "permalink") re: Boost XmlSerializer usability and performance by using strongly-typed serializers @ Monday, November 14, 2005 2:16 AM

Does your tool work with .NET 1.1 (and Visual Studio .NET 2003). I've downloaded the install file that asks me for .NET 2.0.   
Thanks a lot. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

Andrea

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21/XGenToolRelease.aspx#394 "permalink") re: Boost XmlSerializer usability and performance by using strongly-typed serializers @ Monday, November 14, 2005 3:34 PM

I can't make this work, can you help me? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

Sergio

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21/XGenToolRelease.aspx#403 "permalink") re: Boost XmlSerializer usability and performance by using strongly-typed serializers @ Monday, November 28, 2005 5:20 PM

The problem is because a few changes in c# code generated by .Net framework (after apply a fix, I guess). Is necessary to add the following lines to XmlSerializerGenerator class:   
  
output = output.Replace("XmlSerializationWriter" + type.Name, "Writer");   
output = output.Replace("XmlSerializationReader" + type.Name, "Reader");   
output = output.Replace("public sealed class "+ type.Name + "Serializer", "public sealed class "+ type.Name + "SerializerBase");   
  
// Give generated classes more friendly names.   
output = output.Replace("public class XmlSerializationWriter" + type.Name,   
@"/// <remarks/>   
public class Writer");   
output = output.Replace("public class XmlSerializationReader" + type.Name,   
@"/// <remarks/>   
public class Reader"); [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

Ariel

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21/XGenToolRelease.aspx#408 "permalink") Improving the performance of the System.XmlSerializer in Framework 2.0 @ Thursday, December 01, 2005 2:38 PM

Today I was looking at the tools that are available in the new framework 2.0. I saw a tool called Sgen.exe... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.dotnetjunkies.com/WebLog/drivenbydotnet/archive/2005/12/01/134105.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21/XGenToolRelease.aspx#409 "permalink") re: Boost XmlSerializer usability and performance by using strongly-typed serializers @ Thursday, December 01, 2005 2:44 PM

Dotnet has a tool to that is called sgen to accomplish the same thing. Check out <http://www.dotnetjunkies.com/WebLog/drivenbydotnet/archive/2005/12/01/134105.aspx> [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl4$EditLink',''\))

[geoffrey Samper](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.dotnetjunkies.com/WebLog/drivenbydotnet "Anonymous")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21/XGenToolRelease.aspx#413 "permalink") re: Boost XmlSerializer usability and performance by using strongly-typed serializers @ Friday, December 02, 2005 12:12 PM

I've downloaded version 0.3 (for FW 1.1) but it doesn't work even on the simplest examples with the following stack trace:   
  
#error Couldn't generate code.   
/*   
System.Reflection.TargetInvocationException: Exception has been thrown by the target of an invocation. ---> System.ArgumentOutOfRangeException: StartIndex cannot be less than zero.   
Parameter name: startIndex   
at System.String.Substring(Int32 startIndex, Int32 length)   
at Mvp.Xml.Design.CustomTools.XGen.XmlSerializerGenerator.GenerateCode(Type type, String targetNamespace)   
at Mvp.Xml.Design.CustomTools.XGen.XGenRunner..ctor(String outputFile, String forType, String targetNamespace)   
\--- End of inner exception stack trace ---   
...   
  
Ariel, does your code fix this problem? If yes, where exactly it should be put?   
  
Thanks a lot! [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl5$EditLink',''\))

Andrew

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/10/21/XGenToolRelease.aspx#419 "permalink") re: Boost XmlSerializer usability and performance by using strongly-typed serializers @ Wednesday, December 14, 2005 1:37 PM

Goeffrey: the sgen tool does not generate the event-rising class that my generator creates. My custom serializer (granted, it's based on the same code generated by the sgen tool) allows you to code to the incoming object in a streaming way, kind of SAX but strongly typed using objects. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl6$EditLink',''\))

[kzu](http://clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

  

[![](/web/20060418071503im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
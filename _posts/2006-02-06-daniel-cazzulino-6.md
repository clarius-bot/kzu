---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-06 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Thursday, December 18, 2003 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2003/12/1.aspx "1 Post")| [2](http://clariusconsulting.net/blogs/kzu/archive/2003/12/2.aspx "1 Post")| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2003/12/4.aspx "1 Post")  
5| 6| 7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/12/11.aspx "2 Posts")  
[12](http://clariusconsulting.net/blogs/kzu/archive/2003/12/12.aspx "1 Post")| 13| 14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2003/12/16.aspx "1 Post")| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/12/17.aspx "2 Posts")| [18](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18.aspx "2 Posts")  
[19](http://clariusconsulting.net/blogs/kzu/archive/2003/12/19.aspx "1 Post")| 20| 21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/12/22.aspx "1 Post")| 23| 24| 25  
26| 27| 28| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060206231930im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Thursday, December 18, 2003 - Posts

#####  [Evolving existing APIs in backwards-compatible way (i.e. SOM and DOM)](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18/123.aspx)

[A couple days ago](http://weblogs.asp.net/cazzu/posts/43875.aspx) I posted about the inconvenience of an API that is designed to expose augmented data depending on its state. This is the case for the XmlSchema Object Model (SOM) in .NET and its Post-compilation infoset (PCI), as well as the DOM and its Post-schema validation infoset (PSVI). [Dare Obasanjo](http://weblogs.asp.net/cazzu/posts/43875.aspx#43882) aknowledged this issue, but is resigned, saying it's too late to fix any of this.

I believe it's not. For classes that have grown too big, or became messy by mixing concepts like the two mentioned above, there's still room for improvement, without risk of breaking compatibility, which is a must in a serious framework such as .NET.   
The "solution" involves creating new interfaces to hold the funcional subsets, and make the "legacy" class implement them as simple passthrough accessors to the cluttered "full" interface. In the case of the SOM, a new hierarchy of interfaces could be implemented, starting in a `ICompiledXmlSchema`. The `XmlSchema.Compile` method could return the new type:

`
    
    
    public ICompiledXmlSchema Compile(System.Xml.Schema.ValidationEventHandler handler)
    {
      // Perform compilation as usual
      return (ICompiledXmlSchema) this;
    }

`

Code using the `void` old version would remain unaffected, as they would be using:

`
    
    
    XmlSchema xsd; //Load it somehow
    // Perform compilation as usual
    xsd.Compile(null);

`

In order to take advantage of the pre-compilation version subset a cast would be needed, for example to an `IXmlSchema`:

`
    
    
    IXmlSchema prexsd = (IXmlSchema) XmlSchema.Read(stream, null);

`

This interface would expose pre-compilation only members, such as `XmlSchema.Items`, whereas the `ICompiledXmlSchema` would replace it with `XmlSchema.Elements` and `XmlSchema.Attributes` and `XmlSchema.SchemaTypes` instead.

This offers a more consistent programming model to the newer code taking advantage of these interfaces, while the "legacy" code keeps working. The typical case for read&compile schemas would be, therefore:

`
    
    
    XmlSchema prexsd = XmlSchema.Read(stream, null);
    ICompiledXmlSchema pcixsd = prexsd.Compile(System.Xml.Schema.ValidationEventHandler handler);
    // Now I don't need to worry about pre vs post compilation members!
    

`

Thoughts? 

posted [Thursday, December 18, 2003 12:29 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18/123.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18/123.aspx#comments)

#####  [Do you need another reason to avoid &quot;sp_&quot; prefix?!](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18/122.aspx)

> Note: Do not preface your stored procedure names with sp_, because doing so reduces performance. When you call a stored procedure that starts with sp_, SQL Server always checks the master database first, even if the stored procedure is qualified with the database name.

from [Designing Data Tier Components and Passing Data Through Tiers](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnbda/html/BOAGag.asp?frame=true&hidetoc=true), section titled "Recommendations for Using Stored Procedures with Data Access Logic Components". 

posted [Thursday, December 18, 2003 12:00 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18/122.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18/122.aspx#comments)

  

![](/web/20060206231930im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
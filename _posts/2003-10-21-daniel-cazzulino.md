---
layout: post
title: "Daniel Cazzulino"
date: 2003-10-21 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : How fast is XmlSerializer?

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/10/3.aspx "1 Post")| 4| [5](http://clariusconsulting.net/blogs/kzu/archive/2003/10/5.aspx "1 Post")| 6  
[7](http://clariusconsulting.net/blogs/kzu/archive/2003/10/7.aspx "1 Post")| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2003/10/9.aspx "2 Posts")| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11.aspx "1 Post")| [12](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12.aspx "2 Posts")| 13  
14| 15| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17.aspx "2 Posts")| 18| 19| 20  
[21](http://clariusconsulting.net/blogs/kzu/archive/2003/10/21.aspx "1 Post")| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2003/10/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2003/10/25.aspx "1 Post")| [26](http://clariusconsulting.net/blogs/kzu/archive/2003/10/26.aspx "1 Post")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/10/27.aspx "1 Post")  
[28](http://clariusconsulting.net/blogs/kzu/archive/2003/10/28.aspx "1 Post")| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060509004636im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## How fast is XmlSerializer? 

Have you ever wondered how does the `XmlSerializer` really works? Well, it creates a temporary assembly that is built by reflecting the type you pass to the constructor. Wait! Don't panic because of the "reflecting" word!   
It does so only once per type, and it builds an extremely efficient pair of Reader/Writer classes that will handle serialization/ deserialization during the life of the AppDomain. 

These classes inherit the public `XmlSerializationReader` and `XmlSerializationWriter` classes in the `System.Xml.Serialization` namespace. If you want to take a look at the generated code, add the following setting to the application configuration file (web.config for a web application): 

`
    
    
    <system.diagnostics>
      <switches>
        <add name="XmlSerialization.Compilation" value="4"/>
      </switches>
    </system.diagnostics>
    

`

Now the serializer won't delete the temporary files generated in the process. For a web application, the files will be located in `C:\Documents and Settings\[YourMachineName]\ASPNET\Local Settings\Temp`, otherwise, they will be located in your current user `Local Settings\Temp` folder.  
You will see code that is exactly what you would have to do if you wanted to efficiently load Xml in .NET: use nested while/if as you read, use XmlReader methods to move down the stream, etc. All the ugly code is there to make it really fast. 

Special thanks to [Chris Sells](http://www.sellsbrothers.com/tools/) for his XmlSerializerCompiler utility.

posted on Tuesday, October 21, 2003 6:01 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/95.aspx) :: 

  

[![](/web/20060509004636im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
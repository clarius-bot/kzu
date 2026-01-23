---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-06 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Thursday, December 04, 2003 - Posts

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060206231847im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Thursday, December 04, 2003 - Posts

#####  [Validating XAML with WXS?](http://clariusconsulting.net/blogs/kzu/archive/2003/12/04/112.aspx)

[Drew Marsh](http://weblogs.asp.net/dmarsh/) (I recommend his blog on XAML-Avalon related posts), says 

> I'm really not sure that XAML can ever actually be pure schema validated in its current incarnation.

([here](http://weblogs.asp.net/dmarsh/posts/35608.aspx).. it's a shame the [blockquote cite](http://www.w3.org/TR/html4/struct/text.html#adef-cite-Q) attribute doesn't work). And he shows as an example, the "attached" properties that are valid depending on the context, such as:

`
    
    
    <DockPanel>
      <Border DockPanel.Dock="Top">

`

It turns out that validating this is extremely easy for a [Schematron](http://www.ascc.net/xml/resource/schematron/schematron.html) aware XML Schema (WXS) processor, such as [Schematron.NET](http://sourceforge.net/projects/dotnetopensrc/). This is achieved by using [WXS built-int extensiblity mechanism](http://www.xfront.com/ExtendingSchemas.html#Supplement). The following simple expression validates this case, :

`
    
    
    <assert test="//*[boolean(@DockPanel.Dock) and local-name(..)="DockPanel"]">
    The 'DockPanel.Dock' attribute can only appear on elements directly below a 'DockPanel'.
    </assert>

`

First part of the XPath expression tests for the existence of the attribute (`boolean(@DockPanel.Dock)`) and the second part tests that the local name of its parent is a DockPanel (`local-name(..)="DockPanel"`). If this condition is not met, that is, the assertion fails, such a validator would signal an error. Cool, isn't it?  
Maybe we should all start asking for Schematron support in .NET `XmlValidatingReader`... or extensiblity hooks at least to plug in other schema languages...

posted [Thursday, December 04, 2003 2:55 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/12/04/112.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/12/04/112.aspx#comments)

  

![](/web/20060206231847im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
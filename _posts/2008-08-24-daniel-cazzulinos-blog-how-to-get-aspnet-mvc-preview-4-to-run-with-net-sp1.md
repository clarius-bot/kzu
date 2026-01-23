---
layout: post
title: "Daniel Cazzulino's Blog : How to get ASP.NET MVC Preview 4 to run with .NET SP1"
date: 2008-08-24 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to get ASP.NET MVC Preview 4 to run with .NET SP1


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20080919132007im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080919132007im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080919132007im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080919132007im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## How to get ASP.NET MVC Preview 4 to run with .NET SP1 

As you probably know by now (i.e. from [Phill's blog](http://haacked.com/archive/2008/08/14/aspnetmvc-not-in-sp1.aspx "ASP.NET MVC Is Not Part of ASP.NET 3.5 SP1")), however both [Routing](http://msdn.microsoft.com/en-us/library/system.web.routing.aspx) and [Abstractions](http://msdn.microsoft.com/en-us/library/system.web.httpcontextbase.aspx) are. [MVC Preview 4](http://www.asp.net/mvc/), however, has its own version of both assemblies.

In order to get MVC to use the new RTM bits of both assemblies (and avoid weird side-by-side errors), you just need to add the following binding redirect to the web.config file:
    
    
        <runtime>
            <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
                <dependentAssembly>
                    <assemblyIdentity name="System.Web.Abstractions" publicKeyToken="31bf3856ad364e35"/>
                    <bindingRedirect oldVersion="0.0.0.0" newVersion="3.5.0.0"/>
                </dependentAssembly>
                <dependentAssembly>
                    <assemblyIdentity name="System.Web.Routing" publicKeyToken="31bf3856ad364e35"/>
                    <bindingRedirect oldVersion="0.0.0.0" newVersion="3.5.0.0"/>
                </dependentAssembly>
                <dependentAssembly>
                    <assemblyIdentity name="System.Web.Extensions" publicKeyToken="31bf3856ad364e35"/>
                    <bindingRedirect oldVersion="1.0.0.0-1.1.0.0" newVersion="3.5.0.0"/>
                </dependentAssembly>
                <dependentAssembly>
                    <assemblyIdentity name="System.Web.Extensions.Design" publicKeyToken="31bf3856ad364e35"/>
                    <bindingRedirect oldVersion="1.0.0.0-1.1.0.0" newVersion="3.5.0.0"/>
                </dependentAssembly>
            </assemblyBinding>
        </runtime>
    

The other two redirects are added automatically by a Dynamic Data website, so I figured out it's better to put them there too :)

[](http://11011.net/software/vspaste)

posted on Sunday, August 24, 2008 9:03 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/81380.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/08/24/81380.aspx#81388 "permalink") How to get ASP.NET MVC Preview 4 to run with .NET SP1 @ Sunday, August 24, 2008 9:26 AM

As you probably know by now (i.e. from Phill&amp;#39;s blog ), however both Routing and Abstractions are [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/08/24/how-to-get-asp-net-mvc-preview-4-to-run-with-net-sp1.aspx "TrackBack")

  

[![](/web/20080919132007im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog : Why XAML makes System.Configuration and Enterprise Library Configuration obsolete"
date: 2007-09-24 00:00:00 +0000
---

Daniel Cazzulino's Blog : Why XAML makes System.Configuration and Enterprise Library Configuration obsolete


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2800'\))| October 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2861'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| [3](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/3.aspx "1 Post")| 4| 5| 6  
7| 8| 9| 10| [11](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/11.aspx "1 Post")| [12](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/12.aspx "1 Post")| 13  
14| 15| 16| 17| 18| [19](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/19.aspx "1 Post")| 20  
21| 22| [23](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/23.aspx "1 Post")| [24](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/24.aspx "3 Posts")| [25](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/25.aspx "1 Post")| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/26.aspx "2 Posts")| [27](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/27.aspx "1 Post")  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20071025100005im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

[![](https://web.archive.org/web/20071025100005im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20071025100005im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20071025100005im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Why XAML makes System.Configuration and Enterprise Library Configuration obsolete 

It may seem unrelated, but if you haven't read [Fowler's article on DSLs](http://martinfowler.com/bliki/DomainSpecificLanguage.html) ([from Google cache if it's down like now](http://64.233.169.104/search?q=cache:EmIl1AbBKpkJ:martinfowler.com/bliki/DomainSpecificLanguage.html+configuration+dsl+fowler&hl=en&ct=clnk&cd=2&lr=lang_es%7Clang_en)), please do so now. It will help you understand why XAML goes far beyond WPF and presentation.

Configuration is typically nothing more than a DSL (external DSL in Fowler's terms) that serves to setup the variable parts of a certain runtime library or framework. For example, while a logging framework has many "static" or invariant components (i.e. logging "pipeline" execution, interaction between components, registration of variable components, etc.), there are variable parts which determine the runtime behavior, such as concrete trace listeners attached to given trace sources, the specific file a file listener will write to, and so on. 

With careful API design, manipulating the actual runtime classes wouldn't be significantly different than manipulating its corresponding configuration classes or files. Your API is already a sort of DSL for your domain. For example, system.diagnostics can contain the definition of trace sources:
    
    
    <source name="TraceTest" switchName="SourceSwitch" switchType="System.Diagnostics.SourceSwitch" >  
      <listeners>  
        <add name="console" />  
        <remove name ="Default" />  
      </listeners>  
    </source>

To achieve the same using the corresponding runtime classes, you would write:
    
    
    				TraceSource source = newTraceSource("TraceTest");
    source.Switch = newSourceSwitch("SourceSwitch");
    source.Listeners.Add(newConsoleTraceListener());
    source.Listeners.Remove("Default");
    

[ ](http://11011.net/software/vspaste)

Note how close the two are. All you need is a good object (de)serialization format and you can go straight from the external DSL ("config" file) to the runtime objects without any intermediate representation. This wasn't possible before with .NET 1.x and 2.0 due to the lack of extensibility of the XmlSerializer and its excesive (IMO wrong) focus as a generic XML Schema <-> object converter (pretty much [an unattainable goal](http://www.25hoursaday.com/weblog/2004/02/20/TheImpedenceMismatchBetweenW3CXMLSchemaAndTheCLR.aspx) if you want full fidelity both ways) and a webservices-only feature. 

XAML, on the other hand, was thought from the beginning as a fully extensible object serialization format. With it, it's quite easy to achieve what's shown above, straight from the domain/runtime classes. One possible XAML syntax for the TraceSource example could be:
    
    
    <TraceSource Name="TraceTest">  
      <TraceSource.Switch>  
        <SourceSwitch Name="SourceSwitch"/>  
      </TraceSource.Switch>  
      <TraceSource.Listeners>  
        <ConsoleTraceListener />  
      </TraceSource.Listeners>  
    </TraceSource>

(this wouldn't work with current diagnostics classes)

You end up having executable models :)  

The only requirement to enable XAML serialization on your classes is to provide a public parameterless constructor, and public read/write properties for the stuff you want to get serialized. Validation can be done after deserialization by implementing [System.ComponentModel.ISupportInitialize](https://msdn2.microsoft.com/en-us/library/System.ComponentModel.ISupportInitialize). 

So, why would you want to develop and maintain a DSL/configuration model for your domain classes ever again?

And XAML is a v1 release, so I can only expect it to get better, more flexible and powerful over time. 

posted on Monday, September 24, 2007 9:00 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.aspx#32837 "permalink") Why we need an EntLib Standalone Validation Application Block @ Monday, September 24, 2007 10:18 PM

In my previous post about XAML and its future as a domain model/DSL serialization format , I've argued [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/09/25/why-we-need-an-entlib-standalone-validation-application-block.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.aspx#32878 "permalink") Daniel Cazzulino: Why XAML makes System.Configuration and Enterprise Library Configuration obsolete @ Tuesday, September 25, 2007 6:38 AM

<http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.asp> [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://wpf.netfx3.com/blogs/presentation_bloggers/archive/2007/09/25/daniel-cazzulino-why-xaml-makes-system-configuration-and-enterprise-library-configuration-obsolete.aspx "TrackBack")

  

[![](/web/20071025100005im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
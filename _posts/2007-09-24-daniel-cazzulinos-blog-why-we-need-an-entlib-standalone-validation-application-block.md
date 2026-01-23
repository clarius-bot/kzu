---
layout: post
title: "Daniel Cazzulino's Blog : Why we need an EntLib Standalone Validation Application Block"
date: 2007-09-24 00:00:00 +0000
---

Daniel Cazzulino's Blog : Why we need an EntLib Standalone Validation Application Block

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081208141132im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081208141132im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081208141132im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081208141132im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Why we need an EntLib Standalone Validation Application Block 

In my previous post about [XAML and its future as a domain model/DSL serialization format](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.aspx), I've argued that System.Configuration as well as [Enterprise Library](http://msdn2.microsoft.com/en-us/library/aa480453.aspx) Configuration (part of the core of EntLib) will soon become irrelevant. 

The caveat is that now you need to design your classes a bit differently. No more constructors where you validate the required input. Now everything is a property get/set, and validation needs to be done at a separate point in time ([ISupportInitialize.EndInit](https://msdn2.microsoft.com/en-us/library/System.ComponentModel.ISupportInitialize.EndInit)), as well as on every property set (if you only want to allow the setter to be called before initialization is completed) and before every method (if you depend on the properties being initialized). 

This sounds much worse than it actually is. With a fairly trivial base class (say, SupportInitialize), you can code your properties as follows:  
  
public int Timeout  
{  
get { return timeout; }  
set { EnsureNotInitialized(); /* validate value here, finally save value */ timeout = value; }   
}  
  
public void DoSomething()  
{  
EnsureInitialized();  
// do work  
}

Property validation can become an annoying issue now, with validation scattered throughout your class on every property setter. Moreover, you may need to validate property values that depend on other properties, meaning the validation will have to be performed on the EndInit method forcedly. 

It's pretty evident that you need something better for validation. Enter the [SVAB](http://www.codeplex.com/entlibcontrib/Release/ProjectReleases.aspx?ReleaseId=7225) (Enterprise Library [Standalone Validation Application Block](http://www.codeplex.com/entlibcontrib/Release/ProjectReleases.aspx?ReleaseId=7225)). It's basically everything you [like about](http://msevents.microsoft.com/cui/webcasteventdetails.aspx?eventid=1032336429&eventcategory=5&culture=en-us&countrycode=us) the [Validation Application Block](http://msdn2.microsoft.com/en-us/library/bb410105.aspx "Validation Application Block") without any of the "legacy" dependencies on System.Configuration (you only need attribute-driven validation) and [ObjectBuilder](http://www.codeplex.com/objectbuilder) (which doesn't really fit on the XAML picture). The idea is that you can simply rely on the base class to perform the validation based on the properties metadata:

[RangeValidator(1, RangeBoundaryType.Inclusive, 60, RangeBoundaryType.Inclusive)]  
public int Timeout  

By inheriting from the base class, you gain automatic validation. The next step is a seamless integration with WPF (it's [getting tricky](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/23/ForgetaboutextendingWPFdatabindingsupport.aspx)). The existing solution is not ideal as it requires the use of an additional wrapper element in the markup, and incurs quite some overhead in its current implementation.

I'll follow up with the alternative I'm working on right now ;)

posted on Monday, September 24, 2007 9:58 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/32833.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyweneedanEntLibStandaloneValidationApplicationBlock.aspx#32838 "permalink") Why we need an EntLib Standalone Validation Application Block @ Monday, September 24, 2007 10:18 PM

In my previous post about XAML and its future as a domain model/DSL serialization format , I've argued [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/09/25/why-we-need-an-entlib-standalone-validation-application-block.aspx "TrackBack")

  

[![](/web/20081208141132im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
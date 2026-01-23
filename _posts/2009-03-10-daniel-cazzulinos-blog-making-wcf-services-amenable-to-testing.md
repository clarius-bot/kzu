---
layout: post
title: "Daniel Cazzulino's Blog : Making WCF services amenable to testing"
date: 2009-03-10 00:00:00 +0000
---

Daniel Cazzulino's Blog : Making WCF services amenable to testing


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20090315070128im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090315070128im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20090315070128im_/http://twitter.com/favicon.ico) ](http://twitter.com/kzu) [kzu in Twitter](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20090315070128im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090315070128im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090315070128im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Making WCF services amenable to testing 

You know that using [WebOperationContext.Current](http://msdn.microsoft.com/en-us/library/system.servicemodel.web.weboperationcontext.current.aspx) is BAD for making your service implementation testable, don't you?

My friend [Pablo Cibraro](http://weblogs.asp.net/cibrax/) continued to evolve [his ideas](http://weblogs.asp.net/cibrax/archive/2008/12/11/testing-wcf-rest-services.aspx) around [decoupling your service implementation](http://weblogs.asp.net/cibrax/archive/2008/05/16/unit-tests-for-wcf.aspx) from this static dependency, and came up with [the most simple yet totally unobtrusive](http://weblogs.asp.net/cibrax/archive/2009/03/08/wcfmock-a-mocking-framework-for-wcf-services.aspx) (for production code) approach to this, which he calls [WCFMock](http://wcfmock.codeplex.com/).

The idea is quite simple: you can leverage C# class aliasing functionality (which few know it even exists) to conditionally (i.e. DEBUG vs RELEASE builds) replace the WebOperationContext implementation, like so:
    
    
    #if DEBUG
    using WebOperationContext = System.ServiceModel.Web.MockedWebOperationContext;
    #endif

What will happen here is that on DEBUG builds, the actual class invoked when your code calls WebOperationContext.Current will be different, and it will be the one that allows easy testability by providing interfaces for the context and all its properties. You can setup this mock context quite easily in your tests:
    
    
    Mock mockContext = new Mock { DefaultValue = DefaultValue.Mock };
     
    using (new MockedWebOperationContext(mockContext.Object))
    {
      var formatter = catalog.GetProducts("foo");
    }
    
    // Just making sure the content type was properly set 
    mockContext.VerifySet(c => c.OutgoingResponse.ContentType = "application/atom+xml");

Of course, WCF service implementations, in my opinion, should not contain much core, and be basically a REST/webservices facade on top of the actual implementation which is something that never depends on any WCF specifics. But for those cases where you must ensure some behavior from your service implementations, this is certainly the best way to do it.

posted on Tuesday, March 10, 2009 1:29 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/10/MakingWCFservicesamenabletotesting.aspx#120905 "permalink") Making WCF services amenable to testing @ Tuesday, March 10, 2009 1:34 PM

You know that using WebOperationContext.Current is BAD for making your service implementation testable [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2009/03/10/making-wcf-services-amenable-to-testing.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/10/MakingWCFservicesamenabletotesting.aspx#120907 "permalink") Making WCF services amenable to testing - Daniel Cazzulino's Blog @ Tuesday, March 10, 2009 2:11 PM

Thank you for submitting this cool story - Trackback from DotNetShoutout [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://dotnetshoutout.com/Making-WCF-services-amenable-to-testing-Daniel-Cazzulinos-Blog "TrackBack")

  

[![](/web/20090315070128im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
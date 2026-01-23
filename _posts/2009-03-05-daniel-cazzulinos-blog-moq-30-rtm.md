---
layout: post
title: "Daniel Cazzulino's Blog : Moq 3.0 RTM!!!"
date: 2009-03-05 00:00:00 +0000
---

Daniel Cazzulino's Blog : Moq 3.0 RTM!!!


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20090309230746im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090309230746im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090309230746im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090309230746im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Moq 3.0 RTM!!! 

I've just [released the latest version of Moq](http://moq.me/get) :))))

It's quite late on an intense week at Redmond, so I'm just going to paste the relevant portion of the [changelog](http://code.google.com/p/moq/source/browse/trunk/Changelog.txt):
    
    
      
    Version 3.0  
    
    
      
        * Silverlight support! Finally integrated Jason's Silverlight contribution! Issue #73  
    
    
      
        * Brand-new simplified event raising syntax (#130): mock.Raise(foo => foo.MyEvent += null, new MyArgs(...));  
    
    
      
        * Support for custom event signatures (not compatible with EventHandler): mock.Raise(foo => foo.MyEvent += null, arg1, arg2, arg3);  
    
    
      
        * Substantially improved property setter behavior: mock.VerifySet(foo => foo.Value = "foo");  //(also available for SetupSet  
    
    
      
        * Renamed Expect* with Setup*  
    
    
      
        * Vastly simplified custom argument matchers: public int IsOdd() { return Match<int>.Create(v => i % 2 == 0); }  
    
    
      
        * Added support for verifying how many times a member was invoked: mock.Verify(foo => foo.Do(), Times.Never());  
    
    
      
        * Added simple sample app named StoreSample  
    
    
      
        * Moved Stub functionality to the core API (SetupProperty and SetupAllProperties)  
    
    
      
        * Fixed sample ASP.NET MVC app to work with latest version  
    
    
      
        * Allow custom matchers to be created with a substantially simpler API  
    
    
      
        * Fixed issue #145 which prevented discrimination of setups by generic method argument types  
    
    
      
        * Fixed issue #141 which prevented ref arguments matching value types (i.e. a Guid)  
    
    
      
        * Implemented improvement #131: Add support for It.IsAny and custom argument matchers for SetupSet/VerifySet  
    
    
      
        * Implemented improvement #124 to render better error messages  
    
    
      
        * Applied patch from David Kirkland for improvement #125 to improve matching of enumerable parameters  
    
    
      
        * Implemented improvement #122 to provide custom errors for Verify  
    
    
      
        * Implemented improvement #121 to provide null as default value for Nullable<T>  
    
    
      
        * Fixed issue #112 which fixes passing a null argument to a mock constructor  
    
    
      
        * Implemented improvement #111 to better support params arguments  
    
    
      
        * Fixed bug #105 about improperly overwriting setups for property getter and setter  
    
    
      
        * Applied patch from Ihar.Bury for issue #99 related to protected expectations   
    
    
      
        * Fixed issue #97 on not being able to use SetupSet/VerifySet if property did not have a getter  
    
    
      
        * Better integration with Pex (http://research.microsoft.com/en-us/projects/Pex/)  
    
    
      
        * Various other minor fixes (#134, #135, #137, #138, #140, etc.)
    
     
    
     
    
    As usual, get it at <http://moq.me/get>, browse the API at [http://api.moq.me](http://api.moq.me/) or go to the project homepage at [http://moq.me](http://moq.me/).
    
     
    
    Enjoy!!!

posted on Thursday, March 05, 2009 11:31 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/120009.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/05/120009.aspx#120022 "permalink") Moq 3.0 RTM!!! @ Friday, March 06, 2009 12:10 AM

I&amp;#39;ve just released the latest version of Moq :)))) It&amp;#39;s quite late on an intense week at Redmond [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2009/03/06/moq-3-0-rtm.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/05/120009.aspx#120027 "permalink") Moq 3.0 RTM!!! - Daniel Cazzulino's Blog @ Friday, March 06, 2009 12:29 AM

Thank you for submitting this cool story - Trackback from DotNetShoutout [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://dotnetshoutout.com/Moq-30-RTM-Daniel-Cazzulinos-Blog "TrackBack")

  

[![](/web/20090309230746im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
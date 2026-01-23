---
layout: post
title: "Daniel Cazzulino's Blog : Serious flaw in WPF validation infrastructure for ValidationRule and Binding"
date: 2007-09-25 00:00:00 +0000
---

Daniel Cazzulino's Blog : Serious flaw in WPF validation infrastructure for ValidationRule and Binding


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3013'\))| May 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3074'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| [3](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/3.aspx "1 Post")  
4| 5| 6| 7| 8| 9| 10  
[11](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/11.aspx "1 Post")| [12](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/12.aspx "1 Post")| 13| 14| 15| 16| 17  
18| [19](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/19.aspx "1 Post")| 20| 21| 22| [23](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/23.aspx "1 Post")| [24](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/24.aspx "3 Posts")  
[25](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/25.aspx "1 Post")| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/26.aspx "2 Posts")| [27](http://www.clariusconsulting.net/blogs/kzu/archive/2007/9/27.aspx "1 Post")| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080504112427im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080504112427im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080504112427im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080504112427im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Serious flaw in WPF validation infrastructure for ValidationRule and Binding 

[Adam Nathan](http://www.adamnathan.net/)'s [excelent book on WPF](http://adamnathan.net/wpf/) states:

> The validation check is invoked during any attempt to update the underlying data ... before a value converter is called (if present)...

This is further reinforced on [MSDN where the validation process is explained](http://msdn2.microsoft.com/en-us/library/ms752347.aspx#validation_process):

![image](https://web.archive.org/web/20080504112427im_/http://www.clariusconsulting.net/images/blogs/kzu/SeriousflawinWPFvalidationinfrastructure_11CFC/image_3.png)   

I can't understand how this design decision was made (it seems to be very much a rational decision, given how well documented it is). 

Think about this scenario: you want to validate an integer value for a property (say, its range). There is a built-in converter for integers (but this could be a custom value converter, if it was your own type) that will ultimately assign a value of the right type to the property.

The validation routine should deal only with checking the range of an integer, not about how to convert it from whichever value it's passed-in by the binding target (i.e. the textbox control), which is already a responsibility of the value converter. If it has to perform conversion of the value prior to validating it, then a double conversion will happen if the value turns out to be valid.

What's worse, the validation rules have no way of accessing the value converter associated with the binding, so you'll end up either hardcoding which value converter to use inside the validator, or having to sync both manually (make validator code and XAML match).

Consider the alternative: first, the value converter tries to convert. Say It fails. It's like a validation error, but it's a precondition to validation that failed. With this approach, the validator can rely on the incoming value to always be of the appropriate type. A much better approach IMO.

I'm still enjoying XAML/WPF very much, but this is [the second](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/23/ForgetaboutextendingWPFdatabindingsupport.aspx) "not-cool" moment I had in a single week :(. 

It's probably useless, but if you wanna [vote to get this changed](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=299711), go ahead. Thanks.

posted on Tuesday, September 25, 2007 8:21 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/32939.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/25/SeriousflawinWPFvalidationinfrastructureforValidationRuleandBinding.aspx#32942 "permalink") Serious flaw in WPF validation infrastructure for ValidationRule and Binding @ Tuesday, September 25, 2007 8:40 PM

Adam Nathan 's excelent book on WPF states: The validation check is invoked during any attempt to update [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/09/26/serious-flaw-in-wpf-validation-infrastructure-for-validationrule-and-binding.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/25/SeriousflawinWPFvalidationinfrastructureforValidationRuleandBinding.aspx#38740 "permalink") Validationを通らないとデータソースに反映されない件について @ Sunday, November 04, 2007 8:07 AM

Validationを通らないとデータソースに反映されない件について [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://blogs.wankuma.com/naka/archive/2007/11/05/105904.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/25/SeriousflawinWPFvalidationinfrastructureforValidationRuleandBinding.aspx#59929 "permalink") For those that think Microsoft Connect is useless @ Friday, April 18, 2008 2:08 AM

A while back I reported both through my weblog and Microsoft Connect what I thought was a serious flaw [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/04/18/for-those-that-think-microsoft-connect-is-useless.aspx "TrackBack")

  

[![](/web/20080504112427im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
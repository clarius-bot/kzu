---
layout: post
title: "Daniel Cazzulino's Blog : A practical example on how to mock static classes without TypeMock"
date: 2008-05-18 00:00:00 +0000
---

Daniel Cazzulino's Blog : A practical example on how to mock static classes without TypeMock


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3043'\))| June 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3104'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
8| 9| 10| 11| 12| 13| 14  
15| 16| 17| [18](http://www.clariusconsulting.net/blogs/kzu/archive/2008/5/18.aspx "1 Post")| 19| 20| 21  
22| 23| 24| 25| 26| 27| [28](http://www.clariusconsulting.net/blogs/kzu/archive/2008/5/28.aspx "1 Post")  
29| 30| 1| 2| 3| 4| 5  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080603044803im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080603044803im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080603044803im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080603044803im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## A practical example on how to mock static classes without TypeMock 

WCF is the second biggest framework after ASP.NET that sooner or later forces you to use a static "context" property to do anything beyond the trivial stuff. ASP.NET has the HttpContext.Current, whereas WCF has the WebOperationContext.Current for example.

My friend [Pablo Cibraro](http://weblogs.asp.net/cibrax) proves [how you can quite easily make your implementations that depend on such static contexts testable](http://weblogs.asp.net/cibrax/archive/2008/05/16/unit-tests-for-wcf.aspx) without resorting to [black-magic voodoo TypeMock](http://www.google.com/search?hl=en&q=typemock%20mock%20static%20classes) kind of stuff. Any .NET developer can trivially introduce an indirection to make their classes testable, even if they depend on static classes. 

So, don't buy a product just because you're lazy and want to avoid creating a few wrapper classes and interfaces. Most of them can be copied directly from Reflector's API rendering. And once you have the interfaces, you can just use [MoQ](http://mockframeworks.com/moq) or [Rhino](http://mockframeworks.com/rhino) (or whichever [mock framework](http://mockframeworks.com/) you like) to mock them any way you want.

Always use the simplest thing that could possibly work.

**Update** : added a reference to other mock frameworks that can be used to the same effect. Apparently some people get picky if you have a preference and it happens to be the one you built :)  
  
**Update II** : For those that didn't follow the discussion over at [Roy's blog](http://weblogs.asp.net/rosherove/archive/2008/05/19/two-faced-commits-how-the-alt-net-community-is-becoming-more-and-more-dogmatic.aspx), I'll [repeat an analogy](http://weblogs.asp.net/rosherove/archive/2008/05/19/two-faced-commits-how-the-alt-net-community-is-becoming-more-and-more-dogmatic.aspx#6201926) that better explains what my point was with [my previous post on mocking statics](http://www.clariusconsulting.net/blogs/kzu/archive/2008/05/18/mock_statics_without_typemock.aspx): 

> If you are not careful enough and can shoot yourself in the foot, the less shotguns you have around the house, the better. 
> 
> That said, you may have a big, ugly, old contender where you really need the biggest shotgun you can get. But you'll be giving it to your very best guys, not to the newbie soldier. 
> 
> Better to teach the newbies how to shoot smaller objectives with a regular pistol first (the whole point of Pablo's post on mocking WCF static context). 
> 
> Some may say this sounds somewhat paternalist. I think that's pragmatism.

I'd rather show developers how to work around statics imposed by some "legacy" framework they happen to use (i.e. WCF and ASP.NET static contexts) by using typical OO techniques such as the one [explained by Pablo](http://weblogs.asp.net/cibrax/archive/2008/05/16/unit-tests-for-wcf.aspx), than giving them a bazooka and spending endless hours explaining how to NOT overuse it. 

For the record, the technique is *exactly* the same used the ASP.NET MVC team, I don't hear anyone calling HttpContextBase and friends "[utterly useless wrappers](http://www.elilopian.com/2008/05/19/mocking-frameworks-dream-feature/)". I find it hard to think about a case where such a technique could not be applied to make new code written to interact/integrate with a legacy system testable. Would love to find a counter example.

Sometimes it's just that the solution ends up being much simpler than you initially thought. How hard do you think it is to do the ASP.NET MVC trick for the ASP.NET HttpContext? Go [get the sources](http://www.codeplex.com/aspnet), find class MvcHandler and see for yourself.

Also, [Pablo clarified](http://weblogs.asp.net/cibrax/archive/2008/05/20/unit-tests-for-wcf-and-moq-part-ii.aspx) that his [original post](http://weblogs.asp.net/cibrax/archive/2008/05/16/unit-tests-for-wcf.aspx) was how to mock the WCF context, regardless of its static nature (as you could still pass it to your implementation's constructor), when it's neither an interface, nor a class with any virtuals that enable easy mocking.

More to the [case against statics and singletons at Scott's blog](http://blogs.msdn.com/scottdensmore/archive/2004/05/25/140827.aspx).  

posted on Sunday, May 18, 2008 9:00 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/69123.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/05/18/mock_statics_without_typemock.aspx#69124 "permalink") A practical example on how to mock static classes without TypeMock @ Sunday, May 18, 2008 8:53 PM

WCF is the second biggest framework after ASP.NET that sooner or later forces you to use a static &amp;quot;context&amp;quot; [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/05/19/a-practical-example-on-how-to-mock-static-classes-without-typemock.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/05/18/mock_statics_without_typemock.aspx#69193 "permalink") Two Faced Commits - how the ALT.NET Community is becoming more and more dogmatic @ Monday, May 19, 2008 3:50 AM

disclaimer: I work at Typemock. There is a big trend I am starting to notice in the &amp;quot;Advanced&amp;quot; [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/rosherove/archive/2008/05/19/two-faced-commits-how-the-alt-net-community-is-becoming-more-and-more-dogmatic.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/05/18/mock_statics_without_typemock.aspx#69194 "permalink") Two Faced Commits - how the ALT.NET Community is becoming more and more dogmatic @ Monday, May 19, 2008 3:50 AM

disclaimer: I work at Typemock. There is a big trend I am starting to notice in the &amp;quot;Advanced&amp;quot; [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/rosherove/archive/2008/05/19/two-faced-commits-how-the-alt-net-community-is-becoming-more-and-more-dogmatic.aspx "TrackBack")

  

[![](/web/20080603044803im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
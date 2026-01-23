---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-19 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Tuesday, November 30, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| 5| 6  
7| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/11/8.aspx "1 Post")| 9| 10| 11| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/11/13.aspx "1 Post")  
14| 15| 16| 17| 18| 19| 20  
21| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/11/23.aspx "1 Post")| 24| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/11/25.aspx "1 Post")| 26| 27  
28| 29| [30](http://clariusconsulting.net/blogs/kzu/archive/2004/11/30.aspx "2 Posts")| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060519073849im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Tuesday, November 30, 2004 - Posts

#####  [The right approach to exposing code in the IDE (i.e. NOT the VS way!)](http://clariusconsulting.net/blogs/kzu/archive/2004/11/30/CodeDomIde.aspx)

Every since the [CodeDom](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconCodeDOMQuickReference.asp) saw the day of light, I've been wondering when it'll be the time that VS throws away the ugly vb-like CodeModel and fully embrace the CodeDom for representing .NET code inside the IDE. Looks like at least [one other company](http://www.borland.com/) is [doing what I believe is the right thing](http://blogs.borland.com/corbindunn/archive/2004/09/30/1493.aspx).   
  
While I don't like the way they mix static members to access IDE features with IServiceProvider-based service retrieval (see the example that accesses BorlandIDE.ModuleServices.CurrentModule and then calls  CurrentModule.GetService(typeof(IOTACodeDomProvider))), an obvious inconsistency, I love the idea of doing addins/VSIP packages that can play with/refactor code using CodeDom... Now I only have finish my [radically different to that](http://www.codeproject.com/csharp/refly.asp) alternative to generating CodeDom, and coupled with the [MsilCodeProvider](http://www.microsoft.com/downloads/details.aspx?FamilyId=7E979ED3-416B-43B6-993B-308A160831B6&displaylang=en) you can kiss Reflection.Emit bye bye!!!  

posted [Tuesday, November 30, 2004 1:45 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/11/30/CodeDomIde.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/11/30/CodeDomIde.aspx#comments)

#####  [When the reasons for cutting an ASP.NET feature are not credible...](http://clariusconsulting.net/blogs/kzu/archive/2004/11/30/ComponentsBadReason.aspx)

For [quite some time now](http://weblogs.asp.net/cazzu/archive/2004/10/12/241276.aspx), I've been trying to raise developer's (and MS) awareness of how an unbelievable bad idea it is to[ remove an amazing feature in ASP.NET v1.x and replace it with a bad, already tried and failed one in v2](http://weblogs.asp.net/cazzu/archive/2004/08/25/LosingComponents.aspx). Even given the overwhelming feedback (151 voters with an average of 4.7 over 5), [Microsoft decided not to fix it](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=e2996990-64a5-4308-921d-245071e6f174), but they gave the wrong reasons for it.   
  
The main reason was that "the existing model in VS 2003 was prone to bugs and code-loss and as such we've removed the functionality of a designer tray for components defined in InitializeComponent.". I reopened the bug and added:  
  
"The Windows Forms designer keeps supporting the Component Tray just as it used to, so I think they somehow solved the "prone to bugs and code-loss" nature in it, right?  
  
I can't see how given that it's working on WinForms, you can't take advantage of it. It's a very important feature to be able to develop components that are reusable across view technologies. This is the last time I'll reopen the bug. I just want an answer and if you're planing to put it back as it was (that is, 100% compatible with the WinForms support and codegen features) or if you're going to break the model anyway."  
  
I'll keep bothering these guys until they give us component developers a satisfactory answer. If you agree, you should definitely [make your voice loud and clear](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?did=1&t=4S*NOROloBkA%2110eMrWG9BxCIv55TO5dJ2Kcs9poleAtxw0aCqF2ns%21voZGVC90TXTb%21mefbXIu2Nk47iVvezkwA$$&p=4Dihn131aHkzHWMEptMmQxP9hGJIYnQkG3CdvP*7oynNU1%21QIhiZC6jjAFTphSmyWRPnQR%21mfV1PFMM3FDykXZQMvhYOTEVMT%21qXUgYeJSMhsCeLGfJaWREOcsnM7l*vc3cn5fyI4moQM$&feedbackid=e2996990-64a5-4308-921d-245071e6f174).  

posted [Tuesday, November 30, 2004 1:28 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/11/30/ComponentsBadReason.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/11/30/ComponentsBadReason.aspx#comments)

  

[![](/web/20060519073849im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
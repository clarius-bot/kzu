---
layout: post
title: "Daniel Cazzulino's Blog : Open source projects and irresponsible use of incompatible licenses"
date: 2005-07-28 00:00:00 +0000
---

Daniel Cazzulino's Blog : Open source projects and irresponsible use of incompatible licenses


### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081122040924im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081122040924im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081122040924im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081122040924im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Open source projects and irresponsible use of incompatible licenses 

I started working on a sample app I want to build on top of [CAB](http://practices.gotdotnet.com/projects/cab). I evaluated using [RssBandit](http://rssbandit.org/) components to do the RSS parsing, NNTP reading and some other goodies it will have. Problem is that I don't like the [GPL ](http://www.opensource.org/licenses/gpl-license.php)license at all, so first thing I did was to check [RssBandit](http://rssbandit.org/) license [as listed in SourceForge](http://sourceforge.net/projects/rssbandit). It says it's [BSD](http://www.opensource.org/licenses/bsd-license.php), cool. But looking at the dependencies the project has, I noticed it's using the [#ZipLib](http://www.icsharpcode.net/OpenSource/SharpZipLib/Default.aspx), which is GPL-licensed and explicitly states that "_Linking this library statically or dynamically with other modules is making a combined work based on this library. Thus, the terms and conditions of the GNU General Public License cover the whole combination._ ". Hence, RssBandit is also GPL, and I therefore cannot use any of its components in any project that is not GPL'ed.   
  
Bottom-line: don't believe open source project admins that happily select any arbitrary licenses they like. * **Always** * check their dependencies, and the licenses of those, as it may be the case that the project is breaching some of them. This is IMO one of the reasons why leveraging OS projects is so risky and most companies don't do at all.  
  
**Update** : ok, people complain that I didn't read the paragraphs following my quote. So I'll add my comments to it here. I did read them, but they hardly matter, if you're a conscious and careful developer. I do not want to get involved in hand-written exceptions invented by people that may or most probably may **not** have consulted a lawyer with expertise in OS licenses. The complex interation between a "core" or base license and its exceptions may very well turn out to be a breach of the original license altogether. Now, do I want to go over the fuss of figuring this out? Of course not. And the same goes for other companies that are scared at even looking at GPL'ed code. Specially if the exception to the license is expressed in terms as vague as "based on this library" or "under terms of your choice". Being a lawyer myself (although certainly not a practicing one), I can hardly believe that an exception that grants such a right (the later one) is not breaching the terms of the GPL. I certainly don't want to find out in court ;), and definitely I do not want to pay a good enough lawyer that I can trust for a forecast on the outcome of such an event. 

posted on Thursday, July 28, 2005 3:11 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/367.aspx) :: 

  

[![](/web/20081122040924im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
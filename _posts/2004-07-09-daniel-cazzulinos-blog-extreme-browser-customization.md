---
layout: post
title: "Daniel Cazzulino's Blog : Extreme browser customization"
date: 2004-07-09 00:00:00 +0000
---

Daniel Cazzulino's Blog : Extreme browser customization


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080827162435im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080827162435im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080827162435im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080827162435im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Extreme browser customization 

I've [already said](http://weblogs.asp.net/cazzu/archive/2004/06/25/166372.aspx) why I believe [FireFox](http://getfirefox.com/) is the best browser ever. Let me show you another amazing feature of this browser. 

FireFox can be completely customized through CSS stylesheets. You know, the browser itself it built with XML (the I-came-first-than-XAML [XML User Interface Language](http://www.xulplanet.com/) and [Extensible Binding Language](http://www.mozilla.org/projects/xbl/xbl.html) -think IE behaviors), javascript and CSS. What's more, all those XML, JS and CSS files are right there sitting in your profile folder waiting for you to play with them. 

There are two main files that customize the browsing experience: 

  * `userChrome.css`: modifies the browser's appearance.
  * `userContent.css`: modifies the appearance of all rendered pages.

Both files can be created inside your profile's `chrome` subfolder. Sample files for them are provided in the `US\chrome` subfolder inside your profile folder. You can rename and copy them to your `chrome` folder. You can create a new FireFox profile with the store location you want by using starting it with `firefox.exe /p`.

I my case, for example, I find the default search box at the top right of the browser too small. I usually perform searches like: `xml performance site:weblogs.asp.net`. That doesn't fit the textbox. What's more, as I'm using 1152x864 resolution, I've a huge wasted address bar.   
In the `userChrome.css` stylesheet file, the following style declaration suffices to make the search box wider (see it [in this screenshot](http://aspnet2.com/kzu/weblog/firefoxsearch.png "FireFox search box")): #search-container { -moz-box-flex: 300 !important; } Way cool huh? 

But it doesn't end in browser customization. You can also affect the way ALL the pages you browse are displayed. That's the `userContent.css`'s role. For example, I find the default font size for <pre> and <code> tags too small in comparison with IE. Easy enough to fix. I just edited the `userContent.css` stylesheet and added: /* code font bigger. */ code { font-size: 10pt !important; } pre { font-size: 10pt !important; } It doesn't end in simple tag rendering modifications. You see, I spend a lot of my online experience either on [MSDN](http://msdn.microsoft.com/) or [SourceForge](http://sf.net/projects/mvp-xml). The former has the completely useless header with the usual MS menu I never use, the the later shows me the advertising banner which takes considerable space at the top of the page too. I didn't want to see them anymore. Piece of cake with FireFox.   
I had a look at both sites' HTML source, located the elements I don't want to see, and added the following styles: /* MSDN */ #msviMasthead { display: none; } #msviFooter { display: none; } /* Microsoft.com */ #masthead { display: none; } #footer { display: none; } /* SF */ img[alt='Click Here'] { display: none; } Note the last style uses a CSS2 selector to hide the image with the specified alt attribute. This is possible because FireFox, unlike that [3 years old](http://www.tech-report.com/news_reply.x/2791) [browser](http://www.microsoft.com/ie), supports the full [CSS 2.1](http://www.w3.org/TR/CSS21/) specification, as well as some of the goodies from [CSS 3](http://www.w3.org/Style/CSS/current-work). I needed to refer to the <img> alt attribute because there's no ID provided on it or its parent elements that I can reliably use, unlike MS sites. Of course, if the site changes, I'll need to update my css. No big deal.

And if you have the disgrace of having to work too much with GDN, the following will get rid of the amazingly useless header and search box and the advertising at the right: td[background='/images/topbar_bg.gif'] { display: none; } span[id='_ctl2_RightNavigation'] { display: none; }

Of course, I've only scratched the surface. There are [a lot more ways to customize your browsing experience](http://www.mozilla.org/unix/customizing.html). Happy firefoxing! 

posted on Friday, July 09, 2004 4:24 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20080827162435im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
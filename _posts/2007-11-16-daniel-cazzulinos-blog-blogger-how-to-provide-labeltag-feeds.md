---
layout: post
title: "Daniel Cazzulino's Blog : Blogger: how to provide label/tag feeds"
date: 2007-11-16 00:00:00 +0000
---

Daniel Cazzulino's Blog : Blogger: how to provide label/tag feeds


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080929004210im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080929004210im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080929004210im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080929004210im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Blogger: how to provide label/tag feeds 

By default, blogger will only render links to the pages where you can read all entries with given labels:

[![BloggerLabels](https://web.archive.org/web/20080929004210im_/http://www.clariusconsulting.net/images/blogs/kzu/Bloggerhowtoprovidelabeltagfeeds_BF05/BloggerLabels_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/Bloggerhowtoprovidelabeltagfeeds_BF05/BloggerLabels.png)

If you want to expose a feed so that people can subscribe to receive only entries with the given label, here's what you need to do:

  1. Go to the Template -> Edit HTML tab on your feed management page:  
  
[![BloggerEditHTML](https://web.archive.org/web/20080929004210im_/http://www.clariusconsulting.net/images/blogs/kzu/Bloggerhowtoprovidelabeltagfeeds_BF05/BloggerEditHTML_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/Bloggerhowtoprovidelabeltagfeeds_BF05/BloggerEditHTML.png)   

  2. Make sure to check "Expand Widget Templates" 
  3. Do a "find" for "data:labels". That will take you to the markup where the labels are iterated to build the links. 
  4. Inside the div with a `class='widget-content'`, change the code as follows:  
  
original: 
         
         <b:loop values='data:labels' var='label'>  
           <li>  
             <b:if cond='data:blog.url == data:label.url'>  
               <data:label.name/>  
             <b:else/>  
               <a expr:href='data:label.url'><data:label.name/></a>  
             </b:if>  
             (<data:label.count/>)  
           </li>  
         </b:loop> 

change to: 
         
         <b:loop values='data:labels' var='label'>  
           <li>  
           <link expr:href='data:blog.homepageUrl + "feeds/posts/default/-/" + data:label.name + "?alt=rss"' expr:title='data:label.name + " Feed"' rel='alternate' type='application/rss+xml'/>  
           <a expr:href='data:blog.homepageUrl + "feeds/posts/default/-/" + data:label.name + "?alt=rss"'>  
             <img alt='Subscribe' src='<http://www.feedburner.com/fb/images/pub/feed-icon16x16.png'> style='vertical-align:middle;border:0'/></a>  
             <b:if cond='data:blog.url == data:label.url'>  
               <data:label.name/>  
             <b:else/>  
               <a expr:href='data:label.url'><data:label.name/></a>  
             </b:if>  
             (<data:label.count/>)  
           </li>  
         </b:loop> 

  
Now the rendering is as follows:  
  
[![BloggerLabelsRss](https://web.archive.org/web/20080929004210im_/http://www.clariusconsulting.net/images/blogs/kzu/Bloggerhowtoprovidelabeltagfeeds_BF05/BloggerLabelsRss_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/Bloggerhowtoprovidelabeltagfeeds_BF05/BloggerLabelsRss.png)

Enjoy! 

posted on Friday, November 16, 2007 8:35 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20080929004210im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog - Blogger: how to provide label/tag feeds"
date: 2007-11-16 00:00:00 +0000
---

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

/kzu

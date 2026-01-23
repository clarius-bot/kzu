---
layout: post
title: "Daniel Cazzulino's Blog : Live Mesh FeedSync: an overview of the protocol under the hood"
date: 2008-04-29 00:00:00 +0000
---

Daniel Cazzulino's Blog : Live Mesh FeedSync: an overview of the protocol under the hood


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3013'\))| May 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3074'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| 3  
4| 5| 6| [7](http://www.clariusconsulting.net/blogs/kzu/archive/2008/4/7.aspx "2 Posts")| 8| 9| 10  
11| 12| 13| 14| 15| 16| 17  
[18](http://www.clariusconsulting.net/blogs/kzu/archive/2008/4/18.aspx "2 Posts")| 19| 20| 21| [22](http://www.clariusconsulting.net/blogs/kzu/archive/2008/4/22.aspx "2 Posts")| 23| [24](http://www.clariusconsulting.net/blogs/kzu/archive/2008/4/24.aspx "1 Post")  
25| 26| 27| 28| [29](http://www.clariusconsulting.net/blogs/kzu/archive/2008/4/29.aspx "1 Post")| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080503171854im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080503171854im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080503171854im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080503171854im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Live Mesh FeedSync: an overview of the protocol under the hood 

I already mentioned why I think Live Mesh is cool and that I think the most important part of it, [FeedSync](http://feedsync.org/), is being largely ignored by reviewers. Fortunately, there's an extensive interview with the team that goes quite deep in FeedSync and how it works. Go watch it, it's good info.

At the most basic level, FeedSync is a mechanism to associate versioning "headers" to arbitrary objects (items), and an algorithm to merge and detect conflicts based on that header information. Replace "header" with "extension element" and "arbitrary object" with "RSS/Atom Item" and you have the XML feed version of it:
    
    
    				<
    				item 
    				xmlns:sx
    				='http://feedsync.org/2007/feedsync'>  
     <title>Buy groceries</title>  
     <sx:sync id='0a7903db47fb0fff' updates='1'>  
      <sx:history sequence='1' by='kzu'/>  
     </sx:sync>  
    </item>

The sx:sync element is the versioning header. Every time the item is updated (say, by another user/device), a new sx:history element is added and the updates attribute is incremented:
    
    
    				<
    				item
    				>  
     <
    				title
    				>Buy groceries</title>  
     <sx:sync id='0a7903db47fb0fff' updates='2'>  
       <sx:history sequence='2' by='vga'/>  
       <sx:history sequence='1' by='kzu'/>  
     </sx:sync>  
    </item>

[ ](http://11011.net/software/vspaste)

If v1 of the item was updated simultaneously by two users and you try to merge them, you'd end up with something like the following:
    
    
    				<
    				item
    				>  
     <
    				title
    				>Buy groceries</title>  
     <sx:sync id='0a7903db47fb0fff' updates='2'>  
       <sx:history sequence='2' by='kzu'/>  
       <sx:history sequence='1' by='kzu'/>  
       <sx:conflicts>  
         <item>  
           <title>Buy icecream</title>  
           <customer id='1' />  
           <sx:sync id='0a7903db47fb0fff' updates='2'>  
             <sx:history sequence='2' by='vga'/>  
             <sx:history sequence='1' by='kzu'/>  
           </sx:sync>  
         </item>  
       </sx:conflicts>  
     </sx:sync>  
    </item>

[ ](http://11011.net/software/vspaste)

Notice the added sx:conflicts element, which contains the conflicting item in its entirety. The algorithm provides a consistent selection of a default "winner" from the merge (in this case my v2 item, rather than [Victor](http://clariusconsulting.net/vga "vga's blog")'s). This gives you a consistent state across the mesh. But note that the merge operation with conflict does NOT resolve the conflict. It just surfaces it in a predictable way.

Needless to say, the default winner might not be what the end user wants, so at that point the application can surface the conflict (i.e. a different icon for the item) and allow him to resolve it in a different way (i.e. doing a full content diff and picking the new state). Alternatively, a specific implementation of an item store/adapter (i.e. the feedsync-enabled store for files) can provide automatic resolution if it so wishes to, such as doing an auto-merge of the file contents.

[Pablo has more info](http://weblogs.asp.net/cibrax/archive/2008/04/22/overview-of-feedsync-support-in-the-microsoft-sync-framework.aspx) on how it works and the way the [Microsoft Sync Framework](http://msdn2.microsoft.com/en-us/sync/default.aspx) exposes this. 

It seems really simple at first glance, doesn't it? The devil is in the details, as usual. It's obviously a RESTful approach to synchronization, where the item payload is the actual representation of the state. This means that upon conflict, all you have is the state. Implementing automatic conflict resolution can be quite tricky as a consequence.

## Automatic Conflict Resolution?

As part of our [Mesh4x](http://www.mesh4x.org/) implementation with [InSTEDD](http://instedd.org/), we're thinking about ways to increase the chances of automatic conflict resolution, as it's generally desirable and you don't want to be bothering your users for every apparently conflicting change. Think about a very simple example: tags. Say both user A and B add a tag at the same time, and then they synchronize:

Initial state of both A and B (say, created by yet another user, C):
    
    
    				<
    				item
    				>  
      <
    				title
    				>Buy groceries</title>  
      <sx:sync id='0a7903db47fb0fff' updates='1'>  
        <sx:history sequence='1' by='C'/>  
      </sx:sync>  
    </item>

[ ](http://11011.net/software/vspaste)

User A changes item by adding a category "to-do" (again, notice the new sx:history):
    
    
    				<
    				item
    				>  
      <
    				title
    				>Buy groceries</title>  
      <category>to-do</category>  
      <sx:sync id='0a7903db47fb0fff' updates='2'>  
        <sx:history sequence='2' by='A'/>  
        <sx:history sequence='1' by='C'/>  
      </sx:sync>  
    </item>

[ ](http://11011.net/software/vspaste)

Whereas user B changes it by adding a different category "supermarket":
    
    
    				<
    				item
    				>  
      <
    				title
    				>Buy groceries</title>  
      <category>supermarket</category>  
      <sx:sync id='0a7903db47fb0fff' updates='2'>  
        <sx:history sequence='2' by='B'/>  
        <sx:history sequence='1' by='C'/>  
      </sx:sync>  
    </item>

[ ](http://11011.net/software/vspaste)

When they sync, the algorithm will detect a conflict, as we have the same sequence number but with different "by". It will pick a default winner (say, A's change). But clearly this is a case where we could apply auto-merge semantics if we knew the operation each user performed. 

You might be tempted to say: just do a content merge and that's it! But the semantics of a merge of state cannot be applied generically (i.e. a Company element gets an IsBankrupt='true' value from one user, and a new Invoice element from another: at the business logic level, the two changes cannot be merged. If the company went bankrup, you can no longer receive invoices from it), and it's even quite tricky with XML elements that can be moved around, renamed, deleted and re-inserted across multiple versions, etc.

So one approach we're thinking is to add command-pattern like hints that an adapter/store can use as hints for automatic conflict resolution and state reconstruction for merging. In the case above, maybe the XML adapter expresses user A operation as a combination of the item payload, the sync versioning header, and diff information about what was changed (added an element inmediately after the first child element of the root, in terms of XPath):
    
    
    				<
    				item
    				>  
      <
    				title
    				>Buy groceries</title>  
      <category>to-do</category>  
      <sx:sync id='0a7903db47fb0fff' updates='2'>  
        <sx:history sequence='2' by='A'/>  
        <sx:history sequence='1' by='C'/>  
      </sx:sync>  
      <diff xmlns=".../xmldiff">  
        <add match="/*[1]">  
          <category>to-do</category>  
        </add>  
      </diff>  
    </item>  
    

[ ](http://11011.net/software/vspaste)

The new diff element would be very similar in spirit to the [XML Diff and Patch](http://msdn.microsoft.com/en-us/xml/bb190622.aspx) tool from [Microsoft](http://msdn.microsoft.com/en-us/library/aa302294.aspx) and would make it easier for the XML adapter to determine if a given change is compatible for auto-merge (i.e. it's not a change in a node that was removed, etc.). 

I think different adapters might benefit from surfacing different conflict resolution hints. A database may include schema manipulation statements to perform upgrades, for example.

This is exploratory field as we try to make for the best user experience possible. We don't want to end up in the Groove approach where your choices are: save your changes as a different item, or discard your changes :S.

What do you think?

posted on Tuesday, April 29, 2008 4:16 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/62598.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/29/62598.aspx#62607 "permalink") Live Mesh FeedSync: a quick intro @ Tuesday, April 29, 2008 5:22 PM

I already mentioned why I think Live Mesh is cool and that I think the most important part of it, FeedSync [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/04/29/live-mesh-feedsync-a-quick-intro.aspx "TrackBack")

  

[![](/web/20080503171854im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
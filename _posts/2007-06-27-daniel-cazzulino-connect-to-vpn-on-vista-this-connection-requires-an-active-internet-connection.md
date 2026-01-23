---
layout: post
title: "Daniel Cazzulino : Connect to VPN on Vista: This connection requires an active Internet connection"
date: 2007-06-27 00:00:00 +0000
---

Daniel Cazzulino : Connect to VPN on Vista: This connection requires an active Internet connection


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2708'\))| July 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2769'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
24| 25| 26| 27| 28| 29| 30  
1| 2| 3| 4| 5| 6| 7  
8| 9| 10| 11| 12| 13| 14  
15| 16| 17| 18| 19| 20| 21  
22| 23| 24| 25| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2007/6/26.aspx "1 Post")| [27](http://www.clariusconsulting.net/blogs/kzu/archive/2007/6/27.aspx "2 Posts")| 28  
29| 30| 31| 1| 2| 3| 4  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070704222027im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20070704222027im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20070704222027im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20070704222027im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Connect to VPN on Vista: This connection requires an active Internet connection 

Pretty much every day, I get the following stupid dialog from Vista when I'm trying to connect to a VPN:

![ConnectedOrNot](/web/20070704222027im_/http://www.clariusconsulting.net/images/blogs/kzu/ConnecttoVPNonVistaThisconnectionrequire_108FD/ConnectedOrNot.png)

Note that even when I've an active wireless connection shown in the dialog, the dialog still doesn't allow me to connect to a VPN supposedly because I don't have such a connection :S.

The workaround is to click on the Open Network and Sharing Center, from there click on the Manage Network Connections link at the left:

![image](/web/20070704222027im_/http://www.clariusconsulting.net/images/blogs/kzu/ConnecttoVPNonVistaThisconnectionrequire_108FD/image.png)

And finally from the dialog that comes up, right-click on the VPN connection and select Connect. Weird enough, it looks like this way of connecting is not checking for the "active Internet connection" as the other dialog:

![image](/web/20070704222027im_/http://www.clariusconsulting.net/images/blogs/kzu/ConnecttoVPNonVistaThisconnectionrequire_108FD/image_3.png)

A much faster solution, though, is to select the Create Shortcut option from the same context menu, which will place a shortcut to the connection on the desktop. That shortcut doesn't check for the active connection either.

Networking in Vista is SOOOO broken!!! (right-clicking on the connection to disconnect takes forever to show up the conext menu, connecting to anything always shows the useless "Successfully connected" dialog every damn time, etc.)

posted on Wednesday, June 27, 2007 5:50 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/28104.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/06/27/28104.aspx#28105 "permalink") Connect to VPN on Vista: &amp;quot;This connection requires an active Internet connection&amp;quot; @ Wednesday, June 27, 2007 5:51 PM

Pretty much every day, I get the following stupid dialog from Vista when I'm trying to connect to a VPN [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/06/27/connect-to-vpn-on-vista-quot-this-connection-requires-an-active-internet-connection-quot.aspx "TrackBack")

  

[![](/web/20070704222027im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
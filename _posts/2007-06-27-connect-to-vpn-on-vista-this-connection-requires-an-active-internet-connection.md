---
layout: post
title: "Connect to VPN on Vista: This connection requires an active Internet connection"
date: 2007-06-27 00:00:00 +0000
---

Pretty much every day, I get the following stupid dialog from Vista when I'm trying to connect to a VPN:

![ConnectedOrNot](/web/20070704222027im_/http://www.clariusconsulting.net/images/blogs/kzu/ConnecttoVPNonVistaThisconnectionrequire_108FD/ConnectedOrNot.png)

Note that even when I've an active wireless connection shown in the dialog, the dialog still doesn't allow me to connect to a VPN supposedly because I don't have such a connection :S.

The workaround is to click on the Open Network and Sharing Center, from there click on the Manage Network Connections link at the left:

![image](/web/20070704222027im_/http://www.clariusconsulting.net/images/blogs/kzu/ConnecttoVPNonVistaThisconnectionrequire_108FD/image.png)

And finally from the dialog that comes up, right-click on the VPN connection and select Connect. Weird enough, it looks like this way of connecting is not checking for the "active Internet connection" as the other dialog:

![image](/web/20070704222027im_/http://www.clariusconsulting.net/images/blogs/kzu/ConnecttoVPNonVistaThisconnectionrequire_108FD/image_3.png)

A much faster solution, though, is to select the Create Shortcut option from the same context menu, which will place a shortcut to the connection on the desktop. That shortcut doesn't check for the active connection either.

Networking in Vista is SOOOO broken!!! (right-clicking on the connection to disconnect takes forever to show up the conext menu, connecting to anything always shows the useless "Successfully connected" dialog every damn time, etc.)

/kzu

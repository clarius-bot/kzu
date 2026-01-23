---
layout: post
title: "Daniel Cazzulino's Blog : How to install Intel WiFi Link 5300/5100 drivers for Windows 7 Beta"
date: 2009-02-17 00:00:00 +0000
---

## How to install Intel WiFi Link 5300/5100 drivers for Windows 7 Beta 

I just couldn't resist going for the brand new beta which is being praised quite a bit when I got my new [Lenovo X200](http://shop.lenovo.com/SEUILibrary/controller/e/web/LenovoPortal/en_US/systemconfig.runtime.workflow:LoadRuntimeTree?sb=:00000025:000019D3:&smid=6194D04805DF4296B0D1A64481A943A4).

I used a trick I got from [Pablo](http://www.clariusconsulting.net/pga) on [how to quickly install Windows 7 from a pendrive](http://www.sevenforums.com/general-discussion/1607-how-install-windows-7-usb-stick.html) (quickly as in <15'!!!), and was up and running pretty fast. Right out of the box I got LAN connectivity, and installing all remaining updates I was in pretty good shape. A few drivers missing, but nothing critical, except for the ***WiFi*** drivers!

See, the page for the [Lenovo X200](http://shop.lenovo.com/SEUILibrary/controller/e/web/LenovoPortal/en_US/systemconfig.runtime.workflow:LoadRuntimeTree?sb=:00000025:000019D3:&smid=6194D04805DF4296B0D1A64481A943A4) shows you the Intel WiFi Link 5100 and 5300 as options (which I used to built mine), but the Lenovo [X200 drivers downloads page](http://www-307.ibm.com/pc/support/site.wss/document.do?sitestyle=lenovo&lndocid=MIGR-70476) doesn't show ANY downloads for them for ANY OS!!!

So I went to [the source](http://downloadcenter.intel.com/Product_Filter.aspx?ProductID=3062), got the bare drivers, unzipped them, right-clicked the unrecognized device (Network Device or something like that), clicked "Update Driver" and specified the path to the unzipped drivers. Worked like a charm and I'm now thoroughly enjoying the new taskbar...

/kzu

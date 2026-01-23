---
layout: post
title: "Daniel Cazzulino's Blog : How to use Windows 2008 on your laptop"
date: 2008-10-21 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to use Windows 2008 on your laptop


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081223084432im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081223084432im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081223084432im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081223084432im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## How to use Windows 2008 on your laptop 

  * Follow all the tips from [Windows 2008 Workstation](http://www.win2008workstation.com/) site. [Microsoft has a KB article](http://support.microsoft.com/kb/947036) also that is useful. 
  * Get [Windows Live Messenger bare MSI from Softpedia](http://www.softpedia.com/progDownload/MSN-Messenger-8-Download-68149.html) (it's a MS-signed installer, worked just fine for me) 
  * How to get Windows Live Writer on Windows 2008: this was a bit trickier, and involves importing a few registry keys (just copy the registry keys to a .reg file and import it). 
    1. First you need a machine with WLW installed. Copy the entire folder to the new machine. I copied it to %ProgramFiles%\Windows Live\Writer, which is where it'd go if I could run the proper installer.  

    2. The following registry keys are created by the "root" Windows Live installer: 

Windows Registry Editor Version 5.00 
           
           [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Live\installer]
           "WLXMarket"="en-us"
           "WLXLanguage"="en"
           "WLXVersion"="WL20" 

    3. Next the keys for WLW on HKLM (make sure the InstallDir matches the right folder where you copied the binaries): 

Windows Registry Editor Version 5.00 
           
           [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Live\Writer]
           "InstallDir"="C:\\Program Files (x86)\\Windows Live\\Writer\\"

    4. Finally, export from your existing WLW installation the entire `HKEY_CURRENT_USER\Software\Microsoft\Windows Live\Writer` key. That will bring in your current blog accounts and everything :). Make sure to fix any folders that might be different on your target machine (i.e. Documents and Settings, etc.)  

    5. Add a shortcut to the start menu and you're done!

  * Finally, forget about sleeping/hibernating your computer from the start menu:  
  
![image](https://web.archive.org/web/20081223084432im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtouseWindows2008onyourlaptop_F80D/image.png)   
  
Even though sleep and hibernation are supported, you have to Ctrl+Alt+Del and choose the respective option which now DOES show up in that screen Shutdown Options button:  
  
![image](https://web.archive.org/web/20081223084432im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtouseWindows2008onyourlaptop_F80D/image_3.png)   

So far it's been a blast using Windows 2008 in my laptop. Vista x64 was becoming truly unusable, even with a 7200RPM disc, 4GB RAM and 2.2Ghz proc.

posted on Tuesday, October 21, 2008 6:45 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20081223084432im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
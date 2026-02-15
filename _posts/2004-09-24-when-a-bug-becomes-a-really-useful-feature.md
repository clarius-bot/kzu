---
layout: post
title: When a bug becomes a really useful feature
date: 2004-09-24 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/BugTure
tags:
- Miscelaneous

---

I have to take quite a few screenshots for [Victor](http://aspnet2.com/vga)'s and mine [last book](http://www.apress.com/book/bookDisplay.html?bID=292) and they have to be taken with 120dpi screen resolution. There's no way I will use such resolution in my laptop, and I also have to test the app in a fresh machine. Of course, the solution is using virtual machines, and I started using VPC 2004.   
  
Well, I'm a keyboard guy, and as soon as I discovered that there's no way of getting out of the VM control unless you click on the host machine, I started to get annoyed. Just by chance, I discovered what looks like a bug but works like a really useful feature for me. Look at the following picture:  
  
![](https://web.archive.org/web/20081122040033im_/http://aspnet2.com/kzu/weblog/bugfeature.jpg)   
  
From inside the VM, hit Ctrl+Alt and release them. Now do Alt+Tab and voila!! You get TWO simultaneous popups for Alt+Tab, and when you release, you'll be taken to the selected one on the host machine! I don't really thing this is expected behavior, as what's happening is that both machines are being controlled at the same time, something that is usually contrary to VM's regular behavior. What's more, when you release the Alt key, both machines will change to the app selected (of course a different one in each!).  
  
Anyway, very cool, and I don't need to touch the mouse anymore to go back and forth between them. Amazing "bugture".  

/kzu

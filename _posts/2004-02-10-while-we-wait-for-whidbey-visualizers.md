---
layout: post
title: While we wait for Whidbey visualizers...
date: 2004-02-10 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/70658
tags:
- .NET

---

I'm as excited as almost everybody else with the ability to [write custom visualizers](http://blogs.msdn.com/ericgu/archive/2003/11/21/52871.aspx) in managed code, so that at debug-time I have a better experience and interaction with variables and their data. However, there're a couple things you can do right now to improve the debugging experience. Here's my favorite list of "tips": 

1 - Download [VSTweak](http://www.gotdotnet.com/community/workspaces/viewuploads.aspx?id=b9330ea5-096d-45b7-8a5b-17450d7a0d5a): this powertoy enables a sort of visualizer for your data. Let me explain: by default, when you set a breakpoint and hover over a variable, you get the class name displayed. Not too helpful, right? So you have to dig in the Locals, Autos or Watch windows and look at all the instance members, which you probable don't care at all except for only a couple of them, which you have to locate.   
Well, VSTweak has a [Debugger Editor](http://www.gotdotnet.com/Community/MessageBoard/Thread.aspx?id=114316) that allows you to change the string representation of your classes at debug-time, that is, the value displayed in the tooltip AND the debug windows, which is the class name yb default, as we said. This feature is located in the `Debug Editor` tab of the tool. You can look at how the display for most built-in types is laid out, and learn the syntaxis from them. For example, a `Rectangle` representation is defined as follows: =X= Y= Width= Height= You can reference you own assemblies using the button at the bottom of the tool: 

![](https://web.archive.org/web/20081122052354im_/http://kzu.aspnet2.com/weblog/debugeditor.png)

After referencing your assemblies, you can for example make a Customer class appear as [FirstName],[LastName],[ID] with the following statement: =, () The first one I changed is: =Name= Now whenever I hover a type variable, I get its full name: 

![](https://web.archive.org/web/20081122052354im_/http://kzu.aspnet2.com/weblog/debuggertooltip.png)

It's really cool, specially if your types are specified through configuration. Another usual change I make is make all by custom delegate classes to display the target method name. 

2 - Getting unescaped strings: quite often you build XML/HTML or whatever with a `StringBuilder` or by some other means. At debugging-time, if you ask for any string variable value you get it escaped, which isn't very useful. You can't copy/paste to a text editor to save to a file and check how it looks like, for example. A trick I use all the time is issuing the following command in the Command Window - Inmediate: System.Diagnostics.Debugger.Log(0, "", theTextVariable) You will get in the same window, the unescaped string, including any tabs, CRLF, etc. :D. This is another one I use everyday! 

/kzu

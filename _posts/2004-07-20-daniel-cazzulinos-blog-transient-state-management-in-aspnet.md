---
layout: post
title: "Daniel Cazzulino's Blog : Transient state management in ASP.NET"
date: 2004-07-20 00:00:00 +0000
---

## Transient state management in ASP.NET 

I'm reading PAG guide on [Improving .NET Application Performance and Scalability](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnpag/html/scalenet.asp) (a must-read for every .NET developer), and I noticed they [missed one of the most interesting and useful state management features](http://msdn.microsoft.com/library/en-us/dnpag/html/scalenetchapt06.asp?frame=true#scalenetchapt06_topic16) ASP.NET introduced, the one I call **transient state**. This is the state that lives in `HttpContext.Items`, which only lasts for the duration of the current request, hence its characteristic of "transient". It's really awesome because you can pass information between modules, pages and controls with it, and completely avoid Session state. It's quickly discarded as soon as the current request has finished processing, so it doesn't impose any of the drawbacks you need to care about with Session. 

In my experience, a combination of `HttpContext.Items` and the Cache API almost completely removes the need to use Session at all. And this is a good thing, as you're also avoiding server affinity resulting from inproc session state (the only one that performs well, BTW).

Too bad it didn't make into that excelent guide :( 

/kzu

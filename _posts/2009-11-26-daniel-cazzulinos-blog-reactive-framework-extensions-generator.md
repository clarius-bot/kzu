---
layout: post
title: "Daniel Cazzulino's Blog : Reactive Framework Extensions Generator"
date: 2009-11-26 00:00:00 +0000
---

Daniel Cazzulino's Blog : Reactive Framework Extensions Generator


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

Source code published in this blog is [public domain](http://en.wikipedia.org/wiki/Public_domain) unless otherwise specified.

[![](https://web.archive.org/web/20100811023721im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100811023721im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100811023721im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100811023721im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100811023721im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100811023721im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Reactive Framework Extensions Generator 

You probably know already that the Reactive Framework Extensions (Rx) is a new library on top of .NET 4.0 and Silverlight that allows developers to leverage the expressiveness and power of LINQ for .NET events. It brings an entirely new paradigm for doing event-driven apps, and therefore shines in WPF/Silverlight scenarios. 

Read more about Rx at the [team blog](http://blogs.msdn.com/RxTeam/), the [project home page](http://msdn.microsoft.com/en-us/devlabs/ee794896.aspx) and [Matthew excelent blog series](http://codebetter.com/blogs/matthew.podwysocki/archive/2009/11/18/introduction-to-the-reactive-framework-part-v.aspx). 

Even with the general availability of the [bits for VS2010 beta2 at DevLabs](http://msdn.microsoft.com/en-us/devlabs/ee794896.aspx), there's still quite a bit of work you need to do in order to leverage the extensions. Specifically, you need to turn your events into [IObservables](http://msdn.microsoft.com/en-us/library/dd990377\(VS.100\).aspx) that can then use the Rx extensions for querying and subscribing. This is a lot of repetitive and boring code that can be easily automated. 

That's precisely what this [Clarius Labs](http://clarius.codeplex.com/) provided extension does, enabling Reactive Framework Extensions for arbitrary assemblies, without writing any code. It basically traverses all public types in a given assembly (i.e. PresentationFramework.dll, for WPF) and generates a "Reactive" assembly for it (i.e. PresentationFramework.Reactive.dll) which contains the necessary extension methods for all public types that expose generic or custom delegate events that can be automatically converted to [IObservables](http://msdn.microsoft.com/en-us/library/dd990377\(VS.100\).aspx). With that in place, you can simply use the Reactive() extension method on your classes and access in a strong-typed fashion all events of that type as [IObservables](http://msdn.microsoft.com/en-us/library/dd990377\(VS.100\).aspx): 

![Typed events as IObservables](https://web.archive.org/web/20100811023721im_/http://i3.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=clarius&DownloadId=94584)

In order to get the extensions assembly generated, you simply right-click on a project or assembly reference, and select "Create Reactive Extensions":

![Executing the command](https://web.archive.org/web/20100811023721im_/http://i3.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=clarius&DownloadId=94586)

and a new assembly will be generated and referenced automatically:

![Reference added](https://web.archive.org/web/20100811023721im_/http://i3.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=clarius&DownloadId=94587)

which will enable you to use LINQ operators and the new Observable APIs for all events exposed on all public types for the given assembly.

[Matthew sample](http://codebetter.com/blogs/matthew.podwysocki/archive/2009/11/12/introduction-to-the-reactive-framework-part-iii.aspx) using our generator looks like:
    
    
    var mouseMoves = from mm in mainCanvas.Reactive().MouseMove
                     let location = mm.EventArgs.GetPosition(mainCanvas)
                     select new { location.X, location.Y };
    
    var mouseDiffs = mouseMoves
        .Skip(1)
        .Zip(mouseMoves, (l, r) => new { X1 = l.X, Y1 = l.Y, X2 = r.X, Y2 = r.Y });
    
    var mouseDrag = from _ in mainCanvas.Reactive().MouseLeftButtonDown
                    from md in mouseDiffs.Until(
                        mainCanvas.Reactive().MouseLeftButtonUp)
                    select md;
    

Go to the [Visual Studio Gallery](http://visualstudiogallery.msdn.microsoft.com/en-us/0791089a-4570-4f21-b5ee-78aba7e80651) and give it a try!

posted on Thursday, November 26, 2009 8:56 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20100811023721im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
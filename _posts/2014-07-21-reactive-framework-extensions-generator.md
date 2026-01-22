---
layout: post
title: "Reactive Framework Extensions Generator"
date: 2014-07-21 00:00:00 +0000
---

##  [Reactive Framework Extensions Generator](<http://blogs.clariusconsulting.net/kzu/reactive-framework-extensions-generator/> "Reactive Framework Extensions Generator")

November 26, 2009 4:56 pm

You probably know already that the Reactive Framework Extensions (Rx) is a new library on top of .NET 4.0 and Silverlight that allows developers to leverage the expressiveness and power of LINQ for .NET events. It brings an entirely new paradigm for doing event-driven apps, and therefore shines in WPF/Silverlight scenarios.� 

Read more about Rx at the [team blog](<http://blogs.msdn.com/RxTeam/>), the [project home page](<http://msdn.microsoft.com/en-us/devlabs/ee794896.aspx>) and [Matthew excelent blog series](<http://codebetter.com/blogs/matthew.podwysocki/archive/2009/11/18/introduction-to-the-reactive-framework-part-v.aspx>). 

� 

Even with the general availability of the [bits for VS2010 beta2 at DevLabs](<http://msdn.microsoft.com/en-us/devlabs/ee794896.aspx>), there’s still quite a bit of work you need to do in order to leverage the extensions. Specifically, you need to turn your events into [IObservables](<http://msdn.microsoft.com/en-us/library/dd990377\(VS.100\).aspx>) that can then use the Rx extensions for querying and subscribing. This is a lot of repetitive and boring code that can be easily automated. 

That’s precisely what this [Clarius Labs](<http://clarius.codeplex.com/>) provided extension does, enabling Reactive Framework Extensions for arbitrary assemblies, without writing any code. It basically traverses all public types in a given assembly (i.e. PresentationFramework.dll, for WPF) and generates a “Reactive” assembly for it (i.e. PresentationFramework.Reactive.dll) which contains the necessary extension methods for all public types that expose generic or custom delegate events that can be automatically converted to [IObservables](<http://msdn.microsoft.com/en-us/library/dd990377\(VS.100\).aspx>). With that in place, you can simply use the Reactive() extension method on your classes and access in a strong-typed fashion all events of that type as [IObservables](<http://msdn.microsoft.com/en-us/library/dd990377\(VS.100\).aspx>): 

![Typed events as IObservables](http://i3.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=clarius&DownloadId=94584)

In order to get the extensions assembly generated, you simply right-click on a project or assembly reference, and select “Create Reactive Extensions”:

![Executing the command](http://i3.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=clarius&DownloadId=94586)

and a new assembly will be generated and referenced automatically:

![Reference added](http://i3.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=clarius&DownloadId=94587)

which will enable you to use LINQ operators and the new Observable APIs for all events exposed on all public types for the given assembly.

[Matthew sample](<http://codebetter.com/blogs/matthew.podwysocki/archive/2009/11/12/introduction-to-the-reactive-framework-part-iii.aspx>) using our generator looks like:
    
    
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
    

Go to the [Visual Studio Gallery](<http://visualstudiogallery.msdn.microsoft.com/en-us/0791089a-4570-4f21-b5ee-78aba7e80651>) and give it a try!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=185514)

Posted by kzu
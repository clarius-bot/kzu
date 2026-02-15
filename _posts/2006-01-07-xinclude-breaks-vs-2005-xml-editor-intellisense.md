---
layout: post
title: XInclude breaks VS 2005 XML editor intellisense
date: 2006-01-07 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/XIncludeBreaksIntellisense
tags:
- .NET
- All Technology
- XML

---


A while back I’ve reported as a [bug that VS XML editor breaks if you use XInclude elements](<http://lab.msdn.microsoft.com/productfeedback/viewfeedback.aspx?feedbackid=FDBK42576>) in the document. You may ask: “who cares? .NET does not support XInclude anyway!”. It just so happens that the recently released version of the [Guidance Automation Extensions (GAX)](<http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/>) include the [Mvp.Xml library](<http://www.xmlmvp.org/>), which adds support for [XInclude](<http://www.w3.org/TR/xinclude/>) in your guidance package configuration file.

So, in order to benefit from the better manageability and modularity of you guidance package configuration, you have to pay the price of losing intellisense ![:\(](/img/2006-01-07-1.gif) … As a workaround, you can keep a dummy XML file around in the solution that you use for authoring the recipe with full intellisense, before you split it in multiple files. However, once you need to start editing it, you're again stuck. I believe the added flexibility is worth the price anyway, but that's just me….(and I'm an XML MVP, so I may be biased ![;\)](/img/2006-01-07-1.gif) )

![](http://clariusconsulting.net/aggbug.aspx?PostID=431)

/kzu

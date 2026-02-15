---
layout: post
title: Do I need SAX for .NET? (or does straight Java ports to C# make sense?)
date: 2004-03-29 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/101437
tags:
- XML

---

After reading [Oleg's](http://www.tkachenko.com/) post [ about an upcoming SAX.NET](http://www.tkachenko.com/blog/archives/000197.html) implementation, and while I still look forward to the other XML fellow developer working on that, I got certainly excited and run to download and have a look at it. I was dissapointed, I must say. 

When I see a project implementing a class called XmlNamespaces containing methods such as `AddMapping`, `GetPrefixMapping`, `PushScope` and `PopScope` (among others), which do exactly the same as the [ System.Xml.XmlNamespaceManager](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemxmlxmlnamespacemanagerclasstopic.asp) with its `AddNamespace`, `LookupNamespace`, `LookupPrefix`, `PushScope` and `PopScope`, I start wondering whether straight ports of other platform libraries really does make sense in .NET. The mismatch doesn't end there:

  * There's IAttributes AND IAttributes2, and the corresponding implementations called AttributesImpl and AttributesImpl2 (?!?!). Multiply that by ILocator, IEntityResolver and so on. This is the first port and there's already interface versioning problems? 
  * There's an IXMLReader (note the casing) class with an EntityResolver property which doesn't try to take advantage of .NET XmlResolver class, instead reinventing it through the IEntityResolver interface 
  * All the GetFeature/SetFeature/IProperty baggage that only makes sense when multiple XML parsers are available and with varying features support (which judging from the [ silence of death](http://groups.google.com/groups?q=cazzulino+xmlfactory&hl=en&lr=&ie=UTF-8&oe=UTF-8&selm=u7uLRLPBEHA.1212%40TK2MSFTNGP12.phx.gbl&rnum=1) to my request for support to such scenarios isn't going to happen at all in .NET) 
  * Non-standard delegate such as `OnPropertyChange(IProperty property, object newValue)` \- in .NET world it would have been `OnPropertyChange(object sender, ProperyChangeEventArgs e)`. 
  * Trivial things such as: public static string GetString(RsId id) { string name = Enum.GetName(typeof(RsId), id); return rm.GetString(name); // Should have been: // return rm.GetString(id.ToString()); }

I think copying Java projects over to .NET is not always a good idea, specially if done by people who doesn't work with C# and .NET on a daily basis. Examples of well done ports are NUnit and Log4Net, for example. Note, however, that it wasn't until v2 that NUnit started using .NET-isms as custom Attributes. 

So, do I want SAX.NET? Definitely NOT. I like some of its ideas. We, as .NET developers, should take the best ideas from it, mix them with .NET-friendly APIs, take advantage of built-in infrastructure, and improve on it. So, I still like it much more the [Xml Streaming Events (XSE)](http://weblogs.asp.net/cazzu/posts/XseIntro.htm) idea than any of these ports. I have to work further on it, develop more use cases, clarify the API and give a second though to some concepts, but it definitely integrates far better with current and future .NET XML support. What I definitely don't want, is to code against a pseudo-.NET/pseudo-Java API. 

/kzu

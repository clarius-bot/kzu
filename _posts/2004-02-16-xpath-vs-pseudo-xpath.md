---
layout: post
title: XPath vs pseudo-XPath
date: 2004-02-16 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/PseudoXPath
tags:
- .NET
- XML

---

[Oleg](http://www.tkachenko.com/blog/archives/000159.html) commented on my [XSE (Xml Streaming Events)](http://weblogs.asp.net/cazzu/posts/XSEIntro.aspx) implementation. He has a nice code snipped with something called an XmlUpdater. Really cool. I'd like to see that code!  

He has a couple of observations about my wildcard syntax. Clarifying them:  
":*" = any element with an empty namespace.  
"*.*" = any element in any namespace.   
Those are different things ;).   
All available wildcards are explained in [the previous post](http://weblogs.asp.net/cazzu/posts/XseTransformations.aspx), towards the end. 

Strictly speaking, his forwardonly navigator is not XPath either, just like my two initial XSE factories. XPath is a very concrete concept and specification. If I'm not going to support it, well, I don't need to care about its syntax, providing I give users something easy to understand. I believe the wildcards are FAR more easier to grasp than the `local-name` and `namespace-uri` XPath counterparts.   
The `RootedPath` and `RelativePath` are just factories for concrete compiled algorithms that are different in implementation (codegen). Note there's no X in the middle, so it's no XPath at all ;).  
Of course, calling something akin to folder browsing anything else than "path" would be unnatural, that's why I chose it. 

My idea was to implement compiled algorithms that (IMO) will always be more performant than generic ones. In the code download I even provide an `InterpretedPath` factory that does just this. Doesn't compile anything and evaluates dynamically. There's a price to pay, just like I guessed. 

Bottom lines: 

  * Naming XPath things that are not, confuses developers.
  * Seeking XPath support where it's overkill is not wise, IMO.
  * XPath will NEVER be available in streaming APIs.
  * Having path-like expression syntax for streaming XML handling can hardly be called "reinventing the wheel". You have to choose the solution that best applies to your problem. Call it whatever you like ;).

**Update: read these follow-up:**

  * [XSE Initial Release](http://weblogs.asp.net/cazzu/archive/2004/02/16/XSERelease.aspx)
  * [XSE != XPath != SXPath != XPathReader](http://weblogs.asp.net/cazzu/archive/2004/02/16/XseNotXPath.aspx)

/kzu

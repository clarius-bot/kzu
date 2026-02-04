---
layout: post
title: "Daniel Cazzulino's Blog - How To Destroy Your Web Developer Reputation in One Line, Guaranteed"
date: 2004-07-15 00:00:00 +0000
---

## How To Destroy Your Web Developer Reputation in One Line, Guaranteed 

Please, make sure these words get deep in your mind the next time you write an ASP.NET application: 

**If you're using`Response.Write`, you're a dreadful citizen of the ASP.NET world.**

As my friend [Victor](http://weblogs.asp.net/vga) said, "Response.Write is there just for compatibility reasons and for old script programmers to not feel lonely".   
An app written in such a way will not only be difficult to maintain and evolve, it will be almost impossible to customize (specially its layout), will never catch up with the upcoming mobile features and just hurts the eye.   
Everytime I see a `Response.Write`, and specially if it's not even kind enough to use `[HtmlTextWriterTag](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwebuihtmltextwritertagclasstopic.asp)`, `[HtmlTextWriterAttribute](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfSystemWebUIHtmlTextWriterAttributeClassTopic.asp)` and `[HtmlTextWriterStyle](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwebuihtmltextwriterstyleclasstopic.asp)`, the developer who wrote it is instantly removed from my in-memory list of good ASP.NET programmers. 

Bottom line: you should always design your web apps as reusable components and user or custom controls, so that they can be easily rearranged, styled and plugged into existing apps.

/kzu

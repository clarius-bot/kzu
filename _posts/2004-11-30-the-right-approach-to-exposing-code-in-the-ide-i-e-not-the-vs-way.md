---
layout: post
title: "The right approach to exposing code in the IDE (i.e. NOT the VS way!)"
date: 2004-11-30 00:00:00 +0000
---

Every since the [CodeDom](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconCodeDOMQuickReference.asp) saw the day of light, I've been wondering when it'll be the time that VS throws away the ugly vb-like CodeModel and fully embrace the CodeDom for representing .NET code inside the IDE. Looks like at least [one other company](http://www.borland.com/) is [doing what I believe is the right thing](http://blogs.borland.com/corbindunn/archive/2004/09/30/1493.aspx).   
  
While I don't like the way they mix static members to access IDE features with IServiceProvider-based service retrieval (see the example that accesses BorlandIDE.ModuleServices.CurrentModule and then calls  CurrentModule.GetService(typeof(IOTACodeDomProvider))), an obvious inconsistency, I love the idea of doing addins/VSIP packages that can play with/refactor code using CodeDom... Now I only have finish my [radically different to that](http://www.codeproject.com/csharp/refly.asp) alternative to generating CodeDom, and coupled with the [MsilCodeProvider](http://www.microsoft.com/downloads/details.aspx?FamilyId=7E979ED3-416B-43B6-993B-308A160831B6&displaylang=en) you can kiss Reflection.Emit bye bye!!!  

/kzu

---
layout: post
title: "Daniel Cazzulino : Reflection severely broken for properties"
date: 2005-09-28 00:00:00 +0000
---

## Reflection severely broken for properties 

`PropertyInfo.GetCustomAttributes` never returns attributes inherited from the base class if the property is an override.   
  
Even worse, if you ask for `Attributes.IsDefined` with the same values, you will get a true!! :S:S:S... Can't believe a release of .NET comes out without an automated test for those kinds of things...  
  
You can see the bug, get a repro class, and vote for it on [Product Feedback](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?feedbackId=FDBK37702).  

posted on Wednesday, September 28, 2005 6:35 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

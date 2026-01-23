---
layout: post
title: "Daniel Cazzulino : I hate sealed classes!!!"
date: 2005-08-29 00:00:00 +0000
---

## I hate sealed classes!!! 

Sealed keyword is by far the most annoying showstopper to extensibility. I hate it so much. I wish there was an FxCop rule that would enforce that:  
1 - If a class is sealed, then it *must* implement an interface that extenders can implement to hook custom implementations.   
2 - The sealed class cannot be used *anywhere* in an "if (foo is MyDamnSealedClass)" statement. The required interface from 1) must be used instead.  
3 - If a method is sealed, the class should be sealed too, or an equivalent method called from the sealed one is provided for inheritors (implementation of the template method pattern). There's no point in providing a non-sealed class where it's most important behavior (say an Execute method in a Command class or something like that) is sealed and there's no way to change its core behavior.  
  
Although the third one is a little bit extreme, the first two are a **MUST**. Another day I'll tell you where I found a few key such annoying combinations...  

posted on Monday, August 29, 2005 4:50 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

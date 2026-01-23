---
layout: post
title: "Daniel Cazzulino's Blog : Sunday, December 30, 2007 - Posts"
date: 2008-05-17 00:00:00 +0000
---

## Sunday, December 30, 2007 - Posts

#####  [Statically-typed reflection with LINQ](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/30/49063.aspx)

Quite some time ago I posted about [how to use LINQ to provide a strong-typed reflection API](http://www.clariusconsulting.net/blogs/kzu/archive/2006/07/06/TypedReflection.aspx). I used a very old LINQ preview back then. 

With [.NET 3.5 and C# 3.0 released](http://www.microsoft.com/downloads/details.aspx?FamilyID=333325fd-ae52-4e35-b531-508d977d32a6&displaylang=en) now, it was time for an update. As part of the update, I also improved the API a little bit. Usage now is:
    
    
    				MethodInfo toString = Reflect<object>.GetMethod(x => x.ToString());

[ ](http://11011.net/software/vspaste)

The renamed `Reflect<TTarget>` class receives the type you want to reflect as a generic parameter. Then you can use `GetMethod`, `GetField` or `GetProperty`.

Other examples:
    
    
    				MethodInfo clone = Reflect<ICloneable>.GetMethod(x => x.Clone());
    
    PropertyInfo prop = Reflect<AppDomain>.GetProperty(x => x.BaseDirectory);
    
    FieldInfo field = Reflect<Mock>.GetField(x => x.PublicField);
    

[ ](http://11011.net/software/vspaste)

Working principle is the same: the lambda you pass to the methods is actually an expression which I analyze to retrieve the underlying reflection object that is already exposed by the LINQ Expression API. For example, once you get to a [MethodCallExpression](http://msdn2.microsoft.com/en-us/library/system.linq.expressions.methodcallexpression.aspx), you can get the method being called through its [Method](http://msdn2.microsoft.com/en-us/library/bb340973.aspx) property:
    
    
    ((MethodCallExpression)lambda.Body).Method;

It's interesting to see how this works actually, and what's the compiler generating for those lambda expressions invoking methods.

In Reflector, the following C# code:

MethodInfo clone = Reflect<ICloneable>.GetMethod(x => x.Clone()); 

is decompiled as (indented for readability): 
    
    
    				ParameterExpression CS$0$0000;
    MethodInfo clone = Reflect<ICloneable>.GetMethod(  
    Expression.Lambda<Action<ICloneable>>(  
    Expression.Call(  
          CS$0$0000 = Expression.Parameter(typeof(ICloneable), "x"),   
          (MethodInfo) methodof(ICloneable.Clone),   
    new Expression[0]  
        ),   
    new ParameterExpression[] { CS$0$0000 }  
      )  
    );

[ ](http://11011.net/software/vspaste)

Note how the MethodInfo is retrieved directly from the interface by using a `methodof` operator. It's not a valid C# keyword, but given that [Lutz Roeder](http://www.aisto.com/roeder/) works for Microsoft (not on the C# team, though), let's hope it will get eventually in the language :). 

That `methodof` translation is actually the conversion from the following two IL lines:
    
    
    L_0017: ldtoken instance object [mscorlib]System.ICloneable::Clone()  
    L_001c: call class [mscorlib]System.Reflection.MethodBase [mscorlib]System.Reflection.MethodBase::GetMethodFromHandle(valuetype [mscorlib]System.RuntimeMethodHandle)
    

`ldtoken` is the key there, let's hope it gets promoted to C# in some way eventually.

Anyway, since I wrote my original article, I realized through [Ayende's blog](http://www.ayende.com/Blog/Default.aspx) that you can also do [static reflection without LINQ](http://www.ayende.com/Blog/archive/2005/10/29/8176.aspx). It only works for methods though, and you cannot use the lambda syntax because it results in method infos that are actually from a compiler-generated type (the one that contains the closures too if any). 

As I'm so in love with the lambda syntax, I'll keep my implementation based on expression trees instead of delegates.

It's released now as part of [Clarius Labs](http://www.codeplex.com/clarius) projects. [Get the source](https://www.codeplex.com/Release/ProjectReleases.aspx?ProjectName=clarius&ReleaseId=9495) and have fun!

[****[License: Microsoft Permissive License (Ms-PL) v1.1](http://www.codeplex.com/clarius/Project/License.aspx)]

posted [Sunday, December 30, 2007 11:45 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/30/49063.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [5 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2007/12/30/49063.aspx#comments)

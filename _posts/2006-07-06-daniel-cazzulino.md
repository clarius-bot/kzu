---
layout: post
title: "Daniel Cazzulino"
date: 2006-07-06 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Linq beyond queries: strong-typed reflection!

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))| July 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2404'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 29| 30| 1  
2| 3| 4| [5](http://clariusconsulting.net/blogs/kzu/archive/2006/7/5.aspx "1 Post")| [6](http://clariusconsulting.net/blogs/kzu/archive/2006/7/6.aspx "1 Post")| 7| 8  
9| 10| 11| 12| 13| 14| 15  
16| 17| 18| 19| 20| 21| 22  
23| 24| 25| 26| 27| 28| 29  
30| 31| 1| 2| 3| 4| 5  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060717161316im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Linq beyond queries: strong-typed reflection! 

Surely you know Linq brings the standard query operators to make queries a first class concept in the C# language. What you may or may not have realized, is that Linq can be used for way more than just querying. Here goes my first exploration outside the query bounds with Linq.  
  

### The problem with reflection: bye-bye type safety

There's (at least for me) a sense of comfort and reassurance in using a type-safe language like C# every time I hit Ctrl + Shift + B (or Shift + F6) - that is, when I compile ;). I know that weird and hard to debug runtime errors because of wrong type usage will almost never happen, as well as "missing method" or something like that. That's until I use reflection and get the infamous TargetInvocationException or some NullReferenceException if I'm not careful. Here's what I mean:  
  

MethodInfo method = typeof(Mock).GetMethod("PublicMethodParameters",   
newType[] { typeof(string), typeof(int) }));

  
What happens if a refactoring is applied to the Mock class to rename the method? What happens if the type of a parameter changes? Yeeessss, runtime exceptions! This is not a trivial problem if you have a flexible and pluggable framework that uses lots of reflection. Not being able to apply refactorings (or making it too expensive) because of the risk of breaking things, essencially limits your ability to improve the design and evolve your code. So, how about this to replace the magic strings and loosely typed Type arrays?:  
  

MethodInfo info = Reflector.Method<Mock, string, int>(

(x, y, z) => x.PublicMethodParameters(y, z));  

### Strong-typed reflection via Linq

The working principle is that lamda expressions passed as arguments (just as delegates in previous versions of .NET) are not necessarily executed. 

The code above basically constructs a lambda expression with a calls to a given method on a type. The type of the target type that declares the method is the first type parameter to the Method<> static generic method. The optional type parameters that you can specify will be the types of the arguments (if any) of the method you will call. If I were to retrieve the MethodInfo for a parameterless method, the expression would be: 

MethodInfo info = Reflector.Method<Mock>(x => x.PublicMethodNoParameters());

This is the more typical lambda that you may be used to seeing. In a lambda expression, if you need to pass additional arguments, you must enclose all of them in parethesis (x, y, z in the example above). I got the same typed reflection feature working for properties and fields: 

PropertyInfo property = Reflector.Property<Mock>(x => x.PublicProperty);

FieldInfo field = Reflector.Field<Mock>(x => x.PublicField);

### Leveraging expression trees

Now to the interesting part. How is it implemented?

In Linq, any method receiving a lambda expression (a delegate type) can be converted into a method receiving an Expression<T> for the same delegate type, without changes to client code. For example: 

privatestaticvoid DoSomething(Predicate<Mock> predicate)

can be replaced with:

privatestaticvoid DoSomething(Expression<Predicate<Mock>> predicate)

In both cases, calling code can be the same lambda expression:

DoSomething(x => x.Value > 25);

What happens is that the compiler, instead of passing in the pointer to the anonymous delegate in the second method signature, generates IL code that builds an AST (abstract syntax tree) of the code, in the form of an expression tree. You can see this if you open Reflector (I named my typed reflection class after it as a tribute to the greatest tool any advanced developer should use regularly) and dissasemble the method invocation to DoSomething: 

ParameterExpression expression1 = Expression.Parameter(typeof(Mock), "x");

Program.DoSomething(Expression.Lambda<Predicate<Mock>>(Expression.GT(Expression.Field(expression1, fieldof(Mock.Value)), Expression.Constant(0x19, typeof(int))), newParameterExpression[] { expression1 }));

There you can see how the compiler built the entire expression using static methods on the Expression class (more on how I think the API could be improved in a separate entry). And of course, in your method implementation, you can inspect that same tree and do whatever you want with it. The latest Linq CTP includes a very cool visualizer to see what's in the expression tree once it reaches your method body at runtime:

![Expression tree visualizer in action](/web/20060717161316im_/http://clariusconsulting.net/ImageGallery/kzu/Linq1.png)

It should be pretty obvious by now how I'm implementing the strong typed reflection: I'm receiving an expression tree, and searching it for the method call node (or member access, for properties and fields). Here's the implementation of the Method<> method: 

publicstaticMethodInfo Method<TDeclaringType>(Expression<Operation> method)

{

return GetMethodInfo(method);

}

privatestaticMethodInfo GetMethodInfo(Expression method)

{

LambdaExpression lambda = method asLambdaExpression;

if (lambda == null) thrownewArgumentNullException("method");

MethodCallExpression methodExpr = null;

// Our Operation<T> returns an object, so first statement can be either 

// a cast (if method does not return an object) or the direct method call.

if (lambda.Body.NodeType == ExpressionType.Cast)

{

// The cast is an unary expression, where the operand is the 

// actual method call expression.

methodExpr = ((UnaryExpression)lambda.Body).Operand asMethodCallExpression;

}

elseif (lambda.Body.NodeType == ExpressionType.MethodCall ||

lambda.Body.NodeType == ExpressionType.MethodCallVirtual)

{

methodExpr = lambda.Body asMethodCallExpression;

}

if (methodExpr == null) thrownewArgumentException("method");

return methodExpr.Method;

}

The Operation delegate type is one that I created. I couldn't use the Linq Func<T> (and T, Arg0..) because they return a boolean. I needed something more flexible, basically something returning an object, and delegate "overloads" receiving a number of fixed argument types (same as Func<T>). So I got:

publicdelegateobjectOperation();

publicdelegateobjectOperation<T>(T declaringType);

publicdelegateobjectOperation<T, A0>(T declaringType, A0 arg0);

...

Note that the user of our API never knows about these delegate types, just as the user of the query operators never knows about Func<T>. I expect these delegates to dissapear in the future, in favor of something more elegant (maybe publicdelegateobjectOperation <params T> ;)). Also, notice how I'm adding the new argument type parameters *after* the T, which is the usual convention for overloading, and which is contrary to what Linq does in their Func<T>s.

Properties and fields are very similar to the example above, and not too interesting. The Method overloads, however, are the really nice part: 

publicstaticMethodInfo Method<TDeclaringType>(Expression<Operation<TDeclaringType>> method)

{

return GetMethodInfo(method);

}

publicstaticMethodInfo Method<TDeclaringType, A0>(Expression<Operation<TDeclaringType, A0>> method)

{

return GetMethodInfo(method);

}

publicstaticMethodInfo Method<TDeclaringType, A0, A1>(Expression<Operation<TDeclaringType, A0, A1>> method)

{

return GetMethodInfo(method);

}  
...

Ok, what's the big deal, right? Well, by being able to specify the types of the arguments and then declaring them in the lambda, you basically get strong typing and compile-type safety back even if you are using reflection in the end :). Back to the initial example: 

MethodInfo info = Reflector.Method<Mock, string, int>(

(x, y, z) => x.PublicMethodParameters(y, z));

See how the y and z parameters are strong typed and are used to resolve at compile time which is the method "invoked" in the lambda expression. When the IDE is fully updated to work with C# 3.0, a rename refactor of the given method would yield the expected result: it will be renamed in all places like this where you are using it even for reflection! And if you change an argument type, the code will simply fail to compile!

Freakin' amazing :D

[Get the prototype](http://clariusconsulting.net/kzu/TypedReflectionLinq.zip) and play at will.

posted on Thursday, July 06, 2006 6:00 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/586.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/07/06/TypedReflection.aspx#587 "permalink") Linq beyond queries: strong-typed reflection! @ Thursday, July 06, 2006 6:05 AM

Note: this entry has moved.Surely you know Linq brings the standard query operators to make queries a [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2006/07/06/Linq-beyond-queries_3A00_-strong_2D00_typed-reflection_2100_.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2006/07/06/TypedReflection.aspx#590 "permalink") New and Notable 108 @ Friday, July 07, 2006 5:16 AM

Ruby/Rails   
  
Martin notes that a video of his keynote at RailsConf is online and the rest are starting... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://codebetter.com/blogs/sam.gentile/archive/2006/07/07/147182.aspx "TrackBack")

  

[![](/web/20060717161316im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
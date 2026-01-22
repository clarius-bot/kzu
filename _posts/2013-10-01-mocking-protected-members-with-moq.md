---
layout: post
title: "Mocking protected members with Moq"
date: 2013-10-01 00:00:00 +0000
---

##  [Mocking protected members with Moq](<http://blogs.clariusconsulting.net/kzu/mocking-protected-members-with-moq/> "Mocking protected members with Moq")

July 5, 2008 5:09 pm

If you’re familiar with [Moq](<http://www.mockframeworks.com/moq>), you know that it relies on lambda expressions heavily. This is very good as you get full support from intellisense and refactoring features in Visual Studio. However, it also means you’re for the most part restricted to setting expectations on things that your code has access too (public or internal members). 

This is especially annoying with protected members, which are very common in template method pattern, factory methods, etc. In this case, you can’t simply set an expectation with a lambda expression, as you have no access from the “outside” to the protected member. Being an important scenario, though, we wanted to add support for it.

We could have just extend the core Mock<T> API and add loosely-typed members that received strings (i.e. `mock.Expect("Foo")`). This would have been bad from the guidance point of view, as it would make for an easy path to “hell” for people not familiar with lambda expression (“mmm… I could use this overload with that lambda thinghy, or just use the simpler string-based overload…”). We’d much rather keep people using strong-typed, lambda-based expectations rather than jumping at the ease of strings.

So, we reached a compromise: we implemented protected expectations using strings, but it will only work for non-public members ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) . We also didn’t want to make this functionality too easy to discover, so we expose it as an extension method that you enable by importing the `Moq.Protected` namespace:
    
    
    using Moq.Protected;

then you use the `Protected` “extension point”:
    
    
    var mock = new Mock<CommandBase>();
    mock.Protected()
         .Expect<int>("Execute")
         .Returns(5);
    

The `Expect` overload receiving a type parameter specifies the return value from the invocation. You also have `ExpectGet/Set` members, which expose the same functionality of the strong-typed lambda versions.

Note how rather than polluting the main API with extension overloads receiving strings, we hang all members from the `IProtectedMock` returned from the `Protected()` method call. That’s an interesting use of extension methods I think, which you also get to see quite a lot in newer C# 3.5 libraries such as [Autofac](<http://autofac.googlecode.com/>) and [Umbrella](<http://www.codeplex.com/umbrella>). 

Another difference in the invocation style for expectations is the argument matching. Here, I couldn’t find an easier way to specify then than using a separate class, [ItExpr](<http://www.clariusconsulting.net/labs/moq/html/169D5A34.htm>) to specify them:
    
    
    mock.Protected()
        .Expect<string>("Execute",
            ItExpr.IsAny<string>())
        .Returns(true);
    

[](<http://11011.net/software/vspaste>)

The need for this is subtle, and lies in the fact that the Expect method is not receiving a lambda expression, unlike the strong-typed version, and the alternatives were far worse. So basically [ItExpr](<http://www.clariusconsulting.net/labs/moq/html/169D5A34.htm>) is an expression-returning version of the [It](<http://www.clariusconsulting.net/labs/moq/html/FBE0FFA5.htm>) class. I still haven’t figured out how you would use custom matchers in this scenario. I guess it would involve building the expression trees just like we do to reconstruct the same expression that would result from using the matcher in the lambda Expect.

If you want to play with it, just go ahead and get the [latest version from Google Code](<http://code.google.com/p/moq/downloads/list>). 

Don’t forget to give us feedback through the [discussion list](<http://groups.google.com/group/moqdisc/>) or [issue tracker](<http://code.google.com/p/moq/issues/list>).

Enjoy!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=77737)

Posted by kzu
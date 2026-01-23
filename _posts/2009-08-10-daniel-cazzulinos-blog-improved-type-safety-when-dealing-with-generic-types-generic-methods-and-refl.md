---
layout: post
title: "Daniel Cazzulino's Blog : Improved type safety when dealing with generic types, generic methods and reflection"
date: 2009-08-10 00:00:00 +0000
---

Daniel Cazzulino's Blog : Improved type safety when dealing with generic types, generic methods and reflection


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20090812022547im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090812022547im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20090812022547im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20090812022547im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090812022547im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090812022547im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Improved type safety when dealing with generic types, generic methods and reflection 

Compile-time safety is always important, as it reduces the chances that a refactoring can break existing code that compiles successfully. This benefit took me previously to the path of using expression trees to achieve strong-typed reflection. 

There is, however, an alternative that works on previous versions of .NET and doesn’t involve expression trees. It essentially involves creating a delegate of the target method, and using the delegate properties to get to the corresponding MethodInfo:
    
    
    Action<string> writeLine = Console.WriteLine;
    MethodInfo writeLineMethod = writeLine.Method;

Note that the code above is very explicit about which overload of the WriteLine method to pick: the one with a single string argument and a void return value. You can leverage Action and Func various overloads to represent pretty much any method invocation. Also, if those do not fit, you can still create your own delegate type. The benefit, clearly, is that you now can refactor the defining class or method and the change will be picked automatically.

The above example dealt with a static method call. Instance methods require an actual instance, but you can still use the technique to reflect over the method metadata ~~What about instance methods? You certainly don't want to instantiate the target type just to do a more safe reflection over it, right? Well, because we're only retrieving a delegate to a method, but not actually executing it, passing a null is perfectly fine~~ :
    
    
    Func<object> cloneable = aCloneable.Clone;
    MethodInfo cloneMethod = cloneable.Method;

How do you deal with generic classes, though?
    
    
    public interface IFoo<T>
    {
       void Do();
    }

In order to get the method, you need to have an actual concrete type of IFoo<T>~~, so you can just any type~~ :
    
    
    Action doMethod = aFooOfString~~((IFoo <string>)null)~~.Do;
    MethodInfo doMethodInfo = doMethod.Method;

The same trick applies to generic methods, but you need to get the generic method definition at the end:
    
    
    public static class Factory
    {
        public static T Create<T>() { ... }
    }
    ...
    Func<string> createMethod = ~~((IFactory)null)~~ Factory.Create<string>;
    MethodInfo genericCreate = createMethod.Method.GetGenericMethodDefinition();

With these combined tricks, you don't need to (ab?)use expression trees for certain scenarios and it's backwards compatible with .NET 2.0.

posted on Monday, August 10, 2009 8:00 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20090812022547im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
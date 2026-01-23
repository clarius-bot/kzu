---
layout: post
title: "Daniel Cazzulino's Blog : Wrong execution path picked by C# compiler when mixing generic and non-generic method signatures."
date: 2005-03-22 00:00:00 +0000
---

Daniel Cazzulino's Blog : Wrong execution path picked by C# compiler when mixing generic and non-generic method signatures.


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081011062304im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081011062304im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081011062304im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081011062304im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Wrong execution path picked by C# compiler when mixing generic and non-generic method signatures. 

I've found what seems like a bug in the C# compiler which makes the execution path of your code unpredictable. The scenario is laid out in the [product feedback bug](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=581bd41b-eb2a-4902-bcef-623f05e6726c) but a brief repro will hopefully suffice to convince you of its severity.   
  
Basically, if you have the following class definition:

  
`public class MyClass  
{  
public void Add(object value) { ... }  
public void Add(BaseType value) { ... }  
public T Add<T>(T value) { ... }  
}`

Assuming DerivedType is a class inheriting from BaseType, the following very strange and highly unexpected behavior will happen:  

`// The method with the non-generic signature is called as expected.  
new MyClass().Add(new object());  
  
  
// The method call below should never compile as the method receiving an object returns **void**  
// The method with the generic signature is called ?!?!  
object o = new MyClass().Add("hola");  
  
// Anything that is not exactly of type object will go the generic method :S:S  
  
// The match for the type is *exact* meaning that even   
// if I have a method of a matching signature according to   
// common polymorphic behavior (passing a derived type),   
// the generic version is called instead of the expected one.  
// the method below should never compile as the method returns **void**  
object o2 = new MyClass().Add(new DerivedType());`

The worst case scenario is if the method receiving a BaseType returned a BaseType instead of void, you would never know that what's actually being executed is the generic method instead of the expected method (for the second example, passing a new DerivedType), as the returned type would match, but the execution path will never be what you expected.  
  
I believe this is pretty serious, and should get inmediate attention before it's too late. Please [vote for the bug](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=581bd41b-eb2a-4902-bcef-623f05e6726c) if you agree.

posted on Tuesday, March 22, 2005 1:45 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20081011062304im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
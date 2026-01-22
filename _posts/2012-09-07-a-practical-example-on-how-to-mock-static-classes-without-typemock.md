---
layout: post
title: "A practical example on how to mock static classes without TypeMock"
date: 2012-09-07 00:00:00 +0000
---

##  [A practical example on how to mock static classes without TypeMock](<http://blogs.clariusconsulting.net/kzu/a-practical-example-on-how-to-mock-static-classes-without-typemock/> "A practical example on how to mock static classes without TypeMock")

May 19, 2008 3:00 am

WCF is the second biggest framework after ASP.NET that sooner or later forces you to use a static “context” property to do anything beyond the trivial stuff. ASP.NET has the HttpContext.Current, whereas WCF has the WebOperationContext.Current for example.

My friend [Pablo Cibraro](<http://weblogs.asp.net/cibrax>) proves [how you can quite easily make your implementations that depend on such static contexts testable](<http://weblogs.asp.net/cibrax/archive/2008/05/16/unit-tests-for-wcf.aspx>) without resorting to [black-magic voodoo TypeMock](<http://www.google.com/search?hl=en&q=typemock%20mock%20static%20classes>) kind of stuff. Any .NET developer can trivially introduce an indirection to make their classes testable, even if they depend on static classes. 

So, don’t buy a product just because you’re lazy and want to avoid creating a few wrapper classes and interfaces. Most of them can be copied directly from Reflector’s API rendering. And once you have the interfaces, you can just use [MoQ](<http://mockframeworks.com/moq>) or [Rhino](<http://mockframeworks.com/rhino>) (or whichever [mock framework](<http://mockframeworks.com/>) you like) to mock them any way you want.

Always use the simplest thing that could possibly work.

**Update** : added a reference to other mock frameworks that can be used to the same effect. Apparently some people get picky if you have a preference and it happens to be the one you built ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

**Update II** : For those that didn’t follow the discussion over at [Roy’s blog](<http://weblogs.asp.net/rosherove/archive/2008/05/19/two-faced-commits-how-the-alt-net-community-is-becoming-more-and-more-dogmatic.aspx>), I’ll [repeat an analogy](<http://weblogs.asp.net/rosherove/archive/2008/05/19/two-faced-commits-how-the-alt-net-community-is-becoming-more-and-more-dogmatic.aspx#6201926>) that better explains what my point was with [my previous post on mocking statics](<http://www.clariusconsulting.net/blogs/kzu/archive/2008/05/18/mock_statics_without_typemock.aspx>):

> If you are not careful enough and can shoot yourself in the foot, the less shotguns you have around the house, the better. 
> 
> That said, you may have a big, ugly, old contender where you really need the biggest shotgun you can get. But you’ll be giving it to your very best guys, not to the newbie soldier. 
> 
> Better to teach the newbies how to shoot smaller objectives with a regular pistol first (the whole point of Pablo’s post on mocking WCF static context). 
> 
> Some may say this sounds somewhat paternalist. I think that’s pragmatism.

I’d rather show developers how to work around statics imposed by some “legacy” framework they happen to use (i.e. WCF and ASP.NET static contexts) by using typical OO techniques such as the one [explained by Pablo](<http://weblogs.asp.net/cibrax/archive/2008/05/16/unit-tests-for-wcf.aspx>), than giving them a bazooka and spending endless hours explaining how to NOT overuse it. 

For the record, the technique is *exactly* the same used the ASP.NET MVC team, I don’t hear anyone calling HttpContextBase and friends “[utterly useless wrappers](<http://www.elilopian.com/2008/05/19/mocking-frameworks-dream-feature/>)“. I find it hard to think about a case where such a technique could not be applied to make new code written to interact/integrate with a legacy system testable. Would love to find a counter example.

Sometimes it’s just that the solution ends up being much simpler than you initially thought. How hard do you think it is to do the ASP.NET MVC trick for the ASP.NET HttpContext? Go [get the sources](<http://www.codeplex.com/aspnet>), find class MvcHandler and see for yourself.

Also, [Pablo clarified](<http://weblogs.asp.net/cibrax/archive/2008/05/20/unit-tests-for-wcf-and-moq-part-ii.aspx>) that his [original post](<http://weblogs.asp.net/cibrax/archive/2008/05/16/unit-tests-for-wcf.aspx>) was how to mock the WCF context, regardless of its static nature (as you could still pass it to your implementation’s constructor), when it’s neither an interface, nor a class with any virtuals that enable easy mocking.

More to the [case against statics and singletons at Scott’s blog](<http://blogs.msdn.com/scottdensmore/archive/2004/05/25/140827.aspx>).

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=69123)

Posted by kzu
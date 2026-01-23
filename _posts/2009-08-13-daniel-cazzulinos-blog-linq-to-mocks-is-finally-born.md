---
layout: post
title: "Daniel Cazzulino's Blog : Linq to Mocks is finally born"
date: 2009-08-13 00:00:00 +0000
---

## Linq to Mocks is finally born 

Last time I announced Linq to Mocks, some said [Moq](http://moq.me/) didn't actually have anything to do with Linq. Despite the heavy usage of lambda expressions and expression trees, the "q" in Linq is for "query" after all. And they were right, of course, but it was fun anyway, and the name is definitely cool IMO :).

But this time around, I'm happy to say that it's finally true. What the next version of Moq (early [beta readily available now](http://moq.me/get "Moq Downloads")) allows you to express in a very declarative way essentially is: 

> _from the universe of mocks, get me those that behave like this_   
> (thanks [Fernando Simonazzi](http://www.clariusconsulting.net/blogs/fds) for coming up with this phrase :)) 

Rather than procedurally defining how the mock will behave, its specification is part of the query:
    
    
    ControllerContext controllerContext =
        (from context in Mocks.Query<ControllerContext>()
         where context.HttpContext.User.Identity.Name == "kzu" &&
               context.HttpContext.Request.IsAuthenticated == true && 
               context.HttpContext.Request.Url == new Uri("http://moq.me") &&
               context.HttpContext.Response.ContentType == "application/xml"
         select context)
        .First();
    

A few things to notice:

  1. The query returns an infinite list of mocks that behave according to the specification/query. You typically get the first of such list. 
  2. The resulting objects are of the actual mocked type, not Mock<T>, so there's no need to do controllerContext.Object anymore. The reasoning for that is that typically you would be able to fully setup the mock in the query, hence there'd be no need to get the Mock<T> back, unlike new Mock<T> where you do need to set it up. 
  3. Fluent mocking happens automatically within the query. And even better, you're NOT limited to just property accesses. *Anything* that is a valid Setup on a mock can appear anywhere in the fluent mock traversal (i.e. context.HttpContext.GetSection("server") == configuration) 
  4. You can have multiple mocks within the query and set them all up together. 
  5. If you want to access these multiple mocks afterwards, you can just return all of them using an anonymous type projection (select new { Context = context, Configuration = configuration } ).

Here's a more comprehensive example of setting up two mocks at the same time:
    
    
    ControllerContext controllerContext =
        (from context in Mocks.Query<ControllerContext>()
         from configuration in Mocks.Query<ServerSection>()
         where context.HttpContext.User.Identity.Name == userName &&
               context.HttpContext.Request.IsAuthenticated == true && 
               context.HttpContext.Request.Url == new Uri("http://moq.me") &&
               context.HttpContext.Response.ContentType == "application/xml" &&
               context.HttpContext.GetSection("server") == configuration && 
               configuration.Server.ServerUrl == new Uri("http://moq.me/api")
         select context)
        .First();
    

Finally, if you needed to access both the context as well as the configuration from the results of this query, you could do:
    
    
    var mocks =
        (from context in Mocks.Query<ControllerContext>()
         from configuration in Mocks.Query<ServerSection>()
         where context.HttpContext.User.Identity.Name == userName &&
               context.HttpContext.Request.IsAuthenticated == true && 
               context.HttpContext.Request.Url == new Uri("http://moq.me") &&
               context.HttpContext.Response.ContentType == "application/xml" &&
               context.HttpContext.GetSection("server") == configuration && 
               configuration.Server.ServerUrl == new Uri("http://moq.me/api")
         select new { Context = context, Configuration = configuration }))
        .First();
    
    MyController controller = new MyController { ControllerContext = mocks.Context };
    // Do something with the configuration object...
    ServerSection config = mocks.Configuration;
    

Next question would be how to setup exceptions to be thrown, and how to verify? You just use the existing [Mock.Get](http://api.moq.me/html/C6B12927.htm) functionality:
    
    
    Mock.Get(controllerContext).Setup(...)  
    // or verify  
    Mock.Get(controllerContext).Verify(...);

Just for the sake of comparison, the equivalent "procedural" code to setup the same mock shown in the complete example above, you'd currently do:
    
    
    var context = new Mock<ControllerContext>();
    var configuration = new Mock<ServerSection>();
    
    context.SetupGet(c => c.HttpContext.User.Identity.Name).Returns(userName);
    context.SetupGet(c => c.HttpContext.Request.IsAuthenticated).Returns(true);
    context.SetupGet(c => c.HttpContext.Request.Url).Returns(new Uri("http://moq/me"));
    context.SetupGet(c => c.HttpContext.Response.ContentType).Returns("application/xml");
    context.SetupGet(c => c.HttpContext.User.Identity.Name).Returns(userName);
    context.Setup(c => c.HttpContext.GetSection("server")).Returns(configuration);
    configuration.Setup(c => c.Server.ServerUrl).Returns(new Uri("http://moq.me/api"));
    

Yes, the query version has one more line of code, the `.First()` call. Yes, it's gonna be largely a matter of personal style and preference, just like many prefer invoking `.Where(…)` and `.Select(…)` instead of `from…where…select`.

Choice is good in this case, IMO.

There are many more features in this upcoming version of Moq. I'll try to blog about those too before/after we ship :). But this is my favorite!

[Go get it](http://moq.me/get)!

/kzu

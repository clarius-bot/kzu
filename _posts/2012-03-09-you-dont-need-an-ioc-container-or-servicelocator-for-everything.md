---
layout: post
title: You don’t need an IoC container or ServiceLocator for everything
date: 2012-03-09 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/you-don-t-need-an-ioc-container-or-servicelocator-for-everything

---

Say you have a class that needs to collaborate with another, say a repository:

```
public class OrderProcessor
{
    public void ProcessPayment(Guid orderId, Payment payment)
    {
        using (var repo = new OrmRepository())
        {
            var order = repo.Find<Order>(orderId);
            order.Pay(payment);

            repo.Save(order);
        }
    }
}
```

Now that clearly is very hard to test ‘cause it’s directly instantiating the repository. So we know we have to refactor that and pass the repository instead, so that tests can replace the implementation and make assertions about the interaction (if we want to):

```
public class OrderProcessor
{
    private OrmRepository repository;

    public OrderProcessor(OrmRepository repository)
    {
        this.repository = repository;
    }

    public void ProcessPayment(Guid orderId, Payment payment)
    {
        var order = this.repository.Find<Order>(orderId);

        order.Pay(payment);

        this.repository.Save(order);
    }
}
```

Now we realize that for unit tests to actually go against the actual real repository (i.e. a database) would be pretty slow and inefficient: we’d have to drop/clean the DB for every test run, etc. Unnecessary complication (not that you don’t need to have *integration* tests that DO run against the real DB, though). So we go ahead and make an interface out of the dependency (the repository in this case), so that we can completely replace its implementation in the tests:

```
public class OrderProcessor
{
    private IRepository repository;

    public OrderProcessor(IRepository repository)
    {
        this.repository = repository;
    }

    public void ProcessPayment(Guid orderId, Payment payment)
    {
        var order = this.repository.Find<Order>(orderId);

        order.Pay(payment);

        this.repository.Save(order);
    }
}
```

Let’s not forget WHY we did all this: just so the behavior we’re creating can be easily tested, that’s all. It was never our goal to dynamically replace the repository, make it configurable externally or whatever. That’s NOT the point of the refactoring.

So what do you do when the need comes along to use some runtime framework (i.e. ASP.NET MVC, WCF, etc.) that by default expect your component to have a default parameterless constructor? (say this processor is an MVC controller or a web service). Well, it’s pretty damn easy, you just add a default ctor with the default implementation you know is the only one you have and will use at runtime!

```
public class OrderProcessor
{
    private IRepository repository;

    public OrderProcessor()
        : this(new OrmRepository())
    {
    }

    public OrderProcessor(IRepository repository)
    {
        this.repository = repository;
    }

    public void ProcessPayment(Guid orderId, Payment payment)
    {
        var order = this.repository.Find<Order>(orderId);

        order.Pay(payment);

        this.repository.Save(order);
    }
}
```

And that’s IT. What? You thought at this point you NEEDED to choose an IoC container from the myriad available, hook up a controller/instance factory on the runtime MVC/WCF, etc.?? NO, you DON’T.

An IoC container WILL help if you have complex dependency graphs to instantiate (in your default constructor) or you have truly pluggable components (i.e. you want to allow a component to be picked up automatically at runtime from some binary if it’s in a folder, etc.).

If you don’t, it’s perfectly fine to have a default constructor that is used at runtime and has a hardcoded instantiation of a dependency. It was never a requirement to make that thing configurable or dynamic. So don’t invent business requirements just ‘cause using an IoC container is fancier. As far as I’m concerned, you didn’t violate any sacred principle by having that default constructor in there.

If you were doing TDD (which you should) the process would be slightly different. Instead of refactoring to make it testable, you’d have the constructor receiving the IRepository right from the beginning. But the end result would be the same: just add a default ctor for the runtime framework to use and move on.

That said, an IoC container and a mocking framework are my first two choices when doing File | New Project. I know I’ll need them for anything non-trivial.

![Smile](/img/2012-03-09-1.png)

/kzu

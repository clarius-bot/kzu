---
layout: post
title: "MAB ContainerModel / Funq: a transparent container"
date: 2013-01-01 00:00:00 +0000
---

##  [MAB ContainerModel / Funq: a transparent container](<http://blogs.clariusconsulting.net/kzu/mab-containermodel-funq-a-transparent-container/> "MAB ContainerModel / Funq: a transparent container")

April 20, 2009 4:26 pm

From the point of view of the user of the container, he doesn’t have to do anything at all. He just creates classes as usual:
    
    
    public class EditCustomersPresenter
    {
        public EditCustomersPresenter(IEditCustomersView view, ICustomerRepository repository)
        {
            this.view = view;
            this.repository = repository;
            view.Presenter = this;
        }
        ...
    }
    

Container configuration is done through lambdas that specify which object to construct for the registered type. For the view used by this presenter (an EditCustomersView form), it would look like: 
    
    
    var container = new Container();
    
    container.Register<IEditCustomersView>(
            c => new EditCustomersView());

In this sense, you can think of Funq as a glorified dictionary of delegates to instantiate objects (it does a bit more than that, though). In the above case, the class we’re constructing doesn’t need any dependencies. If it did, such as the presenter above, you can use the “c” argument to the lambda, which is the container itself, which you can use to express that you’ll need to resolve the dependencies to pass on:
    
    
    container.Register(
        c => new EditCustomersPresenter(
            c.Resolve<IEditCustomersView>(),
            c.Resolve<ICustomerRepository>()));

Note that because this is a lambda/delegate, it won’t actually be executed until the presenter is needed. Moreover, note how the type to register can be omitted if it matches the created object type (i.e. you don’t want to register the presenter as an interface).

Because this is configuration, you can also pass configuration data on your registrations: 
    
    
    container.Register<ICustomerRepository>(
        c => new CustomerRepository("[CONNECTION STRING TO DB / AppSetting / etc]"));
    

Moreover, the object itself can expose properties that affect its behavior, which can also be initialized at this point using C# 3 object initializer syntax: 
    
    
    container.Register<ICustomerRepository>(
        c => new CustomerRepository("...") { IsAudited = true });
    

More lambda “magic” makes it possible to arbitrarily initialize the object when it’s constructed, by using the InitializedBy fluent method:
    
    
    container
        .Register<ICustomerRepository>(
            c => new MemoryCustomerRepository())
        .InitializedBy((c, r) =>
        {
            // Initialize with some fake data.
            r.Create(new Customer { FirstName = "Joe", LastName = "Doe" });
            r.Create(new Customer { FirstName = "Sarah", LastName = "Smith" });
            r.Create(new Customer { FirstName = "Mary", LastName = "Brown" });
        });

The InitializedBy method receives a lambda with two arguments: the first is again the container, in case we need to further resolve dependencies, and the second is the instance created by the first delegate (at the time it was needed), typed to the registration type (ICustomerRepository in this case, or the constructed instance type if you omitted it) passed on so that you can call methods, set properties, etc. on it.

## Lazy resolve

Let’s say a service needs to be able to create/resolve a dependency on-demand. Typically, you’d create a factory for that, and have the factory instantiate the object through the container. Funq provides built-in support for this via factory functions as a built-in concept.

If you had a controller that instantiated use cases as needed, you wouldn’t want to create all the possible use case classes up-front. So let’s say you have a registered use case class:
    
    
    container.Register<IUseCase>("AddCustomer", c => new AddCustomerUseCase());

> Note that instances can be named so that you can register many under the same interface.

The controller class would need to run this use case at some point. It would have a constructor dependency not the actual instance, but on a resolver delegate to it:
    
    
    public class CustomersController
    {
        public CustomersController(Func<IUseCase> addCustomerResolver, ...)
        {
            ...
        }
        public void AddCustomer()
        {
           // invoke the function, which would create the use case as registered.
           IUseCase useCase = addCustomerResolver();
           useCase.Run();
        }
    }

You’d register the controller slightly different, by lazy resolving the use case dependency 
    
    
    container.Register(
      c => new CustomersController(
               c.LazyResolve<IUseCase>("AddCustomer"))

The LazyResolve method works (and provides same overloads) just like the Resolve, but it returns Func delegates instead, so that the actual invocation to Resolve is delayed until you execute the delegate. This is very useful in many scenarios, and avoids many one-line factories. 

## Passing constructor arguments 

Another common scenario we wanted to support without sacrificing performance was to allow passing constructor arguments to these registered “factories”. Let’s say you have a Queue object that needs the queue name:

If you have the following queue class:
    
    
    public class Queue : IQueue
    {
        public Queue (string queueName)
        {
            ...
        }
    }

You’d register it like so:
    
    
    container.Register<IQueue, string>(
        (c, name) => new Queue(name));

Note how you specify in addition to the service type, the type of the arguments that it requires. In order to resolve it, you must therefore pass a string for the invocation: 
    
    
    var queueOut = container.Resolve<IQueue, string>("outgoing");

This would allow you to configure something like a notifications service with two queues with different names: 
    
    
    public class NotificationService : INotificationService
    {
      public NotificationService(IQueue input, IQueue output)
      {
        ...
      }

And its corresponding registration would be:
    
    
    container.Register<INotificationService>(
        c => new NotificationService(
               c.Resolve<IQueue, string>("in"),
               c.Resolve<IQueue, string>("out")
    );

This also works for lazy resolution, so if the service creates the queues on-demand, it could be defined as follows: 
    
    
    public class NotificationService : INotificationService
    {
      public NotificationService(Func<IQueue, string> queueResolver)
      {
        ...
      }
      public void Reply(string message, ...)
      {
         using (var queue = queueResolver("out"))
           queue.Enqueue(message);
      }

Note that the service invokes the resolver passing the queue name. Registration would be slightly different now:
    
    
    container.Register<INotificationService>(
        c => new NotificationService(c.LazyResolve<IQueue, string>())
    );

Passing arguments can also be done at registration time for dependencies. Imagine you introduce a IQueueFactory service that must receive a queue name in its constructor so that its caller can create multiple instances of the same queue object as needed, without knowing the queue name at all. A notification service would use such a factory as follows:
    
    
    IQueueFactory factory;
    
    public NotificationService(IQueueFactory factory)
    {
        this.factory = factory;
    }
    
    public void Send(string text)
    {
        using (var queue = factory.CreateQueue())
        {
            queue.Enqueue(text);
        }
    }

The service doesn’t know which particular queue it’s going to send the message to. And (for whatever reason) it needs to create a new queue whenever it needs it. The registration for such an object, would simply be:
    
    
    container.Register<IQueueFactory, string>(
        (c, name) => new QueueFactory(name));

Note how the registration overload we’re using specifies that in addition to the service type, we’ll need a string argument to construct the object. Now it’s time to register the notification service, which (say) we have two of: input and output notifications
    
    
    container.Register("outgoing",
        c => new NotificationService(c.Resolve<IQueueFactory, string>("out-queue")));
    
    container.Register("incoming",
        c => new NotificationService(c.Resolve<IQueueFactory, string>("in-queue")));

What’s happening here is that we’re registering the same service twice with different names, and resolving the queue factory dependency passing the desired queue name that will be received by its implementation. This way, we have externalized the dependency on this knowledge from the notification service.

The same effect (of “fixing” a lambda parameter to a given value) can be achieved by just [currying the function](<http://diditwith.net/2007/08/15/TheArtOfCurrying.aspx>) returned from LazyResolve ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=142789)

Posted by kzu
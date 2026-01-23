---
layout: post
title: "Event Centric: storing and consuming events"
date: 2012-01-22 00:00:00 +0000
---

##  [Event Centric: storing and consuming events](<http://blogs.clariusconsulting.net/kzu/event-centric-storing-and-consuming-events/> "Event Centric: storing and consuming events")

January 22, 2012 8:47 pm

[Disclaimer: I don’t think this disclaimer is needed, but just to be on the safe side. The opinions expressed herein are my own personal opinions and do not represent in any way my company's view, that of any customer current or past, or any current, past or future project related to these concepts that I may participate in]

In [my previous post](<https://bit.ly/uSx4g2>) I showed how you can evolve the way you code your domain objects (or entities) so that they can benefit from the [Event Sourcing](<https://bit.ly/og0QJ5>) pattern, and I also showed that it’s pretty simple at its core. That post ended up being a little disconnected from the one where [I show how do to cool analysis](<https://bit.ly/srVn3P>) based on those events. It was on purpose, as I needed to introduce another concept, and the post was getting too big already ![Smile](http://blogs.clariusconsulting.net/kzu/files/2012/01/wlEmoticon-smile1.png).

Lets recap briefly what happens on a domain object when we invoke an operation:

![image](http://blogs.clariusconsulting.net/kzu/files/2012/01/image7.png)

So after we invoked Move(), calling GetEvents() on the object would give us the CustomerMoved event data class that was the result of the operation. Pushing this event through the event stream manually is pretty straightforward:
    
    
    var stream = new EventStream();
    
    // print to the console every time a customer
    // changes his address
    stream.Of<CustomerMoved>().Subscribe(x => Console.WriteLine("Customer has moved to a new address: {0}", x.NewAddress));
    
    var customer = new Customer(1); // load somehow
    customer.Move("999 NE 9TH ST, Redmond, WA");
    
    foreach (var @event in customer.GetEvents())
    {
        stream.Push(@event);
    }

The next important thing as [mentioned by Folwer](<https://bit.ly/og0QJ5>) is that events are persisted somehow, and never change, ever. They are the definite and authoritative source of truth about what happened to your system. And you can perform analysis on that stream at any point in time in the future, even for events that happened long ago. This is very valuable to business: being able to derive new conclusions and trends retroactively, from day one of the system. It’s a very easy sell. So let’s get on to define the simplest possible interface for an event store.

## The DomainObject

The domain object base class from [my previous post](<https://bit.ly/uSx4g2>) needs to evolve now, so that it’s more flexible. First, we have no way of knowing what type of object identifiers developers will prefer. So we can just make that a generic TObjectId argument. Ditto for the base type for events: maybe you want to enforce they are all EventArgs-derived, or they all implement a certain interface (i.e. [ITimestamped](<https://bit.ly/zhqc1m>)?), and so on. So we make that a generic parameter as well:
    
    
    abstract partial class DomainObject<TObjectId, TBaseEvent>
    {
        private Dictionary<Type, Action<TBaseEvent>> handlers = new Dictionary<Type, Action<TBaseEvent>>();
        private List<TBaseEvent> events = new List<TBaseEvent>();
    
        protected DomainObject()
        {
        }
    
        public virtual TObjectId Id { get; set; }
    
        public virtual void AcceptEvents()
        {
            this.events.Clear();
        }
    
        public virtual IEnumerable<TBaseEvent> GetEvents()
        {
            return this.events.AsReadOnly();
        }
    
        protected virtual void Handles<TEvent>(Action<TEvent> handler)
            where TEvent : TBaseEvent
        {
            this.handlers.Add(typeof(TEvent), @event => handler((TEvent)@event));
        }
    
        protected void Load(IEnumerable<TBaseEvent> events)
        {
            foreach (var args in events)
            {
                var handler = default(Action<TBaseEvent>);
                if (this.handlers.TryGetValue(args.GetType(), out handler))
                    handler.Invoke(args);
            }
        }
    
        protected virtual void Apply<TEvent>(TEvent @event)
            where TEvent : TBaseEvent
        {
            var handler = default(Action<TBaseEvent>);
            if (this.handlers.TryGetValue(@event.GetType(), out handler))
                handler.Invoke(@event);
    
            this.events.Add(@event);
        }
    }

  
The first thing you’d do in a project using that base class, is “fix” the base class type parameters for the ones you’ll use for your entire domain model, like:
    
    
    abstract class DomainObject : DomainObject<Guid, EventArgs>
    {
    }

So from your domain you don’t have to repeat those generic parameters all over the place. It would make things easier if you decide to change the type of either the identifier or the event data base class.

## The Event Store

An event store has two core responsibilities: save a bunch of events produced by a domain object (maybe in a single "transaction", if we adhere to the [DDD](<https://bit.ly/vrpGDR>) principle that a single so-called [aggregate root](<https://bit.ly/vsrenE>) defines the [consistency boundary](<https://bit.ly/s72iXI>) for a domain operation), and allow minimal querying to retrieve the events that apply to a given object, and within a range of time (to allow replaying an object to a previous state) so that we can load it as it was at a certain point in time.

For saving, we could model the API in a few different ways: pass in the list of events, or each event individually, or the entire domain object. I chose the latter because it allows the implementations to decide how they will handle consistency and transactions for the whole set of events raised by the domain object, which may be a DDD aggregate root if you design it that way. But it’s not restrictive in any way, as you can still design things differently.

The store interface will use the TObjectId type for querying the events for a specific object instance.
    
    
    partial interface IEventStore<TObjectId, TBaseEvent>
    {
        void SaveChanges(DomainObject<TObjectId, TBaseEvent> entity);
    
        IEnumerable<TBaseEvent> Query(EventQueryCriteria<TObjectId> criteria);
    }

  
For the query, I provided a simple [query object](<https://bit.ly/vLh01z>) style pattern that store implementations can use to issue the actual underlying query. We basically want to be able to load events for a specific object instance, for objects of a given type (maybe, like "give me all Published events of all products", for specific event types (i.e. LoginFailure) and all of that within certain time ranges:
    
    
    partial class EventQueryCriteria<TObjectId>
    {
        public EventQueryCriteria()
        {
            this.ObjectInstances = new List<ObjectFilter>();
            this.ObjectTypes = new List<Type>();
            this.EventTypes = new List<Type>();
        }
    
        public List<ObjectFilter> ObjectInstances { get; private set; }
        public List<Type> ObjectTypes { get; private set; }
        public List<Type> EventTypes { get; private set; }
    
        public DateTime? Since { get; set; }
        public DateTime? Until { get; set; }
        public bool IsExclusiveRange { get; set; }
    
        public class ObjectFilter
        {
            public ObjectFilter(Type objectType, TObjectId objectId)
            {
                this.ObjectType = objectType;
                this.ObjectId = objectId;
            }
    
            public Type ObjectType { get; private set; }
            public TObjectId ObjectId { get; private set; }
        }
    }

  
Just a plain DTO of the query information. The nice thing about this is that I can provide a fluent API over the store interface, like so:
    
    
    var store = new EventStore(...);
    
    var query = store
        .Query()
        .For<Product>()
        .Since(new DateTime(2010, 1, 1))
        .OfType<Published>();
    
    var results = query.Execute();

The query.Execute method simply calls Query(criteria) on the underlying store ![Smile](http://blogs.clariusconsulting.net/kzu/files/2012/01/wlEmoticon-smile1.png). Needless to say, not all stores need to implement all the query behavior. You’ll use what you need. I just put in the criteria I thought would be useful against an event store (things like being able to query by event type regardless of object instance, or all events for all objects of a given type, are useful in some scenarios we’ll see later, but aren’t common in other event store implementations).

To make things even simpler, I’ve created a [separate nuget package](<https://bit.ly/vtYxP4>) that provides the necessary LINQ expression building so that implementing a store over an underlying IQueryable storage is trivial. But again, being a separate package means you don’t have to use it or that your underlying storage has to be an IQueryable of some sort. And that’s about it for the store API itself.

I currently have an [Entity Framework-based store](<https://bit.ly/xa06ab>), an [in-memory store](<https://bit.ly/zc7ygc>) (useful for tests, for example) and a sample file system based one. Being NETFx packages, they are all provided as source code (few lines each), so building a new store based on that source should be pretty straightforward against almost any store. I may include more store implementations in the future.

Some might say that I’ve gone too far with the event store querying capabilities. I believe that the basic querying I’ve put in makes it much more useful in its own right, rather than having to resort to full CQRS to perform simple ad-hoc querying like “how many new customers have registered last month?” (store .Query().OfType<CustomerRegistered>().Since(DateTime.Now.Substract(TimeSpan.FromDays(30))) and the like. Once you have the domain raising all sort of interesting events, business owners will surely want to be able to perform various querying over that data, and there’s no reason why we wouldn’t want to leverage existing technology that solves that easily (i.e. Linq to data in .NET).

Of course, loading a given domain object state up to a certain date is pretty simple too:
    
    
    var events = store.Query()
        .For<Customer>(customerId)
        .Until(DateTime.Now.Substract(TimeSpan.FromDays(30)))
        .Execute();
    
    var customerAsOfLastMonth = new Customer(events);

This type of querying capability on top of the basic event stream that your [“empowered” domain model](<https://bit.ly/uSx4g2>) starts populating is extremely easy to sell to stakeholders. And I believe it’s entirely additive on top of whatever modeling and persistence strategy you’re currently using. This is [not the prevalent criteria among CQRS/ES practitioners](<https://bit.ly/yzm76e>), but I think it’s a pragmatic approach that can quickly bring real benefits in terms of business value and intelligence without having to do anything significantly different than what you’re already doing.

I’ll explore more of this smooth evolution path in my next post. Stay tunned.

Posted by kzu
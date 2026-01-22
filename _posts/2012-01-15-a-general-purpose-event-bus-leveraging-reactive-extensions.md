---
layout: post
title: "A general purpose event bus leveraging Reactive Extensions"
date: 2012-01-15 00:00:00 +0000
---

##  [A general purpose event bus leveraging Reactive Extensions](<http://blogs.clariusconsulting.net/kzu/a-general-purpose-event-bus-leveraging-reactive-extensions/> "A general purpose event bus leveraging Reactive Extensions")

January 2, 2012 7:15 pm

I talked before on the usefulness of having [rich events published throughout your domain](<http://kzu.to/srVn3P>). In that blog post, I also showed a very simple implementation.

I realized that there seems to be [quite](<http://code.google.com/p/simpleeventbus/>) [some](<http://stackoverflow.com/questions/368265/a-simple-eventbus-for-net>) [interest](<http://docs.guava-libraries.googlecode.com/git-history/v10.0.1/javadoc/com/google/common/eventbus/EventBus.html>) in the event (or message) bus pattern as an application architecture pattern and not necessarily in the usual enterprise integration style. This means that you leverage the concept of an event bus for internal application decoupling (along the lines of an [Event Collaboration](<http://kzu.to/v1VPoF>)), and not for integration with external systems. The difference is that everything happens in-memory, there is no intermediate persistent message queue, there are not message/event routers, partition, scalability requirements or anything like that. It’s a very simple way to make your components more loosely coupled.

In this post I’ll introduce a minor tweak to the original implementation of an _event stream_ (I wanted to remove the _Bus_ word from it as it confuses people that think it’s an enterprise style message bus) to make it more useful and general purpose.

To recap: the event stream is consumed by subscribers by simply subscribing to the desired event type:
    
    
    var subscription = eventStream.Of<ProductPurchased>().Subscribe(….)

Or by performing a more complicated reactive query over the events:
    
    
    var query =
        from discharged in events.Of<PatientLeftHospital>()
        from admitted in events.Of<PatientEnteredHospital>()
        where
            admitted.PatientId == discharged.PatientId &&
            (admitted.When - discharged.When).Days < 5
        select admitted;
    
    var subscription = query.Subscribe(...)

My initial implementation would only invoke subscribers that register for the specific event being pushed through the stream:
    
    
    partial class EventStream : IEventStream
    {
        private ConcurrentDictionary<Type, object> subjects = new ConcurrentDictionary<Type, object>();
    
        public void Push<TEvent>(TEvent @event)
        {
            Guard.NotNull(() => @event, @event);
    
            var subject = this.subjects.Find(@event.GetType()) as Subject<TEvent>;
            if (subject != null)
                subject.OnNext(@event);
        }
    
        public IObservable<TEvent> Of<TEvent>()
        {
            return (IObservable<TEvent>)subjects.GetOrAdd(typeof(TEvent), type => new Subject<TEvent>());
        }
    }

The Find extension method on ConcurrentDictionary simply does a TryGetValue on it and returns null if not found. We need to be smarter there to make this event stream more useful.

It’s probably that we’ll want to subscribe to more generic events (say for tracing purposes, for some global statistics, etc.), so you should be able to subscribe to (say) EventArgs and get all events that derive from it. Or do it based on interfaces, etc.

The change to generalize it is pretty simple too: we just make the Push method look for all subjects that have compatible event types:
    
    
    public void Push<TEvent>(TEvent @event)
    {
        Guard.NotNull(() => @event, @event);
    
        var eventType = @event.GetType();
    
        var compatible = subjects.Keys
            .Where(subjectEventType => subjectEventType.IsAssignableFrom(eventType))
            .Select(subjectEventType => subjects[subjectEventType]);
    
        foreach (dynamic subject in compatible)
        {
            subject.OnNext((dynamic)@event);
        }
    }

We cast the subjects from object to dynamic so that we can do a dynamic invocation, because we don’t have a common interface for all. They all implement [ISubject<T>](<http://kzu.to/u269Tz>). We also need to make the event itself dynamic, so that the runtime will pick the right method signature given both the subject type and the event type (might involve covariant cast, etc.). 

In my opinion, the coolest part of having this type of event bus is that you can now layer on top the concept of schedulers (i.e. introduce async event listeners, or even create your own custom scheduler and perform crazy things like out of process queue-based events if you wanted) with no effort and keeping the same simple public interface. 

Both the [IEventStream](<http://kzu.to/twxrOu>) and [EventStream](<http://kzu.to/uVWBoV>) implementation are very straightforward and simple. I have put them together as source code [NETFx](<http://netfx.codeplex.com/>) nugets so you can get any updates to this post or future posts concerning these classes in the future. They are separate because in your application you may have a separate assembly for all your interfaces and separate ones for the implementations. In that case, you’ll install the interface nuget in the former, and the other in one of the implementation ones. For convenience, I also made an [aggregated package](<http://kzu.to/rPiZEs>) that installs both interface and implementation on the same project. To make either the interface or the implementation public (they are both partial internal by default, to avoid increasing your API surface unnecessarily), you just add a partial declaration marking them public. The interface nuget even comes with a Visibility.cs file which you can just uncomment to get make the interface public:
    
    
    // In order to make types introduced by this package public
    // uncomment the following:
    
    //namespace System.Reactive
    //{
    //    public partial interface IEventStream { }
    //}

Enjoy!

Posted by kzu
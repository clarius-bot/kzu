---
layout: post
title: "Event Centric: finding key business value by leveraging domain events and reactive extensions"
date: 2011-12-29 00:00:00 +0000
---

##  [Event Centric: finding key business value by leveraging domain events and reactive extensions](<http://blogs.clariusconsulting.net/kzu/event-centric-finding-key-business-value-by-leveraging-domain-events-and-reactive-extensions/> "Event Centric: finding key business value by leveraging domain events and reactive extensions")

December 29, 2011 1:58 pm

[Reactive Extensions](<https://bit.ly/rsPavA>) (Rx) is one of the coolest additions to .NET ever. However, they have been largely ignored by the mainstream, in a significant part because (IMO) it’s seen as a [UI technique](<http://www.reactiveui.net/>), with samples that show how to handle mouse moves, drag & drop and so on. Its focus on asynchronous programming too makes it look like a niche technique that might even be worth skipping over as we wait for [C# 5.0 async keyword](<https://bit.ly/vBpKrj>) (see [Mike’s blog entry](<https://bit.ly/vJuwi7>) on a possible clarification of where it might fit in the async world).

There is, however, one mainstream application of reactive extensions that seems to have been missed by most: business intelligence. Here’s one concrete example: pretty soon, [hospitals will face penalties for patient readmission](<https://bit.ly/uxwOmY>), so you need a way to get an alert whenever patients are readmitted before a certain elapsed time (say 5 days or whatever). Another one: you want to preventively block a user’s account after 5 consecutive login failures within a minute (looks like an automated attack), or shoot an sms to the support team when failure rates for your app go above 5 crashes a day, or keep a report of top trending products in a store, and so on.

The common theme across all those kinds of business queries is that they involve the concept of time passing and events happening (patients admitted and discharged from hospitals, users trying to log-in, an app crashing, a product being downloaded), things that the Reactive Extensions models as first class citizens. These events are not .NET events, but _domain events_ , the representation of something meaningful that happened to your system.

And how would the query for readmitted patients look like? Pretty much like a SQL query would, actually:
    
    
    var events = new EventStream();
    var query =
        from discharged in events.Of<PatientLeftHospital>()
        from admitted in events.Of<PatientEnteredHospital>()
        where
            admitted.PatientId == discharged.PatientId &&
            (admitted.When - discharged.When).Days < 5
        select admitted;

Note how we’re joining the patient discharge events with the admission ones based on the patient id, and filtering those where the difference between a readmission event (that is, it’s When is greater than a previous discharge’s When) and a previous discharge is less than 5 days. Looks pretty darn easy to author and grasp.

The login failures one:
    
    
    var query = events.Of<LoginFailure>()
        // Sliding windows 1' long, every 10''
        .Buffer(TimeSpan.FromMinutes(1), TimeSpan.FromSeconds(10), scheduler)
        // From all failure values
        .SelectMany(failures => failures
            // Group the failures by user
            .GroupBy(failure => failure.UserId)
            // Only grab those failures with more than 5 in the 1' window
            .Where(group => group.Count() >= 5)
            // Return the user id that failed to log in
            .Select(group => group.Key));

And the app crash one would be very similar to the one above. The most interesting ones are of course those that combine data from multiple events, like the hospital example.

The EventStream class is simply a pass-through of events that turns things that are pushed through it into observable streams of specific events. This allows the queries to receive just one dependency, the event stream, and grab the events they are interested in by using the Of<TEvent> method:
    
    
    partial interface IEventStream
    {
        void Push<TEvent>(TEvent @event);
        IObservable<TEvent> Of<TEvent>();
    }

The implementation is surprisingly simple with [Reactive Extensions](<https://bit.ly/uD6ysq>):
    
    
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

I’ve put this together as a [NuGet for your convenience](<https://bit.ly/rPiZEs>). I’ve also published a [unit tests package](<https://bit.ly/sYGqDW>) for it, so you get the above examples to play.

This seems like a rather simple thing, and even one that isn’t so revolutionary by itself. Might seem like just an improved way to query a log, but in real-time. Like many things, the true power comes when it’s combined with other patterns, specifically [Event Sourcing](<https://bit.ly/og0QJ5>) (ES), as I’ll explain in my next blog post. And that’s the reason behind the title’s prefix, a hint to Greg’s upcoming [Event Centric](<https://bit.ly/to2aQj>) book, which talks about the ES pattern (although I doubt it will mention how combining it with Rx makes for the killer business argument for adopting it).

Stay tunned!

[Update] The “surprisingly simple” implementation explained above is surprisingly limiting too ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) . Namely: the subscriber has to use the exact same type as the publisher in order for a subscription to be called. In other words: no support for covariant subscriptions, subscriptions to interfaces implemented by the concrete events, etc. (i.e. the EventPattern<TEventArgs> from Rx wouldn’t work for subscriptions to the base EventPattern<EventArgs>). So I had to make it a bit more complicated to support everything the CLR supports in terms of assignable types. The updated nuget package contains the full implementation.

Posted by kzu
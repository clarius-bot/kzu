---
layout: post
title: "Event Centric: super-charge your model with domain events to enable business intelligence"
date: 2012-01-21 00:00:00 +0000
---

##  [Event Centric: super-charge your model with domain events to enable business intelligence](<http://blogs.clariusconsulting.net/kzu/event-centric-super-charge-your-model-with-domain-events-to-enable-business-intelligence/> "Event Centric: super-charge your model with domain events to enable business intelligence")

December 30, 2011 6:06 pm

I’ve shown in [my previous post](<http://kzu.to/srVn3P>) how interesting domain events can be mined using the Reactive Extensions for .NET. Now we need to raise those events when things happen to our domain. The typical way you’d publish events from your domain is simply adding .NET events. Say we have a Patient class, with a method Admit that causes the patient to be in the hospital and tracks the date when he was admitted:
    
    
    public class Patient
    {
        public DateTimeOffset? AdmittedDate { get; private set; }
        public bool IsInHospital { get; private set; }
    
        public void Admit(DateTimeOffset when)
        {
            if (this.IsInHospital)
                throw new InvalidOperationException("Already in hospital!");
    
            this.IsInHospital = true;
            this.AdmittedDate = when;
        }
    }

The domain object method typically does some precondition validation (like the one above, the patient can’t be admitted twice), then mutates the state as needed. At some point the resulting object state will be persisted somehow, but it’s a good goal to have [persistence ignorant](<http://kzu.to/tNqNE0>) entities, as you probably know by now ![Winking smile](http://blogs.clariusconsulting.net/kzu/files/2011/12/wlEmoticon-winkingsmile.png).

If we now want to let other components know whenever a patient is admitted, we can just add a .NET event, like so:
    
    
    public class Patient
    {
        public event EventHandler<PatientAdmitted> Admitted = (sender, args) => { };
    
        //...
    
        public void Admit(DateTimeOffset when)
        {
            //...
            this.OnAdmitted();
        }
    
        private void OnAdmitted()
        {
            this.Admitted(this, new PatientAdmitted(this.AdmittedDate.Value));
        }
    }
    
    public class PatientAdmitted : EventArgs
    {
        public PatientAdmitted(DateTimeOffset when)
        {
          this.When = when;
        }
    
        public DateTimeOffset When { get; set; }
    }

From the domain public method, we just raise the event when we’re done mutating state, and this is typical practice in .NET. 

> Note: I have initialized the event with a non-null initializer lambda, (sender, args) => { }, and that means the event will never be null, so I can avoid the null check in the OnAdmitted method. The overhead is negligible compared to the increased readability and simplicity. I’ve been using this trick forever, and I always find it weird that developers don’t use it everywhere since we have lambdas…

Now, in order to achieve the kind of analysis that I showed in [my previous post](<http://kzu.to/srVn3P>), we need a way to grab ALL events that have been raised by any domain object, so as to publish them for analysis. Someone could still hook to our .NET event, but it would be cumbersome to have to do that in a generic fashion, using reflection, for all events of all domain objects we instantiate (not to mention it would be slow). If we think about the events, the actual interesting data about it is the event args class itself. The sender is always the same, the current object. So we could refactor a bit the code like so:
    
    
    public void Admit(DateTimeOffset when)
    {
        // ...
        this.OnAdmitted(new PatientAdmitted(this.AdmittedDate.Value));
    }
    
    private void OnAdmitted(PatientAdmitted args)
    {
        this.Admitted(this, args);
    }

So that now the OnAdmitted receives the actual event data instead. We still need a central way to track all raised event data for this object, so that we can do something like:
    
    
    var patient = new Patient(); // load somehow
    patient.Admit(DateTimeOffset.Now);
    
    var events = patient.GetEvents();
    // Publish events somehow somewhere

Let’s add a way to track the raised event data in a list that we can return later. We can do this by introducing a private Raise method that receives the event data, and the method to call to handle the actual event raising (our OnAdmitted method), which we can pass as an Action<T> delegate. When we introduce this method, the code above will change to:
    
    
    public void Admit(DateTimeOffset when)
    {
        // ...
        this.Raise(new PatientAdmitted(when), this.OnAdmitted);
    }
    
    private void OnAdmitted(PatientAdmitted args)
    {
        this.Admitted(this, args);
    }

The Raise implementation just adds the raised event data to a list: 
    
    
    private List<EventArgs> events = new List<EventArgs>();
    
    private void Raise<TEvent>(TEvent args, Action<TEvent> handler)
        where TEvent : EventArgs
    {
        this.events.Add(args);
        handler(args);
    }
    
    public IEnumerable GetEvents()
    {
        return this.events.AsReadOnly();
    }

We could probably say we’re done, but we’ll go a bit further. How do you know up-front which events are interesting to raise and which aren’t? How can you possibly foresee the business needs in the future? What if you also want to do analysis of how many _new_ patients you’re receiving vs admission of existing patients? What if you now need to report on the frequency patients get certain symptoms? Or how frequent they move, and to which neighbors, and so on? In the end, it might be that some day, you need to do analysis on ANY state changes in the system. What if we “forced” ourselves to ensure that ALL state changes have a corresponding event associated with them? 

One easy way to do that would be to refactor a little bit the code above, and perform the state changes always in the private event handler, instead of the public domain method:
    
    
    public void Admit(DateTimeOffset when)
    {
        if (this.IsInHospital)
            throw new InvalidOperationException("Already in hospital!");
    
        this.Raise(new PatientAdmitted(when), this.OnAdmitted);
    }
    
    private void OnAdmitted(PatientAdmitted args)
    {
        this.IsInHospital = true;
        this.AdmittedDate = args.When;
    
        this.Admitted(this, args);
    }

The change seems minor, but it has profound implications as we’ll see shortly. First and foremost, if you force yourself to do every state change like this, you can be sure you’ll have a very rich set of domain events to perform analysis from in the future. Not only that, but you’re forcing yourself to put ALL the data you need to perform the state changes IN the event data class itself. Seems like an obvious thing to do. Let’s add one more domain method, which is to assign a bed to the patient:
    
    
    public event EventHandler<BedAssigned> BedAssigned = (sender, args) => { };
    
    public int Bed { get; private set; }
    
    public void AssignBed(int bed)
    {    if (!this.IsInHospital)        throw new InvalidOperationException("Patient must be in the hospital to assign a bed");
        if (bed < 0)
            throw new ArgumentException("Invalid bed number");
    
        this.Raise(new BedAssigned(bed), this.OnBedAssigned);
    }
    
    private void OnBedAssigned(BedAssigned args)
    {
        this.Bed = args.Bed;
    
        this.BedAssigned(this, args);
    }

Another minor thing we changed here: the concept of **When** things happen is key in any domain event. Events clearly have a When property pretty much always. In our first event, we passed the date as an argument to the Admit method, but assigning a bed would be no different, right? You’d soon realize that you’d be passing a date time to pretty much every method. But if you think about it, the actual domain state doesn’t necessarily need that piece of data. In the assign bed example, the domain class may just need to keep the current bed, but not necessarily when it was assigned. That might be something that analysis from the events needs. Ditto for other events. Forcing our domain to keep two properties (one for the actual data, another for the _when_ it changed) seems unnatural and it’s something we don’t typically do, essentially because our domain objects have state that is current _as of now_. So in this case, I just moved the responsibility of knowing when an event happened to the event arguments class itself, and we free our domain from having to worry or pass that data over and over:
    
    
    public class BedAssigned : EventArgs
    {
        public BedAssigned() { }
        public BedAssigned(int bed)
        {
            this.Bed = bed;
            this.When = DateTimeOffset.Now;
        }
    
        public int Bed { get; set; }
        public DateTimeOffset When { get; set; }
    }

## The passing of time

We mentioned above that the domain objects represent state that is current _as of now_. If you think about the Patient.Bed property, its current value will change over time as the OnBedAssigned handler is called repeatedly over time. What if in addition to the GetEvents() method we also provided a Load(events) method that received events that we just want to apply to the object?
    
    
    public void Load(IEnumerable<EventArgs> events)
    {
        foreach (var args in events)
        {
            // OnAdmitted(args)
            // OnBedAssigned(args)
            // etc.
        }
    }

Notice how moving the state changes from the public domain method into the event handler allows us to cause the state of the object to change by just loading (or applying) events to it. We can essentially change the concept of _now_ for our domain objects! We can grab a set of events (say, until yesterday), load them into the object, and see what the state of the patient was as of _yesterday_. And if we were strictly following our pattern of making ALL state transitions in the private event handlers, we can be sure the object state will be _exactly the same_ as it was yesterday. This is the manifestation of the apparently minor but profound change we did above when we moved the state change from the public method to the private event handler. We have replay capabilities now in our domain objects!

This is very useful capability that we gained with very little effort. So now we not only have business analytics capabilities built-in, but also historical replay for every entity we code this way. This is huge. But there’s even more, as we’ll see later.

Let’s first finish our implementation of the Load method: we need a way to know which handlers to call for which events, and we can do that by registering the mapping between event types and handler methods in the constructor:
    
    
    public Patient()
    {
        this.Handles<PatientAdmitted>(this.OnAdmitted);
        this.Handles<BedAssigned>(this.OnBedAssigned);
    }
    
    private Dictionary<Type, Action<EventArgs>> handlers = new Dictionary<Type, Action<EventArgs>>();
    
    private void Handles<TEvent>(Action<TEvent> handler)
        where TEvent : EventArgs
    {
        this.handlers.Add(typeof(TEvent), @event => handler((TEvent)@event));
    }
    
    public void Load(IEnumerable<EventArgs> events)
    {
        foreach (var @event in events)
        {
            var handler = default(Action<EventArgs>);
            if (this.handlers.TryGetValue(@event.GetType(), out handler))
                handler(@event);
        }
    }

The Handles method simply stores a delegate that knows how to call our handler. Our dictionary contains the event type –>Action map. The action has to be generic (can’t have a separate list for Action<PatientAdmitted>, another for Action<BedAssigned> and so on), so we just make the action receive the generic EventArgs type, which we just cast to the type we know it will have for our event handler: 
    
    
    this.handlers.Add(typeof(TEvent), @event => handler((TEvent)@event));

When the Load method finds an Action handler for a given event type, it will just call our lambda with no reflection involved. We’ll then cast from the generic base event data type the Load event passes us, down to the one the specific handler expects:
    
    
    handler(@event) –>(calls our lambda in Handles)-> @event => handler((TEvent)@event))

With that in place, the following works perfectly:
    
    
    var patient = new Patient(); // load somehow
    patient.Admit();
    patient.AssignBed(1);
    
    // grab events as of now.
    var yesterdayEvents = patient.GetEvents().ToList();
    
    // Do something more with the patient.
    patient.AssignBed(2);
    patient.AssignBed(3);
    
    // Later on, we want to see
    // patient as it was yesterday.
    var yesterdayPatient = new Patient();
    yesterdayPatient.Load(yesterdayEvents);
    
    Debug.Assert(yesterdayPatient.Bed == 1);

Note how depending on what events we load on the patient, we get the state currently reflecting as of that time. One thing you might have noticed at this point, is that as we’re loading events and calling the various OnXXX handlers, we’re also causing the corresponding .NET events to fire! That shouldn’t be the case, as the .NET events are the external notification that happens when the event was _originally_ created. So it seems appropriate to move the raising of the .NET event to the domain method instead:
    
    
    public void Admit()
    {
        if (this.IsInHospital)
            throw new InvalidOperationException("Already in hospital!");
    
        var args = new PatientAdmitted();
        this.Raise(args, this.OnAdmitted);
        this.Admitted(this, args);
    }
    
    private void OnAdmitted(PatientAdmitted args)
    {
        this.IsInHospital = true;
    }

And it’s now pretty obvious that the Raise method is not actually raising anything, but actually _applying_ the event data to the object. So we can rename that method now and call it Apply instead. 

Now that we have the event type and handler map in place from the constructor we added, we can even simplify the way we raise events too. We had:
    
    
    public void Admit()
    {
        if (this.IsInHospital)
            throw new InvalidOperationException("Already in hospital!");
    
        this.Apply(new PatientAdmitted(), this.OnAdmitted);    this.Admitted(this, args);
    }

But now we already know what handler to call for events of type PatientAdmitted (as demostrated when we loaded events), so the call should instead just be: Raise(new PatientAdmitted()): 
    
    
    private void Raise<TEvent>(TEvent args)
        where TEvent : EventArgs
    {
        this.events.Add(args);
    
        var handler = default(Action<EventArgs>);
        if (this.handlers.TryGetValue(args.GetType(), out handler))
            handler(args);
    }

And if we move all that generic code to a base class, we end up with a pretty straightforward way of implementing our domain classes:
    
    
    public class Patient : DomainObject
    {
        public event EventHandler<PatientAdmitted> Admitted = (sender, args) => { };
        public event EventHandler<BedAssigned> BedAssigned = (sender, args) => { };
    
        public Patient()
        {
            this.Handles<PatientAdmitted>(this.OnAdmitted);
            this.Handles<BedAssigned>(this.OnBedAssigned);
        }
    
        public int Bed { get; private set; }
        public bool IsInHospital { get; private set; }
    
        public void Admit()
        {
            if (this.IsInHospital)
                throw new InvalidOperationException("Already in hospital!");
    
            var args = new PatientAdmitted()
            this.Apply(args);
            this.Admitted(this, args);
        }
    
        public void AssignBed(int bed)
        {
            if (!this.IsInHospital)
                throw new InvalidOperationException("Patient must be in the hospital to assign a bed");
            if (bed < 0)
                throw new ArgumentException("Invalid bed number");
    
            var args = new BedAssigned(bed);
            this.Apply(args);
            this.BedAssigned(this, args);
        }
    
        private void OnBedAssigned(BedAssigned args)
        {
            this.Bed = args.Bed;
        }
    
        private void OnAdmitted(PatientAdmitted args)
        {
            this.IsInHospital = true;
        }
    }

Note also that we wouldn’t typically want to allow our objects to be mutated by applying arbitrary events at arbitrary times (i.e. after performing operations on it), so we’d typically make the Load method protected on the base class, and expose two constructors for our objects instead:
    
    
    private Patient()
    {
        this.Handles<PatientCreated>(this.OnCreated);
        this.Handles<PatientAdmitted>(this.OnAdmitted);
        this.Handles<BedAssigned>(this.OnBedAssigned);
    }
    
    public Patient(int id)
        : this()
    {
        if (id < 0)
          throw new ArgumentException("Invalid patient identifier");
    
        this.Apply(new PatientCreated(id));
    }
    
    public Patient(IEnumerable<EventArgs> events)
        : this()
    {
        this.Load(events);
    }

As true OO design mandates, our object cannot be constructed in an invalid state: you can either create a new patient (first time he comes in), with a valid identifier, or you create a patient by loading a set of events. Notice how both public constructors call the private parameterless constructor which hooks up the event-handler map. Also key is that even for the new patient creation constructor, we also follow the pattern we’ve explained: we don’t just blindly set the Id property. Instead, we validate the argument, apply a proper event data class, which in turn sets the Id:
    
    
    private void OnCreated(PatientCreated args)
    {
        this.Id = args.Id;
    }

Another subtlety to notice, is that in this case we don’t expose a corresponding .NET event for the object creation event. The reason is quite obvious: nobody would be able to attach to the event before the object is constructed, at which point it would be too late to catch the event using plain .NET event handlers. Our mechanism to retrieve object events and push them to an event stream would still work, however. This highlights another important thing: 

> Raising a .NET event for a domain event is _optional_.

Given that you’re performing the analysis and storage of events (as we’ll see in my next post) using a different API than plain .NET event handlers (our current GetEvents() method), there’s no requirement that you expose your event data as .NET events at all. And if you’re not doing so, there’s not even a requirement that the event data classes derive from EventArgs either! It’s really up to you. 

And that, dear reader, is the essence of the **Event Sourcing pattern**. Nothing more, nothing less. As Folwer says:

> The fundamental idea of Event Sourcing is that of ensuring every change to the state of an application is captured in an event object, and that these event objects are themselves stored in the sequence they were applied for the same lifetime as the application state itself.

And I’ll talk about the storage in my next post. To peek at what’s coming, you can install the [Event Sourcing NETFx package](<http://kzu.to/tl7euc>), which includes the DomainObject base class we’ve been discussing in this post (and a bit more).

Stay tunned.

Posted by kzu
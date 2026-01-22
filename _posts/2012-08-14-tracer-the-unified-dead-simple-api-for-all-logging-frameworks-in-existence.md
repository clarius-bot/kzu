---
layout: post
title: "Tracer: the unified, dead-simple API for all logging frameworks in existence"
date: 2012-08-14 00:00:00 +0000
---

##  [Tracer: the unified, dead-simple API for all logging frameworks in existence](<http://blogs.clariusconsulting.net/kzu/tracer-the-unified-dead-simple-api-for-all-logging-frameworks-in-existence/> "Tracer: the unified, dead-simple API for all logging frameworks in existence")

August 8, 2012 3:42 am

We all need some kind of tracing or logging in our apps. We’d also like third party components to provide useful logging too. And if it integrates with whatever logging framework we happen to use, even better!

There’s a challenge though: we’d all have to agree on using a certain logging framework up-front. Or we could all agree on a common API (much like [Common Service Locator](<http://kzu.to/MrebVE>) did for picking DI containers) and provide specific adapters. The former is impossible, so it’s got to be the latter ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

There are some efforts in the area, most notably [Common.Logging](<http://kzu.to/MreRds>) which has quite a following according to the [nuget](<http://nuget.org/>) download numbers. So I set to investigate how thin the abstraction was: 28 public types, yuck. Doesn’t look much like a thin wrapper over specific frameworks ![:\(](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_sad.gif) . One problem I noticed right away is that it already provides a bunch of abstractions to write logger implementations, reading configuration, etc., which I believe should be totally out of scope of such an abstraction.

The abstraction should be about the consuming side, not the bootstrapping/authoring side. Just like common service locator doesn’t dictate how you configure a container, how to initialize or extend it in any way, neither should a logging abstraction: just the API for consumers, nothing more.

I looked across log4net, NLog and EntLib logging, and at the core, they are about just two operations: log a message (with a formatted overload), or log an exception alongside a message (also with a formatted overload). Then they all provide a gazillion overloads in their main logger interface/class for all the permutations of those four by each of the supported severity (or log type): Critical, Error, Warning, Information and Verbose (also called Debug).

That’s IT. There’s nothing more an abstraction for consuming code needs. Here’s all we need:
    
    
    interface ITracer
    {
        void Trace(TraceEventType type, object message);
        void Trace(TraceEventType type, string format, params object[] args);
        void Trace(TraceEventType type, Exception exception, object message);
        void Trace(TraceEventType type, Exception exception, string format, params object[] args);
    }

The BCL already has [TraceEventType](<http://kzu.to/NbgvnD>) which can be used to determine the type of entry to create, although some logging library might not support all of the values in the enumeration (although I would love it if they do, because the activity tracing ones are really really useful if leveraged properly, but that’s another post ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) . Of course some usability overloads to do a direct tracer.Warn(….) are nice, but those can be easily placed in a static class as extension methods, allowing us to keep the main interface clean:
    
    
    public static void Error(this ITracer tracer, object message)
    {
        tracer.Trace(TraceEventType.Error, message);
    }

Note that the message parameter is an object. This allows each implementation to support their own fancy formatting/rendering of arbitrary objects. 

We’ll also need a way to retrieve tracers for use in our app, and that’s another very small piece we need for the abstraction to work:
    
    
    static class Tracer
    {
        public static ITracer Get(string name) { ... }    // Convenience...    public static ITracer Get<T>() { ... }
        public static ITracer Get(Type type) { ... } }

This static class would need a static Initialize method where you’d pass the implementation that retrieves the actual tracer implementations for each specific logging framework. The bridge there could be something like an ITracerManager, with the same API as the static facade:
    
    
    interface ITracerManager
    {
        ITracer Get(string name);
    }

That’s all. A general-purpose logging abstraction does not need anything more than this. 

Now, given that this is SUCH a small abstraction, does it justify being a full-blown assembly? I don’t think so, and in the spirit of [NETFx](<http://kzu.to/ltBifS>), I’ve made it a source-only nuget package. So you can, right now, go and add [this package](<http://kzu.to/PEgjcT>) to your own “Common” project, or “Core.Interfaces” that is shared by all of your app components:
    
    
    Install-Package Tracer

Next, just start using it by retrieving (ideally statically) a tracer for use in your components:
    
    
    public class MyComponent
    {
        private static readonly ITracer tracer = Tracer.Get<MyComponent>();
    
        public void DoSomething()
        {
            tracer.Info("Doing something...");
            ...
        }
    }

Then your bootstrapper/application startup code, can take a dependency on a specific implementation of the tracer, and initialize it appropriately. Choose your option of [log4net](<http://kzu.to/PEgl4A>), [NLog](<http://kzu.to/PEgncC>) or [Enterprise Library](<http://kzu.to/PEgoxc>):
    
    
    Install-Package Tracer.log4net
    Install-Package Tracer.NLog
    Install-Package Tracer.EntLib

and perform the one-liner initialization:
    
    
    Tracer.Initialize(new TracerManager());

Done!

The source is BSD-licensed, so you can do whatever you want with it. 

Happy tracing/logging!

Posted by kzu
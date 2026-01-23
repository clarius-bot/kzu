---
layout: post
title: "A better way to implement the Singleton (anti?) pattern for easier testing using AmbientSingleton"
date: 2021-01-27 00:00:00 +0000
tags: [ddd, ef, eventsourcing, extensibility, gadgets, mocking, moq, msbuild, mvc, nuget, patterns, programming, t4, technology, vsx, wcf, webapi]
---

##  [A better way to implement the Singleton (anti?) pattern for easier testing using AmbientSingleton](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/ "A better way to implement the Singleton \(anti?\) pattern for easier testing using AmbientSingleton")

January 10, 2012 6:03 pm

In .NET singletons are typically implemented with a static variable that you control access to:
    
    
    public class SystemClock : IClock
    {
        private SystemClock() { }
    
        static SystemClock()
        {
            Instance = new SystemClock();
        }
    
        public static IClock Instance { get; private set; }
    }

Fairly easy. Problem is, of course that there’s no way you can test a class that uses this singleton now. The easy thing that you might be tempted to do is to just make the setter internal and starting replacing the singleton clock with mocks of it. Problem is, as you may have guessed, that now the tests cannot be run in multiple threads simultaneously. You have made no provisions for shielding changes across threads, so if one test setups up the singleton with a mock with certain values, and another goes and changes it before the asserts get through, you’ll be seeing intermittent failures on random tests when run together, but no single failure when run individually.

Being such a common problem, the .NET framework provides a few ways to work around that, via a mechanism called [Thread Local Storage](https://bit.ly/yD4at4) (or TLS). Joe Albahari provides a great summary of the available options, so make sure you [read that link](https://bit.ly/yD4at4). In summary, they are:

  * Mark a static backing variable with [ThreadStatic] attribute:  

        
        public class SystemClock : IClock
        {
            [ThreadStatic]
            private static IClock instance = new SystemClock();
        
            private SystemClock() { }
        
            public static IClock Instance
            {
                get { return instance; }
                internal set { instance = value; }
            }
        }
        

  * Use ThreadLocal<T> instead for the private field:  

        
        public class SystemClock : IClock
        {
            private static ThreadLocal<IClock> instance = new ThreadLocal<T>(() => new SystemClock());
        
            private SystemClock() { }
        
            public static IClock Instance
            {
                get { return instance.Value; }
                internal set { instance.Value = value; }
            }
        }
        

  * Use Thread.SetData/GetData to hold the state:  

        
        public class SystemClock : IClock
        {
            private static readonly LocalDataStoreSlot slot = Thread.AllocateDataSlot();
        
            private SystemClock() { }
        
            public static IClock Instance
            {
                get
                {
                    var value = (IClock)Thread.GetData(slot);
                    // Lazy init first time for this thread.
                    if (value == null)
                    {
                        value = new SystemClock();
                        Thread.SetData(slot, value);
                    }
        
                    return value;
                }
                internal set { Thread.SetData(slot, value); }
            }
        }

These options have slightly different performance characteristics (in my tests, ThreadStatic is fastest and the other two about 5x slower than that). However, they all share a very serious limitation, that was highlighted by [Scott ages ago, back in 2003](https://bit.ly/yLqVIw). They simply don’t work if what you need is per-context state, such as per web request, per test, essentially, per Call Context. Some call this the Ambient Context pattern, but its essence in .NET is the Logical Call Context, thoroughly dissected by [Jeffrey Richter in a blog post](https://bit.ly/z5gMct). 

Given its misleading [MSDN summary](https://bit.ly/yM3fdO), and its location with the namespace System.Runtime.Remoting.Messaging, it’s not surprising that developers quickly dismiss it as a valid (and much better as we’ll see!) alternative. A logical call context flows as a thread-like state bag, but it’s not limited to a single thread. In fact, even the new threading Tasks library honors this capability, and the most prominent use of this in .NET is in [WCF E2E Tracing](https://bit.ly/wl5Veh), which uses the [CorrelationManager.ActivityId](https://bit.ly/xXghu1), which is persisted in the logical call context and flows even across AppDomains. 

You basically use [CallContext.LogicalGetData](https://bit.ly/xfvdTu) and [LogicalSetData](https://bit.ly/ygvdMd) instead of the Thread.SetData/GetData from the example above. It is, however, a bit cumbersome, and I just wish we had something like ThreadLocal<T> to leverage for this “smart singleton” (or “ambient singleton”) capability.

Enter the [NETFx AmbientSingleton](https://bit.ly/w5NcfX) class, which gives you just that ![Smile](https://web.archive.org/web/20210127041224im_/http://blogs.clariusconsulting.net/kzu/files/2012/01/wlEmoticon-smile.png):
    
    
    public class SystemClock : IClock
    {
        private static readonly AmbientSingleton<IClock> instance = new AmbientSingleton<IClock>(() => new SystemClock());
    
        private SystemClock() { }
    
        public static IClock Instance
        {
            get { return instance.Value; }
            internal set { instance.Value = value; }
        }
    }

It is safe to set the value of the singleton in multiple threads simultaneously, and the value you set will be preserved in the entire call chain, even if the test or code under test spawns new threads via the thread pool or the task pool (which ultimately also uses the thread pool by default).

There is also a static AmbientSingleton.Create factory method with a couple overloads, to cut on the generic parameters noise.

The entire source for the class is very straightforward, as you’d expect: 
    
    
    static partial class AmbientSingleton
    {
        public static AmbientSingleton<T> Create<T>(T defaultValue)
        {
            return new AmbientSingleton<T>(defaultValue);
        }
    
        public static AmbientSingleton<T> Create<T>(Func<T> defaultValueFactory)
        {
            return new AmbientSingleton<T>(defaultValueFactory);
        }
    }
    
    partial class AmbientSingleton<T>
    {
        private string slotName = Guid.NewGuid().ToString();
        private Lazy<T> defaultValue;
    
        /// </summary>
        public AmbientSingleton()
            : this(() => default(T))
        {
        }
    
        public AmbientSingleton(T defaultValue)
            : this(() => defaultValue)
        {
        }
    
        public AmbientSingleton(Func<T> defaultValueFactory)
        {
            Guard.NotNull(() => defaultValueFactory, defaultValueFactory);
    
            this.defaultValue = new Lazy<T>(defaultValueFactory);
        }
    
        public T Value
        {
            get
            {
                var contextValue = CallContext.LogicalGetData(this.slotName);
                if (contextValue != null)
                    return (T)contextValue;
    
                return this.defaultValue.Value;
            }
            set
            {
                CallContext.LogicalSetData(this.slotName, value);
            }
        }
    }

As you can see, the _Ambient Singleton_ behaves like a regular singleton, without the overhead of per-thread initialization, when it’s not needed. This is another drawback of the TLS approaches: if the object initialization is expensive, you’ll be paying for that once per thread. In the ambient singleton, however, only when a particular call context requires a different value for the singleton, the added behavior kicks in. In my tests this approach is the closest to the speed of [ThreadStatic], measuring only about 1.8x the ThreadStatic approach (compared with 5x for the ThreadLocal<T> and Thread data). All in all, a very compelling way of implementing singletons, when they are unavoidable (although you could say there’s always another way of doing it ![Winking smile](https://web.archive.org/web/20210127041224im_/http://blogs.clariusconsulting.net/kzu/files/2012/01/wlEmoticon-winkingsmile.png), but that’s another post).

You can install the [nuget package to get the source AmbientSingleton<T> class](https://bit.ly/w5NcfX), which is partial and defaults to internal, as you’d typically not expose it as a public type in your libraries, and is rather an internal implementation detail of your singletons. You can of course create another partial of it and make it public if you wish. It’s fully documented, and lives in the System namespace.

In order to keep your code coverage goals, you can also install the [xUnit tests](https://bit.ly/ym4hcr) which provide 100% coverage for this source.

Posted by kzu

![Comments](https://web.archive.org/web/20210127041224im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/hr.png)

### 9 Comments

  1. [![](https://web.archive.org/web/20210127041224im_/http://0.gravatar.com/avatar/0be5450531082b87f60a3a620558aab3?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Michael Hart]() [ January 10, 2012 at 10:56 pm. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-429)

@kzu – CallContext is *not* safe for ASP.NET applications “if there is the possibilty that the value might be setup prior to Page_Load (eg in IHttpModule, or page constructor) but accessed during or after” <http://piers7.blogspot.com/2005/11/threadstatic-callcontext-and_02.html>

I’d modify the AmbientSingleton source to check for HttpContext and try to store there before falling back to CallContext

     * [![](https://web.archive.org/web/20210127041224im_/http://0.gravatar.com/avatar/6230e73ab381af22df10156ad5b9bcf4?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[kzu]() [ January 12, 2012 at 8:54 pm. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-443)

Fair enough. But I don’t want to take a dependency on system.web. Maybe a new WeAmbientSingleton would be more appropriate?

     * [![](https://web.archive.org/web/20210127041224im_/http://0.gravatar.com/avatar/6230e73ab381af22df10156ad5b9bcf4?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[kzu]() [ January 17, 2012 at 2:13 pm. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-469)

I think this point is actually only relevant if you do modify your singleton per call context in production code, which is extremely rare. Singletons are typically global.

If there’s enough demand I’ll add the WebAmbientSingleton, but otherwise, for testing, this one works just fine for web code too.

  2. [![](https://web.archive.org/web/20210127041224im_/http://0.gravatar.com/avatar/0e747083685b78a6fb3f264b48ab253d?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[tobi]() [ January 11, 2012 at 5:02 pm. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-434)

I wish there was more documentation and guidance on how to use all of the different contexts available to a .net developer. ExecutionContext, CompressedStack and others come to mind. Almost nobody used them.

  3. [![](https://web.archive.org/web/20210127041224im_/http://0.gravatar.com/avatar/2dbf46b7402861adcc87b59d481479a8?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[RobDS]() [ September 23, 2013 at 2:47 pm. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-2185)

Interesting, and two thoughts for consideration:  
1) CallContext is considered a ‘legacy technology’ in .NET 4.5.  
2) The note about HttpContext is interesting, as that is what has lead me searching. In my case, I need a thread-static which I can use within my business-logic, which sometimes has an HttpContext (usual ASP.NET life-cycle complciated by thread-agility), and sometimes does not have an HttpContext (e.g. unit-tests, service-process independent of IIS). I’ll be pursuing a dependency-injection-style-solution, i.e. I’ll define an interface and more than two implementations (one with [ThreadStatic] and one with HttpContext.Current.Items).

  4. [Complex traces you can actually understand by leveraging Activity Tracing – Daniel Cazzulino's Blog](http://blogs.clariusconsulting.net/kzu/complex-traces-you-can-actually-understand-by-leveraging-activity-tracing/) [ January 14, 2014 at 1:09 pm. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-2324)

[...] activities are identified by an arbitrary guid, which is placed in the ambient singleton property Trace.CorrelationManager.ActivityId. This ID flows with threads, and in the case of WCF, [...]

  5. [AmbientSingleton – a CallContext aware singleton | Around computing](http://muibiencarlota.wordpress.com/2014/01/15/ambientsingleton-a-callcontext-aware-singleton/) [ January 15, 2014 at 7:09 am. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-2328)

[...] [...]

  6. [![](https://web.archive.org/web/20210127041224im_/http://1.gravatar.com/avatar/7b676b4ac3a4c5c2a23146cf1755a3f0?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Devon S]() [ May 22, 2014 at 5:17 pm. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-2459)

I thought this was just what the doctor ordered for having a TraceId available throughout the entire call stack… but now I’m having difficulties and I’m not sure why. I use AmbientSingleton where TraceContex is my own class with 3 string properties (internal setters). I have a Handler that fires for every web request, checks for a TraceId header and plugs that value into the TraceContext.TraceId. This TraceContextHandler inherits from DelegatingHandler and as such returns base.SendAsynch(…). This worked perfectly in my Framework app with a bunch of Project references, so I built some Nuget packages and installed them into an API based on our Framework. When testing this app, the TraceId was always null in the log data. I changed the AmbientSingleton class to implement ILogicalThreadAffinative, changed the public T Value get/set to use CallContext.LogicalSetData/GetData and now it works. I did this based on Stephen Cleary’s blog (<http://blog.stephencleary.com/2013/04/implicit-async-context-asynclocal.html>) in which he stated:

“There is a solution for this problem: the “logical call context”, which you can access by CallContext.LogicalGetData and CallContext.LogicalSetData. The regular call context (CallContext.GetData and CallContext.SetData) acts just like thread-local storage, which of course doesn’t work for async methods.”

Thoughts? Possible issues I may be facing? I’m assuming the implementation I have now will essentially create/use a TraceId for the entire request, but only one request. New requests will use/create their own traceId value and they won’t leak across requests.

  7. [![](https://web.archive.org/web/20210127041224im_/http://1.gravatar.com/avatar/7b676b4ac3a4c5c2a23146cf1755a3f0?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Devon S]() [ May 22, 2014 at 5:20 pm. ](http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/#comment-2460)

Oops. Above post removed some angle brackets. It should have read “I use AmbientSingleton<TraceContext>”

Comments are closed
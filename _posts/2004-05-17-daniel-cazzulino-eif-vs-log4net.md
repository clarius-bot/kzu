---
layout: post
title: "Daniel Cazzulino : EIF vs log4net"
date: 2004-05-17 00:00:00 +0000
---

## EIF vs log4net 

I've been doing a comparison of both products recently. Before you read, I must say that I used [log4net](http://logging.apache.org/log4net/) a lot (I even appear as a contributor :o), so I may be biased. On the other hand, I only evaluated EIF, looked at how it's used in a real world product, and read the documentation provided, as well as built the examples. 

Here are my conclusions.

Conventions:

· x: feature is supported equally.

· -: feature is supported/implemented, but is not as good as the other product

· +: feature is better supported/implemented than the other product

**Feature** General  
Decoupling of event source and event sink Number of built-in event sinks supported Configuration Arbitrary log data Installation Source provided Performance with logging enabled Reconfiguration API - Dev friendliness Event source inheritance |  |   
  
One of the "distinguishing" features of EIF is request tracing, but it is mostly irrelevant as it only works using the remoting CallContext, which reduces its applicability considerably. And remoting is not a long-term platform to rely on either... For request-like tracing on a single thread (important when there're multiple components involved in an operation happening on a single machine/thread) log4net offers similar functionality through its Nested Diagnostics Context.

For business events that rely on arbitrary objects being send, EIF has a clear advantage. I wonder, however, how many business notification scenarios are actually handled through logging... Through customization similar functionality could be implemented in log4net, however.

**Overall** : both seem like good logging packages. EIF may be more manageable as it has strong relationship with WMI. log4net, on the other hand, clearly wins on simplicity and in my opinion satisfies most common logging and tracing needs. 

Except for the extra WMI stuff (which can also be implemented as custom extensions to log4net - I've done it) and arbitrary objects publication (also achievable, but requiring more work), I'd choose log4net. 

## Side Note

**log4net "event source" (loggers)** : in log4net, you ask for a logger to the LogManager. Using a simple dotted syntax, you create hierarchycal loggers that inherit sinks, filters and threshold very easily. For example, the following code asks for a logger and logs an informational message:
    
    
    ILog log = LogManager.GetLogger("Finance.Accounting.Customers.Administration");
    
    
    if (Log.IsInfoEnabled)
    
    
    {
    
    
      log.Info("Adding user " + _userId);
    
    
    }

some other component in the same module may use the following:
    
    
    ILog log = LogManager.GetLogger("Finance.Accounting.Orders");
    
    
    if (Log.IsInfoEnabled)
    
    
    {
    
    
      log.Info("Adding order " + _orderId);
    
    
    }

All the "Finance" application, or the "Accounting" module can be configured in a single place, and affect both components. A common use is to pass the current component type to the GetLogger() method, therefore making the logger match class full names, which is also an easy way to configure groups of components or modules in an application. For example:
    
    
    <!-- Enables all logging events in finance application (both components above) -->
    
    
    <logger name="Finance ">
    
    
      <level value="ALL" />
    
    
    </logger>
    
    
     
    
    
    <!-- Enables INFO logging events in accounting module (both components above) -->
    
    
    <logger name="Finance.Accounting">
    
    
      <level value="INFO" />
    
    
    </logger>
    
    
     
    
    
    <!-- Enables INFO logging events in Orders module (only for the last code above) -->
    
    
    <logger name="Finance.Accounting.Orders">
    
    
      <level value="INFO" />
    
    
    </logger>

Custom logger levels can be used directly, without previous definition, for example "BusinessEvent" or "CriticalOperation". This functionality, combined with hierarchycal loggers is very flexible and completely removes the need in EIF for defining custom types for every event. In addition, arbitrary key-value (only strings) can be logged by using a so-called Mapped Diagnostics Context. Functionality similar to request tracing in EIF is available through Nested Diagnostic Context, that is threads-specific. 

I'd love to hear arguments in favor of EIF. I may be missing some other features it has to offer, or I may have misunderstood some of its functionality, as (like I said) I haven’t used it before. 

Have you used both products? What do you think about the points made above? 

/kzu

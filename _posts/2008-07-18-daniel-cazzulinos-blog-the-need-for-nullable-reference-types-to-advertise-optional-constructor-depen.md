---
layout: post
title: "Daniel Cazzulino's Blog : The need for nullable reference types to advertise optional constructor dependencies"
date: 2008-07-18 00:00:00 +0000
---

## The need for nullable reference types to advertise optional constructor dependencies 

In "traditional" OOP, you advertise your class required dependencies via constructor arguments:
    
    
    public Foo(IOutput output, ILogger logger, ...)

Typically, the first few lines of code will check that these dependencies are not null. 

Optional dependencies may be provided as properties, which you can leave unset (null). 

Internally, in order to avoid a multitude of conditionals checking for nulls, you might have your own ["null" implementations](http://en.wikipedia.org/wiki/Null_Object_pattern) of the dependencies' interfaces (i.e. NullLogger which does nothing). This way the code is more readable, and you can always assume the dependencies are non-null and you'll never get a NullReferenceException ;)

One problem with property dependency injection is that you can't readily tell which properties are dependencies, and with constructor arguments, you cannot specify which ones are optional (can be passed null OK). 

I think a much more consistent approach, and one that would integrate very well with the [nullable value types](http://msdn.microsoft.com/en-us/library/1t3y8s4s.aspx) functionality in .NET, is to introduce the concept of a nullable reference type:
    
    
    public Foo(IOutput output, ILogger? logger, ...)

What this tells the caller, is that the first argument is a required dependency, while the second can be null. I believe the .NET framework should go one step further and give the implementer a null implementation of the interface or abstract class if the argument is null. This way, you get rid of all nulls in your apps.

You can also avoid depending on properties to advertise optional dependencies (and an associated custom attribute such as [MEF](http://blogs.msdn.com/kcwalina/archive/2008/04/25/MEF.aspx) in order to indicate it's a dependency and not a regular property).

/kzu

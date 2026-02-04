---
layout: post
title: "Daniel Cazzulino's Blog - How to do reflection with a dynamic style"
date: 2011-05-26 00:00:00 +0000
---

## How to do reflection with a dynamic style

I’m not advocating *private* reflection (invoking private/internal fields, properties and methods), but we all know that there are those corner cases where you just can’t avoid it. And there’s a whole lot of scenarios when there are legitimate uses of reflection itself that can also leverage this very cool dynamic syntax (i.e. invoking generic methods where you don’t know the type at compile-time, etc.). In these cases, your code goes from pristine-looking C# to crappy unreadable reflection code.

David Ebbo hasexplained quite a bitalready why this might be needed and how it can be used.

This is a pretty handy tool to have for those rare cases, and it’s pretty small, making it ideal for aNETFxNuGetlittle source-style package.

You install it either from the library package manager (search for “dynamic reflection”):

![image](http://blogs.clariusconsulting.net/kzu/files/2011/05/image31.png)

or the console(you can [TAB] for autocompletion right after “netfx-System.Dyn”).

And you get a new extension method (with source code, as usual) in the System.Dynamic namespace (didn’t want to put this in the global namespace as it would show up everywhere):

![reflectiondynamic](http://blogs.clariusconsulting.net/kzu/files/2011/05/reflectiondynamic.png)

Now you can do all sorts of interesting reflection-based code with nice clean C# syntax (even if it’s private, internal, static, or generics stuff). The implementation isfully covered by unit tests(yes all 100% of the functionality), and supports the following features:

- Getting/setting properties, fields and indexed properties
- Invoking methods with full overload resolution
- Invoking methods with generic signature with C# generic signature or runtime Type as parameter
- Invoking constructors: var instance = dynFoo.ctor(“hello”)
- All of the above but also for static members, including static constructor: obj.cctor()
- Both properties and methods can be explicitly implemented members (non-explicit has higher priority)
- Support for out/ref parameters
- Automatic recursive private access (i.e. foo.Bar.Baz, where the type of Bar is also a private class and Baz is a private member of it) for all supported invocations

Because this is just C# dynamic syntax, most examples (except for the constructors and out/ref) look just like plain C#, but keep in mind that they all are resolved at runtime using reflection:

```
var foo = Activator.CreateInstance("MyNamespace.Foo, MyAssembly");

// Get/set private field
int value = foo.AsReflectionDynamic().field1;
foo.AsReflectionDynamic().field1 = value++;

// Get/set property
int value = foo.AsReflectionDynamic().Id;
foo.AsReflectionDynamic().Id = value++;

string indexed = foo.AsReflectionDynamic().Items["key"];
foo.AsReflectionDynamic().Items["key"] = "hello";

// Recursively access a property in a nested private object
var value = foo.AsReflectionDynamic().Internals.InnerState.Id;

// Invoke method (does overload resolution)
var value = foo.Call("hello");

// Invoke method and recursively access result properties dynamically too
var value = foo.Call("hello").Internals.InnerState.Id;

// Invoke a method with a generic signature (does overload resolution too)
var value = foo.InternalServiceLocator.GetService<IFormatter>();

// Invoke private constructor passing values
var fooType = Type.GetType("MyNamespace.Foo, MyAssembly");
var foo = fooType.AsReflectionDynamic().ctor("Hello", 25);

// Invoke private (alternate?) constructor again after object has been initialized
var foo = Activator.CreateInstance("MyNamespace.Foo, MyAssembly");
foo.ctor("Hello", 25);

// Invoke static constructor
var fooType = Type.GetType("MyNamespace.Foo, MyAssembly");
fooType.AsReflectionDynamic.cctor();
```

Out/Ref require a little bit of explanation. There is a well known limitation in the underlying C# binder that does not copy out/ref values to the caller. This is aknown bug that is supposedly fixed for .NET vNext. I managed to get something fairly usable IMHO to simulate out/ref. Essentially, the ReflectionDynamic knows about two special types or arguments you can pass to invocations: OutValue and RefValue. These are two generic classes with corresponding factory Create<T> methods that you pass delegates into for the get/set (Ref) or only set (Out). And the dynamic implementation will handily copy back and forth the values before/after invoking the actual member via Reflection:

```
// Invoke with output parameter
var service = default(IFormatter);
// Create a pass-through holder that can set the out value.
var out1 = OutValue.Create(value => service = value);

bool success = foo.InternalServiceLocator.TryGetService<IFormatter>(out1);
// if success == true, service1 will contain the output of the method call
// which has a signature of:
// bool TryGetService<TService>(out TService instance);

// Invoke with by-ref parameter
var service = default(IFormatter);
// Create a pass-through holder that can get/set the ref value.
var ref1 = RefValue.Create(() => service, value => service = value);

bool success = foo.InternalServiceLocator.TryGetService<IFormatter>(ref1);
// if success == true, service1 will contain the output of the method call
// which has a signature of:
// bool TryGetService<TService>(ref TService instance);
```

Another very useful but a little departed from C# functionality is to call generic methods but passing the generic type argument as a parameter (i.e. you need to call Resolve<T> but you only have a System.Type at runtime, back to ugly reflection land!):

```
var type = Type.GetType("Foo");
var instance = foo.InternalServiceLocator.Resolve(type.AsGenericParameter(), true);

// which has a signature of:
// TService Resolve<TService>(bool throwIfMissing);
```

You can even mix and match passing the generic parameters as traditional C# generics and as parameters to the invocation:

```
foo.InternalServiceLocator.Register<IFoo>(Type.GetType("Foo").AsGenericParameter(), "MyFoo");

// which has a signature of:
// void Register<TInterface, TService>(string contractName);
```

The types used as proper C# generics are always the first and next come the ones as parameters. i.e., if you wanted the TService to be IFoo, you’d have to pass both types as parameters.

This generics invocation is incredibly useful for general purpose APIs that rely a lot on generics for public consumption but which require general-purpose internal behavior. Now you can place the behavior in the generic members and invoke this way via reflection when someone uses the non-generic API, instead of the other way around which makes all code look substantially more convoluted.

Tests are a good placeto learn about the various usage scenarios.

Go get it, and enjoy!

/kzu

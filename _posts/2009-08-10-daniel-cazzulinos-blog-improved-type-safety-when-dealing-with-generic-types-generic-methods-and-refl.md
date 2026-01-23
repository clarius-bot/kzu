---
layout: post
title: "Daniel Cazzulino's Blog : Improved type safety when dealing with generic types, generic methods and reflection"
date: 2009-08-10 00:00:00 +0000
---

## Improved type safety when dealing with generic types, generic methods and reflection 

Compile-time safety is always important, as it reduces the chances that a refactoring can break existing code that compiles successfully. This benefit took me previously to the path of using expression trees to achieve strong-typed reflection. 

There is, however, an alternative that works on previous versions of .NET and doesn’t involve expression trees. It essentially involves creating a delegate of the target method, and using the delegate properties to get to the corresponding MethodInfo:
    
    
    Action<string> writeLine = Console.WriteLine;
    MethodInfo writeLineMethod = writeLine.Method;

Note that the code above is very explicit about which overload of the WriteLine method to pick: the one with a single string argument and a void return value. You can leverage Action and Func various overloads to represent pretty much any method invocation. Also, if those do not fit, you can still create your own delegate type. The benefit, clearly, is that you now can refactor the defining class or method and the change will be picked automatically.

The above example dealt with a static method call. Instance methods require an actual instance, but you can still use the technique to reflect over the method metadata ~~What about instance methods? You certainly don't want to instantiate the target type just to do a more safe reflection over it, right? Well, because we're only retrieving a delegate to a method, but not actually executing it, passing a null is perfectly fine~~ :
    
    
    Func<object> cloneable = aCloneable.Clone;
    MethodInfo cloneMethod = cloneable.Method;

How do you deal with generic classes, though?
    
    
    public interface IFoo<T>
    {
       void Do();
    }

In order to get the method, you need to have an actual concrete type of IFoo<T>~~, so you can just any type~~ :
    
    
    Action doMethod = aFooOfString~~((IFoo <string>)null)~~.Do;
    MethodInfo doMethodInfo = doMethod.Method;

The same trick applies to generic methods, but you need to get the generic method definition at the end:
    
    
    public static class Factory
    {
        public static T Create<T>() { ... }
    }
    ...
    Func<string> createMethod = ~~((IFactory)null)~~ Factory.Create<string>;
    MethodInfo genericCreate = createMethod.Method.GetGenericMethodDefinition();

With these combined tricks, you don't need to (ab?)use expression trees for certain scenarios and it's backwards compatible with .NET 2.0.

/kzu

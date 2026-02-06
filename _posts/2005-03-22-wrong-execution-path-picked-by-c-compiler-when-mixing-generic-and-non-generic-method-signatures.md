---
layout: post
title: "Wrong execution path picked by C# compiler when mixing generic and non-generic method signatures."
date: 2005-03-22 00:00:00 +0000
---

I've found what seems like a bug in the C# compiler which makes the execution path of your code unpredictable. The scenario is laid out in the [product feedback bug](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=581bd41b-eb2a-4902-bcef-623f05e6726c) but a brief repro will hopefully suffice to convince you of its severity.   
  
Basically, if you have the following class definition:

  
`public class MyClass  
{  
public void Add(object value) { ... }  
public void Add(BaseType value) { ... }  
public T Add<T>(T value) { ... }  
}`

Assuming DerivedType is a class inheriting from BaseType, the following very strange and highly unexpected behavior will happen:  

`// The method with the non-generic signature is called as expected.  
new MyClass().Add(new object());  
  
  
// The method call below should never compile as the method receiving an object returns **void**  
// The method with the generic signature is called ?!?!  
object o = new MyClass().Add("hola");  
  
// Anything that is not exactly of type object will go the generic method :S:S  
  
// The match for the type is *exact* meaning that even   
// if I have a method of a matching signature according to   
// common polymorphic behavior (passing a derived type),   
// the generic version is called instead of the expected one.  
// the method below should never compile as the method returns **void**  
object o2 = new MyClass().Add(new DerivedType());`

The worst case scenario is if the method receiving a BaseType returned a BaseType instead of void, you would never know that what's actually being executed is the generic method instead of the expected method (for the second example, passing a new DerivedType), as the returned type would match, but the execution path will never be what you expected.  
  
I believe this is pretty serious, and should get inmediate attention before it's too late. Please [vote for the bug](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=581bd41b-eb2a-4902-bcef-623f05e6726c) if you agree.

/kzu

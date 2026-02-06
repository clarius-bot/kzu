---
layout: post
title: "Inferring in parameter types in SqlCommand: does not work with Nullable&lt;T&gt; values"
date: 2005-06-16 00:00:00 +0000
---

SqlCommand can infer parameter types from their values. It has always been that way. Therefore, you don't need to care about the mapping between CLR types and SQL types. In Whidbey (.NET v2.0), nullable types (Nullable<T> generic class) were introduced to better support database scenarios, where a field that would map to a CLR value type can actually be null. I would have expected the same type inference on parameters to be performed for these types too, basically resolving to the underlying type (i.e. Int32 in a Nullable<int>) and having the parameter set to null if it didn't contain a value.   
  
Turns out that if you try to use parameter inference with Nullable<T>, you will get an exception saying that the managed provider does not know how to map the Nullable<T> to a native type. As usual, [I reported the bug](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?feedbackid=e4c5e9a3-9fac-4eab-98c0-776e85250d0c), which they resolved ***By Design*** (hopefully they will change the resolution to **Posponed** , which is what I would expect given their own answer to the issue). Hence, it's not supported and will not be in Whidbey. Too bad as auto-generated data access layers now will have to account for this. And it's bad because although the introduccion of the Nullable<T> made it easier to generate the reading piece, it now complicates the querying and updating :(. 

/kzu

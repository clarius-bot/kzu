---
layout: post
title: Is IDisposable missing something???
date: 2005-04-27 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/IDisposeDefinition
tags:
- .NET

---

Who about:  
  

    
    
    public interface IDisposable  
    {  
          event EventHandler Disposed;  
          void Dispose();  
          bool IsDisposed { get; }  
    }

That would make it feasible to have features that monitor for the disposal of elements to do something (like cleanup related state, etc.). For the record, the `Disposed` event *is* exposed in the `IComponent` interface.... too bad it didn't make it to the `IDisposable` interface :( .... (at least I'd like the event ...)  

/kzu

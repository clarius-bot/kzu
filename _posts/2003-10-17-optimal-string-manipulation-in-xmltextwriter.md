---
layout: post
title: "Daniel Cazzulino's Blog - Optimal string manipulation in XmlTextWriter?"
date: 2003-10-17 00:00:00 +0000
---

## Optimal string manipulation in XmlTextWriter? 

Lately I've been digging inside the `XmlTextWriter` class. I'm working on an alternate implementation to the traditional state machine based on arrays, one based on a mix of hierarchical state machines and DOM-like events propagation, for an XmlWriter-inherited class.   
During this investigation, I found several places where string manipulation is not optimal in aforementioned class. Specifically, even if it uses the `StringBuilder` class, it mixes calls to it with `String.Concat`, which is completely useless. Look at the following example taken from the `StartDocument` method (called by `WriteStartDocument`): 

`
    
    
    builder1.Append(string.Concat(" encoding=", this.quoteChar));

`

This is functionally equivalent to:

`
    
    
    builder1.Append(" encoding=").Append(this.quoteChar);

`

So, why are the strings concatenated? Even temporary arrays of strings are built only to be concatenated and passed to the `Append` method later. Do these guys now something about string handling we don't or is this just a bit more inefficient code?

References: 

  * [Hierarchical State Machines](http://www.accu-usa.org/Slides/samek0311.pdf)
  * [Quantum Hierarchical State Machine - Port to C#](http://www.quantum-leaps.com/qf.code/qhsm_csharp.PDF)
  * [Hierarchical State Machine Design Pattens](http://www.scs.carleton.ca/~francis/Courses/304/Slides/304P2S7-HSMPatterns.pdf)

/kzu

---
layout: post
title: "Dependency Injection and Object Composition put to practice"
date: 2007-05-17 00:00:00 +0000
---

[Last week I presented](http://www.sigs-datacom.de/sd/kongresse/set_2007/index.htm "SET Conference") this topic in Zurich, based on [p&p ObjectBuilder](http://www.codeplex.com/objectbuilder "ObjectBuilder @ CodePlex"). It's amazing how much interest people show around this topic, yet there is so little available on the web about ObjectBuilder. 

The project has been open sourced for a while now, but the lack of good documentation and a full DI container hindered its adoption. First thing I hear on these conferences is that it's too low-level, and that higher level APIs are needed.  
  
I believe that's what will happen in the short-term. ObjectBuilder is a very good tool to apply simple dependency injection and object composition functionality in your app, without taking huge dependencies. For the most part, you can make it work even without using custom attributes and the like.  

  
You can [get the slides](http://www.clariusconsulting.net/kzu/SET2007_ObjectBuilder.zip "Powerpoint 2007 Slides") (PowerPoint 2007), and [download the sample project](http://clariusconsulting.net/downloads/farcaster.zip "Sample ObjectBuilder project") that compares the usage against standard hardcoded dependencies and even Pico and Spring.  

/kzu

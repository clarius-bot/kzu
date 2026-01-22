---
layout: post
title: "How to mock a dynamic object"
date: 2011-06-29 00:00:00 +0000
---

##  [How to mock a dynamic object](<http://blogs.clariusconsulting.net/kzu/how-to-mock-a-dynamic-object/> "How to mock a dynamic object")

June 29, 2011 12:03 pm

Someone asked me how to mock a dynamic object with Moq, which might be non-obvious.

Given the following interface definition:
    
    
    public interface IProject
    {
      string Name { get; }
      dynamic Data { get; }
    }

When you try to setup the mock for the dynamic property values, you get:

![image001](http://blogs.clariusconsulting.net/kzu/files/2011/06/image001.png)

What’s important to realize is that a dynamic object is just a plain object, whose properties happen to be resolved at runtime. Kinda like reflection, if you will: all public properties of whatever object happens to be the instance, will be resolved just fine at runtime.

Therefore, one way to mock this dynamic is to just create an anonymous type with the properties we want, and set the dynamic property to return that:
    
    
    var data = new
    {
        AssemblyName = "Something.dll",
        DefaultNamespace = "Something",
    };
    var item = Mock.Of<IProject>(i => i.Name == "Bar" &&
                                      i.Data == data);

~~Note that I’m also using the linq to mocks syntax which makes for much more concise and “declarative” way of specifying stub behaviors.~~ That syntax doesn’t work for dynamic properties though, unfortunately ![Sad smile](http://blogs.clariusconsulting.net/kzu/files/2011/06/wlEmoticon-sadsmile.png), and you’d get the same compile error as before.

  
The equivalent imperative style would be:
    
    
    var item = new Mock<IProject>();
    item.Setup(i => i.Name).Returns("Bar");
    item.Setup(i => i.Data).Returns(data);

I hardly use that syntax anymore (except for dynamics). It gets really annoying for setting multiple properties and method return values…

Happy moqing!

Posted by kzu
---
layout: post
title: "Daniel Cazzulino's Blog : How to hide System.Object members from your interfaces"
date: 2008-03-10 00:00:00 +0000
---

## How to hide System.Object members from your interfaces 

Sometimes, [System.Object](http://msdn2.microsoft.com/en-us/library/system.object.aspx) methods ([Equals](http://msdn2.microsoft.com/en-us/library/system.object.equals.aspx), [GetHashCode](http://msdn2.microsoft.com/en-us/library/system.object.gethashcode.aspx), [GetType](http://msdn2.microsoft.com/en-us/library/system.object.gettype.aspx) and [ToString](http://msdn2.microsoft.com/en-us/library/system.object.tostring.aspx)) only contribute clutter to VS intellisense. Everyone knows those members are always there, yet they are seldom used explicitly. This is especially important (and annoying) for fluent APIs that define the flow of invocations in terms of interfaces and usually have few members at each "step" of the statement.

For example, in the following [Moq](http://code.google.com/p/moq/ "A Moq framework powered by C# 3.5 and lambda expressions") expectation, at the particular step in the statement, there are only two "real" invocations that make sense. However, they are obscured by the [System.Object](http://msdn2.microsoft.com/en-us/library/system.object.aspx) members, which even outnumber them:

![image](https://web.archive.org/web/20080503122031im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtohideSystem.ObjectmembersfromAPIs_CE56/image.png)

A much cleaner intellisense is possible though:

![image](https://web.archive.org/web/20080503122031im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtohideSystem.ObjectmembersfromAPIs_CE56/image_3.png)

The trick comes from the [System.ComponentModel.EditorBrowsableAttribute](http://msdn2.microsoft.com/en-us/library/System.ComponentModel.EditorBrowsableAttribute.aspx), which controls visibility of members in VS intellisense. To hide a member from intellisense, you apply the following attribute to it:
    
    
    [EditorBrowsable(EditorBrowsableState.Never)]

[](http://11011.net/software/vspaste)

Now, you don't want to have to override all four object members in every type just to apply the attribute. A quite elegant solution exists, which involves taking advantage of implicit interface implementation. In particular, you can define an interface that re-defines all object members and applies the attribute:
    
    
        [EditorBrowsable(EditorBrowsableState.Never)]
        public interface IHideObjectMembers
        {
            [EditorBrowsable(EditorBrowsableState.Never)]
            Type GetType();
    
            [EditorBrowsable(EditorBrowsableState.Never)]
            int GetHashCode();
    
            [EditorBrowsable(EditorBrowsableState.Never)]
            string ToString();
    
            [EditorBrowsable(EditorBrowsableState.Never)]
            bool Equals(object obj);
        }
    

[](http://11011.net/software/vspaste)

Now you simply add this interface to all your classes or interfaces where you want to hide these members. Starting in [Moq v2](http://code.google.com/p/moq/downloads/list "Current Moq downloads"), we've done this with all the interfaces in our fluent API so that they don't clutter your discovery of the expected flow:
    
    
    public interface IVerifies : IHideObjectMembers

[](http://11011.net/software/vspaste)

Sometimes I do love VS :)

posted on Monday, March 10, 2008 9:59 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

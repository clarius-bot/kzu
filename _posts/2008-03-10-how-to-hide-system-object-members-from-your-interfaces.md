---
layout: post
title: "How to hide System.Object members from your interfaces: the IFluentInterface"
date: 2008-03-10 00:00:00 +0000
---

##  [How to hide System.Object members from your interfaces: the IFluentInterface](<http://blogs.clariusconsulting.net/kzu/how-to-hide-system-object-members-from-your-interfaces/> "How to hide System.Object members from your interfaces: the IFluentInterface")

March 10, 2008 4:59 pm

Sometimes, [System.Object](<http://msdn2.microsoft.com/en-us/library/system.object.aspx>) methods ([Equals](<http://msdn2.microsoft.com/en-us/library/system.object.equals.aspx>), [GetHashCode](<http://msdn2.microsoft.com/en-us/library/system.object.gethashcode.aspx>), [GetType](<http://msdn2.microsoft.com/en-us/library/system.object.gettype.aspx>) and [ToString](<http://msdn2.microsoft.com/en-us/library/system.object.tostring.aspx>)) only contribute clutter to VS intellisense. Everyone knows those members are always there, yet they are seldom used explicitly. This is especially important (and annoying) for fluent APIs that define the flow of invocations in terms of interfaces and usually have few members at each "step" of the statement.

For example, in the following [Moq](<http://code.google.com/p/moq/> "A Moq framework powered by C# 3.5 and lambda expressions") expectation, at the particular step in the statement, there is only one "real" invocation that makes sense (Verifiable). However, it is obscured by the [System.Object](<http://msdn2.microsoft.com/en-us/library/system.object.aspx>) members:

[![image](http://blogs.clariusconsulting.net/kzu/files/2012/04/image_thumb.png)](<http://blogs.clariusconsulting.net/kzu/files/2012/04/image.png>)

A much cleaner intellisense is possible though:

[![image](http://blogs.clariusconsulting.net/kzu/files/2012/04/image_thumb1.png)](<http://blogs.clariusconsulting.net/kzu/files/2012/04/image1.png>)

The trick comes from the [System.ComponentModel.EditorBrowsableAttribute](<http://msdn2.microsoft.com/en-us/library/System.ComponentModel.EditorBrowsableAttribute.aspx>), which controls visibility of members in VS intellisense. To hide a member from intellisense, you apply the following attribute to it:
    
    
    [EditorBrowsable(EditorBrowsableState.Never)]

Now, you don’t want to have to override all four object members in every type just to apply the attribute. A quite elegant solution exists, which involves taking advantage of implicit interface implementation. In particular, you can define an interface that re-defines all object members and applies the attribute:
    
    
    /// <summary>
    /// Interface that is used to build fluent interfaces and hides methods declared by <see cref="object"/> from IntelliSense.
    /// </summary>
    /// <remarks>
    /// Code that consumes implementations of this interface should expect one of two things:
    /// <list type = "number">
    ///   <item>When referencing the interface from within the same solution (project reference), you will still see the methods this interface is meant to hide.</item>
    ///   <item>When referencing the interface through the compiled output assembly (external reference), the standard Object methods will be hidden as intended.</item>
    /// </list>
    /// See http://bit.ly/ifluentinterface for more information.
    /// </remarks>
    [EditorBrowsable(EditorBrowsableState.Never)]
    public interface IFluentInterface
    {
        /// <summary>
        /// Redeclaration that hides the <see cref="object.GetType()"/> method from IntelliSense.
        /// </summary>
        [EditorBrowsable(EditorBrowsableState.Never)]
        Type GetType();
    
        /// <summary>
        /// Redeclaration that hides the <see cref="object.GetHashCode()"/> method from IntelliSense.
        /// </summary>
        [EditorBrowsable(EditorBrowsableState.Never)]
        int GetHashCode();
    
        /// <summary>
        /// Redeclaration that hides the <see cref="object.ToString()"/> method from IntelliSense.
        /// </summary>
        [EditorBrowsable(EditorBrowsableState.Never)]
        string ToString();
    
        /// <summary>
        /// Redeclaration that hides the <see cref="object.Equals(object)"/> method from IntelliSense.
        /// </summary>
        [EditorBrowsable(EditorBrowsableState.Never)]
        bool Equals(object obj);
    }

Now you simply add this interface to all your classes or interfaces where you want to hide these members. Starting in [Moq v2](<http://code.google.com/p/moq/downloads/list> "Current Moq downloads"), we’ve done this with all the interfaces in our fluent API so that they don’t clutter your discovery of the expected flow:
    
    
    public interface IVerifies : IFluentInterface

Update: a whole lot of projects are leveraging this technique now ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) , pretty much all that have a fluent API. Over time, I’ve started liking the [IFluentInterface](<http://code.google.com/p/autofac/source/browse/src/Source/Autofac/Registrars/IFluentInterface.cs?r=e08de9730494bdb7a6671008094c7edbb4216e03>) name better than my original IHideObjectMembers, but I’ve seen others using [IFluentSyntax](<https://github.com/ninject/ninject/blob/master/src/Ninject/Syntax/IFluentSyntax.cs>) too. If you do leverage this technique, I’d appreciate it if you link to <http://bit.ly/ifluentinterface> in your code documentation ![Smile](http://blogs.clariusconsulting.net/kzu/files/2012/06/wlEmoticon-smile.png). Thanks!

Update2: to grab this interface declaration, and stay up to date with documentation updates, just install the [IFluentInterface](<http://nuget.org/packages/ifluentinterface>) [nuget](<http://nuget.org/>)!

Sometimes I do love VS ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=58301)

Posted by kzu

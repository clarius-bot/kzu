---
layout: post
title: "Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute"
date: 2012-02-04 00:00:00 +0000
---

##  [Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute](<http://blogs.clariusconsulting.net/kzu/evolving-an-api-without-breaking-clients-via-extension-methods-obsoleteattribute-and-editorbrowsableattribute/> "Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute")

January 8, 2009 3:14 pm

API evolution is tough and versioning is a complex enough issue that deserves not one but several posts. So I will only focus on one specific kind of evolution and backwards compatibility: [Source](<http://en.wikipedia.org/wiki/Source_code_compatibility>) [Compatibility](<http://en.wikipedia.org/wiki/Backward_compatibility>).

Let’s say you have a class with a given functionality:
    
    
    public class Mock
    {
        public void VerifyAll()
        {
            // ...
        }
    }

At a certain point, let’s say you realize it was not such a good idea to have that method, and would rather have people using another method by default, but still being able to opt-in to the “old” behavior. One way of achieving this is to move this method to a new assembly (i.e. MyProduct.Legacy.dll), as an extension method:
    
    
    public static class MockExtensions
    {
        public static void VerifyAll(this Mock mock)
        {
            // ...
        }
    }
    

[](<http://11011.net/software/vspaste>)

Existing code can remain unchanged, and you only need to add a reference to the newly created “legacy support” assembly to recompile:
    
    
    public void Test()
    {
        var mock = new Mock();
        // ...
        mock.VerifyAll();
    }
    

[](<http://11011.net/software/vspaste>)

A slightly different scenario, is where you have an existing method that you want to deprecate from the core API (i.e. you renamed a method). In this case, you can still move the existing behavior to the new “legacy support” assembly, but you don’t want the obsolete member to appear in intellisense at all. It’s there just to get source compatibility: 
    
    
    public static class MockExtensions
    {
        [Obsolete("Expect has been renamed to Setup.", false)]
        [EditorBrowsable(EditorBrowsableState.Never)]
        public static ISetup Expect<T>(this Mock<T> mock, Expression<Action<T>> expression)
            where T : class
        {
            // ...
        }
    }
    

[](<http://11011.net/software/vspaste>)

The [ObsoleteAttribute](<http://msdn.microsoft.com/en-us/library/system.obsoleteattribute.aspx>) is there to remind developers that they should be using the new feature, but it doesn’t cause a compile error (otherwise it wouldn’t be source compatible, would it?). 

The [EditorBrowsableAttribute](<http://msdn.microsoft.com/en-us/library/system.componentmodel.editorbrowsableattribute.aspx>) is there to hide the obsolete member from users (doesn’t show up in intellisense), so that new functionality is always using the new API.

This approach ensures that existing users know where legacy features went (you get a compile warning from the Obsolete attribute), while new users/functionality don’t get confused with backwards-compatible APIs (they would typically NOT add a reference to a *.Legacy.dll on a new project).

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=115183)

Posted by kzu
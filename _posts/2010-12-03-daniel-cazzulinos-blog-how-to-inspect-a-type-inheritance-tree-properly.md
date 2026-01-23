---
layout: post
title: "Daniel Cazzulino's Blog : How to inspect a type inheritance tree properly"
date: 2010-12-03 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to inspect a type inheritance tree properly


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

Source code published in this blog is [public domain](http://en.wikipedia.org/wiki/Public_domain) unless otherwise specified.

[![](https://web.archive.org/web/20101205201116im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20101205201116im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20101205201116im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20101205201116im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20101205201116im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20101205201116im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[Translate this page](http://www.microsofttranslator.com/bv.aspx?a=http%3a%2f%2fwww.clariusconsulting.net%2f)  
Powered by [Microsoft® Translator](http://www.microsofttranslator.com/)

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## How to inspect a type inheritance tree properly 

You might think this is a trivial thing, with Type.BaseType and Type.GetInterfaces already there. But there's catch: the GetInterfaces method will give you all the implemented interfaces by the concrete type, as well as all its base types, as well as all the interfaces inherited by other interfaces it implements. What a mess! To make it more clear, say you have the following types:
    
    
        public interface IBase
        public class Base : IBase, ICloneable
        public class Derived : Base

If you do 
    
    
        typeof(Derived).GetInterfaces().ToList().ForEach(t => Console.WriteLine(t.FullName));
    

Here's what you get:
    
    
        Test.IBase
        System.ICloneable
    

If you look back to Derived definition, it doesn't implement any interfaces itself, but rather it's the base class. So, in order to have a more precise information about the type, we should be able to get this instead:
    
    
    Derived
        Base
            Object
            IBase
            ICloneable
    

Now, this could be very useful in a few scenarios. My particular one involves finding an adapter that is registered for the closest type to the actual instance (i.e. if I have adapters registered for Derived, IBase and ICloneable, I want to be able to give them priority automatically based on where they appear in the precise type hierarchy).

So in order to do this, the first thing I needed was a structure that could represent a Type and the list of its implemented interface and base type, where in turn every member is also a tuple of the Type and the list of its own interfaces and base type and so on. A recursive generics structure like:
    
    
        Tuple>>>>>
    

But of course that doesn't work ![Smile](/web/20101205201116im_/http://www.clariusconsulting.net/images/blogs/kzu/How-to-retrieve_8C9E/wlEmoticon-smile.png). As almost everything these days, I found the answer in [StackOverflow](http://stackoverflow.com/questions/647533/recursive-generic-types): just give the type a name so you can reference it in the type itself:
    
    
    public class TypeInheritance : Tuple>
    {
        public TypeInheritance(Type type)
            : base(type, new List())
        {
        }
    }
    

Now I need to populate the thing. I'm going to make this an extension method on Type for convenience. Let's first deal with the basic scenario of adding all the base classes recursively:
    
    
    public static TypeInheritance GetInheritanceTree(this Type type)
    {
        var list = new TypeInheritance(type);
    
        if (type.IsClass)
        {
            if (type.BaseType != null)
                list.Item2.Add(GetInheritanceTree(type.BaseType));
        }
    
        return list;
    }
    

In a test, I can easily build a helper that will print out the tree to the console:
    
    
    [TestMethod]
    public void WhenGettingInheritanceTree_ThenCanPrintIt()
    {
        PrintTypeList(typeof(Test.Derived).GetInheritanceTree1(), 0);
    }
    
    private void PrintTypeList(TypeInheritance list, int indentLevel)
    {
        Console.WriteLine(
            Enumerable.Range(0, indentLevel).Aggregate("", (s, level) => s += '\t') +
            list.Item1.Name);
    
        indentLevel++;
    
        foreach (var inner in list.Item2)
        {
            PrintTypeList(inner, indentLevel);
        }
    }
    

I tend to forget just how useful the [Aggregate](http://msdn.microsoft.com/en-us/vcsharp/aa336747.aspx) Linq extension method is. Here you can see it action building the indenting string based on the indent level that is incremented on each recursion. I'm sure there are many other ways of doing that ![Smile](/web/20101205201116im_/http://www.clariusconsulting.net/images/blogs/kzu/How-to-retrieve_8C9E/wlEmoticon-smile.png).

Ok, next, adding the interfaces, which is the interesting part of course ![Smile](/web/20101205201116im_/http://www.clariusconsulting.net/images/blogs/kzu/How-to-retrieve_8C9E/wlEmoticon-smile.png). In our sample hierarchy, we have:
    
    
    public interface IBase
    {
        string Name { get; set; }
    }
    
    public class Base : IBase, ICloneable
    {
        public virtual string Name { get; set; }
        public object Clone() { return this; }
    }
    
    public class Derived : Base
    {
    }
    

To add the interfaces we'll use an often-ignored member in the reflection API: [GetInterfaceMap](http://msdn.microsoft.com/en-us/library/system.type.getinterfacemap.aspx). This method gives us the mapping between the interface members and the actual methods implementing them. So we'll say that an interface should be added to a type inheritance list only if all its members have method mappings declared on the current type:
    
    
    public static TypeInheritance GetInheritanceTree(this Type type)
    {
        var list = new TypeInheritance(type);
    
        if (type.IsClass)
        {
            if (type.BaseType != null)
                list.Item2.Add(GetInheritanceTree(type.BaseType));
    
            list.Item2.AddRange(type
                // Add all interfaces of the type, but
                .GetInterfaces()
                // See if the map gives us where the interface members are implemented
                .Select(i => new { Interface = i, Map = type.GetInterfaceMap(i) })
                .Where(i => i.Map.TargetMethods.All(m => m.DeclaringType == type))
                .Select(i => GetInheritanceTree(i.Interface)));
        }
    
        return list;
    }

So there you can see we only add the interfaces where all target methods are declared in the current type. The result now is:
    
    
    Derived
        Base
            Object
            IBase
            ICloneable
    

Now, what about interface inheritance? Let's try adding one to IBase:
    
    
    public interface IBase : IFormattable
    

Now, re-running (after providing a dummy implementation in Base) shields:
    
    
    Derived
        Base
            Object
            IBase
            IFormattable
            ICloneable
    

Ok, essentially, we need to implement the case where the type is not a Class ![Smile](/web/20101205201116im_/http://www.clariusconsulting.net/images/blogs/kzu/How-to-retrieve_8C9E/wlEmoticon-smile.png). So we first need to get the IFormattable interface out of under the Base class. For that, we can just look at all the interfaces we get from Reflection (remember we'll get also interfaces that are inherited by other interfaces we actually implement), and get all the interfaces, recursively, that we get up the hierarchy. With that list, we can quickly discard interfaces that seem "top-level" (i.e. IFormattable under Base) because it already shows up somewhere up the hierarchy of IBase. I have a helper Flatten method that does exactly what Matt Warren shows in the [MSDN forums](http://social.msdn.microsoft.com/forums/en-US/linqprojectgeneral/thread/fe3d441d-1e49-4855-8ae8-60068b3ef741/), and with that, I only need to add a Where to the AddRange:
    
    
    public static TypeInheritance GetInheritanceTree(this Type type)
    {
        var list = new TypeInheritance(type);
    
        // Gives us a map of Interface + All ancestor interfaces in the entire hierarchy up.
        var interfaces = type
            .GetInterfaces()
            .Select(i => new { Interface = i, Ancestors = i.GetInterfaces().Flatten(n => n.GetInterfaces()) });
    
        if (type.IsClass)
        {
            if (type.BaseType != null)
                list.Item2.Add(GetInheritanceTree(type.BaseType));
    
            list.Item2.AddRange(type
                // Add all interfaces of the type, but
                .GetInterfaces()
                // Skip all interfaces that appear already somewhere else up in the hierarchy of interfaces.
                .Where(i => !interfaces.SelectMany(n => n.Ancestors).Any(t => t == i))
                // See if the map gives us where the interface members are implemented
                .Select(i => new { Interface = i, Map = type.GetInterfaceMap(i) })
                .Where(i => i.Map.TargetMethods.All(m => m.DeclaringType == type))
                .Select(i => GetInheritanceTree(i.Interface)));
        }
    
        return list;
    }

That gives us:
    
    
    Derived
        Base
            Object
            IBase
            ICloneable

Now we need add the case where type.IsClass is false (so we're for example in IBase and we want IFormattable to be added). We just need to add the interfaces from the flattened list we built above, that do not show up elsewhere in the hierarchy, and that's our final implementation:
    
    
    public static TypeInheritance GetInheritanceTree(this Type type)
    {
        var list = new TypeInheritance(type);
    
        // Gives us a map of Interface + All ancestor interfaces in the entire hierarchy up.
        var interfaces = type
            .GetInterfaces()
            .Select(i => new { Interface = i, Ancestors = i.GetInterfaces().Flatten(n => n.GetInterfaces()) });
    
        if (type.IsClass)
        {
            if (type.BaseType != null)
                list.Item2.Add(GetInheritanceTree(type.BaseType));
    
            list.Item2.AddRange(type
                // Add all interfaces of the type, but
                .GetInterfaces()
                .Where(i => !interfaces.SelectMany(n => n.Ancestors).Any(t => t == i))
                // See if the map gives us where the interface members are implemented
                .Select(i => new { Interface = i, Map = type.GetInterfaceMap(i) })
                // Either it is a marker interface, or all members are declared by the type.
                // (explicit interface implementation or otherwise we are the first class in the hierarchy to introduce the interface).
                .Where(i => i.Map.TargetMethods.All(m => m.DeclaringType == type))
                .Select(i => GetInheritanceTree(i.Interface)));
        }
        else
        {
            // Then we only add those interfaces that do not show up as ancestors in any other 
            // interface in the list.
            list.Item2.AddRange(interfaces
                .Select(i => i.Interface)
                .Where(i => !interfaces.SelectMany(n => n.Ancestors).Any(t => t == i))
                .Select(i => GetInheritanceTree(i)));
        }
    
        return list;
    }

Giving us the correct output:
    
    
    Derived
        Base
            Object
            IBase
                IFormattable
            ICloneable
    

Enjoy!

posted on Friday, December 03, 2010 8:14 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20101205201116im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
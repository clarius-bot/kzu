---
layout: post
title: "How extension methods ruined unit testing and OOP, and a way forward"
date: 2011-05-05 00:00:00 +0000
---

##  [How extension methods ruined unit testing and OOP, and a way forward](<http://blogs.clariusconsulting.net/kzu/how-extension-methods-ruined-unit-testing-and-oop-and-a-way-forward/> "How extension methods ruined unit testing and OOP, and a way forward")

May 5, 2011 6:04 am

You probably know I’m an advocate of a [particular way](<http://blogs.clariusconsulting.net/kzu/making-extension-methods-amenable-to-mocking/>) of [doing extension methods](<http://blogs.clariusconsulting.net/kzu/how-to-mock-extension-methods/>) that I call the “Extension Method Entry Point Pattern”, which makes it easier to mock them. 

This technique, while very useful and recommended for highly cohesive sets of extension methods over a given API, is not well suited for the kind of finer grained extension methods we see proliferating everywhere that are frequently just helpers to supplement core .NET libraries with perceived (or actual) missing functionality. Things like [FormatWith](<http://james.newtonking.com/archive/2008/03/29/formatwith-2-0-string-formatting-with-named-variables.aspx>), and a [myriad](<http://www.google.com.ar/search?q=extension+methods+library>) [others](<http://netfx.codeplex.com/>).

The problem with these extension method libraries is that you’re no longer shipping the *contracts*/interfaces for your APIs but the actual implementations! So, if you were building some kind of pluggable application and providing plugin authors with [a cool interface-based API](<http://clide.codeplex.com/>) and SDK for it, now every plugin carries its own copy of the *implementation* of all those helpers. And if you find bugs, you need to redist the fixes to everyone. And Dll hell might ensue with multiple versions laying around.

So you worked hard on designing a clean, interface-based intuitive API that you can use as a foundation where authors can plug in their stuff, and you didn’t provide a way to decouple the API extensions contracts (a.k.a. “extension methods” signatures) from their actual implementation. I can see the “Extension methods considered harmful” headline coming already.

## 

## Back to basics

If we go back to analyzing extension methods (of the finer-grained category), we can see that they can be treated in OOP fashion but on a more granular level:

  * Extension method signature == interface/contract: contracts are always Func or Action in their various generic overloads 
  * Extension method implementation == class: the body of the method is the equivalent of the class. 

You make the first public (and maybe even ship with a public SDK or NuGet or whatever), and the second internal and with a different shipping vehicle (i.e. built-in the product).

But clearly, we cannot consider a given extension method as just its signature in terms of arguments and optional return value (i.e. just a Func/Action), just like a strong typed language like C# or VB.NET doesn’t consider two objects of the same “shape” to be interchangeable (a.k.a. [duck typing](<http://en.wikipedia.org/wiki/Duck_typing>)). The method name is a key part of its “contract”.

Also, we can’t really decouple a Func from the method body pointed by it, so we need something in between to perform this decoupling. Enter API Extenders.

## API Extenders

The Func/Action that an extension method body represents can be trivially transformed into an instance method on a class pretty easily. Next, the extension method body can be replaced with code that lookups up somehow the implementation class and invokes it passing whatever arguments the extension method received. 

Let’s take an example:
    
    
    static string FormatWith(this string format, object with)
    {
      // the bunch of code we want to split apart
    }

And evolve it via a “pseudo”-code progression to take us to a decoupled design (~ indicates “tentative”/non-compiling code):

  1. Decouple method body 
         
         internal class FormatWithExtension
         {
             public string Execute(this string format, object with)
             {
               // the bunch of code we just split apart
             }
         }
         
         static string FormatWith(this string format, object with)
         {
           return FormatWithExtension.Execute(format, with);
         }

  2. Introduce registry of extenders 
         
         ~ Extenders.Register<FormatWithExtension>
         
         static string FormatWith(this string format, object with)
         {
           ~ return Extenders.Execute<FormatWithExtension>(format, with);
         }

  3. Introduce extender interface for method contract 
         
         internal class FormatWithExtension : IExtenderFunc<string, object, string>

  4. Decouple implementation concrete type dependency with contract "shape" and "name" 
         
         ~ Extenders.Register<FormatWithExtension>("FormatWithExtension")
                    .As<IExtenderFunc<string, object, string>>()
         
         static string FormatWith(this string format, object with)
         {
           ~ return Extenders.LookupFunc<string, object, string>("FormatWithExtension").Execute(format, with);
         }

  5. Automate registration via IoC-style discovery 
         
         [Extender("FormatWith")]
         internal class FormatWithExtension : IExtenderFunc<string, object, string>
         
         ~ Extenders.RegisterTypes()
                    .Implementing<IExtender[Func or Action]>()
                    .WithName(ExtenderAttribute.Name)

  6. Remove client knowledge about IExtender, everything’s a Func or an Action ultimately 
         
         static string FormatWith(this string format, object with)
         {
           return Extenders.Func<string, object, string>("FormatWithExtension").Invoke(format, with);
         }

  7. Optionally, turn extender names into constants, probably even code-generated at build time so you always get them in sync.  

After this refactoring is done, implementing a new “API extender” (a.k.a. “OOP extension methods”) is easy:
    
    
    // internal assembly
    [Extender(Extenders.Names.Project.Reload)]
    internal class ProjectReload : IExtenderAction<IProject>
    {
        public void Execute(IProject project)
        {
            // 252 LoC to do this with VS ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif)
        }
    }
    
    // public interfaces/SDK assembly
    public static class Project
    {
        public static void Reload(this IProject project)
        {
            Extenders.Action<IProject>(Extenders.Names.Project.Reload).Invoke(project);
        }
    }

That doesn’t seem too complicated given the benefits, does it?

Next post we’ll look at the implementation and I’ll post the source.

Stay tunned!

/kzu

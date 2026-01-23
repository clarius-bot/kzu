---
layout: post
title: "How to improve string resources usability"
date: 2011-07-13 00:00:00 +0000
---

##  [How to improve string resources usability](<http://blogs.clariusconsulting.net/kzu/how-to-improve-string-resources-usability/> "How to improve string resources usability")

July 13, 2011 5:47 am

(cross-posted from [NETFx](<https://bit.ly/rnpM7S>))

Somehow we ended up with a stagnating code generator for .resx built-in VS and we just got used to its shortcomings.

Namely:

  1. No support for formatting arguments: while you can set your resource string value to contain {0} and the like, the generator knows nothing about them. Meaning you have to write the repetitive and boring formatting code on the caller side. For example, for a resource string with Name=”User_InvalidEmail” and Value=”Provided email ‘{0}’ is invalid.”: 
         
         throw new ArgumentException(string.Format(CultureInfo.CurrentCulture, Resources.User_InvalidEmail, email)); 

(always the same code!!) 

The bigger problem with this though is that it’s easy to make mistakes, like forgetting one replacement argument, or providing an extra one we think will end up in the formatted string but it doesn’t because we forgot to add it to the value format expression. The compiler can’t help us here. Not good for refactoring string when they go through a proper technical writer review… 

  2. No logical organization whatesoever: most devs I know (including myself) use underscores to group logically related strings, like “Orders_InvalidDate”, “User_InvalidEmail”, etc. The generator has no way of structuring the strings in any way, so you’re left with a huge intellisense list of members for every single localized string in your assembly. One workaround I’ve seen some use is to have separate .resx files per area, but this increases the burden on documentation reviewers and translators. It also leads to inconsistency as in some (many) cases it’s overkill to have one file for two or three strings in an area, so you end up grouping all small areas into the big ugly single resource file and only the areas that “deserve” it get a proper resource file. 

And to think all it takes to make things better is just a [T4 template](<http://www.hanselman.com/blog/T4TextTemplateTransformationToolkitCodeGenerationBestKeptVisualStudioSecret.aspx>)!!!

The [netfx-System.StringResources](<https://bit.ly/oCEsLz>) package provides that very template in a simple to use way. When it’s installed, a new Resources.tt file is added to your Properties folder, alongside your existing (or to be created) Resources.resx file.

The template automatically processes the .resx file whenever its associated custom tool is run by right-clicking the template and selecting “Run Custom Tool”, which also happens automatically when you install the package. So you end up with something like this:

[![image5](http://blogs.clariusconsulting.net/kzu/files/2011/07/image5_thumb1.png)](<http://blogs.clariusconsulting.net/kzu/files/2011/07/image51.png>)

The resulting generated class is named Strings (under the same namespace as your existing Resources class) and solves both problems above by building on top of the built-in generated Resources class in the following ways:

  1. Whenever a formatting argument is found in the resource value, a method instead of a property is generated to access the localized value. So for example for a string resource named “Formatted” with a value of “Should {0} be {1}?”, the following method can be called by consumers: 
         
         Console.WriteLine(Strings.Formatted(“foo”, 25));

The generated method is: 
         
         /// <summary>
         /// Looks up a localized string similar to: Should {0} be {1}?
         /// </summary>
         public static string Formatted(object arg0, object arg1)
         {
             return string.Format(
                 CultureInfo.CurrentCulture,
                 Resources.Formatted,
                 arg0, arg1);
         }

Note that the method is duplicating behavior already existing in the Resources class, and it’s just layering on top the improved API. You obviously can’t forget to pass one of the replacement values into the method, neither can you pass more than what’s defined in the string value. 

  2. Formatting arguments can be named for self-documentation. So for example for a string resource named “User_InvalidEmail” with a value of “Supplied email ‘{email}’ is not from the required domain {domain}.”, the following method can be called by consumers:  

    
    Console.WriteLine(Strings.User.InvalidEmail(email, “foo.com”));

The generated method is: 
    
    /// <summary>
    /// Looks up a localized string similar to: Supplied email ‘{email}’ is not from the required domain {domain}.”
    /// </summary>
    public static string Formatted(object email, object domain)
    {
        return string.Format(
            CultureInfo.CurrentCulture,
            Resources.Formatted,
            arg0, arg1);
    }

  3. Whenever an underscore is found in the resource name, a nested static class is generated to contain the accessors for resources in that logical area. So given a string resource named “User_InvalidEmail” with a value of “Provided email ‘{0}’ is invalid.”, it would be accessed like: 
         
         throw new ArgumentException(Strings.User.InvalidEmail(email));

Multiple levels of nesting are supported. 

And that’s it. The simplest thing that could possibly work and make your developer’s life just a tiny bit happier [![wlEmoticon-smile2](http://blogs.clariusconsulting.net/kzu/files/2011/07/wlEmoticon-smile2_thumb1.png)](<http://blogs.clariusconsulting.net/kzu/files/2011/07/wlEmoticon-smile21.png>)

Posted by kzu

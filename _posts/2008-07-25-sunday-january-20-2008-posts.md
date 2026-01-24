---
layout: post
title: "Daniel Cazzulino's Blog - Sunday, January 20, 2008 - Posts"
date: 2008-07-25 00:00:00 +0000
---

## Sunday, January 20, 2008 - Posts

#####  [Beware of typeparamref XML documentation tag](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/20/BewareoftypeparamrefXMLdocumentationtag.aspx)

Most projects use "Warnings as Errors" project-level setting together with the "XML documentation file" so that you can spot early on which areas of your public APIs are not documented or have broken links etc. in it. I've come to rely on it, especially in the face of refactoring, which even in VS2008 still doesn't refactor code documentation references.

If the refactoring engine can't fix documentation references for me, I want to get compilation errors at least. 

Turns out that unlike the paramref and typeparam tags, typeparamref is not validated and will NOT issue warnings when it's out of sync with your codebase (i.e. you renamed a type parameter from a function or type).

The following will compile fine:
    
    
    /// <summary>
    /// Foo is great. And it has a <typeparamref name="TInvalid"/>.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class Foo<T>
    {
        /// <summary>
        /// Foo as a <typeparamref name="RInvalid"/> argument.
        /// </summary>
        /// <typeparam name="R"></typeparam>
        /// <param name="arg"></param>
        /// <param name="value"></param>
        public void Do<R>(string arg, R value)
        {
        }
    }
    

[](http://11011.net/software/vspaste)

I bet more than one product will ship with broken links in the doc... (dunno how important is for documentation consumers that links to the documentation of a generic paramter is accurate...). [Go vote the bug](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=323159) and let's find out!

posted [Sunday, January 20, 2008 6:36 PM](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/20/BewareoftypeparamrefXMLdocumentationtag.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/20/BewareoftypeparamrefXMLdocumentationtag.aspx#comments)

#####  [Pipelines Using Iterators, Lambda Expressions and Extension Methods in C# 3.0](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/20/PipelinesUsingIteratorsLambdaExpressionsExtensionMethods.aspx)

Inspired by [Pipelines Using Fibers in Ruby 1.9](http://pragdave.blogs.pragprog.com/pragdave/2007/12/pipelines-using.html), I set to explore what could be done with C# 3.0 in the same area. I'll also follow that article's overall structure.

Building a pipeline is all about chaining together simple reusable commands so that the output of one is the input of the next. Same principle [PowerShell](http://en.wikipedia.org/wiki/Windows_PowerShell) uses, as well most other command-line shells.

Reusing the commands allows you to focus on simpler primitives and achieve more complicated tasks via their composition through the pipeline.

By the end of this post, we'll get to a syntax like the following:
    
    
    				var pipeline = Evens()  
        .Pipe(x => x * 3)            // Tripler  
        .Pipe(x => x + 1)            // Incrementer  
        .Filter(x => x % 5 == 0);    // Filter  
    
    
    
    				var palindromes = words  
        .Pipe(x => new { Original = x, Normalized = x.ToLower() })  
        .Pipe(x => new { Original = x.Original, Forwards = x.Normalized, Backwards = x.Normalized.Reverse() })  
        .Pipe(x => x.Forwards == x.Backwards ? "'" + x.Original + "' is a palindrome" : "'" + x.Original + "' is not a palindrome");  
    

[ ](http://11011.net/software/vspaste)

## The basics

I really like [Dave Thomas](http://pragdave.blogs.pragprog.com/pragdave/) explanation of what a fiber is:

> A fiber is somewhat like a thread, except you have control over when it gets scheduled. Initially, a fiber is suspended. When you resume it, it runs the block until the block finishes, or it hits a `Fiber.yield`. This is similar to a regular block yield: it suspends the fiber and passes control back to the `resume`. Any value passed to `Fiber.yield` becomes the value returned by `resume`.

If you replace "fiber" with "iterator" (in the [yield return](http://msdn2.microsoft.com/en-us/library/65zzykke.aspx) sense) and "Fiber.yield" with "yield return", the description is very well suited for those C# concepts too.

The first step will be to create an "iteration function" (I'll name this way a method that returns an IEnumerable using yield return) that returns even numbers:
    
    
    				static 
    				IEnumerable<int> Evens()  
    {  
      int i = 0;  
      while (true)  
      {  
        yield return i;  
        i += 2;  
      }  
    }  
    

[ ](http://11011.net/software/vspaste)

Now, let's add another iterator that only lets multiples of three pass:
    
    
    				static 
    				IEnumerable<int> MultiplesOfThree(IEnumerable<int> source)  
    {  
      foreach (var item in source)  
      {  
        if (item % 3 == 0)  
          yield return item;  
      }  
    }  
    

[ ](http://11011.net/software/vspaste)

And the consumer of these would print the first 10 results like so:
    
    
    				static void Consumer(IEnumerable<int> source)  
    {  
      int i = 0;  
      foreach (var item in numbers)  
      {  
        Console.WriteLine(item);  
        i++;  
        if (i >= 10) break;  
      }  
    }  
    

The regular of chaining these two functions and print the first 4 results would be:
    
    
    Consumer(MultiplesOfThree(Evens()));

Running it, we would get the output:
    
    
    				0  
    6  
    12  
    18  
    ...
    		

Before moving on to improve the pipeline itself, let's add some syntactic sugar to the consumer via extension methods. If you read Dave's article you will notice that the Ruby consumer is much more compact:
    
    
    				    def consumer(source)  
          Fiber.new do  
            10.times do  
              next_value = source.resume  
              puts next_value  
            end  
          end  
        end
    		

We can do better than what we have now in C# 3.0 too:
    
    
    				public static class 
    				BclExtensions  
    {  
      public static void Times<T>(this int count, IEnumerable<T> source, Action<T> action)  
      {  
        int i = 0;  
        foreach (var item in source)  
        {  
          action(item);  
          i++;  
          if (i == count)  
            break;  
        }  
      }  
    }  
    

[ ](http://11011.net/software/vspaste)

This class allows us to call a Times() method on integers, passing the enumeration source and an action to execute. Our consumer now becomes much more compact:
    
    
    				static void Consumer(IEnumerable<int> source)  
    {  
        10.Times(source, x => Console.WriteLine(x));  
    }  
    

[ ](http://11011.net/software/vspaste)

Note how the <T> in the method call is typically not needed, as the type inferencing will do its job as soon as we pass the method arguments and "fix" the T.

  
MUCH better, right? You gotta love the combination of extension methods and lambdas... 

Still, as noted by Dave, the chaining looks backwards. Instead of:
    
    
    Consumer(MultiplesOfThree(Evens()));

we'd like to write something like 
    
    
    Evens       
    to_word_info = Transformer.new do       if word_info.forwards == word_info.backwords  
        "'#{word_info.original}' is a palindrome"  
      else  
        "'#{word_info.original}' is not a palindrome"  
      end  
    end  
      
    pipeline = words     		

That line of Ruby code is the key. You see, it's possible to assign the transforming filter to a variable and reuse it, pass it around, etc. On the other hand, the following is invalid in C# 3.0:
    
    
    				var transformer = x => new { Original = x, Normalized = x.ToLower() };

[ ](http://11011.net/software/vspaste)

Compiler error is:

> Cannot assign lambda expression to an implicitly-typed local variable

And of course, being an anonymous type, there's no way to tell the compiler which specific Func<T,R> that lambda is either. How would you refer to the anonymous type on the variable type declaration?
    
    
    Func<string, {string Original, string Normalized}> transformer = x => new { Original = x, Normalized = x.ToLower() };

It's plain ugly and verbose, I know. 

This doesn't seem like a very serious drawback on the surface, until you realize that the whole point of pipelines is to have *reusable* filters that you stitch together to accomplish tasks. So, you can't use fancy projections unless you're OK giving up reuse outside of a method.

## What's the point?

It was fun for one thing ;). It also starts opening your mind regarding reuse at the function level rather the interface/class level. 

C# 3.0 is the absolutely best version ever. Programming is becoming so damn interesting!

posted [Sunday, January 20, 2008 7:29 PM](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/20/PipelinesUsingIteratorsLambdaExpressionsExtensionMethods.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [2 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/20/PipelinesUsingIteratorsLambdaExpressionsExtensionMethods.aspx#comments)

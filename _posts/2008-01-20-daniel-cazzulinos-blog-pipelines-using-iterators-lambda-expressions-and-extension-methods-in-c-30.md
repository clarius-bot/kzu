---
layout: post
title: "Daniel Cazzulino's Blog : Pipelines Using Iterators, Lambda Expressions and Extension Methods in C# 3.0"
date: 2008-01-20 00:00:00 +0000
---

Daniel Cazzulino's Blog : Pipelines Using Iterators, Lambda Expressions and Extension Methods in C# 3.0

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3013'\))| May 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3074'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| 3  
[4](http://www.clariusconsulting.net/blogs/kzu/archive/2008/1/4.aspx "1 Post")| 5| 6| 7| 8| 9| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| [20](http://www.clariusconsulting.net/blogs/kzu/archive/2008/1/20.aspx "2 Posts")| 21| 22| 23| 24  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080508023252im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080508023252im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080508023252im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080508023252im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

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

## Pipelines Using Iterators, Lambda Expressions and Extension Methods in C# 3.0 

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
    
    
    Evens | MultiplesOfThree | Consumer

## Improving the syntax

Unfortunately, the "|" is not a valid identifier in .NET so we can't overload its implementation like Dave does with Ruby. 

Another alternative would be so overload the "+" operator:
    
    
    Evens + MultiplesOfThree + Consumer

Turns out we can't implement it that way either, as extension methods cannot provide operator overload implementations :(.

So, all we're left is plain extension methods. When reading the following code, remember that any filter in the pipeline can have one one of three behaviors:

  1. Act on the value without changing the returned values (an action) 
  2. Change the returned value, by transforming or otherwise enriching it (a function) 
  3. Filter the returned values (a predicate) 

That translates in one extension method for each kind:
    
    
    				public static class 
    				PipeExtensions  
    {  
      public static IEnumerable<T> Pipe<T>(this IEnumerable<T> source, Action<T> action)  
      {  
        foreach (var item in source)  
        {  
          action(item);  
          yield return item;  
        }  
      }  
      
      
      public static IEnumerable<R> Pipe<T, R>(this IEnumerable<T> source, Func<T, R> transform)  
      {  
        foreach (var item in source)  
        {  
          yield return transform(item);  
        }  
      }  
      
      public static IEnumerable<T> Filter<T>(this IEnumerable<T> source, Predicate<T> filter)  
      {  
        foreach (var item in source)  
        {  
          if (filter(item))  
            yield return item;  
        }  
      }  
    }  
    

[ ](http://11011.net/software/vspaste) [ ](http://11011.net/software/vspaste) [ ](http://11011.net/software/vspaste)

Note that we moved the responsibility for iterating the source into the new extension methods to avoid that repeated code. Also, we had to create separate methods for "pipes" (either actions that do not modify the output or functions that transform it) and proper filters. It would have been great to be able to define the two behaviors as overloads of Pipe/Filter, but the C# compiler would complain about ambiguity between the Predicate<T> overload andÂ Func<T, bool> overload that has basically the same signature. Understandable, but annoying :(. It would have been great to have a single overload Pipe for all three. It's tempting to make the code interpret the Func<T,R> so as to treat the call as a filter if R is a boolean. But that's too subtle IMO and would not make the API as explicit. Also, you would be preventing filters that actually return a list of booleans.

Because we moved the iteration responsibility into the new extension methods, we will refactor our current iterators so that they plain functions working on one value at a time:
    
    
    				static bool MultiplesOfThree(int value)  
    {  
      return value % 3 == 0;  
    }  
      
    static void Consumer(int value)  
    {  
      Console.WriteLine(value);  
    }  
    

[ ](http://11011.net/software/vspaste)

Now we can write:
    
    
    Evens().Filter(MultiplesOfThree).Pipe(Consumer);

The only issue now is that if we run the above code, no values are printed at all!

Ah... the joys of lazy evaluation :). See, if you don't enumerate the pipeline, nothing gets executed whatsoever. None of the steps is evaluated. None. And this is a good thing, because it means you can have an infinite size input (in our case, the Evens implementation will never stop returning new even numbers) that you can process efficiently and in a streaming fashion. 

This basically means we have to take the consumer out of the pipe, or provide an overload to our Times integer extension method that provides just the enumeration of the source:
    
    
    				public static class 
    				BclExtensions  
    {  
      private static void NullAction<T>(T value) {}   
      
      public static void Times<T>(this int count, IEnumerable<T> source)  
      {  
        Times(count, source, NullAction);  
      }  
      
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

I'm really fond of the null object pattern and you can see how well it applies also to delegate-type parameters. 

Now the working pipeline would look like:
    
    
    10.Times(Evens().Filter(MultiplesOfThree).Pipe(Consumer));

Note that because iteration must happen outside of the pipeline, it might not make much to keep the Action<T> overload on Pipe, as the ultimate consumer will always have to iterate outside. It's a matter of personal preference I guess.

## The way of the lambda

You might have noticed that our filter and action are one-liners, and that they can easily be passed inline on the call:
    
    
    				var pipeline = Evens()  
        .Filter(x => x % 3 == 0)  
        .Pipe(x => Console.WriteLine(x));  
      
    10.Times(pipeline);  
    

[ ](http://11011.net/software/vspaste) [ ](http://11011.net/software/vspaste) [ ](http://11011.net/software/vspaste)

That's a fairly nice syntax, I think. 

The other examples from Dave's post look like the following now:
    
    
    				var pipeline = Evens()  
        .Pipe(x => x * 3)            // Tripler  
        .Pipe(x => x + 1)            // Incrementer  
        .Filter(x => x % 5 == 0);    // Filter  
      
    5.Times(pipeline, x => Console.WriteLine(x));  
    

[ ](http://11011.net/software/vspaste)

which prints:
    
    
    25  
    55  
    85  
    115  
    145  
    ----

and the palindromes finder one, which includes projection of new types within the pipeline:
    
    
    				var words = "Madam, the civic radar rotator is not level".Split(' ');  
      
    var palindromes = words  
        .Pipe(x => new { Original = x, Normalized = x.ToLower() })  
        .Pipe(x => new { Original = x.Original, Forwards = x.Normalized, Backwards = x.Normalized.Reverse() })  
        .Pipe(x => x.Forwards == x.Backwards ? "'" + x.Original + "' is a palindrome" : "'" + x.Original + "' is not a palindrome");  
      
    palindromes.ForEach(x => Console.WriteLine(x));  
    

[ ](http://11011.net/software/vspaste) [ ](http://11011.net/software/vspaste)

(I added a ForEach extension method to IEnumerable<T>. How come it's missing in .NET 3.5? :S)

Let's compare to the same in Ruby:
    
    
    				WordInfo = Struct.new(:original, :forwards, :backwords)  
      
    words = Pump.new %w{Madam, the civic radar rotator is not level.}  
      
    normalize = Transformer.new {|word| [word, word.downcase.tr("^a-z", '')] }  
      
    to_word_info = Transformer.new do |word, normalized|  
      reversed = normalized.reverse  
      WordInfo.new(word, normalized, reversed)  
    end  
      
    formatter = Transformer.new do |word_info|  
      if word_info.forwards == word_info.backwords  
        "'#{word_info.original}' is a palindrome"  
      else  
        "'#{word_info.original}' is not a palindrome"  
      end  
    end  
      
    pipeline = words | normalize | to_word_info | formatter  
      
    while word = pipeline.resume  
      puts word  
    end
    		

Wow. That's 8 lines of C# 3.0 vs 18 lines of Ruby 1.9! Impressive.

## What's missing

There's one drawback though in the C# 3.0 lambda + anonymous types approach. Here's a hint:
    
    
    				normalize = Transformer.new {|word| [word, word.downcase.tr("^a-z", '')] }
    		

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

posted on Sunday, January 20, 2008 7:29 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/53052.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/20/PipelinesUsingIteratorsLambdaExpressionsExtensionMethods.aspx#53054 "permalink") Pipelines Using Iterators, Lambda Expressions and Extension Methods in C# 3.0 @ Sunday, January 20, 2008 6:38 PM

Inspired by Pipelines Using Fibers in Ruby 1.9 , I set to explore what could be done with C# 3.0 in the [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/01/20/pipelines-using-iterators-lambda-expressions-and-extension-methods-in-c-3-0.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/20/PipelinesUsingIteratorsLambdaExpressionsExtensionMethods.aspx#59725 "permalink") C# 3.0 Lambdas and Type Inference @ Monday, April 14, 2008 2:04 PM

Daniel Cazzulino recently wrote a blog entry whose main focus was on building pipelines using iterators [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://askwayne.net/blogs/dotnetmash/archive/2008/03/17/c-3-0-lambdas-and-type-inference.aspx "TrackBack")

  

[![](/web/20080508023252im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: Writing meaningful, self-documenting, behavior-oriented tests
date: 2009-10-01 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/writing-meaningful-self-documenting-behavior-oriented-tests
tags:
- .NET

---

Over the years I've come to realize that the one-fixture-per-class approach to unit testing just doesn't scale. As the amount of variations in state and interactions increases, that file starts becoming a big soup of "Should" methods that are increasingly difficult to traverse and find later on. Essentially, since every test is doing the first "A" in AAA (Arrange-Act-Assert) too, that means the context is also part of the test method.

You can only make a method so long and remain understandable at a glance: IfRepositoryContainsACustomerAndAddingANewOneWithSameIdButDifferentAliasThenThrowsInvalidArgumentException. So, a while ago at Clarius [we started exploring](http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/13/120996.aspx) some of the concepts behind BDD (Behavior Driven Development), Context/Specification, etc., while working on an internal project. 

I was more than pleased with the compromise we made to accommodate our current tools, and to land in a place that is not totally alien for the regular "barebones"TDD guy. I'm convinced that changing paradigms just for this isn't probably worth it.

In my last post I hinted at one of the core values I see with TDD/unit testing: self-documenting code. Any kind of non-trivial code will involve a series of back and forth with the customer, numerous changes to a written spec (if you're lucky to have one) and its increasing and inevitable obsolescence. In most cases where I'm given enough freedom (i.e. the customer knows us well and trusts our development process and guaranteed quality), I usually get very few written specs, if any. A lot of details are just talked over standup (or IP), and many details are left for us to figure out. And that's fine: that's the reason you're the one with the keyboard writing code, and with the brains to make reasonable design choices if you understand the problem space well enough.

You could get picky with the customer and start asking for explicit definitions for everything. Tried that too, doesn't get you too far. In a short term, you're either out of the project 'cause you're too much of an overhead to an already busy person, or the customer gets even more exasperatingly vague and confusing as he tries hard to explain in detail something that doesn't even know yet for sure, while leaving crucial execution paths out, at which point you either quit politely, or go "don't worry, let me figure that out for you". Back to square zero.

The fact that the customer didn't know quite yet what he wanted, does certainly mean he doesn't want to know what he's getting. What you thought it was that he needed. So, you need to write whatever you write in such a way that it's easy to transform into a human-readable form that you can hand out to your customer. 

So, without further ado, here's the way we write tests:
    
    
    namespace Runtime.Workflow.JoinSpec
    {
       [TestClass]
       public class GivenAJoinWithTwoPredecessorsAndOneSuccessor
       {
         // ctor builds up the context
    
         [TestMethod]
         public void WhenAPredecessorIsAvailable_ThenJoinIsBlocked()
         {
           // set predecesor state,  
           // verify the join has the given state
         }
    
         [TestMethod]
         public void WhenBothPredecessorsAreFinished_ThenJoinIsFinished()
         {
           // set predecesor state  
           // verify the join changed state to Finished
         }
       }
    }

How it works:

  * The last part of the namespace becomes the logical grouping of the tests. This typically is the name of the class under test plus the "Spec" suffix. 
  * The test class starts with "Given" and the phrase that follows describes what's instantiated in the constructor and typically stored in fields for use by tests. The Given is the Arrange in AAA. 
  * Test methods have two parts: "When" and "Then", separated by an underscore. 
    * When: describes the action or state change that is caused in the context to perform the test. This is the Act in AAA. This is typically just one operation, but it could be more if changing the state/acting requires so. 
    * Then: the Assert in AAA. Typically just one Assert or mock Verify, but there could be more than one if verifying the state/interactions require so. But in either case, the Then should describe what you're asserting.

Key benefits of this approach:

  * This is plain MSTest code. You could as well use xUnit, NUnit, etc. No new paradigms to learn, just some naming conventions. 
  * The only additional "overhead" is having a separate context (Given) class to group related tests (those tests that use the same setup). 
  * Having a convention in place for how to write tests has proven immensely valuable on its own. I can navigate our tests and not tell the difference on who wrote which tests. 
  * It triggers good practices about test complexity almost automatically: because context + tests have to make sense as an english phrase, sometimes you realize that a given test is testing too much (the test method becomes TOOOO long to write). 
  * It's trivial to write code that uses reflection to render this as a document

We use this as a guideline. There's no requirement that we have a context class. Sometimes, it's just not worth it because you're testing a very small unit. In this case, the *Spec becomes the class, such as:
    
    
    namespace Runtime.Workflow
    {
       [TestClass]
       public class FinalSpec  
       {  
       }  
    }

This is typically more the exception than the rule, though. 

To render specs I quickly put together a query that uses reflection:
    
    
    public class RenderSpecs
    {
        public void Render()
        {
            // Change and run with TestDriven.NET to get the specs for a given 
            // namespace:
            Render("Runtime.Workflow", Console.Out);
        }
    
        public void RenderAllSpecs()
        {
            using (var stream = File.Open(@"..\..\Specs.txt", FileMode.Create))
            using (var writer = new StreamWriter(stream))
            {
                Render("", writer);
            }
        }
    
        private void Render(string withinNamespace, TextWriter output)
        {
            var specs = (from type in this.GetType().Assembly.GetTypes()
                         where type.Namespace != null && type.Namespace.StartsWith(withinNamespace) &&
                             type.GetCustomAttributes(true).OfType<TestClassAttribute>().Any()
                         from method in type.GetMethods()
                         where method.GetCustomAttributes(true).OfType<TestMethodAttribute>().Any() &&
                            method.Name.StartsWith("When")
                         orderby type.Namespace, type.Name
                         select new
                         {
                             Type = type, 
                             Method = method,
                             //Phrase = method.Name,
                             When = ToPhrase(method.Name.Substring(0, method.Name.IndexOf('_'))),
                             Then = ToPhrase(method.Name.Substring(method.Name.IndexOf('_') + 1)),
                         })
                        .GroupBy(x => x.Type)
                        .OrderBy(x => x.Key.FullName)
                        .GroupBy(x => x.Key.Namespace);
    
            foreach (var ns in specs)
            {
                output.WriteLine(new string('-', 50));
                output.WriteLine(ToPhrase(ns.Key.Split('.').Last(), false));
    
                foreach (var context in ns)
                {
                    output.WriteLine("    " + ToPhrase(context.Key.Name));
                    foreach (var spec in context.OrderBy(spec => spec.When).ThenBy(spec => spec.Then))
                    {
                        output.WriteLine( "        " + spec.When + ", " + spec.Then);
                        //Console.WriteLine("\t" + spec.Phrase);
                    }
                }
            }
        }
    
        private static string ToPhrase(string pascalCasedPhrase)
        {
            return ToPhrase(pascalCasedPhrase, true);
        }
    
    
        private static string ToPhrase(string pascalCasedPhrase, bool toLower)
        {
            var builder = new StringBuilder();
            builder.Append(pascalCasedPhrase.First());
    
            for (int i = 1; i < pascalCasedPhrase.Length; i++)
            {
                if (Char.IsUpper(pascalCasedPhrase[i]))
                    builder.Append(" ");
    
                builder.Append(pascalCasedPhrase[i]);
            }
    
            var phrase = builder.ToString();
    
            if (toLower)
            {
                phrase = phrase.ToLower(CultureInfo.CurrentCulture);
                // Make only When and Then upper case
                phrase = phrase.Replace("given", "Given").Replace("when", "When").Replace("then", "Then");
            }
    
            return phrase;
        }
    }
    

Note that this class is not a test class or test method. That's because we render on-demand. When I need to discuss or explain how a given area works, I'll go and render the specs first, email it and then meet. To run the Render method, I use [TestDriven.NET](http://testdriven.net/) which can run any method on any class (with a default constructor). I use it to run all tests too :), it's SOOOO much speedier than the VS runner...

/kzu

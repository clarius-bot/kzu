---
layout: post
title: 'NuDoc: A .NET XML API Documentation Reader'
date: 2013-06-11 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/nudoc-a-net-xml-api-documentation-reader
tags:
- .NET

---

A couple days ago I was toying with the idea of generating a static API documentation site in markdown ready for hosting in GitHub. The idea is to make it part of the project wiki, so that anyone can very easily improve the code documentation, and later on somehow allow project authors/contributors to merge back the edited markdown as XML documentation in the code itself, so that the cycle is closed.

So I set out to spike the idea, and the first thing I encountered was that reading XML documentation was something that you either had to do by just using XML APIs in .NET, or you had to use some big piece of software that not only reads documentation but it also can generate an entire site already, in multiple formats with plugins and formatters and what-not. There was no middle ground.

So, instead of building my XML doc <-> markdown wiki synchronizer, I first had to build a simple XML documentation reading  API. Straight from theNuDoc site:

![:)](/img/2013-06-11-1.gif)

# NuDoc: A .NET XML API Documentation Reader

![Icon](/img/2013-06-11-1.png)

A standalone API to read .NET XML documentation files and optionally augment it with reflection information.

NuDoc provides a simple and intuitive API that reads .NET XML documentation files into an in-memory model that can be easily used to generate alternative representations or arbitrary processing. If the read operation is performed using a .NET assembly rather than an XML file, NuDoc will automatically add the reflection information to the in-memory model for the documentation elements, making it very easy to post-process them by grouping by type, namespace, etc.

NuDoc leverages two well-known patterns: theVisitorpattern and theCompositepattern. Essentially, every member in the documentation file is represented as a separate “visitable” type. By simply writing a NuDocVisitor-derived class, you can process only the elements you’re interested in.

NuDoc can read documentation files from any CIL assembly, and the source tree has explicit unit tests that do so for all major .NET platforms: .NET, WinRT/Metro, Windows Phone and Silverlight.

# How to Install

NuDoc is a single assembly with no external dependencies whatsoever and is distributed as aNuGetpackage. It can be installed issuing the following command in thePackage Manager Console:

```
PM> Install-Package NuDoc

```

```
PM> Install-Package NuDoc

```

# Sample code

This is a sample visitor that generates markdown content from member summaries:

```
    public class MarkdownVisitor : Visitor
    {
        public override void VisitMember(Member member)
        {
            Console.WriteLine();
            Console.WriteLine(new string('-', 50));
            Console.WriteLine("# " + member.Id);
            base.VisitMember(member);
        }

        public override void VisitSummary(Summary summary)
        {
            Console.WriteLine();
            Console.WriteLine("## Summary");
            base.VisitSummary(summary);
        }

        public override void VisitRemarks(Remarks remarks)
        {
            Console.WriteLine();
            Console.WriteLine("## Remarks");
            base.VisitRemarks(remarks);
        }

        public override void VisitExample(Example example)
        {
            Console.WriteLine();
            Console.WriteLine("### Example");
            base.VisitExample(example);
        }

        public override void VisitC(C code)
        {
            // Wrap inline code in ` according to Markdown syntax.
            Console.Write(" `");
            Console.Write(code.Content);
            Console.Write("` ");

            base.VisitC(code);
        }

        public override void VisitCode(Code code)
        {
            Console.WriteLine();
            Console.WriteLine();

            // Indent code with 4 spaces according to Markdown syntax.
            foreach (var line in code.Content.Split(new[] { Environment.NewLine }, StringSplitOptions.None))
            {
                Console.Write("    ");
                Console.WriteLine(line);
            }

            Console.WriteLine();
            base.VisitCode(code);
        }

        public override void VisitText(Text text)
        {
            Console.Write(text.Content);
            base.VisitText(text);
        }

        public override void VisitPara(Para para)
        {
            Console.WriteLine();
            Console.WriteLine();
            base.VisitPara(para);
            Console.WriteLine();
            Console.WriteLine();
        }

        public override void VisitSee(See see)
        {
            var cref = NormalizeLink(see.Cref);
            Console.Write(" [{0}]({1}) ", cref.Substring(2), cref);
        }

        public override void VisitSeeAlso(SeeAlso seeAlso)
        {
            var cref = NormalizeLink(seeAlso.Cref);
            Console.WriteLine("[{0}]({1})", cref.Substring(2), cref);
        }

        private string NormalizeLink(string cref)
        {
            return cref.Replace(":", "-").Replace("(", "-").Replace(")", "");
        }
    }

```

```
    public class MarkdownVisitor : Visitor
    {
        public override void VisitMember(Member member)
        {
            Console.WriteLine();
            Console.WriteLine(new string('-', 50));
            Console.WriteLine("# " + member.Id);
            base.VisitMember(member);
        }

        public override void VisitSummary(Summary summary)
        {
            Console.WriteLine();
            Console.WriteLine("## Summary");
            base.VisitSummary(summary);
        }

        public override void VisitRemarks(Remarks remarks)
        {
            Console.WriteLine();
            Console.WriteLine("## Remarks");
            base.VisitRemarks(remarks);
        }

        public override void VisitExample(Example example)
        {
            Console.WriteLine();
            Console.WriteLine("### Example");
            base.VisitExample(example);
        }

        public override void VisitC(C code)
        {
            // Wrap inline code in ` according to Markdown syntax.
            Console.Write(" `");
            Console.Write(code.Content);
            Console.Write("` ");

            base.VisitC(code);
        }

        public override void VisitCode(Code code)
        {
            Console.WriteLine();
            Console.WriteLine();

            // Indent code with 4 spaces according to Markdown syntax.
            foreach (var line in code.Content.Split(new[] { Environment.NewLine }, StringSplitOptions.None))
            {
                Console.Write("    ");
                Console.WriteLine(line);
            }

            Console.WriteLine();
            base.VisitCode(code);
        }

        public override void VisitText(Text text)
        {
            Console.Write(text.Content);
            base.VisitText(text);
        }

        public override void VisitPara(Para para)
        {
            Console.WriteLine();
            Console.WriteLine();
            base.VisitPara(para);
            Console.WriteLine();
            Console.WriteLine();
        }

        public override void VisitSee(See see)
        {
            var cref = NormalizeLink(see.Cref);
            Console.Write(" [{0}]({1}) ", cref.Substring(2), cref);
        }

        public override void VisitSeeAlso(SeeAlso seeAlso)
        {
            var cref = NormalizeLink(seeAlso.Cref);
            Console.WriteLine("[{0}]({1})", cref.Substring(2), cref);
        }

        private string NormalizeLink(string cref)
        {
            return cref.Replace(":", "-").Replace("(", "-").Replace(")", "");
        }
    }

```

There are two logically separated hierarchies of visitable elements: the members (like the whole set read by theReader, a type, method, property, etc.) and the documentation elements (like summary, remarks, code, etc.).

The following is the members hierarchy:

![Members hierarchy](/img/2013-06-11-1.png)

And this is the supported documentation elements hierarchy:

![Members hierarchy](https://raw.github.com/clariuslabs/NuDoc/master/doc/NuDoc.Content.png)

Note that at the visitor level, both hierarchies are treated uniformly, since they all ultimately inherit fromElement. In this fashion, you can have one or multiple visitors processing different parts of the graph, such as one that processes members and generates individual folders for each, and one for documentation elements that generate the content.

Enjoy! Go get it now fromNuGet

![;)](/img/2013-06-11-2.gif)

/kzu

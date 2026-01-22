---
layout: post
title: "Beware of typeparamref XML documentation tag"
date: 2008-01-21 00:00:00 +0000
---

##  [Beware of typeparamref XML documentation tag](<http://blogs.clariusconsulting.net/kzu/beware-of-typeparamref-xml-documentation-tag/> "Beware of typeparamref XML documentation tag")

January 21, 2008 2:36 am

Most projects use “Warnings as Errors” project-level setting together with the “XML documentation file” so that you can spot early on which areas of your public APIs are not documented or have broken links etc. in it. I’ve come to rely on it, especially in the face of refactoring, which even in VS2008 still doesn’t refactor code documentation references.

If the refactoring engine can’t fix documentation references for me, I want to get compilation errors at least. 

Turns out that unlike the paramref and typeparam tags, typeparamref is not validated and will NOT issue warnings when it’s out of sync with your codebase (i.e. you renamed a type parameter from a function or type).

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
    

[](<http://11011.net/software/vspaste>)

I bet more than one product will ship with broken links in the doc… (dunno how important is for documentation consumers that links to the documentation of a generic paramter is accurate…). [Go vote the bug](<https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=323159>) and let’s find out!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=53053)

Posted by kzu
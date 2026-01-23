---
layout: post
title: "How to remove all useless new lines in automatic properties in an entire solution"
date: 2010-09-22 00:00:00 +0000
---

##  [How to remove all useless new lines in automatic properties in an entire solution](<http://blogs.clariusconsulting.net/kzu/how-to-remove-all-useless-new-lines-in-automatic-properties-in-an-entire-solution/> "How to remove all useless new lines in automatic properties in an entire solution")

September 22, 2010 7:03 pm

Say you have someone on the team that for whatever reason keeps changing back the corresponding VS settings (or even worse, wasting keystrokes) and formats automatic properties like so:
    
    
    public string Foo
    {
        get;
        private set;
    }

Say you got tired of freakin’ fixing this manually every time to the much more readable and less wasteful default format:
    
    
    public string Foo { get; private set; }

Well, in order to replace each and every match for the wasteful version with the concise, readable and default version, just do a File & Replace in all files in the solution, using Regular Expressions matching, and use:

Find What: `{:i}\n:b*\{\n:b*{.*}get;\n:b*{.*}set;\n:b*\}`

Replace With: `\1 \{ \2get; \3set; \}`

``

This will even preserve the property visibility modifiers.

Enjoy!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=285007)

/kzu

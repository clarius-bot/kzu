---
layout: post
title: "How to replace default interface property implementation expansion with automatic properties"
date: 2011-05-11 00:00:00 +0000
---

##  [How to replace default interface property implementation expansion with automatic properties](<http://blogs.clariusconsulting.net/kzu/how-to-replace-default-interface-property-implementation-expansion-with-automatic-properties/> "How to replace default interface property implementation expansion with automatic properties")

May 11, 2011 1:50 pm

By default, when you implement an interface in a class, you get the following for properties:
    
    
    public string ClassName
    {
        get
        {
            throw new NotImplementedException();
        }
        set
        {
            throw new NotImplementedException();
        }
    }

But of course the typical thing to do is to implement them as automatic properties. You have two options at this point: modify the default expansion snippet, or do a find & replace with a regex.

## How to change the default property stub expansion

Open the PropertyStub.snippet from C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC#\Snippets\1033\Refactoring\PropertyStub.snippet, and change the <Code> from:
    
    
    <Code Language="csharp">
        <![CDATA[$signature$
    {
        $GetterAccessibility$ get
        {
            $end$throw new $Exception$();
        }
        $SetterAccessibility$ set
        {
            throw new $Exception$();
        }
    }]]>
    </Code>

to:
    
    
    <Code Language="csharp">
        <![CDATA[$signature$ { get; set; }]]>
    </Code>

Done. Now implementing an interface shields:
    
    
    public string ClassName { get; set; }

## How to replace default property expansion with a regular expression

Find: (?<member>\w+)\s*\\{\s*get\s*\\{\s*throw\snew\sNotImplementedException\\(\\);\s*\\}\s*set\s*\\{\s*throw\snew\sNotImplementedException\\(\\);s*\\}\s*\\}

Replace: ${member} { get; set; }

Use the [Power Tools](<http://visualstudiogallery.msdn.microsoft.com/d0d33361-18e2-46c0-8ff2-4adea1e34fef/>) inline [replace in the text editor](<http://blogs.msdn.com/b/visualstudio/archive/2011/02/22/productivity-power-tools-introduces-find-organize-imports-for-vb-enhanced-scrollbar-middle-click-scrolling-and-more.aspx>) (Ctrl + H) because the replacement string is in .NET Regex format.

**Update** : you can do the same trick (add automatic get; private set;) to interfaces that only have a getter defined (note the private set;), by changing the snippet at C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC#\Snippets\1033\Refactoring\PropertyStubGet.snippet. I’ve both now in place, and doing interface-based programming (a good thing!) is now more enjoyable ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) .

/kzu

---
layout: post
title: "PowerShell: vastly improved tab expansion/completion (or do you still miss VS intellisense?)"
date: 2006-10-26 00:00:00 +0000
---

##  [PowerShell: vastly improved tab expansion/completion (or do you still miss VS intellisense?)](<http://blogs.clariusconsulting.net/kzu/powershell-vastly-improved-tab-expansioncompletion-or-do-you-still-miss-vs-intellisense/> "PowerShell: vastly improved tab expansion/completion \(or do you still miss VS intellisense?\)")

October 26, 2006 6:29 am

I’m an intellisense-addict. I hate doing work that my computer can do for me, and typing long namespace and class names certainly fits that category.

[If you know all about PowerShell and just want to try it really quick, go [get the straight dope](<http://powershell.wiki.com/TabExpansion>) now ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) ]

Out of the box, PowerShell (PS) does fairly minimal tab completion: simple member expansion on variables, variable name expansion and parameter completion on commands. The tab expansion in PS is implemented in a script function named TabExpansion. Turns out that functions are exposed via a custom PS provider (like the file system provider, the registry provider, etc.), meaning you can “cd” into functions and do a dir    
    
    PS Function:\> gc TabExpansion
    
                # This is the default function to use for tab expansion. It handles simple            # member expansion on variables, variable name expansion and parameter completion            # on commands. It doesn't understand strings so strings containing ; | ( or { may            # cause expansion to fail.
    
                param($line, $lastWord)
    
                switch -regex ($lastWord)            {                # Handle property and method expansion...                 ...

  
You can also do `gc function:tabexpantion`, directly. That’s pretty amazing. Read more about it at the [Windows PowerShell blog](<http://blogs.msdn.com/powershell/archive/2006/04/26/584551.aspx>). 

Being just a function, it can be overridden in your profile, so you can grab the default expansion implementation, and extend it in any way you want. I [found a couple](<http://monadblog.blogspot.com/2006/06/extending-tabexpansion-function.html>)[versions](<http://mow001.blogspot.com/2006/10/powershell-tabcompletion-part-5.html>) of a pretty cool extended tab expansion that did almost what I wanted: full expansion on namespace, type name and members. Looks like the latest version is hosted in [CodePlex](<http://www.codeplex.com/Wiki/View.aspx?ProjectName=PsObject>). With that extended function added to my profile, I can do (first the line ending with the [TAB] keypress, next what’s completed by the tab expansion): 
    
    
    PS C:\> [**S**[TAB]PS C:\> [SystemPS C:\> [System**.Ref**[TAB]PS C:\> [System.ReflectionPS C:\> [System.Reflection.**As**[TAB]PS C:\> [System.Reflection.Assembly]PS C:\> [System.Reflection.Assembly]**::LoadW**[TAB]PS C:\> [System.Reflection.Assembly]::LoadWithPartialName(PS C:\> [System.Reflection.Assembly]::LoadWithPartialName(**"Microsoft.Build.Framework")**

Bold is what I actually had to type. So I entered a 79 characters statement only typing 43 characters! And of those, 28 were the actual method parameter! So, if I don’t count the parameter, I typed 1/3 of what I would have had to before. Amazing boost in speed ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) . 

There were a couple annoyances with the implementation, though: System and Microsoft were hardcoded as the only top level namespaces recognized, and it didn’t refresh the cache when I loaded an assembly via Assembly.LoadX. Those were significant drawbacks that I set to fix for myself. In the course of fixing it, I ended up re-implementing the caching in a completely different way, that makes for a much faster in-memory cache building process, as well as an optimized storage. Now I can load an assembly on the prompt, and have immediate intellisense on the types from that assembly ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

Get the [improved tab expansion](<http://powershell.wiki.com/TabExpansion>) from the [PowerShell Wiki](<http://powershell.wiki.com/>).

![](http://clariusconsulting.net/aggbug.aspx?PostID=4906)

/kzu

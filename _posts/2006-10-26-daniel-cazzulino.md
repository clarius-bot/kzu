---
layout: post
title: "Daniel Cazzulino"
date: 2006-10-26 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : PowerShell: vastly improved tab expansion/completion (or do you still miss VS intellisense?)

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2588'\))| March 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2647'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| 22| 23| 24  
25| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2006/10/26.aspx "2 Posts")| 27| 28| 29| 30| [31](http://www.clariusconsulting.net/blogs/kzu/archive/2006/10/31.aspx "1 Post")  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070323152756im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## PowerShell: vastly improved tab expansion/completion (or do you still miss VS intellisense?) 

I'm an intellisense-addict. I hate doing work that my computer can do for me, and typing long namespace and class names certainly fits that category.

[If you know all about PowerShell and just want to try it really quick, go [get the straight dope](http://powershell.wiki.com/TabExpansion) now ;)]

Out of the box, PowerShell (PS) does fairly minimal tab completion: simple member expansion on variables, variable name expansion and parameter completion on commands. The tab expansion in PS is implemented in a script function named TabExpansion. Turns out that functions are exposed via a custom PS provider (like the file system provider, the registry provider, etc.), meaning you can "cd" into functions and do a dir|gci|get-childitem on it   

    
    
    PS C:\> Get-PSProvider  
      
    Name                 Capabilities  
    ----                 ------------  
    Alias                ShouldProcess  
    Environment          ShouldProcess  
    FileSystem           Filter, ShouldProcess  
    Function             ShouldProcess  
    Registry             ShouldProcess  
    Variable             ShouldProcess  
    Certificate          ShouldProcess  
      
      
    PS C:\> cd Function:  
    PS Function:\> gci  
      
    CommandType     Name  
    -----------     ----  
    Function        prompt  
    Function        TabExpansion  
    Function        Clear-Host  
    Function        more  
    Function        help  
    Function        man  
    ...  
    

  
Now, being exposed as items over a provider, means that you can also call cat|gc|get-content on it, and see the actual function implementation:
    
    
    PS Function:\> gc TabExpansion  
      
      
                # This is the default function to use for tab expansion. It handles simple  
                # member expansion on variables, variable name expansion and parameter completion  
                # on commands. It doesn't understand strings so strings containing ; | ( or { may  
                # cause expansion to fail.  
      
                param($line, $lastWord)  
      
      
                switch -regex ($lastWord)  
                {  
                    # Handle property and method expansion...  
                     ...  
    

  
You can also do `gc function:tabexpantion`, directly. That's pretty amazing. Read more about it at the [Windows PowerShell blog](http://blogs.msdn.com/powershell/archive/2006/04/26/584551.aspx). 

Being just a function, it can be overridden in your profile, so you can grab the default expansion implementation, and extend it in any way you want. I [found a couple](http://monadblog.blogspot.com/2006/06/extending-tabexpansion-function.html)[versions](http://mow001.blogspot.com/2006/10/powershell-tabcompletion-part-5.html) of a pretty cool extended tab expansion that did almost what I wanted: full expansion on namespace, type name and members. Looks like the latest version is hosted in [CodePlex](http://www.codeplex.com/Wiki/View.aspx?ProjectName=PsObject). With that extended function added to my profile, I can do (first the line ending with the [TAB] keypress, next what's completed by the tab expansion): 
    
    
    PS C:\> [**S**[TAB]  
    PS C:\> [System  
    PS C:\> [System**.Ref**[TAB]  
    PS C:\> [System.Reflection  
    PS C:\> [System.Reflection.**As**[TAB]  
    PS C:\> [System.Reflection.Assembly]  
    PS C:\> [System.Reflection.Assembly]**::LoadW**[TAB]  
    PS C:\> [System.Reflection.Assembly]::LoadWithPartialName(  
    PS C:\> [System.Reflection.Assembly]::LoadWithPartialName(**"Microsoft.Build.Framework")  
    **

Bold is what I actually had to type. So I entered a 79 characters statement only typing 43 characters! And of those, 28 were the actual method parameter! So, if I don't count the parameter, I typed 1/3 of what I would have had to before. Amazing boost in speed :). 

There were a couple annoyances with the implementation, though: System and Microsoft were hardcoded as the only top level namespaces recognized, and it didn't refresh the cache when I loaded an assembly via Assembly.LoadX. Those were significant drawbacks that I set to fix for myself. In the course of fixing it, I ended up re-implementing the caching in a completely different way, that makes for a much faster in-memory cache building process, as well as an optimized storage. Now I can load an assembly on the prompt, and have immediate intellisense on the types from that assembly :)

Get the [improved tab expansion](http://powershell.wiki.com/TabExpansion) from the [PowerShell Wiki](http://powershell.wiki.com/).

posted on Thursday, October 26, 2006 7:29 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070323152756im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
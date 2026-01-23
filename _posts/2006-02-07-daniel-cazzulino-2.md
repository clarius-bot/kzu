---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-07 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Sunday, October 12, 2003 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/10/3.aspx "1 Post")| 4  
[5](http://clariusconsulting.net/blogs/kzu/archive/2003/10/5.aspx "1 Post")| 6| [7](http://clariusconsulting.net/blogs/kzu/archive/2003/10/7.aspx "1 Post")| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2003/10/9.aspx "2 Posts")| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11.aspx "1 Post")  
[12](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12.aspx "2 Posts")| 13| 14| 15| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17.aspx "2 Posts")| 18  
19| 20| [21](http://clariusconsulting.net/blogs/kzu/archive/2003/10/21.aspx "1 Post")| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2003/10/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2003/10/25.aspx "1 Post")  
[26](http://clariusconsulting.net/blogs/kzu/archive/2003/10/26.aspx "1 Post")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/10/27.aspx "1 Post")| [28](http://clariusconsulting.net/blogs/kzu/archive/2003/10/28.aspx "1 Post")| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060207043334im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Sunday, October 12, 2003 - Posts

#####  [Automatically executing start-up actions and locking workstation](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12/90.aspx)

I came across the need to ensure that upon machine startup, certain programs in the Start group get executed even if I'm not around to logon with my session. This is typically the case if you have your webserver in your machine and want to automatically connect to the Internet and update a dynamic DNS service with the new IP. You could use [SrvAny](http://deverest.com.ar/downloads/SrvAny%20Installation.zip) to make those apps look like services that would run without the need to logon. But most applications store settings in user-specific folders, and will not work without an initiated session.   
[Microsoft](http://support.microsoft.com/default.aspx?scid=KB;EN-US;Q97597&LN=EN-US&SD=gn&FR=0) offers a "solution" to you: enable automatic logon. Ups. It works in Windows 2003 too. But now the problem is that the machine will remain logged-on until your password-protected screen saver comes up to lock the workstation. I'm using the following script, which gives the startup programs enough time to do their work and then automatically blocks the session:

`
    
    
    <package>
       <job id="lock">
          <script language="JScript">
             var WshShell = WScript.CreateObject("WScript.Shell");
             // 5 minutes are enough for me ;)
             WScript.Sleep(300000);
       WshShell.Exec("rundll32 user32.dll,LockWorkStation");
          </script>
       </job>
    </package>

`

This script is a .wsf file executed by Windows Script Host. We want to ensure this script is ALWAYS run. You know that pressing `Shift` at windows start skips executing the Start group. To avoid that we can make this script be run though the registry:

`
    
    
    Windows Registry Editor Version 5.00
    
    [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
    "LockStation"="C:\\LockStation.wsf"

`

posted [Sunday, October 12, 2003 1:24 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12/90.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12/90.aspx#comments)

#####  [Proper parenthesis formatting with a macro](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12/89.aspx)

It's common coding convention to add a space surrounding method parameters. However, it can be quite annoying to keep remembering it. Examples of such convention are: 

`
    
    
    Console.WriteLine( "\nFinished" );
    int var = Int32.Parse( Console.Read() );
    DoSomething( Int32.Parse( Console.Read() ), 
    	DoSomethingElse( var ) );

`

As you can see, it gets more and more annoying when you have nested method calls, as closing each requires placing a space between parenthesis too. You can easily add such formatting to a whole solution by executing this simple macro:

`
    
    
    Sub FormatParenthesis()
        Dim result As vsFindResult
    
        DTE.ExecuteCommand("Edit.Replace")
        DTE.Windows.Item(Constants.vsWindowKindFindReplace).Activate()
        DTE.Find.FindWhat = "{[^ (]}\)"
        DTE.Find.ReplaceWith = "\1 )"
        DTE.Find.Target = vsFindTarget.vsFindTargetSolution
        DTE.Find.MatchCase = False
        DTE.Find.MatchWholeWord = False
        DTE.Find.MatchInHiddenText = True
        DTE.Find.PatternSyntax = vsFindPatternSyntax.vsFindPatternSyntaxRegExpr
        DTE.Find.ResultsLocation = vsFindResultsLocation.vsFindResultsNone
        DTE.Find.Action = vsFindAction.vsFindActionReplaceAll
    
        result = DTE.Find.Execute()
        Do While result = vsFindResult.vsFindResultReplaced
            result = DTE.Find.Execute()
        Loop
    
        DTE.Find.FindWhat = "\({[^ )]}"
        DTE.Find.ReplaceWith = "( \1"
        result = DTE.Find.Execute()
    
        Do While result <> vsFindResult.vsFindResultNotFound
            result = DTE.Find.Execute()
        Loop
        DTE.Windows.Item(Constants.vsWindowKindFindReplace).Close()
    
    End Sub

`

posted [Sunday, October 12, 2003 12:56 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12/89.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12/89.aspx#comments)

  

![](/web/20060207043334im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
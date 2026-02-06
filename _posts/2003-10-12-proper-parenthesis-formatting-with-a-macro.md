---
layout: post
title: "Proper parenthesis formatting with a macro"
date: 2003-10-12 00:00:00 +0000
---

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

/kzu

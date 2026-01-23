---
layout: post
title: "Daniel Cazzulino's Blog : Business Rules, OCL, XML and Schemas"
date: 2004-01-19 00:00:00 +0000
---

## Business Rules, OCL, XML and Schemas 

[DonXML](http://donxml.com/allthingstechie/archive/2004/01/15/314.aspx) is proposing extensions to OCL to express business rules that can be used at code-gen time and at run-time.   
He mentions my [Schematron](http://www.ascc.net/xml/resource/schematron/schematron.html) implementation called [Schematron.NET](http://sf.net/projects/dotnetopensrc), which allows many business rules to be expressed simply in terms of standard XPath expressions. I believe such an XPath-based language is good enough to express almost every business rule. 

[Udi Dahan](http://donxml.com/allthingstechie/archive/2004/01/15/314.aspx#316) commented as an example, a rule "only a bank manager can authorize a loan above X" which he said couldn't be expressed with Don's idea. It could, indeed, with something along these lines (XPath-like):

`
    
    
    <assert test="sec:principal-role('BankManager') and po:Loan/@Amount < 1000">
      Only a BankManager can place a loan of more than $1000.
    </assert>

`

Note that XPath extensibility allows for more domain-specific extensions to be active, which can even check against databases, etc. For example, something like this: 

`
    
    
    <assert test="crm:customer-id(po:CustomerId)" />

`

in this case, the application would map the "crm" prefix to the business objects that contain the logic, and register the "customer-id" extension function to ensure the Id is a valid one. This way, you can change business rules based on a (well documented) set of extensions, and you can let managers handle them, instead of programmers.   
These schemas are easy enough for an advanced user to edit.   
In [Schematron.NET](http://sf.net/projects/dotnetopensrc), I'm implementing quite a few extensions, including XSLT-specific ones, and adding the full [EXSLT](http://www.exslt.org/) [for .NET](http://workspaces.gotdotnet.com/exslt) implemented by [Dare Obasanjo](http://www.25hoursaday.com/weblog/). It's not impossible to think about a set of domain-specific standard specs (like EXSLT itself) that would aid in business rules expression. 

posted on Monday, January 19, 2004 1:13 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

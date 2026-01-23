---
layout: post
title: "Daniel Cazzulino : String concatenation considered harmfull (or how is HTML different than XML with regards to creating it)"
date: 2005-08-03 00:00:00 +0000
---

## String concatenation considered harmfull (or how is HTML different than XML with regards to creating it) 

From [Brad](http://www.agileprogrammer.com/dotnetguy/archive/2005/07/28/6459.aspx), I got to [Craig](http://pluralsight.com/blogs/craig/)'s post about the [bad things that happen when you build XML by string concatenation](http://pluralsight.com/blogs/craig/archive/2005/07/28/13549.aspx). His core statement is: 

> The moral of the story here is that if you find yourself doing something like this:   
>  xml = "<FOO>" + fooContents + "</FOO>";  
> then you should lose points on your programming license. 

Now, I wonder how is XML different than HTML with regards to creating it. After all, you should probably be creating *X*HTML anyway, as it's the most compatible way of doing it. So, you should * **also** * lose points if you're doing the following: 
    
    
    output.WriteLine("<FIELDSET><LEGEND>Federation namespace list</LEGEND></FIELDSET>");

Guess [where you will find ****TONS**** of code like that](http://www.flexwiki.com/). This is so [1996 of them](http://en.wikipedia.org/wiki/Active_Server_Pages)!! 

/kzu

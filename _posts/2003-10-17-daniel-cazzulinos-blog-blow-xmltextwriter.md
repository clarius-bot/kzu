---
layout: post
title: "Daniel Cazzulino's Blog : Blow XmlTextWriter"
date: 2003-10-17 00:00:00 +0000
---

## Blow XmlTextWriter 

Mmm... the following code causes a `System.NullReferenceException`: 

`
    
    
    using (FileStream fs = new FileStream(@"e:\xmltextwriter.xml", FileMode.Create))
    {
      XmlTextWriter tw = new XmlTextWriter(fs, System.Text.Encoding.UTF8);
      tw.WriteDocType("html", 
          "-//W3C//DTD XHTML 1.0 Transitional//EN", 
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd", 
          null);
      tw.WriteStartDocument();
      tw.Flush();
    }

`

The exception is thrown at the `WriteStartDocument()` call. Of course the document being written is not valid according to the [Prolog and DTD Declaration](http://www.w3.org/TR/REC-xml#sec-prolog-dtd) specification in XML, but we should get a meaningful exception, right? 

posted on Friday, October 17, 2003 12:57 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

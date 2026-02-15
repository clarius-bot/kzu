---
layout: post
title: Blow XmlTextWriter
date: 2003-10-17 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/32367
tags:
- XML

---

Mmm... the following code causes a `System.NullReferenceException`: 

```
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
```

The exception is thrown at the `WriteStartDocument()` call. Of course the document being written is not valid according to the [Prolog and DTD Declaration](http://www.w3.org/TR/REC-xml#sec-prolog-dtd) specification in XML, but we should get a meaningful exception, right? 

/kzu

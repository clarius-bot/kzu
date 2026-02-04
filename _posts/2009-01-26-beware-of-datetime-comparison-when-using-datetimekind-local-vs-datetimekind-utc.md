---
layout: post
title: "Daniel Cazzulino's Blog - Beware of DateTime comparison when using DateTimeKind.Local vs DateTimeKind.Utc"
date: 2009-01-26 00:00:00 +0000
---

##  [Beware of DateTime comparison when using DateTimeKind.Local vs DateTimeKind.Utc](<http://blogs.clariusconsulting.net/kzu/beware-of-datetime-comparison-when-using-datetimekind-local-vs-datetimekind-utc/> "Beware of DateTime comparison when using DateTimeKind.Local vs DateTimeKind.Utc")

January 26, 2009 6:07 pm

Oh, DateTime is so hopelessly broken…
    
    
    public void BewareLocalAndUniversalDoNotEqual()
    {
        // This gives you a local time.
        DateTime now = DateTime.Now;
        DateTime utc = now.ToUniversalTime();
    
        Assert.AreEqual(now, utc);
    }
    

[](<http://11011.net/software/vspaste>)

That’s right: both values represent the exact same moment in time, the only difference is that one is in in one timezone and the other is universal, and that makes the test fail:
    
    
    Expected:<24/01/2009 02:28:23 p.m.>. Actual:<24/01/2009 10:28:23 p.m.>. 

Absolutely broken if you ask me. So you have to make sure you always convert everything to universal for date time comparison. 

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=115995)

/kzu

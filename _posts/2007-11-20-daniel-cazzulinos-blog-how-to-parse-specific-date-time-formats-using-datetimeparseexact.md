---
layout: post
title: "Daniel Cazzulino's Blog : How to parse specific date-time formats using DateTime.ParseExact"
date: 2007-11-20 00:00:00 +0000
---

## How to parse specific date-time formats using DateTime.ParseExact 

I've done this myself: write an entirely new date-time parser using regular expressions. I'm sure most people implementing standards have done the same (i.e. for syndication libraries, etc.). There's almost no point in doing so, except for some very specific cases, as [DateTime.ParseExact](http://msdn2.microsoft.com/en-US/library/w2sa9yss.aspx) is very flexible through the use of [custom DateTime format strings](http://msdn2.microsoft.com/en-US/library/8kb3ddd4.aspx).

The following is an example of how you can parse (and normalize, by removing milliseconds) [RFC 3389](http://www.ietf.org/rfc/rfc3339.txt) date-times:
    
    
    /// <summary>  
    /// Parses and renders <see cref="DateTime"/> instances in a format   
    /// compliant with RFC 3389 (see [http://www.ietf.org/rfc/rfc3339.txt)](http://www.ietf.org/rfc/rfc3339.txt%29).  
    /// </summary>  
    public static class Timestamp  
    {  
        const string Rfc3389 = "yyyy'-'MM'-'dd'T'HH':'mm':'ss%K"; 
    
    
        public static DateTime Parse(string timestamp)  
        {  
            return DateTime.ParseExact(timestamp, Rfc3389, CultureInfo.CurrentCulture);  
        } 
    
    
        public static string ToString(DateTime timestamp)  
        {  
            return timestamp.ToString(Rfc3389);  
        } 
    
    
        public static DateTime Normalize(DateTime dateTime)  
        {  
            return Parse(ToString(dateTime));  
        }  
    } 
    

Thanks [Juan](http://weblogs.manas.com.ar/waj/) for reminding me (and causing a full class to be [deleted from a project](http://www.codeplex.com/sse) :)).

posted on Tuesday, November 20, 2007 3:07 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

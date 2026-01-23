---
layout: post
title: "Daniel Cazzulino's Blog : Friday, January 04, 2008 - Posts"
date: 2008-07-25 00:00:00 +0000
---

## Friday, January 04, 2008 - Posts

#####  [foreach to from..select (I)](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/04/50039.aspx)

Build a coma-separated list of the string representation of an array of objects, rendering null values as "null", string values with quotes ( i.e. `15, true, "foo", null` ) and everything else using `object.ToString()`:

foreach:
    
    
    				List<string> values = new List<string>(invocation.Arguments.Length);
    foreach (var x in invocation.Arguments)
    {
        values.Add(x == null ?
            "null" :
            x is string ?
                "\"" + (string)x + "\"" :
                x.ToString()
        );
    }
    
    string msg = String.Join(", ", values.ToArray());
    

from..select:
    
    
    				string msg = String.Join(", ", 
        (from x in invocation.Arguments select x == null ?
            "null" :
            x is string ?
                "\"" + (string)x + "\"" :
                x.ToString()
        ).ToArray()
    );
    

[ ](http://11011.net/software/vspaste)

posted [Friday, January 04, 2008 4:15 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/04/50039.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2008/01/04/50039.aspx#comments)

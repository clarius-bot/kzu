---
layout: post
title: "Daniel Cazzulino's Blog - foreach to from..select (I)"
date: 2008-01-04 00:00:00 +0000
---

## foreach to from..select (I) 

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

/kzu

---
layout: post
title: "Daniel Cazzulino's Blog - Tip: how to tell a regular method apart from property getter/setters and event add/remove"
date: 2009-02-06 00:00:00 +0000
---

## Tip: how to tell a regular method apart from property getter/setters and event add/remove 

Rather than typical code like:
    
    
    private static MethodInfo GetFirstMethodWithReturnType(Type type)
    {
        return
            type.GetMethods(BindingFlags.Public                 .Where(method => !method.IsSpecialName)
                .FirstOrDefault(method => (method.ReturnType != typeof(void)));
    }
    

IsSpecialName returns true for property getters/setters and event add/remove :) 

/kzu

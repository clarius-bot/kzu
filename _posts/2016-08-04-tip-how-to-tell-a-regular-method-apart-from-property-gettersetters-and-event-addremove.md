---
layout: post
title: "Tip: how to tell a regular method apart from property getter/setters and event add/remove"
date: 2016-08-04 00:00:00 +0000
---

##  [Tip: how to tell a regular method apart from property getter/setters and event add/remove](<http://blogs.clariusconsulting.net/kzu/tip-how-to-tell-a-regular-method-apart-from-property-gettersetters-and-event-addremove/> "Tip: how to tell a regular method apart from property getter/setters and event add/remove")

February 7, 2009 3:02 am

Rather than typical code like:
    
    
    private static MethodInfo GetFirstMethodWithReturnType(Type type)
    {
        return
            type.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly)
                .Where(method => !method.Name.StartsWith("get_") &&
                                    !method.Name.StartsWith("set_") &&
                                    !method.Name.StartsWith("add_") &&
                                    !method.Name.StartsWith("remove_"))
                .FirstOrDefault(method => (method.ReturnType != typeof(void)));
    }
    

You can simply do:
    
    
    private static MethodInfo GetFirstMethodWithReturnType(Type type)
    {
        return
            type.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly)
                .Where(method => !method.IsSpecialName)
                .FirstOrDefault(method => (method.ReturnType != typeof(void)));
    }
    

IsSpecialName returns true for property getters/setters and event add/remove ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) ![](http://www.clariusconsulting.net/aggbug.aspx?PostID=116734)

Posted by kzu
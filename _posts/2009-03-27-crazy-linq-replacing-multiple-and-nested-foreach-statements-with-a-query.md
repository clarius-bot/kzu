---
layout: post
title: "Crazy Linq: replacing multiple and nested foreach statements with a query"
date: 2009-03-27 00:00:00 +0000
---

Objective of the method: determine whether the given EnvDTE code class contains the given GeneratedCodeAttribute:

"old" foreach/if approach:
    
    
    private bool IsPresentationModel(CodeClass2 baseClass)
    {
        foreach (CodeClass2 pc in baseClass.PartialClasses)
        {
            foreach (CodeAttribute2 attr in pc.Attributes)
            {
                if (attr.FullName == typeof(GeneratedCodeAttribute).FullName &&
                    attr.Value.Contains(ThisAssembly.Title))
                {
                    return true;
                }
            }
        }
    
        foreach (CodeAttribute2 attr in baseClass.Attributes)
        {
            if (attr.FullName == typeof(GeneratedCodeAttribute).FullName &&
                attr.Value.Contains(ThisAssembly.Title))
            {
                return true;
            }
        }
    
        return false;
    }
    

Note that most collections in the EnvDTE code model are not IEnumerable<T>. Here's the linq-ified version:
    
    
    private bool IsPresentationModel(CodeClass2 baseClass)
    {
        return baseClass.PartialClasses
            .OfType<CodeClass2>()
            .Select(cc => cc.Attributes)
            .SelectMany(ce => ce.OfType<CodeAttribute2>())
            .Concat(baseClass.Attributes.OfType<CodeAttribute2>())
            .Where(attr =>
                attr.FullName == typeof(GeneratedCodeAttribute).FullName &&
                attr.Value.Contains(ThisAssembly.Title))
            .Any();
    }
    

The SelectMany invocation is needed to flatten the list of attributes from all partial classes :)

Update: Changed Count() to Any() which is generally more optimal, as I only care about knowing whether there's at least one such attribute, regardless of how many.   

/kzu

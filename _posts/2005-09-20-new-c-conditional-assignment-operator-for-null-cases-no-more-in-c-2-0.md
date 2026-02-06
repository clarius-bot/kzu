---
layout: post
title: "New C# conditional assignment operator ?? for null cases!! (no more ? .. : in C# 2.0)"
date: 2005-09-20 00:00:00 +0000
---

    
    object obj = canBeNull ?? alternativeObj;
    
    // equals:
    
    object obj = canBeNull != null ? canBeNull : alternativeObj;

And it can be nested!   
I love it!  
  
[see [MSDN](http://msdn2.microsoft.com/en-us/library/ms173224)]  
[via [BradWilson](http://www.agileprogrammer.com/dotnetguy/) code]  

/kzu

---
layout: post
title: "Daniel Cazzulino's Blog : Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement"
date: 2010-04-15 00:00:00 +0000
---

## Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement 
    
    
    public static IEnumerable<ValidationResult> Validate(object component)
    {
        return from descriptor in TypeDescriptor.GetProperties(component).Cast<PropertyDescriptor>()
                from validation in descriptor.Attributes.OfType<System.ComponentModel.DataAnnotations.ValidationAttribute>()
                where !validation.IsValid(descriptor.GetValue(component))
                select new ValidationResult(
                    validation.ErrorMessage ?? string.Format(CultureInfo.CurrentUICulture, "{0} validation failed.", validation.GetType().Name),
                    new[] { descriptor.Name });
    }
    
    

Enjoy!

posted on Thursday, April 15, 2010 10:08 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

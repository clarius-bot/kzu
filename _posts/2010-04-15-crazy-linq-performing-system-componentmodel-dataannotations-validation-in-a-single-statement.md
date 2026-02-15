---
layout: post
title: 'Crazy Linq: performing System.ComponentModel.DataAnnotations validation in
  a single statement'
date: 2010-04-15 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/crazy-linq-performing-system-componentmodel-dataannotations-validation-in-a-single-statement
tags:
- .NET
- All Technology

---

    
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

/kzu

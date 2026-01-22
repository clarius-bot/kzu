---
layout: post
title: "Serious flaw in WPF validation infrastructure for ValidationRule and Binding"
date: 2014-07-25 00:00:00 +0000
---

##  [Serious flaw in WPF validation infrastructure for ValidationRule and Binding](<http://blogs.clariusconsulting.net/kzu/serious-flaw-in-wpf-validation-infrastructure-for-validationrule-and-binding/> "Serious flaw in WPF validation infrastructure for ValidationRule and Binding")

September 26, 2007 3:21 am

[Adam Nathan](<http://www.adamnathan.net/>)‘s [excelent book on WPF](<http://adamnathan.net/wpf/>) states:

> The validation check is invoked during any attempt to update the underlying data … before a value converter is called (if present)…

This is further reinforced on [MSDN where the validation process is explained](<http://msdn2.microsoft.com/en-us/library/ms752347.aspx#validation_process>):

![image](http://www.clariusconsulting.net/images/blogs/kzu/SeriousflawinWPFvalidationinfrastructure_11CFC/image_3.png)

I can’t understand how this design decision was made (it seems to be very much a rational decision, given how well documented it is). 

Think about this scenario: you want to validate an integer value for a property (say, its range). There is a built-in converter for integers (but this could be a custom value converter, if it was your own type) that will ultimately assign a value of the right type to the property.

The validation routine should deal only with checking the range of an integer, not about how to convert it from whichever value it’s passed-in by the binding target (i.e. the textbox control), which is already a responsibility of the value converter. If it has to perform conversion of the value prior to validating it, then a double conversion will happen if the value turns out to be valid.

What’s worse, the validation rules have no way of accessing the value converter associated with the binding, so you’ll end up either hardcoding which value converter to use inside the validator, or having to sync both manually (make validator code and XAML match).

Consider the alternative: first, the value converter tries to convert. Say It fails. It’s like a validation error, but it’s a precondition to validation that failed. With this approach, the validator can rely on the incoming value to always be of the appropriate type. A much better approach IMO.

I’m still enjoying XAML/WPF very much, but this is [the second](<http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/23/ForgetaboutextendingWPFdatabindingsupport.aspx>) “not-cool” moment I had in a single week ![:\(](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_sad.gif) . 

It’s probably useless, but if you wanna [vote to get this changed](<https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=299711>), go ahead. Thanks.

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=32939)

Posted by kzu
---
layout: post
title: "Daniel Cazzulino's Blog : For those that think Microsoft Connect is useless"
date: 2008-04-18 00:00:00 +0000
---

## For those that think Microsoft Connect is useless 

A while back I reported both [through my weblog](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/25/SeriousflawinWPFvalidationinfrastructureforValidationRuleandBinding.aspx "Serious flaw in WPF validation infrastructure for ValidationRule and Binding") and [Microsoft Connect](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=299711) what I thought was a serious flaw in the WPF validation infrastructure for ValidationRule and Binding. The issue, in short was:

> > The validation check is invoked during any attempt to update the underlying data ... **_before a value converter is called_** (if present)...

Take special note that this was not some undocumented, strange behavior, but rather something that was explicitly explained on [MSDN where the validation process was explained](http://msdn2.microsoft.com/en-us/library/ms752347.aspx#validation_process) as part of the design. 

But based on my feedback and the 13 other people that voted to fix the bug, it looks like they just did so (at least that's what [the bug](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=299711) status shows).

Pretty significant IMO, especially since in my experience these kind of "breaking changes even if the existing behavior was already broken" issues rarely get fixed, no matter how obvious the error might be. 

Continue blogging and bitching about stuff that bothers you, but don't forget to [report it formally](https://connect.microsoft.com/): it might [make a difference](http://www.clariusconsulting.net/blogs/kzu/archive/2004/09/11/ContributingFeedback.aspx "How I got Microsoft to create XPathExpression.Compile") and we may end up getting a better product from Microsoft (it may take years, but hey, it's a learning process!).

/kzu

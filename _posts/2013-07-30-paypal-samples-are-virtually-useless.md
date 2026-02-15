---
layout: post
title: PayPal Samples are virtually useless
date: 2013-07-30 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/paypal-samples-are-virtually-useless

---


I’m investigating the [PayPal Adaptive Payments](<https://developer.paypal.com/webapps/developer/docs/classic/adaptive-payments/integration-guide/APIntro/>) for a project, and was gladly surprised to find not only the sample app but also the SDK itself [open sourced at GitHub](<https://github.com/paypal/adaptivepayments-sdk-dotnet>). Cool!

My excitement ended abruptly as I opened the sample app. It’s so unbelievably bad you have to see it to believe it. A few WTFs:

  1. Sample is essentially a bunch of .aspx pages with plain forms that allow you to fill all possible parameters
  2. Form uses postback to a ** **1600+** ** lines of code .ashx handler that uses the submit ** **BUTTON TEXT** ** to determine the operation to perform
  3. Then the handler goes on to manually parse the HttpContext.Request.Params collection one by one and building the PayPal API classes used in the requests/services

How does web apps this way these days?? Being a C# sample, I would have expected at least to have an MVC app, that potentially used nice model binders to automatically parse form input and invoke PayPal from that, and fill an EF code first database with the IPN callback data, etc.

I mean, I GET it that it’s a sample, but it couldn’t have been MORE horrible! Hint to PayPal: samples lately are more of the “Reference Implementation” type, where you can actually learn the GOOD usage patterns for your library/service in a more or less real scenario. 

/kzu

---
layout: post
title: "Daniel Cazzulino's Blog : ForwardXPathNavigator vs XSE"
date: 2004-02-16 00:00:00 +0000
---

## ForwardXPathNavigator vs XSE 

[Oleg](http://www.tkachenko.com/blog/archives/000161.html) has posted his code now too. I guess this way we're encouraging mutually to release code often ;). I must defend: 

> (btw, I'm musing if I have to adopt hype-before-release strategy? :).

Honestly, I was porting the code to v1.x :o). 

Back to the issue, there's a fundamental difference in the approach between his class and my XSE API: his will consume the stream with a single query. Mine supports multiple handlers matching multiple elements at the same time. And it's still a pull-based API, where you have to iterate results, instead of being called when something you care happened (was matched). I look forward his XmlUpdater!

posted on Monday, February 16, 2004 4:17 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

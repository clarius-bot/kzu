---
layout: post
title: 'Breathing TDD: learning to distrust yourself'
date: 2004-10-07 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/239449
tags:
- .NET

---

## Breathing TDD: learning to distrust yourself

The more I use Test Driven Development (TDD), the more I learn that I must not trust myself. You see, before TDD, I used to develop big chunks of applications, doing some minimal (relative to TDD approach) testing from the end-user perspective. This approach to app development assumes you trust yourself in the code you write, as you know what you're doing, right? Well, my experience (and a lot of other's too) tells me that a huge number of subtle and hard to repro/track bugs can result from this approach (specially if they happen deep inside your libraries). (not that I've discovered anything new, of course....)

The more time I spend using TDD, the less I trust in my coding. I've found and fixed lots of bugs in my code before even checking the code in the repository. So, unless I have some NUnit tests that tell me from **outside** my code (the code I'll deliver for production, actually) that what I did actually works as expected, I do not consider the code to be trustworthy. Initially, it seems as it slows down your productivity, as I tend to spend an equal amount of time writing tests as writing the actual features. But in the long term, the code is much more robust and stable, and you can always do some refactoring without risking the entire project. The tests ensure you don't break other parts of the product.

If you're not doing TDD yet, you're really missing something...

posted on Thursday, October 07, 2004 7:23 PM
						bykzu

/kzu

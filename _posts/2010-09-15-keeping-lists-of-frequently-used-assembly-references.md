---
layout: post
title: Keeping lists of frequently used assembly references
date: 2010-09-15 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/keeping-lists-of-frequently-used-assembly-references
tags:
- .NET
- All Technology

---

This idea had been onour headsfor quite a while. Just to make sure it wasn’t just us who thought it was a cool idea,we postedit on theExtension Ideasforum and it rather quickly made it to the top 10.

You cango straight to the bitsand/or keep reading for the details of how it works :)

It’s not uncommon to have projects that require dozens of references. It’s also fairly common that the set of references you use within a company for certain types of projects (i.e. “ASP.NET MVC App with NHibernate”) is also pretty stable and there’s usually a well-known combination of assembly references that you have to setup for each and every one you start. Ditto for “Unit Test Project” (i.e. add xUnit, Moq, etc.).

In a nutshell, here’s how easy it is to create a new reference list:

![image](/img/2010-09-15-1.png)

Note that the suggested list name is smart enough to find the common root name in all of the selected ones. If no common root is found, you will just see the New List… menu:

![image](/img/2010-09-15-2.png)

Now when it’s time to start another project, you can add all the references in that list with one click:

![image](/img/2010-09-15-3.png)

Say later on you realize an assembly is missing on that list. No problem. Just select the reference and add it to the existing list:

![image](/img/2010-09-15-4.png)

To add that new reference from the list to other existing projects you simply re-add the entire list, and the new reference will be added automatically (just like the first time).

![image](/img/2010-09-15-5.png)

Now say the opposite happens. There is a reference in the list that you really don’t want to have there. Easy too: just select the reference, and opt to remove from list instead:

![image](/img/2010-09-15-6.png)

And if we just want to remove the entire list, right-clicking on References gives you the one-click way too:

![image](/img/2010-09-15-7.png)

The bits are free as in beer. You can download themfrom the Visual Studio Galleryor the Extension Manager within VS. They will expire on Oct. 28th at which time full public beta bits of WoVS will be available and you will need to download them again for compatibility reasons (of course, free as in beer, again).

We don’t have any dedicated forum or such for tracking extension bugs just yet, so please usethe VS Gallery Q&A sectionfor now to submit any feedback you may have.

If you want to gently push Microsoft to include such a feature in the next version of Visual Studioplease vote here. We would love to see WoVS extensions being deprecated by the next version of VS!

Enjoy your life inside the IDE!

/kzu

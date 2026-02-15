---
layout: post
title: DevEnvDir considered harmful
date: 2011-05-09 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/devenvdir-considered-harmful
tags:
- .NET

---


It’s quite common to refer to $(DevEnvDir) in a project, such as to specify the path to a referenced assembly, or to execute a tool on a build event or a target. It’s right there in the UI after all, why not use it?

![image](/img/2011-05-09-1.png)

Well, turns out that the variable is not defined when the build is run by Team Build, so it resolves to *Undefined*. Yuck.

This adds yet [another reason](<https://bit.ly/e8l7vP>) in favor of using the less obvious $(VS100COMNTOOLS) environment variable.

Just replace all occurrences of $(DevEnvDir) with $(VS100COMNTOOLS)..\IDE\ and you’re good.

/kzu

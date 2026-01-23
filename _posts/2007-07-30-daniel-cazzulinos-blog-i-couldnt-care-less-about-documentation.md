---
layout: post
title: "Daniel Cazzulino's Blog : I couldn't care less about documentation"
date: 2007-07-30 00:00:00 +0000
---

## I couldn't care less about documentation 

I've been subconsciously hunt by this statement I made during the last MVP Summit among a bunch of very smart people, specially because I'm pretty sure I was misinterpreted as I didn't have a chance to explain my assertion.

I do care about code documentation, clarity, and self-explaining code. You can tell how much I (and the rest of the development team I worked with) care if you take a look at the source code for the Composite UI Application Block. I frequently use the Documentor extension to VS heavily to help me create nice-looking code comments. I do believe [if a feature is not documented, for all practical purposes it's as if it doesn't exist](http://www.codinghorror.com/blog/archives/000776.html).

What I don't care at all is about the debate we were having about [Sandcastle](http://blogs.msdn.com/sandcastle/) vs [NDoc](http://ndoc.sourceforge.net/), and which tools you use to generate documentation, packaging format (do you use a chm? an hxs? html?), etc. In my mind, those are things that should happen automatically when I do "File -> New Project" (setting up the MSBuild tasks to do everything automatically on release builds). I shouldn't have to worry about any of that. Even today, once the continuous integration is running and configured to generate the docs automatically, I can simply forget about it, almost forever. That's why I said I couldn't care less about it. 

posted on Monday, July 30, 2007 8:04 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

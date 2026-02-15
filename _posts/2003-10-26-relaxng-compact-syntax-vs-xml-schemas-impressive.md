---
layout: post
title: 'RelaxNG Compact Syntax vs XML Schemas: impressive!'
date: 2003-10-26 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/33507
tags:
- XML

---

I've reading about blogging formats, undergoing specs, and the like, and I eventually ended in [Tim Bray weblog](http://www.tbray.org/ongoing/), and his multi-version schema for [PIE/ECHO/ATOM/Whatever (PEAW)](http://www.tbray.org/ongoing/When/200x/2003/08/18/PieSchema02). You can look at the [RelaxNG Compact Syntax](http://www.tbray.org/ongoing/pie/0.2/pie02.rnc) version as well as the [XML Schema](http://www.tbray.org/ongoing/pie/0.2/pie02.xsd) version.   
Boy, 2Kb vs 6kb!! And the RelaxNG version is actually FAR more readable! And it uses the built-in XSD Types! Please, you NEED to have a look at both. 

I've [implemented](http://sf.net/projects/dotnetopensrc) the [](http://www.schematron.com/)Schematron XML validation language for .NET... maybe I should start having a look at RelaxNG now :). However, I saw a [RelaxNG](http://cvs.hispalinux.es/cgi-bin/cvsweb/mcs/class/Commons.Xml.Relaxng/?cvsroot=mono) folder in the Mono source, so it seems those guys are beating MS this time... or will we have a surprise in Whidbey?  
As a developer, I'd love to have the choice in .NET to use one or the other, specially because XSD is not easy to tackle at first, and many developers completely ignore its capabilities, and design plain wrong schemas. RelaxNG looks so much simple that it would be quite easy to get up to speed designing complex schemas with it. And of course, there's a non-compact XML [version too](http://www.tbray.org/ongoing/pie/0.2/pie02.rng). 

/kzu

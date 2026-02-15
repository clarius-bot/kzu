---
layout: post
title: Religious, unproductive and useless contract-first vs code-first discussions
  again
date: 2005-05-09 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/WsMeetsRealWorld
tags:
- .NET
- All Technology
- XML

---

Every now and then, an [article](http://msdn.microsoft.com/msdnmag/issues/05/05/ServiceStation/default.aspx) revives that old [debate](http://www.25hoursaday.com/weblog/CommentView.aspx?guid=e1ab8978-f0a9-4913-bee3-badc1cbefbe5) on whether to code web services starting from XSD/WSDL or starting from classes that generate the former. Answers from [one side](http://pluralsight.com/blogs/aaron/archive/2005/04/25/7729.aspx) or [the other](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=e17a8a0e-d5c1-4b5d-9e37-78793f518601) fail to realize the truth: [there's no black and white in the real world](http://pluralsight.com/blogs/craig/archive/2005/04/27/7786.aspx). Amen [Craig](http://pluralsight.com/blogs/craig/)!  
  
Just for the record: I agree with Craig in that you cannot do one without the other. Which way you start, is a matter of timing, which won't save you from learning both technologies. And I would even argue that learning how to properly understand and use the host of XML serialization attributes to get what you want on the wire is almost on a pair with learning XSD (except for the esoteric features like substitution groups that you don't even need to learn as they are not even supported by XmlSerializer).  

/kzu

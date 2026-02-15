---
layout: post
title: Don't know what SHA1, DPAPI and Initialization Vector is? Crypto made simpe
  at last!
date: 2004-03-11 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/87737
tags:
- .NET

---

[Hernan de Lahitte](http://weblogs.asp.net/hernandl) brings signing, encrypting and hashing to the masses with his [Crypto for Everyone](http://weblogs.asp.net/hernandl/archive/2004/03/08/85884.aspx) post. His work is not pet-project development. I worked with this guy in probably the biggest .NET project in Argentina, and he really knows what security means. The helpers he presents are fully tested, widely used in that project to perform many security-sensitive actions, and is really a time-saver for anyone (like myself) who just wants to call a method and get somebody else worry about the intricacies of cryptography.

Next time you need to encrypt a license key, a password, in-memory (i.e. CallContext) data internal to your framework, etc., be sure to download it. 

/kzu

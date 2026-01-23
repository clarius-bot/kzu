---
layout: post
title: "Daniel Cazzulino's Blog : Who failed to validate XML?"
date: 2004-03-24 00:00:00 +0000
---

Daniel Cazzulino's Blog : Who failed to validate XML?


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20081122022402im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081122022402im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081122022402im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081122022402im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Who failed to validate XML? 

Today, you validate XML in .NET v1.x by creating an `XmlValidatingReader`, setting the schema, and reading: 

// Configure the validating reader XmlValidatingReader vr = new XmlValidatingReader(theinput); // Add the schema to the reader (usually the schema is preloaded only once). vr.Schemas.Add(theschema); while (vr.Read()) { // Do your stuff. }

You have two options for handling invalid content in the input document (with regards to the schema/s): 

  1. Catch the exception thrown at the first error, halting processing: try { while (vr.Read()) { // Do your stuff. } } catch (XmlException ex) { // Report the *parse* exception/rethrow. } catch (XmlSchemaException ex) { // Report the *validation* exception. } 
  2. Attach to the `ValidationEventHandler` (according to .NET naming conventions this would have been named `ValidationError` or something like that): vr.ValidationEventHandler += new ValidationEventHandler(OnValidationError); while (vr.Read()) { // Do your stuff. } if (_haserrors) { // Report the errors/throw. } Here you get a chance of sort of recovering from errors, as you can keep reading and working with data. The `_haserrors` flag is set by your ` OnValidationError` event handler, as well as the accumulation of error messages. 

So far so good. All this is clearly explained in the [ MSDN documentation](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpguide/html/cpconxmlvalidatingreadervalidationeventhandlercallback.asp). The validation handler signature looks just like what you would expect: 

void ValidationCallback(object sender, ValidationEventArgs e) { }

In case 2, what happens to the invalid XML item in the input? Well, it's read anyways, as well as its content. Now, suppose that the element just found doesn't even exist in your schema, and most probably its inner content either. Your validation error messages will be filled with errors about each and every single item inside the erroneous element. What's more, I may want my application to work in a "forgiveness" mode and so do something useful with what IS valid so far.

Easy enough, I though. I have a `sender` in my validation callback. I bet it's the reader. I just have to cast it back, call the [ `Skip`](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemxmlxmlreaderclassskiptopic.asp) method, accumulate just one error for the current validation failure, and move on:

private void OnValidationError(object sender, ValidationEventArgs e) { if (e.Severity = XmlSeverityType.Error) { // Accumulate error, set flag. ((XmlReader)sender).Skip(); } }

Unfortunately, the `sender` is `null` in v1.x, so no luck.   
The good news is that this has been fixed in the PDC bits. Maybe we can hope a service pack/hotfix for v1.1...

posted on Wednesday, March 24, 2004 8:24 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20081122022402im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
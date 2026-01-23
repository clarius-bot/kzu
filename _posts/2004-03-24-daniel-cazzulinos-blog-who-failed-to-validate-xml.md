---
layout: post
title: "Daniel Cazzulino's Blog : Who failed to validate XML?"
date: 2004-03-24 00:00:00 +0000
---

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

/kzu

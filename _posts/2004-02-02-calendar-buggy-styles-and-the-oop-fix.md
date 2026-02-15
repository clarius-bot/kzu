---
layout: post
title: Calendar buggy styles, and the OOP fix!
date: 2004-02-02 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/66130
tags:
- ASP.NET

---

[VGA](http://weblogs.asp.net/vga/archive/2004/02/01/CalendarsBuggyStyleHandling.aspx) found a recurrent problem most developers and users of the MS Calendar control seem to have, namely, its poor integration with CSS styles. Being an OOP fan, I clearly see an easy way to solve this problem. Inherit Calendar and change its behavior! That's the cool thing about .NET and the new ASP.NET. It's all too easy: 

public class UnStyledCalendar : Calendar { protected override void Render(HtmlTextWriter writer) { base.Render (new NonStyleWriter( writer) ); } } 

Cool, huh? The "secret", of course, is the derived writer, which simply implements a passthrough `HtmlTextWriter` descendant which skips calls to the virtual `AddStyleAttribute` and `WriteStyleAttribute` methods: 

private class NonStyleWriter : HtmlTextWriter { HtmlTextWriter _writer; public NonStyleWriter(HtmlTextWriter innerWriter) : base(innerWriter.InnerWriter) { _writer = innerWriter; } public override void AddAttribute(HtmlTextWriterAttribute key, string value) { _writer.AddAttribute(key, value); } // Passthrough all other methods public override void AddStyleAttribute(HtmlTextWriterStyle key, string value) { // Do nothing here. We don't want style attributes! } public override void AddStyleAttribute(string name, string value) { // Do nothing here. We don't want style attributes! } public override void WriteStyleAttribute(string name, string value) { // Do nothing here. We don't want style attributes! } public override void WriteStyleAttribute(string name, string value, bool fEncode) { // Do nothing here. We don't want style attributes! } } 

What you get is a calendar without ANY `style=""` attributes whatsoever.  
I leave the task of putting this into a library, copying the XSD from the MS Calendar, installing it under the appropriate VS folder to get intellisense, and toolbox item attribute to VGA, which excels in the matter ;). The code can be downloaded from the [ ASPNET2 Incubator](http://aspnet2.com/incubator/code/UnStyledCalendar.cs.txt)

/kzu

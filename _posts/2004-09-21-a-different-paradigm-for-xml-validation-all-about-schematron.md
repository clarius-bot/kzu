---
layout: post
title: 'A different paradigm for XML validation: all about Schematron'
date: 2004-09-21 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/AllAboutSchematron
tags:
- .NET
- Miscelaneous
- XML

---

## A different paradigm for XML validation: all about Schematron

In a very timely article,Dare ObasanjointroducesSchematronin an MSDN article entitledImproving XML Document Validation with Schematron.

I discovered Schematrontwo years ago, and decided to develop a pure XPath-based implementation in C#, which was also an amazing project to learn System.Xml in depth. In November that year, I presented the project in .NET ONE 2002 in Frankfurt (in an really surprising move and amazing lack of netiquette, the company organizing the event has simply removed all previous conferences materials, so I could only find a link to last year's.NET ONE 2003. Maybe I should letRalfknow, he was one of the organizers...).

I found Schematron to be an amazing extension to my XML toolbox. It makes it very easy to declaratively specify rule-based conditions that must be satisfied in a document in order to be valid. But not only that, it allows natural language reporting of errors in the document, which makes it far more user friendly than XSDs criptic (for an end-user) error messages. Schematron is already onDare's list of nice-to-have features for System.Xml v3.

Aaron Skonnardhas already shown the power of XPath-based rules for XML validation andhow it can be integrated with the WebMethod framework, although this approach is fundamentally flawed, as it puts again business rules in the compiled code, removing all benefits of a declarative language as XML and XPath.

This year it's time to present Schematron atApplied XML Developer's Conference. Besides showing the basis of Schematron, and what it's good for and how it can suplement XSDs, I'll show cool WebMethod framework integration, which allows you to specify a schema, phase, and output format for Schematron validation of incoming messages. I'll also discuss the future of Schematron and its upcoming ISO standarization (there'sa prelimiar draft of the spec).

So, if you want to lean more about it, or if you engage with abunch of amazing industry-renowned professionals in the XML field(not that I consider myself one, of course),register for the conference ASAP, as all previous DevCons were sold out. You should really hurry up, asthere's little extra space left.

posted on Tuesday, September 21, 2004 1:54 AM
						bykzu

/kzu

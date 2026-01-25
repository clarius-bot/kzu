---
layout: post
title: "Daniel Cazzulino's Blog - Making regex authoring easier to read and maintain"
date: 2011-06-13 00:00:00 +0000
---

## Making regex authoring easier to read and maintain

I’m spiking ideas on how to make my regular expressions easier to read and maintain for the dev who comes after me (that could be myself in 3 months, meaning I will surely have forgotten everything about how that crazy regex worked).

I’m aware and wary offluent APIalternativesto building regular expressions which IMO hinder readability more than anything. They are just too verbose.

So here’s a progression of options that I’m thinking of. I’d like to get your feedback on what makes for a readable pattern and how much you care about extension method pollution (since patterns are all strings, extension methods would need to “hang” there):

1:

```
// "old"-style, may need to duplicate patterns on the full expression
private const string StringValue = "(\"[^\"]+\"|[\\S]+))";
```

2:

```
// extracting component patterns to make it explicit what they match
private const string NonWhitespace = "[\\S]+";
private const string QuotedValue = "\"[^\"]+\"";

private const string StringValue = "(" + QuotedValue + "|" + NonWhitespace + ")";
```

3:

```
private const string NonWhitespace = "[\\S]+";
private const string QuotedValue = "\"[^\"]+\"";

// using extension methods on string to compose instead of string concat. pollutes string.[...].
// can't be a const anymore. methods all returns further strings
private static readonly string StringValue = QuotedValue.Alternate(NonWhitespace).Group();
```

4:

```
private const string NonWhitespace = "[\\S]+";
private const string QuotedValue = "\"[^\"]+\"";

// using an extension method entry point avoids polluting string.[...]
// note implicit cast to string from the fluent API "holder", as the methods are no longer extension
// methods, they live in a RegexBuilder fluent class)
private static readonly string StringValue = QuotedValue.Regex().Alternate(NonWhitespace).Group();
```

5:

```
private const string NonWhitespace = "[\\S]+";
private const string QuotedValue = "\"[^\"]+\"";

// (ab?)using operator overloading when possible. opinionated concat here, as we assume alternation is
// wrapped in a group always (most common scenario, explicit group captures can be used anyway).
private static readonly string StringValue = QuotedValue.Regex() | NonWhitespace;
```

For #5, are there other operator overloads that might be useful? “+” “&” etc? Not sure which ones map intuitively to regex, except for the obvious alternation one…

This will almost surely become a newNETFxso it’s easy to bring in to any project. Let me know what you think!

/kzu

---
layout: post
title: "Daniel Cazzulino"
date: 2006-08-29 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Monday, January 10, 2005 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))| August 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2435'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| 7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2005/1/10.aspx "2 Posts")| 11| 12  
13| 14| 15| 16| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2005/1/19.aspx "1 Post")  
20| 21| 22| 23| 24| 25| 26  
27| 28| 29| 30| 31| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060829233204im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Monday, January 10, 2005 - Posts

#####  [W3C XML Schema and XInclude: impossible to use together???](http://clariusconsulting.net/blogs/kzu/archive/2005/01/10/XsdAndXInclude.aspx)

On a project I'm working on for [MS Patterns & Practices](http://www.microsoft.com/practices), we were excited about the [XInclude spec becoming a recomendation](http://www.w3.org/2004/11/xinclude-pr) and anxious about using it in our project, which is quite heavy on XML usage for configuration. The modularization that could be introduced transparently by XInclude was very compelling. Even if it [will hardly be implemented in .NET v2](http://weblogs.asp.net/cazzu/posts/XIncludeRec.aspx), we could still take advantage of the [Mvp.Xml](http://mvp-xml.sf.net/) project [XInclude.NET](http://mvp-xml.sourceforge.net/xinclude/index.html) implementation [Oleg ](http://www.tkachenko.com/blog/)did. But apparently it's almost impossible to use XInclude and XSD validation together :(  
  
The problem stems from the fact that XInclude (as per the spec) [adds the xml:base attribute to included elements](http://www.w3.org/TR/2004/REC-xinclude-20041220/#base) to signal their origin, and the same can potentially happen with xml:lang. Now, the W3C XML Schema spec says:  

#### 3.4.4 Complex Type Definition Validation Rules

#### 

****Validation Rule: Element Locally Valid (Complex Type)  
...  
********

3 For each attribute information item in the element information item's [[attributes]](http://www.w3.org/TR/xml-infoset/#infoitem.element) excepting those whose [[namespace name]](http://www.w3.org/TR/xml-infoset/#infoitem.attribute) is identical to `http://www.w3.org/2001/XMLSchema-instance` and whose [[local name]](http://www.w3.org/TR/xml-infoset/#infoitem.attribute) is one of `type`, `nil`, `schemaLocation` or `noNamespaceSchemaLocation`, the appropriate **case** among the following must be true:

And then goes on to detailing that everything else needs to be declared explicitly in your schema, including xml:lang and xml:base, therefore :S:S:S.   
  
So, either you modify all your schemas to that each and every element includes those attributes (either by inheriting from a base type or using an attribute group reference), or you validation is bound to fail if someone decides to include something. Note that even if you could modify all your schemas, sometimes it means you will also have to modify the semantics of it, as a simple-typed element which you may have (with the type inheriting from xs:string for example), now has to become a complex type with simple content model only to accomodate the attributes. Ouch!!! And what's worse, if you're generating your API from the schema using tools such as xsd.exe or the much better [XsdCodeGen custom tool](http://weblogs.asp.net/cazzu/posts/XsdCodeGenTool.aspx), the new API will look very different, and you may have to make substancial changes to your application code.  
  
This is an important issue that should be solved in .NET v2, or XInclude will be condemned to poor adoption in .NET. I don't know how other platforms will solve the W3C inconsistency, but [I've logged this as a bug](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?FeedbackId=29376d16-5e56-47d5-a239-f2add05e78bc) and I'm proposing that a property is added to the [XmlReaderSettings](http://msdn2.microsoft.com/library/tyt9ka3c.aspx) class to specify that XML Core attributes should be ignored for validation, such as XmlReaderSettings.IgnoreXmlCoreAttributes = true. Note that [there are a lot of Ignore* properties already](http://msdn2.microsoft.com/library/t4hts0ce.aspx) so it would be quite natural.  
  
Please [vote the bug if](http://lab.msdn.microsoft.com/ProductFeedback/viewFeedback.aspx?FeedbackId=29376d16-5e56-47d5-a239-f2add05e78bc) you feel it's important, and better yet, think of a better solution to it!!! ;)  
  
  

posted [Monday, January 10, 2005 4:00 PM](http://clariusconsulting.net/blogs/kzu/archive/2005/01/10/XsdAndXInclude.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2005/01/10/XsdAndXInclude.aspx#comments)

#####  [The lost art of using regular expressions for parsing?](http://clariusconsulting.net/blogs/kzu/archive/2005/01/10/RegexParsing.aspx)

Regular expressions are really powerful and very cool. Most people think of them as just a validation mechanism. They are missing a big scenario enabled by regexes: parsing.

Some other people think that if you're doing any parsing, you **have** to use parser generator tools (i.e. yacc/lex, antlr, coco/r, etc), build a formal grammar of your language, etc. But do you really **need** to get into that? Do you want proof that you can achieve the same goal with regular expressions? **The ASP.NET page parser is built with regular expressions, and not only the v1.x, but the Whidbey version too.**   
Wanna confirm? Fire up Reflector, search for the `TemplateParser` class in the `System.Web.UI` namespace, and look at the `ParseStringInternal` method. There you will see how the `BaseParser` class is being used to parse the page source, which contains all the regular expressions for the several pieces of a page.

I've build a number of parsers with regexes, from simple expression parsers (i.e. a more flexible and powerful expression format than DataBinder.Eval, for example) to full template file parsing (i.e. templates with ASP-like syntax for codegen, in the spirit of CodeSmith, NVelocity, etc.). And it works very well. And your code using very complex regular expressions [doesn't have to be a cryptic-impossible to read-never ending-line of almost garbage](http://weblogs.asp.net/cazzu/archive/2004/02/10/70621.aspx) that only you can understand.

Bottom-line: learn regular expression. There're a lot of very real problems that you can solve SO easily with them... 

posted [Monday, January 10, 2005 12:35 PM](http://clariusconsulting.net/blogs/kzu/archive/2005/01/10/RegexParsing.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2005/01/10/RegexParsing.aspx#comments)

  

[![](/web/20060829233204im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
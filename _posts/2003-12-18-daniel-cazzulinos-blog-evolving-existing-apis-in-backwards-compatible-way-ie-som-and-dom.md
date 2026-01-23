---
layout: post
title: "Daniel Cazzulino's Blog : Evolving existing APIs in backwards-compatible way (i.e. SOM and DOM)"
date: 2003-12-18 00:00:00 +0000
---

Daniel Cazzulino's Blog : Evolving existing APIs in backwards-compatible way (i.e. SOM and DOM)


### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081011070648im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081011070648im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081011070648im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081011070648im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

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

## Evolving existing APIs in backwards-compatible way (i.e. SOM and DOM) 

[A couple days ago](http://weblogs.asp.net/cazzu/posts/43875.aspx) I posted about the inconvenience of an API that is designed to expose augmented data depending on its state. This is the case for the XmlSchema Object Model (SOM) in .NET and its Post-compilation infoset (PCI), as well as the DOM and its Post-schema validation infoset (PSVI). [Dare Obasanjo](http://weblogs.asp.net/cazzu/posts/43875.aspx#43882) aknowledged this issue, but is resigned, saying it's too late to fix any of this.

I believe it's not. For classes that have grown too big, or became messy by mixing concepts like the two mentioned above, there's still room for improvement, without risk of breaking compatibility, which is a must in a serious framework such as .NET.   
The "solution" involves creating new interfaces to hold the funcional subsets, and make the "legacy" class implement them as simple passthrough accessors to the cluttered "full" interface. In the case of the SOM, a new hierarchy of interfaces could be implemented, starting in a `ICompiledXmlSchema`. The `XmlSchema.Compile` method could return the new type:

`
    
    
    public ICompiledXmlSchema Compile(System.Xml.Schema.ValidationEventHandler handler)
    {
      // Perform compilation as usual
      return (ICompiledXmlSchema) this;
    }

`

Code using the `void` old version would remain unaffected, as they would be using:

`
    
    
    XmlSchema xsd; //Load it somehow
    // Perform compilation as usual
    xsd.Compile(null);

`

In order to take advantage of the pre-compilation version subset a cast would be needed, for example to an `IXmlSchema`:

`
    
    
    IXmlSchema prexsd = (IXmlSchema) XmlSchema.Read(stream, null);

`

This interface would expose pre-compilation only members, such as `XmlSchema.Items`, whereas the `ICompiledXmlSchema` would replace it with `XmlSchema.Elements` and `XmlSchema.Attributes` and `XmlSchema.SchemaTypes` instead.

This offers a more consistent programming model to the newer code taking advantage of these interfaces, while the "legacy" code keeps working. The typical case for read&compile schemas would be, therefore:

`
    
    
    XmlSchema prexsd = XmlSchema.Read(stream, null);
    ICompiledXmlSchema pcixsd = prexsd.Compile(System.Xml.Schema.ValidationEventHandler handler);
    // Now I don't need to worry about pre vs post compilation members!
    

`

Thoughts? 

posted on Thursday, December 18, 2003 12:29 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/123.aspx) :: 

  

[![](/web/20081011070648im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
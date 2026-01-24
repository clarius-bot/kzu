---
layout: post
title: "Daniel Cazzulino's Blog - Evolving existing APIs in backwards-compatible way (i.e. SOM and DOM)"
date: 2003-12-18 00:00:00 +0000
---

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

/kzu

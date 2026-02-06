---
layout: post
title: "XmlSerializer and IXmlSerializable: automatic XSD validation please!"
date: 2003-10-27 00:00:00 +0000
---

The `IXmlSerializable` interface allows you to take full control of the XML serialization of your class whenever the `XmlSerializer` is used. It will check for this interface, and if it finds it, it will use its methods for the serialization, instead of reading the serialization attributes, etc. The interface has the following definition: 

`
    
    
    public interface IXmlSerializable
    {
      XmlSchema GetSchema();
      void ReadXml(XmlReader reader);
      void WriteXml(XmlWriter writer);
    }

`

Having the `GetSchema` method, you would think it performs automatic XSD validation of incoming XML, right? That the `XmlReader` passed to the `ReadXml` method is actually an instance of `XmlValidatingReader` created automatically by the serializer when it detects you implement `IXmlSerializable`, right? WRONG. It doesn't.

Basically the schema is retrieved at the initial temporary assembly generation step (explained in [a previous post](http://weblogs.asp.net/cazzu/posts/32822.aspx)), for reasons I still couldn't find. But it's not used whatsoever after that. Why?  
The `XmlSerializer` constructor takes an `XmlReader`, `TextReader` or `Stream`. It would be all too easy to wrap them with an `XmlValidatingReader` before deserializing the object. Think that the schema you have to return from the `GetSchema` method can be taken from an embedded resource...

I think this would be a great addition to Whidbey.

/kzu

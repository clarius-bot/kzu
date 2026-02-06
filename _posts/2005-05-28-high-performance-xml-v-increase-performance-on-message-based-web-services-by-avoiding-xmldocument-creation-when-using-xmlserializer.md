---
layout: post
title: "High-performance XML (V): Increase performance on message-based web services by avoiding XmlDocument creation when using XmlSerializer"
date: 2005-05-28 00:00:00 +0000
---

## High-performance XML (V): Increase performance on message-based web services by avoiding XmlDocument creation when using XmlSerializer

In a previous post,I discussed the way coarse-grained web service interfaces can be used in a strongly typed wayby resorting to the xsd.exe or acool custom tool. The only problem with that approach is that in order to communicate with the service, you need to pass anXmlNode, when you actually have an instance of an object. People will usually write code like the following to call the service:

```
XmlNode
```

```

```

```

				 // Customer is an XmlSerializer-friendly classCustomer cust = new Customer("Daniel", "Cazzulino", new DateTime(1974, 4, 9));
				// "Convert" the object to an XmlNodeXmlSerializer ser = new XmlSerializer(typeof(Customer));XmlNode customerNode;
				using (MemoryStream mem = new MemoryStream()){    ser.Serialize(mem, cust);    mem.Position = 0;    XmlDocument doc = new XmlDocument();    doc.Load(mem);
				    customerNode = doc.DocumentElement;}
				service.Execute(customerNode);
		
```

// Customer is an XmlSerializer-friendly classCustomer cust = new Customer("Daniel", "Cazzulino", new DateTime(1974, 4, 9));

// "Convert" the object to an XmlNodeXmlSerializer ser = new XmlSerializer(typeof(Customer));XmlNode customerNode;

using (MemoryStream mem = new MemoryStream()){ser.Serialize(mem, cust);mem.Position = 0;XmlDocument doc = new XmlDocument();doc.Load(mem);

customerNode = doc.DocumentElement;}

service.Execute(customerNode);

All the code to perform the XML serialization is so standard and repetitive that most developers will already have some sort of helper class with a single method that receives an objects and gives them back anXmlNode"view" of it.

```
XmlNode
```

There are several problems with this approach, though, all of them affecting the performance of your application:

- Even if the information of the object is already in memory in the typed class, a new "copy" is generated through theXmlSerializer, consuming more memory as a consequence (the MemoryStream).
- XML must be parsed from the stream, now consuming CPU processing
- AnXmlDocumentwith its entire object graph is built from the parsing process (that happens automatically when you call Load on it), which is now a different "view" of your object, but in terms of the DOM, which you will not use at all in your application

```
XmlSerializer
```

```
XmlDocument
```

Interestingly, none of that is necessary, if you know the internal workings of the web service infrastructure used on the client-side proxy, which doesn't differ much from the one used on the server (asmx) side.

TheXmlNodeyou pass to the service method call must be serialized and embedded as the body of the SOAP message to send to the server. Just like I explained a while back that it happens on the server side, the infrastructure will callXmlNode.WriteTo(XmlWriter w)passing a writer to emit content to the body of the SOAP message. So all we need to do is hold a "faked"XmlNodeuntil that method is called, and serialize the object graph directly to that writer instead:

```
XmlNode
```

```
XmlNode.WriteTo(XmlWriter w)
```

```
XmlNode
```

```

```

```

				public class ObjectNode : XmlElement{    private object serializableObject;
				    // All arguments for the base class are irrelevant.    public ObjectNode(object serializableObject)        : base("mvp", "xml", string.Empty, new XmlDocument())    {        this.serializableObject = serializableObject;    }
				    public override void WriteTo(XmlWriter w)    {        XmlSerializer ser = new XmlSerializer(serializableObject.GetType());        ser.Serialize(w, serializableObject);    }}
		
```

public class ObjectNode : XmlElement{private object serializableObject;

// All arguments for the base class are irrelevant.public ObjectNode(object serializableObject): base("mvp", "xml", string.Empty, new XmlDocument()){this.serializableObject = serializableObject;}

public override void WriteTo(XmlWriter w){XmlSerializer ser = new XmlSerializer(serializableObject.GetType());ser.Serialize(w, serializableObject);}}

Now your client code will look like the following:

```

```

```

				// Customer is an XmlSerializer-friendly classCustomer cust = new Customer("Daniel", "Cazzulino", new DateTime(1974, 4, 9));
		
```

// Customer is an XmlSerializer-friendly classCustomer cust = new Customer("Daniel", "Cazzulino", new DateTime(1974, 4, 9));

service.Execute(new XmlObjectNode(cust));

Now your client application will never consume resources for copying the object to a stream, parsing and loading anXmlDocumentjust to make a web service call. This will result in a significant performance increment, which will depend on the kind of object graphs you usually serialize.

```
XmlDocument
```

For consistency with the approach I explained before for increasing the performance in this kind of scenario on the server side, theMvp.Xmlproject implements this as another overload on theXmlNodeFactoryclass, so that your code is completely isolated from the implementation (which could even be based on the inefficient one explained before). Consuming code is equally simple, though:

```
XmlNodeFactory
```

```

```

```

				service.Execute(XmlNodeFactory.Create(cust));
				The internal implementation is just another overload returning a custom SerializableNode type:
				
						public class XmlNodeFactory{    public static XmlNode Create(object serializableObject)    {        return new ObjectNode(serializableObject);    }    ….    private class ObjectNode : SerializableNode    {        private object serializableObject;
				        public ObjectNode() {}
				        public ObjectNode(object serializableObject)        {            this.serializableObject = serializableObject;        }
				        public override void WriteTo(XmlWriter w)        {            XmlSerializer ser = new XmlSerializer(serializableObject.GetType());            ser.Serialize(w, serializableObject);        }}
		
```

service.Execute(XmlNodeFactory.Create(cust));

The internal implementation is just another overload returning a custom SerializableNode type:

public class XmlNodeFactory{public static XmlNode Create(object serializableObject){return new ObjectNode(serializableObject);}….private class ObjectNode : SerializableNode{private object serializableObject;

public ObjectNode() {}

public ObjectNode(object serializableObject){this.serializableObject = serializableObject;}

public override void WriteTo(XmlWriter w){XmlSerializer ser = new XmlSerializer(serializableObject.GetType());ser.Serialize(w, serializableObject);}}

You candownload the Mvp.Xml project (binary and sources) from SourceForge.

This post is part of theXML Performance series.

posted on Saturday, May 28, 2005 6:17 PM
						bykzu

/kzu

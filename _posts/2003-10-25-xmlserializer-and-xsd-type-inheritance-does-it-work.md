---
layout: post
title: 'XmlSerializer and XSD Type Inheritance: does it work?'
date: 2003-10-25 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/33470
tags:
- XML

---

One of the most powerful XML Schema features is its hability to validate documents based on element types, instead of element names. That is no matter which element name is used in an instance document, say `Customer`, ` customer` and `CRMCustomer`, as far as our XSD Schema makes them all inherit from say `CustomerDef`, the document will be valid. This is very important in interoperability scenarios, of course.   
That said, one of the most versatile and performat ways to handle XML in .NET (forget about `XmlDocument`) is using the `XmlSerializer` class. Coupled with XSD.EXE or the technique I exposed [ in a previous post](http://weblogs.asp.net/cazzu/posts/33302.aspx), you can easily autogenerate the classes from that schema. So far so good.

+ For the curious, here's such a schema (a trivial one here of couse). 

`
    
    
    <?xml version="1.0" encoding="utf-8" ?>
    <xs:schema id="Customers" 
      targetNamespace="http://www.lagash.com/schemas/customers" 
      elementFormDefault="qualified" 
      xmlns="http://www.lagash.com/schemas/customers"
      xmlns:mstns="http://www.lagash.com/schemas/customers" 
      xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xs:complexType name="CustomerDef">
        <xs:sequence>
          <xs:element name="Name" type="xs:string" />
          <xs:element name="EMail" type="xs:string" />
        </xs:sequence>
      </xs:complexType>
      <xs:element name="customer" type="CustomerDef"></xs:element>
      <xs:element name="Customer" type="CustomerDef"></xs:element>
      <xs:element name="CustomerCRM" type="CustomerDef"></xs:element>
    </xs:schema>

`

  

+ And here are the different instance documents. 

`
    
    
    <?xml version="1.0" encoding="utf-8" ?> 
    <Customer xmlns="http://www.lagash.com/schemas/customers">
      <Name>Daniel Cazzulino</Name>
      <EMail>customer@example.com</EMail>
    </Customer>
    
    <?xml version="1.0" encoding="utf-8" ?> 
    <customer xmlns="http://www.lagash.com/schemas/customers">
      <Name>Daniel Cazzulino</Name>
      <EMail>customer@example.com</EMail>
    </customer>
    
    <?xml version="1.0" encoding="utf-8" ?> 
    <CustomerCRM xmlns="http://www.lagash.com/schemas/customers">
      <Name>Daniel Cazzulino</Name>
      <EMail>customer@example.com</EMail>
    </CustomerCRM>

`

However, only one of the three versions will work, the one with the element "customer". The other versions, which are equally valid according to the schema, and which are of the desired type `CustomerDef` will fail with an exception saying the element was not expected. As I explained while [discussing `XmlSerializer` speed](http://weblogs.asp.net/cazzu/posts/32822.aspx), it creates a temporary assembly for reading and writing the serialized version of a type. We're interested in the reader now.   
When the XSD shown above is used to generate the XmlSerializable class, we get a class definition like the following: 

`
    
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.lagash.com/schemas/customers")]
    [System.Xml.Serialization.XmlRootAttribute("customer", Namespace="http://www.lagash.com/schemas/customers", IsNullable=false)]
    public class CustomerDef 
    {
      /// <remarks/>
      public string Name;
      
      /// <remarks/>
      public string EMail;
    }

`

From the definition above, the `XmlSerializer` will create the temporary reader. The reader will contain a set of `Read` methods according to those serialization attributes. Using the technique explained in the [aforemetioned post](http://weblogs.asp.net/cazzu/posts/32822.aspx), I got the temporary generated class. The reader contains a `Read4_customer` method which is the one that tries to load the XML. The problem is that this method uses a stored string (taken from the serialization attributes) and performs an element name/namespace string comparison. Therefore, it will always fail with the other two valid root elements. 

I found a very interesting thing though, while digging inside the generated reader. It has a method with the signature `CustomerDef Read1_CustomerDef(bool isNullable, bool checkType)` which is perfectly capable of loading the object. However, getting this far was very difficult. First, I had to add this temporary class to my project and make that method public, as it's private by default, and second, there's no "public" way of initializing this reader. You have to call an internal `Init` method on the base `XmlSerializationReader` class. Thanks GOD we still have reflection to test these things! 

`
    
    
    MethodInfo m = typeof(XmlSerializationReader).GetMethod(
      "Init", BindingFlags.Instance | BindingFlags.NonPublic);
    
    using (FileStream c = new FileStream(@"C:\CustomerCRM.xml", FileMode.Open))
    {
      XmlValidatingReader vr = new XmlValidatingReader(new XmlTextReader(c));
      vr.Schemas.Add(xsd);
      
      // Create the temp. reader manually
      Microsoft.Xml.Serialization.GeneratedAssembly.CustomerDefReader cr = 
        new Microsoft.Xml.Serialization.GeneratedAssembly.CustomerDefReader();
      
      // Call Init through reflection
      m.Invoke(cr, new object[] { vr, null, null, null } );
      
      // Read with the method that checks the type
      object cust = cr.Read1_CustomerDef( false, false );
      Console.WriteLine(cust);
    }

`

That method will sucessfully load any of the three versions for the root element, either if they have the `xsi:type` attribute set, in which case the `Read1_CustomerDef` could use a `true` for the second parameter (checkType), or not. Another method that is generated and could work is `Read2_Object`, if it receives `checkType=true` and the instance document uses `xsi:type` to specify that it's a `CustomerDef` instance (which is not always possible if you're receiving the document from a third party). Unfortunately, like I said above, the code that calls `Read1_CustomerDef`, and which is the one called by the serializer to load the XML, only checks for names:

`
    
    
    public object Read4_customer() {
        object o = null;
        Reader.MoveToContent();
        if (Reader.NodeType == System.Xml.XmlNodeType.Element) {
            if (((object) Reader.LocalName == (object)id5_customer && 
                (object) Reader.NamespaceURI == (object)id2_httpwwwlagashcomschemascustomers)) {
                o = Read1_CustomerDef(false, true);
            }
            else {
                throw CreateUnknownNodeException();
            }
        }
        else {
            UnknownNode(null);
        }
        return (object)o;
    }

`

Note the very efficient use of string reference comparison, by casting them to `Object`.

One way to solve this would be if the `XmlRootAttribute` could be specified multiple times, so that the generated code checks for multiple names.   
The other, more XSD-compliant and certainly more flexible as it wouldn't require regeneration of the serializable class (CustomerDef in this case) to reflect new element names, would be to check if the current `Reader` is actually an `XmlValidatingReader` and read the customer if the type matches. The previous code can be modified as follows to make this work: 

`
    
    
    public object Read4_customer() {
      object o = null;
      Reader.MoveToContent();
      if (Reader.NodeType == System.Xml.XmlNodeType.Element) {
    
    
        // Check for validating reader with schema type determined
        if (Reader is System.Xml.XmlValidatingReader && 
          ((System.Xml.XmlValidatingReader) Reader).SchemaType != null) {
          System.Xml.Schema.XmlSchemaType type = (System.Xml.Schema.XmlSchemaType)
            ((System.Xml.XmlValidatingReader) Reader).SchemaType;
          // We would have to check the inheritance chain too.
          if (((object) type.Name == (object)id1_CustomerDef && 
            (object) type.QualifiedName.Namespace == (object)id2_httpwwwlagashcomschemascustomers)) {
            o = Read1_CustomerDef(false, true);
          }
        }
    
    
        else if (((object) Reader.LocalName == (object)id5_customer && 
          (object) Reader.NamespaceURI == (object)id2_httpwwwlagashcomschemascustomers)) {
          o = Read1_CustomerDef(false, true);
        }
        else {
          throw CreateUnknownNodeException();
        }
      }
      else {
        UnknownNode(null);
      }
      return (object)o;
    }
    

`

Of course this would require a validating reader with the appropriate schema loaded, by why would you create an XSD otherwise? Would you loose all those powerful validation capabilities and instead use it only to save you some lines of class definition code and Xml serialization attributes? If you do, I urge you to think twice, you're really missing something that can greatly improve your code (no more validation of ranges, patterns, etc.).

Another interesting thing I found is that the `XmlSerializer` can be inherited, and it has a protected method that allows you to deserialize directly from an `XmlSerializationReader`. That would have solve my previous reflection problems, as I could simply inherit the serializer and make a public method receiving my modified reader and pass it through to it. That would even make for maybe more efficient custom deserialization, for example one where the temporary assemblies are not generated each time the application starts but rather stored in a permanent location for reuse across AppDomains (maybe a DB?). Remember the initial generation and compilation performance hit is significant. Unfortunately, that method implementation throws a `NotImplementedException` :((((((. But that makes me wonder if in Whidbey it's possible.... :) 

In a future post, maybe here, maybe on MSDN online, I will explain how to take advantage of `IXmlSerializable` interface to implement custom serialization but also to gain automatic XSD validation right from your assembly-embedded schema.

+ For the curious, the complete XmlSerializer-generated file for the schema. 

`
    
    
    [assembly:System.Security.AllowPartiallyTrustedCallers()]
    namespace Microsoft.Xml.Serialization.GeneratedAssembly {
    
      public class XmlSerializationWriter1 : System.Xml.Serialization.XmlSerializationWriter {
    
        void Write1_CustomerDef(string n, string ns, WebLogConsole.XSD.CustomerDef o, bool isNullable, bool needType) {
          if ((object)o == null) {
            if (isNullable) WriteNullTagLiteral(n, ns);
            return;
          }
          if (!needType) {
            System.Type t = o.GetType();
            if (t == typeof(WebLogConsole.XSD.CustomerDef))
              ;
            else {
              throw CreateUnknownTypeException(o);
            }
          }
          WriteStartElement(n, ns, o);
          if (needType) WriteXsiType(@"CustomerDef", @"http://www.lagash.com/schemas/customers");
          WriteElementString(@"Name", @"http://www.lagash.com/schemas/customers", ((System.String)o.@Name));
          WriteElementString(@"EMail", @"http://www.lagash.com/schemas/customers", ((System.String)o.@EMail));
          WriteEndElement(o);
        }
    
        void Write2_Object(string n, string ns, System.Object o, bool isNullable, bool needType) {
          if ((object)o == null) {
            if (isNullable) WriteNullTagLiteral(n, ns);
            return;
          }
          if (!needType) {
            System.Type t = o.GetType();
            if (t == typeof(System.Object))
              ;
            else if (t == typeof(WebLogConsole.XSD.CustomerDef)) {
              Write1_CustomerDef(n, ns, (WebLogConsole.XSD.CustomerDef)o, isNullable, true);
              return;
            }
            else {
              WriteTypedPrimitive(n, ns, o, true);
              return;
            }
          }
          WriteStartElement(n, ns, o);
          WriteEndElement(o);
        }
    
        protected override void InitCallbacks() {
        }
    
        public void Write3_customer(object o) {
          WriteStartDocument();
          if (o == null) {
            WriteEmptyTag(@"customer", @"http://www.lagash.com/schemas/customers");
            return;
          }
          TopLevelElement();
          Write1_CustomerDef(@"customer", @"http://www.lagash.com/schemas/customers", ((WebLogConsole.XSD.CustomerDef)o), false, false);
        }
      }
    
      public class XmlSerializationReader1 : System.Xml.Serialization.XmlSerializationReader {
    
        WebLogConsole.XSD.CustomerDef Read1_CustomerDef(bool isNullable, bool checkType) {
          if (isNullable && ReadNull()) return null;
          if (checkType) {
            System.Xml.XmlQualifiedName t = GetXsiType();
            if (t == null || ((object) ((System.Xml.XmlQualifiedName)t).Name == (object)id1_CustomerDef && (object) ((System.Xml.XmlQualifiedName)t).Namespace == (object)id2_httpwwwlagashcomschemascustomers))
              ;
            else
              throw CreateUnknownTypeException((System.Xml.XmlQualifiedName)t);
          }
          WebLogConsole.XSD.CustomerDef o = new WebLogConsole.XSD.CustomerDef();
          bool[] paramsRead = new bool[2];
          while (Reader.MoveToNextAttribute()) {
            if (!IsXmlnsAttribute(Reader.Name)) {
              UnknownNode((object)o);
            }
          }
          Reader.MoveToElement();
          if (Reader.IsEmptyElement) {
            Reader.Skip();
            return o;
          }
          Reader.ReadStartElement();
          Reader.MoveToContent();
          while (Reader.NodeType != System.Xml.XmlNodeType.EndElement) {
            if (Reader.NodeType == System.Xml.XmlNodeType.Element) {
              if (!paramsRead[0] && ((object) Reader.LocalName == (object)id3_Name && (object) Reader.NamespaceURI == (object)id2_httpwwwlagashcomschemascustomers)) {
                o.@Name = Reader.ReadElementString();
                paramsRead[0] = true;
              }
              else if (!paramsRead[1] && ((object) Reader.LocalName == (object)id4_EMail && (object) Reader.NamespaceURI == (object)id2_httpwwwlagashcomschemascustomers)) {
                o.@EMail = Reader.ReadElementString();
                paramsRead[1] = true;
              }
              else {
                UnknownNode((object)o);
              }
            }
            else {
              UnknownNode((object)o);
            }
            Reader.MoveToContent();
          }
          ReadEndElement();
          return o;
        }
    
        System.Object Read2_Object(bool isNullable, bool checkType) {
          if (isNullable && ReadNull()) return null;
          if (checkType) {
            System.Xml.XmlQualifiedName t = GetXsiType();
            if (t == null)
              return ReadTypedPrimitive(new System.Xml.XmlQualifiedName("anyType", "http://www.w3.org/2001/XMLSchema"));
            else if (((object) ((System.Xml.XmlQualifiedName)t).Name == (object)id1_CustomerDef && (object) ((System.Xml.XmlQualifiedName)t).Namespace == (object)id2_httpwwwlagashcomschemascustomers))
              return Read1_CustomerDef(isNullable, false);
            else
              return ReadTypedPrimitive((System.Xml.XmlQualifiedName)t);
          }
          System.Object o = new System.Object();
          bool[] paramsRead = new bool[0];
          while (Reader.MoveToNextAttribute()) {
            if (!IsXmlnsAttribute(Reader.Name)) {
              UnknownNode((object)o);
            }
          }
          Reader.MoveToElement();
          if (Reader.IsEmptyElement) {
            Reader.Skip();
            return o;
          }
          Reader.ReadStartElement();
          Reader.MoveToContent();
          while (Reader.NodeType != System.Xml.XmlNodeType.EndElement) {
            if (Reader.NodeType == System.Xml.XmlNodeType.Element) {
              UnknownNode((object)o);
            }
            else {
              UnknownNode((object)o);
            }
            Reader.MoveToContent();
          }
          ReadEndElement();
          return o;
        }
    
        protected override void InitCallbacks() {
        }
    
        public object Read4_customer() {
          object o = null;
          Reader.MoveToContent();
          if (Reader.NodeType == System.Xml.XmlNodeType.Element) {
            if (((object) Reader.LocalName == (object)id5_customer && (object) Reader.NamespaceURI == (object)id2_httpwwwlagashcomschemascustomers)) {
              o = Read1_CustomerDef(false, true);
            }
            else {
              throw CreateUnknownNodeException();
            }
          }
          else {
            UnknownNode(null);
          }
          return (object)o;
        }
    
        System.String id4_EMail;
        System.String id2_httpwwwlagashcomschemascustomers;
        System.String id3_Name;
        System.String id5_customer;
        System.String id1_CustomerDef;
    
        protected override void InitIDs() {
          id4_EMail = Reader.NameTable.Add(@"EMail");
          id2_httpwwwlagashcomschemascustomers = Reader.NameTable.Add(@"http://www.lagash.com/schemas/customers");
          id3_Name = Reader.NameTable.Add(@"Name");
          id5_customer = Reader.NameTable.Add(@"customer");
          id1_CustomerDef = Reader.NameTable.Add(@"CustomerDef");
        }
      }
    }

`

/kzu

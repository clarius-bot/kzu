---
layout: post
title: "Daniel Cazzulino"
date: 2004-01-23 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : XML extensibility, xsi:type, XmlSerializer and configuration (or how to leverage XmlSerializer + OO extensibility)

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2588'\))| March 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2647'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 1| 2| 3  
4| 5| 6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/1/8.aspx "1 Post")| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/1/9.aspx "2 Posts")| 10  
11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/1/12.aspx "1 Post")| 13| 14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/1/16.aspx "1 Post")| 17  
18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/1/19.aspx "1 Post")| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/1/20.aspx "2 Posts")| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/1/21.aspx "1 Post")| [22](http://clariusconsulting.net/blogs/kzu/archive/2004/1/22.aspx "1 Post")| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/1/23.aspx "1 Post")| 24  
25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/1/26.aspx "2 Posts")| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070302155813im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## XML extensibility, xsi:type, XmlSerializer and configuration (or how to leverage XmlSerializer + OO extensibility) 

Consider the following XML:
    
    
    <Person>  
    
      <FirstName>Daniel</FirstName>  
    
      <LastName>Cazzulino</LastName>  
    
    </Person>

We can use the XmlSerializer to reconstruct an instance of the following class from it:
    
    
    public class Person  
    
    {  
    
      public string FirstName  
    
      {  
    
        get { return _first; }  
    
        set { _first = value; }  
    
      } string _first;  
      
    
      public string LastName  
    
      {  
    
        get { return _last; }  
    
        set { _last = value; }  
    
      } string _last;  
    
    }

So far so good. Now, if we use the XmlSerializer to serialize an instance of Person to Xml, you'd be "surprised" to get the following XML (declaration aside):
    
    
    <Person xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">  
    
      <FirstName>Daniel</FirstName>  
    
      <LastName>Cazzulino</LastName>  
    
    </Person>

Now, those namespace declaration weren't there in the original XML! The only way to get rid of them is to create a custom XmlTextWriter to use with the XmlSerializer:
    
    
    public class NonXsiTextWriter : XmlTextWriter  
    
    {  
    
      public NonXsiTextWriter( TextWriter w ) : base( w ) {}  
    
      public NonXsiTextWriter( Stream w, Encoding encoding ) : base( w, encoding ) {}  
    
      public NonXsiTextWriter( string filename, Encoding encoding ) : base( filename, encoding ) {}  
      
    
      bool _skip = false;  
      
    
      public override void WriteStartAttribute( string prefix, string localName, string ns )  
    
      {  
    
        if ( prefix == "xmlns" && ( localName == "xsd" || localName == "xsi" ) )   // Omits XSD and XSI declarations.  
    
        {  
    
          _skip = true;  
    
          return;  
    
        }  
    
        base.WriteStartAttribute( prefix, localName, ns );  
    
      }  
      
    
      public override void WriteString( string text )  
    
      {  
    
        if ( _skip ) return;  
    
        base.WriteString( text );  
    
      }  
      
    
      public override void WriteEndAttribute()  
    
      {  
    
        if ( _skip )  
    
        {  
    
          // Reset the flag, so we keep writing.  
    
          _skip = false;  
    
          return;  
    
        }  
    
        base.WriteEndAttribute();  
    
      }  
    
    }  
    

The skip flag works because everytime an attribute is being written, the three methods are called in a sequence: WriteStartAttribute, WriteString and WriteEndAttribute. Now, our writer will omit the xsd and xsi namespace declarations and preserve full fidelity with regards to the original XML. We just need to pass our writer to the XmlSerializer:
    
    
    StringWriter sw = new StringWriter();  
    
    ser.Serialize( new NonXsiTextWriter( sw ), person );  
    
    Console.WriteLine( sw.ToString() );

Update: there's [another way](http://groups.google.com/groups?hl=en&lr=lang_en|lang_es&ie=UTF-8&oe=UTF-8&selm=e4wQER%24MCHA.2428%40tkmsftngp12) to achieve this namespace declarations omissions, as pointed by Jiho Han. But we will still need the specialized writer below.

Let's go a bit further and say we have an Employee class that inherits from Person:
    
    
    public class Employee : Person  
    
    {  
    
      public string EmployeeID  
    
      {  
    
        get { return _id; }  
    
        set { _id = value; }  
    
      } string _id;  
    
    }  
    

This is only natural in most OO apps. Now, serializing an instance of Employee will result in the following XML (using our NonXsiTextWriter):
    
    
    <Employee>  
    
      <FirstName>Daniel</FirstName>  
    
      <LastName>Cazzulino</LastName>  
    
      <EmployeeID>1234</EmployeeID>  
    
    </Employee>

Well, Houston, we have a problem. Even when Employee inherits from Person, the XmlSerializer will no longer be able to deserialize this XML into a Person object, because it expects a root <Person> element. So, what we can do is make the Employee class expect/render the root element of a Person object:
    
    
    [XmlRoot("Person")]  
    
    public class Employee : Person  
    

The XmlSerializer will be able to deserialize the following XML into a Person or an Employee, depending on the Type passed to its ctor:
    
    
    <Person>  
    
      <FirstName>Daniel</FirstName>  
    
      <LastName>Cazzulino</LastName>  
    
      <EmployeeID>1234</EmployeeID>  
    
    </Person>

So far so good. Now, if we have an XML containing a bunch of <Person> elements, let's say <People>, and its corresponding class: 
    
    
    public class People  
    
    {  
    
      [XmlElement("Person", typeof(Person))]  
    
      public Person[] AllPeople  
    
      {  
    
        get { return _people; }  
    
        set { _people = value; }  
    
      } Person[] _people;  
    
    }

The XmlSerializer will be perfectly capable of deserializing the following XML:
    
    
    <People>  
    
      <Person>  
    
        <FirstName>Daniel</FirstName>  
    
        <LastName>Cazzulino</LastName>  
    
      </Person>  
    
      <Person>  
    
        <FirstName>Victor</FirstName>  
    
        <LastName>Garcia Aprea</LastName>  
    
      </Person>  
    
    </People>  
    

And it will be able to generate exactly the same document from the following object:
    
    
    People p = new People();  
    
    p.AllPeople = new Person[] {  
    
    		new Person("Daniel", "Cazzulino"),   
    
    		new Person("Victor", "Garcia Aprea") };

Now, being an Employee a Person, we may want to populate the People class with them too, let's say [VGA](http://clariusconsulting.net/vga) becomes and Employee while I remain an independent person:
    
    
    People p = new People();  
    
    p.AllPeople = new Person[] {  
    
    		new Person("Daniel", "Cazzulino"),   
    
    		new Employee("Victor", "Garcia Aprea", "9999") };

The XmlSerializer will no longer know how to serialize the People type unless we tell it to expect an Employee too. The exception will say something like "Use the XmlInclude or SoapInclude attribute to specify types that are not known statically.". Adding these attributes to the base class, pointing to derived classes is not a good idea. Furthermore, new derived classes may appear that we may not know ahead of time. So, instead of adding those attributes, we can just pass the additional types to the XmlSerializer ctor:
    
    
    XmlSerializer ser = new XmlSerializer( typeof( People ), new Type[] { typeof( Employee ) } );

Cool. Now the serializer will be able to serialize a People object containing a mix of Person and Employee instances. However, the XML will not look like what you expected:
    
    
    <People>  
    
      <Person>  
    
        <FirstName>Daniel</FirstName>  
    
         <LastName>Cazzulino</LastName>  
    
      </Person>  
    
      <Person d2p1:type="Employee" xmlns:d2p1="http://www.w3.org/2001/XMLSchema-instance">  
    
        <FirstName>Victor</FirstName>  
    
        <LastName>Garcia Aprea</LastName>  
    
        <EmployeeID>9999</EmployeeID>  
    
      </Person>  
    
    </People>

What's more, we have effectively broken the deserialization of regular People now, in the sense that a piece of code that only knows how to deal with Person objects, wishing to deserialize the XML with an XmlSerializer constructed without the Employee extra type parameter will fail with the following error: 
    
    
    "The specified type was not recognized: name='Employee', namespace='', at <Person xmlns=''>"

So, even though the XML containing the extra data for an Employee could be successuly deserialized into a Person, as we saw above, the `type="Employee"` attribute is breaking it. Note that the namespace prefix is "d2p1" instead of the regular "xsi" because I used the NonXsiTextWriter, which prevented the namespace to be mapped to "xsi" and the root element. Therefore, a "random" new prefix is being created.   
What we need is a way to completely avoid emitting the xsi:type attribute. We can further modify the NonXsiTextWriter to skip all "xsi" attributes it finds as they're being written:
    
    
    public override void WriteStartAttribute( string prefix, string localName, string ns )  
    
    {  
    
      if ( ( prefix == "xmlns" && (localName == "xsd" || localName == "xsi")) ||  // Omits XSD and XSI declarations.  
    
        ns  == XmlSchema.InstanceNamespace )                                      // Omits all XSI attributes.  
    
      {  
    
        _skip = true;  
    
        return;  
    
      }  
    
      base.WriteStartAttribute( prefix, localName, ns );  
    
    }

With the new check for `ns == XmlSchema.InstanceNamespace` we're effectively bypassing the attribute writing. Now, the part of the program that works against Person instances can simply deserialize the People class without knowing there is Employee data also, or that there is an Employee class altogether. It will simply be ignored by the XmlSerializer. This is specially useful in configuration scenarios, where there may be extensible points like [ providers](http://clariusconsulting.net/dgonzalez/archive/2003/08/18/24477.aspx) that need to be handled generically by your custom configuration handler, but need to be instanciated and initialized with custom configuration. Your generic provider class could simply specify the `Type` as an attribute, and the custom handler would deserialize the entire node into the Provider-derived class:
    
    
    object IConfigurationSectionHandler.Create( object parent, object configContext, XmlNode section)  
    
    {  
    
      XmlSerializer ser = new XmlSerializer(typeof(MyConfigurationWithProviders));  
    
      MyConfigurationWithProviders cfg = (MyConfigurationWithProviders)   
    
        ser.Deserialize( new XmlNodeReader( section ) );  
      
    
      // Iterate providers.  
    
      XmlNodeList providers = section.SelectNodes("Provider");  
    
      foreach (XmlNode p in providers)  
    
      {  
    
        Type t = Type.GetType( p.Attributes["Type"].Value );  
    
        XmlSerializer ps = new XmlSerializer( t );  
    
        object instance = ps.Deserialize( new XmlNodeReader ( p ) );  
    
        // We have a derived type fully initialized!!  
    
      }  
    
    }

Our Provider class would be all too simple:
    
    
    public class Provider  
    
    {  
    
      [XmlAttribute]  
    
      public string Type  
    
      {  
    
        get { return _type; }  
    
        set { _type = value; }  
    
      } string _type;  
    
    }  
    

Afterwards, a derived provider, for example a DbStorageProvider, would be:
    
    
    [XmlRoot("Provider")]  
    
    public class DbStorageProvider : Provider  
    
    {  
    
      public int Timeout  
    
      {  
    
        get { return _timeout; }  
    
        set { _timeout = value; }  
    
      } string _timeout;  
    
    }  
    

I'm sure you appreciate the power and flexibility of this approach. You no longer need to worry about "parsing" the XmlNode in search for your properties, load them, etc. You can just rely on the generic XmlSerializer-based configuration handler above. The configuration for the provider can be as complex as you like, and it integrates well with the base functionality of the handler:
    
    
    <MyCoolSection>  
    
      <SomeConfig>...</SomeConfig>  
    
      <Providers>  
    
        <Provider Type="MyCoolApp.DbStorageProvider, MyCoolApp">  
    
          <Timeout>25</Timeout>  
    
          <Audit>true</Audit>  
    
        </Provider>  
    
      </Providers>  
    
    </MyCoolSection>  
    

But you not only gain loading ease of use, you can also modify your provider instance and serialize back to the configuration file, preserving the format thanks to the NonXsiTextWriter we wrote. Now you can build a flexible configuration API based on the XmlSerializer features, letting developers programmatically configure your application. For example, let's say some admin interface allows adding new providers. The code could do something like the following: 
    
    
    AnotherProvider ap = new AnotherProvider();  
    
    // Set all properties  
    
    // Pass to configuration API  
    
    MyConfig cfg = (MyConfig) ConfigurationSection.GetSection( "MyCoolSection" );  
    
    cfg.Providers.Add( ap );  
    
    // Save passing the extra types array to use with the XmlSerializer.  
    
    MyConfigManager.Save( cfg, new Type[] { typeof (AnotherProvider) }  );  
    

I believe this is a far more straightforward way of handling extensible configuration. Instead of implementing a sort of `IProvider.Init(XmlNode config)` feature, providers only need to care about the serialization format they want. I've seen that [in many places in ASP.NET 2](http://clariusconsulting.net/rhoward/archive/2003/11/07/36393.aspx), providers receive some kind of NameValueCollection. This is clearly a step in the wrong direction. Complex configuration simply can't be handled by key-value pairs (or it's too ugly/cumbersome to do so). Imaging a provider with lots of attributes because that's the only config. supported... ugh.. 

posted on Friday, January 23, 2004 12:16 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070302155813im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
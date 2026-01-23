---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-19 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Monday, August 02, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2004/8/2.aspx "2 Posts")| 3| 4| 5| 6  
7| 8| 9| 10| 11| 12| 13  
14| 15| 16| 17| 18| 19| 20  
21| 22| 23| 24| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/8/25.aspx "1 Post")| 26| 27  
28| 29| 30| [31](http://clariusconsulting.net/blogs/kzu/archive/2004/8/31.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060519094056im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Monday, August 02, 2004 - Posts

#####  [Strongly-typed, event-rising, design-time generated custom XmlSerializers (even more than Whidbey sgen!)](http://clariusconsulting.net/blogs/kzu/archive/2004/08/02/279.aspx)

## Summary

There are a couple known issues with the XmlSerializer:

  1. First-time use is painfully slow, because of the temporary assembly generation and compilation. 
  2. If you want to do something else other than straight serialization, there's no easy way of customizing it.

Whidbey will bring a solution to the first, in the form of the "sgen" tool, which will generate at design-time the serialization assembly. I still haven't looked at the solutions it offers for the second issue.

So, are you condemned to waiting 'till Whidbey? Are you condemned to either choose between the straightforward-but-almost-impossible-to-customize XmlSerializer approach and endless lines of XmlReader/XmlDocument/XPath code to do almost the same yet generally with less performance just to gain the flexibility you need? Well, I turns out that I am a firmly believer on automating boring and repetitive tasks, so I'm not happy at all with people choosing the later, because I believe it leads to hard to maintain, inflexible, and really ugly code. You waste so much effort that would be better put to work on creative stuff, and making your app great. And performance is always a big issue, at least in my view.

This article explains how to achieve design-time XmlSerializer generation, how it's customized to allow for the stuff you always thought impossible, such as getting events for each kind of object being deserialized.

Recall that I wrote this code in 4 hours as I waited for my plane to Redmond on the airport :o), so it's not the most gorgeous piece of code you'll see coming from me, but it certainly gets a pretty cool job done!

Near the end of a [previous article](http://weblogs.asp.net/cazzu/archive/2003/10/25/33470.aspx) I said it was not possible to customize the XmlSerializer to use something else other than the built-in dynamically generated code. I was wrong. What follows is an explanation of how I achieved what seemed impossible. 

## Usage

Right now, this is a command-line utility. Its arguments are:

`SGen.exe fullTypeName assemblyFile targetNamespace outputFileName`

First argument is the namespace-qualified name of the type you'll be using with the XmlSerializer. The second argument is the file name of the assembly containing the type. Next follows the namespace you want to put the generated code into. And finally you can specify the file name to write the generated code to.

The output of the tool is a set of classes you can use for XML serialization, which not only allows you to avoid the run-time impact of temporary assembly generation, but also allows you to attach to events that are exposed for each element that will be deserialized. If you had a class called Order like the following (presumably generated from an XSD):

``
    
    
    public class Customer {   // Members plus optional XML serialization attributes }

You would get the following classes:

  * `CustomerReader`: a class inheriting from the XmlSerializationReader-derived class generated by the `XmlSerializer`, also included in the file but as an inner class of the `Customer``Serializer`. 
  * `Customer``Writer`: a class inheriting from the XmlSerializationWriter-derived class generated by the `XmlSerializer`, also included in the file but as an inner class of the `Customer``Serializer` too. 
  * `Customer``Serializer`: `XmlSerializer`-derived class that allows you to pass the two previous custom classes for serialization, in order to skip the dynamic code generation. 
  * `Customer``DeserializedHandler`: handler for an event exposed by the `OrderReader`, called `Customer``Deserialized`, which you can attach to in order to perform additional processing when deserialization is done.

The custom serializer is generated basically to allow for the custom reader/writer classes to be passed-in, as the `XmlSerializer` class itself doesn't allow for this, but provides the hook methods `CreateReader` and `CreateWriter`, as well `Serialize` and `Deserialize` overloads receiving the result of those method calls. So in order to deserialize an order class, you instantiate the reader, pass it to the custom serializer, and call `Deserialize` as usual. You can avoid constructing the custom reader at all, as by default I'll create a new one when needed. You will need the reader variable, though, in order to attach to the events it fires.  

``
    
    
     CustomerSerializer os = new CustomerSerializer();   
     object customer = os.Deserialize(inputReader); 

The same process would be done for serializing the object. At this point you already saved a *huge* amount of processing for the initial hit on this class upon deserialization. And this impact is higher as the object to deserialize is more complex.

But there's more to this generation process than just performance boost. Let's say the Customer class, among other properties, has one of type Order, and then a collection of Item. The custom reader would expose an event for each of them, so you can perform additional processing. So you could do the following:

``
    
    
     public void Test()   
     {   
     XmlTextReader tr = new XmlTextReader(GetInputStream());   
     // Typed reader.   
     CustomerReader reader = new CustomerReader();   
     // Attach to events for each object!   
     reader.CustomerDeserialized += new CustomerDeserializedHandler(OnCustomerDeserialized);   
     reader.OrderDeserialized += new OrderDeserializedHandler(OnOrderDeserialized);   
     reader.ItemDeserialized += new ItemDeserializedHandler(OnItemDeserialized);   
       
     // Custom serializer receiving the custom reader.   
     CustomerSerializer serializer = new CustomerSerializer(reader);   
     // Deserialize as usual, but all event handlers called while deserializing!   
     object customer = serializer.Deserialize(tr);   
     // Do something with the order...   
     }   
       
     private void OnCustomerDeserialized(Customer customer)   
     {   
     Console.WriteLine(customer.FirstName);   
     }   
     private void OnOrderDeserialized(Order order)   
     {   
     Console.WriteLine(order.Id);   
     }   
     private void OnItemDeserialized(Item item)   
     {   
     Console.WriteLine(item.Price);   
     } 

You can even use this event callbacks as a more programmer-friendly approach to XML processing than the lower-level XmlReader. You just have to create the XSD, generate classes with xsd.exe or [something better](http://msdn.microsoft.com/library/en-us/dnxmlnet/html/xsdcodegen.asp), and use the SGen generated reader. You just attach to the events for each element you're interested in, and process it using friendly properties/fields instead of XmlReader.Value, XmlReader.GetAttribute and the like.

You can easily set this tool to run as a post-build event, by setting appropriate project field to:

``
    
    
    ..\..\..\SGen\bin\Debug\SGen SGen.Tests.Customer SGen.Tests.dll SGen.Tests.Serialization ..\..\CustomerSerialization.cs

## Implementation

The code generated by the ``XmlSerializer can be kept around by using [the technique explained in a previous post](http://weblogs.asp.net/cazzu/archive/2003/10/21/32822.aspx). Using that approach, the SGen utility instantiates an XmlSerializer passing the type you specify as arguments. After that, using hacky reflection, it retrieves the temporary code location burned deep inside the XmlSerializer private members and internal classes. Afterwards, using a mix of CodeDom and raw string manipulation, the final code is generated. I've done quite a bit of regular expressions-based parsing too, and there's a region called "Code templates" that provide the skeleton for the generation process. 

I didn't create everything using CodeDom because the XmlSerializer generates just C# output, therefore, there wasn't much benefit in trying to do everything the "right" way. The code and the regular expressions are pretty nasty for the non-accustomed eye, so I'll save you the trouble and instead point you to the [respective code download](http://prdownloads.sourceforge.net/mvp-xml/SGen.zip?download).

What's worth seeing is how the XmlSerializer is being extended:

``
    
    
     /// Custom serializer for Order type.Constructs the serializer with a pre-built reader.   
     public OrderSerializer(OrderReader reader)   
     {   
     _reader = reader;   
     }  
      
     /// Constructs the serializer with a pre-writer reader.   
     public OrderSerializer(OrderWriter writer)   
     {  
     _writer = writer;   
     }  
      
     /// Constructs the serializer with pre-built reader and writer.   
     public OrderSerializer(OrderReader reader, OrderWriter writer)   
     {   
     _reader = reader;   
     _writer = writer;   
     }  
      
     /// <summary>See <see cref="XmlSerializer.CreateReader"/>.</summary>  
     protected override XmlSerializationReader CreateReader()  
     {  
     if (_reader != null)   
     return _reader;  
     else  
     return new CustomerReader();  
     }  
       
     /// <summary>See <see cref="XmlSerializer.CreateWriter"/>.</summary>  
     protected override XmlSerializationWriter CreateWriter()  
     {  
     if (_writer != null)   
     return _writer;  
     else  
     return new CustomerWriter();  
     }  
       
     /// <summary>See <see cref="XmlSerializer.Deserialize"/>.</summary>  
     protected override object Deserialize(XmlSerializationReader reader)  
     {  
     if (!(reader is CustomerReader))  
     throw new ArgumentException("reader");  
       
     return ((CustomerReader)reader).Read();  
     }  
       
     /// <summary>See <see cref="XmlSerializer.Serialize"/>.</summary>  
     protected override void Serialize(object o, XmlSerializationWriter writer)  
     {  
     if (!(writer is CustomerWriter))  
     throw new ArgumentException("writer");  
       
     ((CustomerWriter)writer).Write((Mvp.Xml.Design.Tests.Customer)o);  
     }   
       
     // Inner XmlSerializer-generated reader and writer classes go on

So it *was* extensible in the end, right? It's a little bit cumbersome, but it's possible to extend it as you can see.

Don't forget to [download the tool](http://prdownloads.sourceforge.net/mvp-xml/SGen.zip?download) and play with it!  

**Update** : now you can simply [use a Custom Tool and get the generated class automatically and easily](http://weblogs.asp.net/cazzu/archive/posts/XGenToolRelease.aspx)!  

posted [Monday, August 02, 2004 1:07 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/08/02/279.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/08/02/279.aspx#comments)

#####  [Behave properly on your posts](http://clariusconsulting.net/blogs/kzu/archive/2004/08/02/278.aspx)

It's rewarding to see [other bloggers](http://weblogs.asp.net/jgalloway/archive/2004/08/01/204671.aspx) using [the same approach I've been using for quite a while](http://weblogs.asp.net/cazzu/archive/2003/10/07/30888.aspx) for collapsing code regions that maybe be of interest of those who want a closer look at what you've done, but not to all readers, specially on the aggregated site.  
If we could just get everyone else using the same, the main page would be much more pleasant. If you want to join this crusade, start using the following for your collapsible HTML regions: 

+ Expand for some cool code. 

...your code... 

posted [Monday, August 02, 2004 6:43 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/08/02/278.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/08/02/278.aspx#comments)

  

[![](/web/20060519094056im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
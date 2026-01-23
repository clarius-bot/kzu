---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-02 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Monday, May 10, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| 5| 6  
[7](http://clariusconsulting.net/blogs/kzu/archive/2004/5/7.aspx "1 Post")| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/5/8.aspx "1 Post")| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/5/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2004/5/11.aspx "1 Post")| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/5/13.aspx "1 Post")  
[14](http://clariusconsulting.net/blogs/kzu/archive/2004/5/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/5/15.aspx "1 Post")| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/5/17.aspx "2 Posts")| 18| 19| 20  
21| 22| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/5/26.aspx "2 Posts")| 27  
28| 29| 30| [31](http://clariusconsulting.net/blogs/kzu/archive/2004/5/31.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502132129im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Monday, May 10, 2004 - Posts

#####  [Lightweight Containers and Plugin Architectures: Dependency Injection and Dynamic Service Locators in .NET](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/226.aspx)

Required reading: [Inversion of Control Containers and the Dependency Injection pattern](http://www.martinfowler.com/articles/injection.html) by [ Martin Fowler](http://martinfowler.com/). If you haven't read it, you will not understand what I'm talking about, and I'm not fond of reproducing other's work here. It's better if you just read it, it's a very interesting article.

I'd like to analyze Fowler's article in the light of .NET and what we have now in v1.x. After reading his article, he seems to imply that lightweight containers are a new concept mainly fuelled by the Java community unsatisfied with heavyweight EJB containers. It turns out that .NET supported and heavily used this approach since its very early bits, released back in PDC'00 (July 14th 2000).

The basic building blocks for lightweight containers in .NET live in the ` System.ComponentModel` namespace. Core interfaces are:

  * `IContainer`: the main interface implemented by containers in .NET. 
  * `IComponent`: provides a very concrete definition of what a component is in this context. It's any class implementing this interface, and which can therefore participate in .NET containers. 
  * `ISite`/`IServiceProvider`: the former inherits the later. It provides the vital link between a component and the container it lives in (its site), which enables service retrieval by the component. `IComponent` has a `Site` property of this type. 
  * `IServiceContainer`: a default container for services, that `IComponent`s can access through the `ISite`. Not actually required as the `IContainer` can store available services through other means.

The relationship between these clases can be depicted as follows:

![Diagram showing interfaces relationship](https://web.archive.org/web/20060502132129im_/http://aspnet2.com/kzu/weblog/LightweightContainers1.png)

A typical container/component/service interaction is:

  1. Specific container class is created by client code. 
  2. Container initializes all services that components will have access to (optionally through an internal `IServiceContainer`). Client can optionally (if the container exposes its own `IServiceContainer` ) add further services at will. 
  3. Either the container or client code adds components. 
  4. Container "sites" these components by setting their `IComponent::Site` property, with an `ISite` implementation that offers services that are retrieved from the optional internal `IServiceContainer` or another implementation. 
  5. Client code can access components by name or index through `IContainer` indexer. 
  6. Components can perform actions requiring services that are retrieved through `IComponent::Site::GetService(Type)`. This method is inherited from `IServiceProvider` actually.

So, in [Fowler](http://www.martinfowler.com/articles/injection.html)'s terms, the `IContainer` implementation performs Interface Dependency Injection (through `IComponent`) of a single dependency, the Dynamic Service Locator (`ISite : IServiceProvider`). The former happens because the `IContainer` automatically sets the `IComponent::Site` property upon receiving the component to add through its `IContainer::Add(IComponent)` method. The later is the implementation of `IServiceProvider::GetService(Type)` method, which allows dynamic retrieval of services from the container.

![Diagram of call sequence for IContainer/IComponent/ISite interaction](https://web.archive.org/web/20060502132129im_/http://aspnet2.com/kzu/weblog/LightweightContainers2.png)

Fowler dislikes dynamic service locators because he says they rely on string keys and are loosely typed. In .NET `IServiceProvider`, you don't pass a string key but the actual Type of the service you request. What's more, the default interface implementation, `System.ComponentModel.Design.ServiceContainer`, checks that services published with a certain Type key are actually assignable to that type. Therefore, it's safe to cast them back upon retrieval. At most you get a null value from a provider, but never an `InvalidCastException`. 

Following his example so that this is a natural adaptation to the .NET world, his `MovieLister` component will look like the following:

public class MovieLister : Component { public void Movie[] MoviesDirectedBy( string name ) { IMovieFinder finder = (IMovieFinder) GetService( typeof( IMovieFinder ) ); if ( finder == null ) return new Movie[0]; ArrayList all = finder.FindAll(); // Iterate, filter by name and return subset. }

It's common, that instead of implementing `IComponent` directly, concrete components inherit from its built-in default implementation `Component`, which provides a `GetService` shortcut method that also checks that the Site property is set before requesting a service from it.

Lifecycle of components is handled through three states:

  * `IComponent::ctor`: at construction time, the component is still not ready for work, as it can't access services. 
  * `IComponent::Site { set; }`: the component is "sited", therefore it's fully functional now. At this (overridable) point, components can further configure themselves, for example by caching a reference to a service they use frequently: public class MovieLister : Component, IMovieLister { public override ISite Site { get { return base.Site; } set { base.Site = value; // Cache the finder. this._finder = (IMovieFinder) GetService( typeof(IMovieFinder) ); } }
  * `IComponent::Dispose`: when it's not needed anymore, a component may be diposed using the `IDispose` interface inherited by `IComponent`.

Fowler notes some drawbacks in general with regards to the service locator approach:

> So the primary issue is for people who are writing code that expects to be used in applications outside of the control of the writer. In these cases even a minimal assumption about a Service Locator is a problem.

By standarizing on `IComponent` and `ISite` from `System.ComponentModel`, this isn't a problem anymore in .NET. Any component that uses these interfaces can be hooked into any container, and query services. This doesn't require dependencies on external products or unproven approaches: .NET uses extensively this feature. 

> Since with an injector you don't have a dependency from a component to the injector, the component cannot obtain further services from the injector once it's been configured.

As injection is being done for the service locator itself (the `ISite : IServiceProvider` instance), this isn't a problem anymore. Further services can be easily requested from it. 

> A common reason people give for preferring dependency injection is that it makes testing easier. The point here is that to do testing, you need to easily replace real service implementations with stubs or mocks. However there is really no difference here between dependency injection and service locator: both are very amenable to stubbing. I suspect this observation comes from projects where people don't make the effort to ensure that their service locator can be easily substituted.

I agree completely on this view. Aren't these architectures all about the ability to dynamically remove dependencies/hook/replace implementations dynamically? It's obvious to me that if such objective is not achieved, it's clearly not because injection vs service locator choice, but an implementation bug. Testing and stubbing with .NET containers is straightforward as components retrieve services by interface type, so stub impls. of those interfaces can be plugged into a testing `IContainer` implementation without problems. 

Note that additionally, the `IContainer` can expose its internal ` IServiceContainer` as yet another service, so that a component could publish a new service for consumption by others:

public class MovieLister : Component, IMovieLister { public override ISite Site { get { return base.Site; } set { base.Site = value; // Publish ourselves as new service. IServiceContainer container = (IServiceContainer) GetService( typeof(IServiceContainer) ); container.AddService( typeof(IMovieLister), this ); } }

This combination of `IServiceProvider`, `IContainer` and ` IComponent` is in broad usage TODAY in Win and Web Forms platforms, as well as design-time and generally the IDE infrastructure. You're usin them everytime you create a Windows Form, Windows User Control, WebForm, etc.

## Layering Service Containers

One scenario that .NET `System.ComponentModel` supports and that hasn't even been discussed by Fowler is that of chained service containers. Let's say you have a component, sited in a container, that performs some quite complex functionality. Now, let's say this complex functionality requires additional services that are provided by a specialized container and further components. In this case, the "main" component needs to instantiate a new container and execute further components. Needless to say, these components may require not only services from this new "child" container but also the parent one, the one where the "main" component lives.

Stacking service providers at this point is extremely useful. What you actually need is a Chain of Responsibility pattern where the service implementation is returned by the first provider in the chain that can respond to the request for it. This would allow you not only to chain different sets of services, but also to override implementations from a parent service provider. This is supported natively in .NET through the `ServiceContainer` implementation, and is heavily used in Visual Studio.NET IDE: some services are offered to components by a specific designer, or a VS package, or the IDE itself. Most requests for services propagate up the chain if necessary until they reach the IDE main container.

I've used exactly the same architecture for an upcoming automatic wizard framework for Shadowfax that acts as a child container inside the IDE. Some components need execution of yet another lower layer, a transformation engine that works with code templates to generate code (among other things), which is also a child container. At this point, the three layers, IDE, wizard and transformation engine, are chained together, so any component in the transformation engine, for example, can query services that are being offered by the IDE itself.

This is an extremely powerful and flexible approach, as you don't have to build monolythic container but can instead rely on components instantiating more specialized child containers to perform specific work. 

## Container Configuration

Of course, any good container should be configurable either programmatically and through configuration files. Fowler discusses the following with regards to configuration: 

> I often think that people are over-eager to define configuration files. Often a programming language makes a straightforward and powerful configuration mechanism. Modern languages can easily compile small assemblers that can be used to assemble plugins for larger systems. If compilation is a pain, then there are scripting languages that can work well also.

I agree absolutely. One usual dual config mechanism (XML + API) in .NET is creating an XSD for the file, get classes generated ready for XML Serialization, and support config either through the file reference, which is simply deserialized into the object model generated for the XSD, or through this object model itself, like so:

public class MyConfigurableContainer : `IContainer` { MyConfigurableContainer(string file) { ... } MyConfigurableContainer(MyConfigModel config) { ... } }

However, unless codegen customization is used, this raw XML serialization model is very poor when it comes to programmatic configuration, as classes only have parameterless ctors (so all initialization has to be done through property setters), there's no way to know which properties are required or optional, by default multi-value properties are arrays instead of typed collections, and so on. 

> Non-language configuration files work well only to the extent they are simple. If they become complex then it's time to think about using a proper programming language.

It's very interesting how most people nowadays perceive programmatic configuration APIs as a drawback over XML config files. I can't really understand why. With dynamic compilation becoming almost common place (i.e. ASP.NET v2 model, upcoming XAML, and so on), having a good programmatic API coupled with full programming language intellisense surely surpasses XML files in usability and productivity, specially for complex stuff.

It's usually the case (i.e. most of .NET) that after inventing a huge daunting configuration file format, admin UIs are created to manipulate them (i.e. .NET Framework Configuration, upcoming ASP.NET v2 admin console, etc.). At this point you start wondering: if nobody is ever going to touch those files except from those UIs, which is the advantage of having it in XML? Why don't just have those UIs generate compiled controllers that programmatically hook and configure everything? Just imagine the savings in parsing, validating, loading time... After all, you have to XCopy deploy those configs, just like the "assemblers" would...

## The missing feature?

So, all the plumbing and required interfaces for implementing lightweight containers in .NET are already in-place. The framework doesn't contain any class to perform configuration of a container, though. This is not necessarily a bad thing, as it doesn't force any concrete file format or configuration API, leaving that to implementers. Creating such feature for an specific container (such as the Shadowfax Wizard container, or the transformation engine - code-named T3 for Templated Text Transformations) is almost trivial. Reading config, loading types, hooking services and components and that's it.

So, once more, we can see that .NET is the pioneer on supposedly "new" patterns. It's true that this pattern (and many others found throughout the .NET Framework) don't have enough advertising, and that may be the cause for their scarse use in .NET application architectures.

In a future post I'll discuss [Apache Avalon](http://avalon.apache.org/) and the [ Spring Framework](http://www.theserverside.com/articles/article.tss?l=SpringFramework), and how they compare to what's built-in .NET.

Update: maybe I should also mention that I've been using this tecnique with excelent results since the initial release of an opensource [XML-based code generator back in Nov-2002](http://sourceforge.net/project/showfiles.php?group_id=27597&package_id=45036)

posted [Monday, May 10, 2004 2:31 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/226.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/226.aspx#comments)

#####  [Configuration with XmlSerializer + codegen (i.e. xsd.exe): how &quot;fix&quot; PascalCase to camelCase for the XML](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/225.aspx)

Most people (including myself, as you may have noticed from [my previous post on XmlSerializer-based configuration](http://weblogs.asp.net/cazzu/archive/2004/01/23/62141.aspx)) believe an automated XSD->Classes->XmlSerializer config section handler is the optimum approach for dealing with configuration in .NET. You basically start definining your configuration in an XML Schema, then use xsd.exe or another even more cool approach, and finally get XmlSerializer-ready classes for it. Loading configuration afterwards is just a matter of deserializing it. Cool right?

Well, no matter how hard I try, the following sample config looks just awful to me (and believe me, I've created many like this one):
    
    
    <SampleConfig>
      <MySetting Type="TheType, TheAssembly">
        <Enabled>True</Enabled>
        <MakeItFast>True</MakeItFast>
      </MySetting>
    </SampleConfig>

And you know XAML goes the same route, using .NET naming convensions for elements and attributes...   
Well, not only this looks pretty ugly (IMO) to any XML geek, but it also sort of unveils you're using `XmlSerializer` for loading it, and for some guys, this may seem like a less professional approach to configuration (don't ask me why). Learning yet another codegen tool just to overcome this "minor" casing issue sounded overkill for me. On the other hand, I didn't want to write all my configuration loading by hand anymore, specially once I got used to the incredibly fast refactoring that is enabled by the combination of XSD->CodeGen->XmlSerialier: all refactorings in the schema reflect on the classes, and you get inmediate compile-time errors in the code depending on old element names, or now inexistent or relocated elements. This is crucial for evolution.

Another aspect the XmlSerializer-based approach enables is a full programmatic typed configuration API you can use to write changes back to the file. And you don't have to write almost any code! Summarizing, the benefits are: straightforward loading and storing back. MAIN drawback: you have to use the XML-ugly .NET casing. Don't you?

Well, I decided I wanted the best of both worlds, as usual. I wanted camelCase-style elements and attributes, but XmlSerializer-based configuration loading and saving. And I definitely didn't want to write/use yet another codegen extension/tool to do the dirty job of adding all those XML serialization attributes to account for this "little" issue of casing.

So the answer is pretty simple once you know it: write a custom reader that turns the first letter into uppercase as it reads, and a custom writer that turns it back to lower upon saving it back. What's more, the reader should be based on the `XmlTextReader` so I can still layer the `XmlValidatingReader` once the "case normalization" happened, so the on-the-fly-PascalCased document is valid against the schema.

With the two new classes, `XmlFirstUpperReader` and `XmlFirstLowerWriter`, you read and write back XML files with the camelCase style, while having the XSD schema and the generated classes believe you have the proper PascalCase source/destination. So you can turn the previous config file into the nicer format:
    
    
    <sampleConfig>
      <mySetting type="TheType, TheAssembly">
        <enabled>True</enabled>
        <makeItFast>True</makeItFast>
      </mySetting>
    </sampleConfig>

Without changing your classes or schema. The trick is done when you pass the source for deserialization:

XmlFirstUpperReader fr = new XmlFirstUpperReader(config); // You should always validate your config at least with XSD XmlValidatingReader vr = new XmlValidatingReader(fr); // Add the PascalCased XSD. vr.Schemas.Add(theSchema); XmlSerializer ser = new XmlSerializer(typeof(MySetting)); MySetting settings = (MySetting) ser.Deserialize(vr);

After modifying the settings class, you can save it back into the file with the proper camelCase by using the custom writer:

MySettings settings = (MySetting) ser.Deserialize(vr); // Modify the settings at will. XmlFirstLowerWriter fw = new XmlFirstLowerWriter( new XmlTextWriter(config)); ser.Serialize(fw, settings);

Pretty straightforward, right?

## Implementation

This time, I didn't ["cheat" the `XmlTextReader`](http://www.tkachenko.com/blog/archives/000227.html), but directly used it by inheriting it like any decent OO citizen, and overriding the members I needed to change. It turned out to be a little more work than I thought because I had to use the base reader `XmlNameTable` everywhere, or the XSD validation would stop working and values would be lost somehow. The ` XmlFirstUpperReader `has a private method that turns a name into uppercase, and adds it to the `NameTable` before returning. This method uses the optimal "algorithm" discussed in [my previous post](http://weblogs.asp.net/cazzu/archive/2004/01/09/48987.aspx):

public class XmlFirstUpperReader : XmlTextReader { #region Support all XmlTextReader ctors ...etc... #endregion Support all XmlTextReader ctors #region Private methods private string MakeFirstUpper(string name) { // Don't process empty strings. if (name.Length == 0) return name; // If the first is already upper, don't process. if (Char.IsUpper(name[0])) return name; // If there's just one char, make it lower directly. if (name.Length == 1) return name.ToUpper(); // Finally, modify and create a string. Char[] letters = name.ToCharArray(); letters[0] = Char.ToUpper(letters[0]); return NameTable.Add(new string(letters)); } ...

The `XmlFirstLowerWriter` implements the opposite operation:

public class XmlFirstLowerWriter : XmlWriter { internal static string MakeFirstLower(string name) { // Don't process empty strings. if (name.Length == 0) return name; // If the first is already lower, don't process. if (Char.IsLower(name[0])) return name; // If there's just one char, make it lower directly. if (name.Length == 1) return name.ToLower(); // Finally, modify and create a string. Char[] letters = name.ToCharArray(); letters[0] = Char.ToLower(letters[0]); return new string(letters); } ...

This last method is made internal and static because it doesn't depend on an `XmlNameTable` instance, and because it must be used by the reader in some places, as explained next. Note that both only modify the string if it's actually necessary.

The `XmlTextReader` properties that need to be overriden are: 

  * `this (indexer)`: this property is used to access attributes of the current element by name. Client code as well as the validating reader (based on the schema) will expect to access attributes by their PascalCase name. So, I need to ensure the name is camelCased before the access occurs: public override string this[string name, string namespaceURI] { get { return base[ NameTable.Add(XmlFirstLowerWriter.MakeFirstLower(name)), namespaceURI]; } }
  * `LocalName`: this property needs to be properly capitalized only for elements and attributes (you don't want to get the <? xml ?> directive changed!), but only if they are not namespace declarations: public override string LocalName { get { // Capitalize elements and attributes. if ( base.NodeType == XmlNodeType.Element || base.NodeType == XmlNodeType.EndElement || base.NodeType == XmlNodeType.Attribute ) { return base.NamespaceURI == XmlNamespaces.XmlNs ? // Except if the attribute is a namespace declaration. base.LocalName : MakeFirstUpper(base.LocalName); } return base.LocalName; } }
  * `Name`: this property returns the qualified name of the element. That is, it can contain a prefix plus the name. The former needs to remain the same, while the later is capitalized. In addition, for namespace declaration, it returns the prefix, which we don't want to capitalize.: public override string Name { get { // Again, if this is a NS declaration, pass as-is. if (base.NamespaceURI == XmlNamespaces.XmlNs) return base.Name; // If there's no prefix, capitalize it directly. if (base.Name.IndexOf(":") == -1) return MakeFirstUpper(base.Name); else { // Turn local name into upper, not the prefix. string name = base.Name.Substring(0, base.Name.IndexOf(":") + 1); name += MakeFirstUpper(base.Name.Substring(base.Name.IndexOf(":") + 1)); return NameTable.Add(name); } } }

On the methods side, there's only one to override:

  * `MoveToAttribute()`: movement must be done using the lower cased name, as the underlying XML uses this "version": public override bool MoveToAttribute(string name, string ns) { return base.MoveToAttribute( NameTable.Add(XmlFirstLowerWriter.MakeFirstLower(name)), ns); }

The `XmlFirstLowerWriter` implementation, in turn, is based on the `XmlTextWriter` one, overrides just `WriteQualifiedName`, `WriteStartAttribute` and `WriteStartElement`. All three methods a `localName` parameter which is turned into camelCase by a call to the `MakeFirstLower` method shown above.

The full [Mvp.Xml project](http://sf.net/projects/mvp-xml) source code can be downloaded from [ SourceForge](http://prdownloads.sourceforge.net/mvp-xml/Mvp.Xml.zip?download).

Enjoy and please give us feedback on the project!

+ As usual, the full code to copy-paste if you want to (remember to split in two files). #region using using System; using System.IO; using System.Xml; #endregion using namespace Mvp.Xml { /// /// Implements an that turns the /// first letter of incoming elements and attributes into uppercase. /// /// /// To be used in conjunction with for /// serialization. /// public class XmlFirstUpperReader : XmlTextReader { #region Ctors /// /// See constructor overloads. /// public XmlFirstUpperReader(Stream input) : base(input) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(TextReader input) : base(input) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url) : base(url) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(Stream input, XmlNameTable nt) : base(input, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(TextReader input, XmlNameTable nt) : base(input, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, Stream input) : base(url, input) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, TextReader input) : base(url, input) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, XmlNameTable nt) : base(url, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(Stream xmlFragment, XmlNodeType fragType, XmlParserContext context) : base(xmlFragment, fragType, context) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, Stream input, XmlNameTable nt) : base(url, input, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, TextReader input, XmlNameTable nt) : base(url, input, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string xmlFragment, XmlNodeType fragType, XmlParserContext context) : base(xmlFragment, fragType, context) {} #endregion Ctors #region Private methods private string MakeFirstUpper(string name) { // Don't process empty strings. if (name.Length == 0) return name; // If the first is already upper, don't process. if (Char.IsUpper(name[0])) return name; // If there's just one char, make it lower directly. if (name.Length == 1) return name.ToUpper(); // Finally, modify and create a string. Char[] letters = name.ToCharArray(); letters[0] = Char.ToUpper(letters[0]); return NameTable.Add(new string(letters)); } #endregion Private methods #region Properties /// See public override string this[string name, string namespaceURI] { get { return base[ NameTable.Add(XmlFirstLowerWriter.MakeFirstLower(name)), namespaceURI]; } } /// See public override string this[string name] { get { return this[name, String.Empty]; } } /// See public override string LocalName { get { // Capitalize elements and attributes. if ( base.NodeType == XmlNodeType.Element || base.NodeType == XmlNodeType.EndElement || base.NodeType == XmlNodeType.Attribute ) { return base.NamespaceURI == XmlNamespaces.XmlNs ? // Except if the attribute is a namespace declaration base.LocalName : MakeFirstUpper(base.LocalName); } return base.LocalName; } } /// See public override string Name { get { // Again, if this is a NS declaration, pass as-is. if (base.NamespaceURI == XmlNamespaces.XmlNs) return base.Name; // If there's no prefix, capitalize it directly. if (base.Name.IndexOf(":") == -1) return MakeFirstUpper(base.Name); else { // Turn local name into upper, not the prefix. string name = base.Name.Substring(0, base.Name.IndexOf(":") + 1); name += MakeFirstUpper(base.Name.Substring(base.Name.IndexOf(":") + 1)); return NameTable.Add(name); } } } #endregion Properties #region Methods /// See public override bool MoveToAttribute(string name, string ns) { return base.MoveToAttribute( NameTable.Add(XmlFirstLowerWriter.MakeFirstLower(name)), ns); } #endregion Methods } } /* NEXT FILE!!! */ #region using using System; using System.IO; using System.Text; using System.Xml; #endregion using namespace Mvp.Xml { /// /// Implements an that turns the /// first letter of outgoing elements and attributes into lowercase. /// /// /// To be used in conjunction with . /// public class XmlFirstLowerWriter : XmlTextWriter { #region Fields & Ctor /// /// See ctors. /// public XmlFirstLowerWriter(TextWriter w) : base(w) { } /// /// See ctors. /// public XmlFirstLowerWriter(Stream w, Encoding encoding) : base(w, encoding) { } /// /// See ctors. /// public XmlFirstLowerWriter(string filename, Encoding encoding) : base(filename, encoding) { } #endregion Fields & Ctor #region MakeFirstLower internal static string MakeFirstLower(string name) { // Don't process empty strings. if (name.Length == 0) return name; // If the first is already lower, don't process. if (Char.IsLower(name[0])) return name; // If there's just one char, make it lower directly. if (name.Length == 1) return name.ToLower(); // Finally, modify and create a string. Char[] letters = name.ToCharArray(); letters[0] = Char.ToLower(letters[0]); return new string(letters); } #endregion MakeFirstUpper #region Methods /// /// See . /// public override void WriteQualifiedName(string localName, string ns) { base.WriteQualifiedName(MakeFirstLower(localName), ns); } /// /// See . /// public override void WriteStartAttribute(string prefix, string localName, string ns) { base.WriteStartAttribute(prefix, MakeFirstLower(localName), ns); } /// /// See . /// public override void WriteStartElement(string prefix, string localName, string ns) { base.WriteStartElement(prefix, MakeFirstLower(localName), ns); } #endregion Methods } }

posted [Monday, May 10, 2004 1:24 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/225.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/225.aspx#comments)

#####  [Subset document loading and transformation with XPathNavigatorReader](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/224.aspx)

Thanks to Tom Smalley who pointed it, I fixed a bug that prevented the [XPathNavigatorReader](http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx) from being used for loading a new `XmlDocument` or `XPathDocument`. This feature is very useful if you have to apply a transformation to a subset of a document. For this purpose, the [MSDN documentation](http://msdn.microsoft.com/library/en-us/cpguide/html/cpconXslTransformClassImplementsXSLTProcessor.asp) suggests using `XmlDocument` both for the entire document loading as well as the subset, which is the most inefficient way of performing transformations in .NET.

The code suggested for this scenario is (I modified it to print each child of the root which is more useful):

XslTransform xslt = new XslTransform();   
xslt.Load("print_root.xsl");  
// Load the entire doc.  
XmlDocument doc = new XmlDocument();  
doc.Load("library.xml");  
  
// Create a new document for each child  
foreach (XmlNode testNode in doc.DocumentElement.ChildNodes)  
  
{  
XmlDocument tmpDoc = new XmlDocument();   
tmpDoc.LoadXml(testNode.OuterXml);  
  
// Transform the subset.  
xslt.Transform(tmpDoc, null, Console.Out, null);  
}

Note that there's double parsing for each node to be transformed as the temporary document is loaded from the raw string returned by the `OuterXml` property. With the `XPathNavigatorReader` you can avoid this parsing cost altogether, and work with the XSLT-optimized `XPathDocument` using the following code:

XslTransform xslt = new XslTransform();  
// Always pass evidence!  
xslt.Load("print_root.xsl", null, this.GetType().Assembly.Evidence);  
// Load the entire doc.  
XPathDocument doc = new XPathDocument("library.xml");  
  
// Create a new document for each child  
XPathNodeIterator books = doc.CreateNavigator().Select("/library/book");  
while (books.MoveNext())  
{  
// Load a doc from the current navigator using a reader over it.  
XPathDocument tmpDoc = new XPathDocument(  
new XPathNavigatorReader(books.Current));   
  
// Transform the subset.  
xslt.Transform(tmpDoc, null, Console.Out, null);  
}

Note that XML parsing happens only once, when the full doc is loaded. For a dsPubs database dump relatively large (300Kb), and a little less trivial stylesheet, the later approach yields 2X performance increase (you already know you gain about 30% from using `XPathDocument` alone).

`XPathNavigatorReader` is part of the opensource [ Mvp.Xml project](http://sf.net/projects/mvp-xml). The full project source code can be downloaded from [ SourceForge](http://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234).

Enjoy and please give us feedback on the project!

**Update** : this technique does incur the cost of an additional parse step. Check [High-performance XML (III): subtree transformations without re-parsing](http://weblogs.asp.net/cazzu/archive/2004/06/24/164243.aspx) for a better approach.

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted [Monday, May 10, 2004 1:15 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/224.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/224.aspx#comments)

  

[![](/web/20060502132129im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
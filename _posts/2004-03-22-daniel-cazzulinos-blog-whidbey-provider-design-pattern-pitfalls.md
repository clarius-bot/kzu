---
layout: post
title: "Daniel Cazzulino's Blog : Whidbey Provider Design Pattern pitfalls"
date: 2004-03-22 00:00:00 +0000
---

## Whidbey Provider Design Pattern pitfalls 

A couple weeks ago [Rob Howard](http://weblogs.asp.net/rhoward/Rss.aspx) (from the ASP.NET team) [ announced the "disclosure"](http://weblogs.asp.net/rhoward/archive/2004/03/02/83026.aspx) of the [ Provider Design Pattern](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnaspnet/html/asp02182004.asp?frame=true&hidetoc=true) they are using in Whidbey ASP.NET (v2).

I've got a couple complaints with this implementation:

  * Naming: [Brad Adams](http://blogs.msdn.com/brada/) (the guy behind design guidelines), is [ explicitly discouraging](http://blogs.msdn.com/brada/archive/2003/11/21/50831.aspx) the practice of adding a "Base" prefix/suffix to abstract classes targeted to be the root of a class hierarchy. Yet, the pattern explained by Rob defines `ProviderBase`, `MembershipProviderBase` and so on. Not good. If these guidelines aren't followed by MS, you can't expect independant developers to do so, right?  

  * Collection typing: as defined, each functionality (i.e. Membership, RoleManager, etc.) defines a `Providers` property of type `ProviderCollection`, defined as follows:  public class ProviderCollection : IEnumerable { // Methods // public void Add(ProviderBase provider); public void Clear(); public void Remove(string name); public void SetReadOnly(string name); // Properties // public ProviderBase this(string name) { get; set; } public int Count { get; set; } }  Therefore, I need to cast whenever I need to access a particular provider. Now that Whidbey has generics, it seems appropriate to define the collection as:  public class ProviderCollection where T:ProviderBase : IEnumerable { // Methods // public void Add(T provider); public void Clear(); public void Remove(string name); public void SetReadOnly(string name); // Properties // public T this(string name) { get; set; } public int Count { get; set; } } 

Membership, therefore, would only need to define its `Providers` property as follows:

public ProviderCollection Provider { get; set; }   

  * Configuration: As defined, the `ProviderBase` class contains an `Initialize` method with the following signature: public abstract void Initialize(string name, NameValueCollection config); Well, can anybody tell me why the config is not an `XmlNode` or an ` XPathNavigator` at least? Given the configuration is already in XML form, why resort to converting it to a `NameValueCollection`?!   
Complex providers may need far more configuration that can't be expressed with attributes in the element. This is a serious issue that may limit the usefulness of the pattern. 

While the first two are a matter of taste in the end, the last one should be fixed promptly. I didn't hear any voice complaining, however. Am I the only one envisioning complex providers with the need to configure themselves with hierarchical XML information? It's all too common everywhere!   
You want a a concrete example? Here it goes:

What if I develop a provider that implements automatic DB schema installation and migration? My super provider could allow the full DB schema to be specified in the configuration itself:

...other columns...  ...other tables... 

The provider can detect the presence of the schema and create it automatically if necessary. I could even go as far as saying that it could even define through configuration the way to migrate a schema if it's incompatible, or whatever. 

Another one: maybe my provider uses a webservice. I may need to pass complex information to the provider, such as credentials, proxy information, SOAP message skeletons, or whatever. None of this is possible with a `NameValueCollection`.

posted on Monday, March 22, 2004 10:12 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

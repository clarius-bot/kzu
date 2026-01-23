---
layout: post
title: "Daniel Cazzulino"
date: 2004-05-10 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Lightweight Containers and Plugin Architectures: Dependency Injection and Dynamic Service Locators in .NET

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
6| [7](http://clariusconsulting.net/blogs/kzu/archive/2004/5/7.aspx "1 Post")| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/5/8.aspx "1 Post")| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/5/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2004/5/11.aspx "1 Post")| 12  
[13](http://clariusconsulting.net/blogs/kzu/archive/2004/5/13.aspx "1 Post")| [14](http://clariusconsulting.net/blogs/kzu/archive/2004/5/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/5/15.aspx "1 Post")| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/5/17.aspx "2 Posts")| 18| 19  
20| 21| 22| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/5/26.aspx "2 Posts")  
27| 28| 29| 30| [31](http://clariusconsulting.net/blogs/kzu/archive/2004/5/31.aspx "1 Post")| 1| 2  
3| 4| 5| 6| 7| 8| 9  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060827132529im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Lightweight Containers and Plugin Architectures: Dependency Injection and Dynamic Service Locators in .NET 

Required reading: [Inversion of Control Containers and the Dependency Injection pattern](http://www.martinfowler.com/articles/injection.html) by [ Martin Fowler](http://martinfowler.com/). If you haven't read it, you will not understand what I'm talking about, and I'm not fond of reproducing other's work here. It's better if you just read it, it's a very interesting article.

I'd like to analyze Fowler's article in the light of .NET and what we have now in v1.x. After reading his article, he seems to imply that lightweight containers are a new concept mainly fuelled by the Java community unsatisfied with heavyweight EJB containers. It turns out that .NET supported and heavily used this approach since its very early bits, released back in PDC'00 (July 14th 2000).

The basic building blocks for lightweight containers in .NET live in the ` System.ComponentModel` namespace. Core interfaces are:

  * `IContainer`: the main interface implemented by containers in .NET. 
  * `IComponent`: provides a very concrete definition of what a component is in this context. It's any class implementing this interface, and which can therefore participate in .NET containers. 
  * `ISite`/`IServiceProvider`: the former inherits the later. It provides the vital link between a component and the container it lives in (its site), which enables service retrieval by the component. `IComponent` has a `Site` property of this type. 
  * `IServiceContainer`: a default container for services, that `IComponent`s can access through the `ISite`. Not actually required as the `IContainer` can store available services through other means.

The relationship between these clases can be depicted as follows:

![Diagram showing interfaces relationship](https://web.archive.org/web/20060827132529im_/http://aspnet2.com/kzu/weblog/LightweightContainers1.png)

A typical container/component/service interaction is:

  1. Specific container class is created by client code. 
  2. Container initializes all services that components will have access to (optionally through an internal `IServiceContainer`). Client can optionally (if the container exposes its own `IServiceContainer` ) add further services at will. 
  3. Either the container or client code adds components. 
  4. Container "sites" these components by setting their `IComponent::Site` property, with an `ISite` implementation that offers services that are retrieved from the optional internal `IServiceContainer` or another implementation. 
  5. Client code can access components by name or index through `IContainer` indexer. 
  6. Components can perform actions requiring services that are retrieved through `IComponent::Site::GetService(Type)`. This method is inherited from `IServiceProvider` actually.

So, in [Fowler](http://www.martinfowler.com/articles/injection.html)'s terms, the `IContainer` implementation performs Interface Dependency Injection (through `IComponent`) of a single dependency, the Dynamic Service Locator (`ISite : IServiceProvider`). The former happens because the `IContainer` automatically sets the `IComponent::Site` property upon receiving the component to add through its `IContainer::Add(IComponent)` method. The later is the implementation of `IServiceProvider::GetService(Type)` method, which allows dynamic retrieval of services from the container.

![Diagram of call sequence for IContainer/IComponent/ISite interaction](https://web.archive.org/web/20060827132529im_/http://aspnet2.com/kzu/weblog/LightweightContainers2.png)

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

posted on Monday, May 10, 2004 2:31 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/226.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/226.aspx#507 "permalink") re: Lightweight Containers and Plugin Architectures: Dependency Injection and Dynamic Service Locators in .NET @ Sunday, May 07, 2006 6:59 PM

""As injection is being done for the service locator itself (the ISite : IServiceProvider instance), this isn't a problem anymore. Further services can be easily requested from it.""   
  
I must say, this defeats the purpose of DI. If you set the level of dependency injection at such a high level, you might as well be going out and looking for your dependencies yourself (which is what you're suggesting). This makes testing the component in isolation, or knowning what it requires by simple inspection impossible. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

Greg Kerdemelidis

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2004/05/10/226.aspx#513 "permalink") re: Lightweight Containers and Plugin Architectures: Dependency Injection and Dynamic Service Locators in .NET @ Thursday, May 11, 2006 2:36 AM

<a href="[http://www.taisha.be/pages/money-order/"><b>money](http://www.taisha.be/pages/money-order/"><b>money) order</b></a>   
<a href="[http://www.taisha.be/pages/unique-gift/"><b>unique](http://www.taisha.be/pages/unique-gift/"><b>unique) gift</b></a>   
<a href="[http://www.taisha.be/g.php/comedy-jobs/"><b>comedy](http://www.taisha.be/g.php/comedy-jobs/"><b>comedy) jobs</b></a>   
<a href="[http://www.taisha.be/g.php/business-humor/"><b>business](http://www.taisha.be/g.php/business-humor/"><b>business) humor</b></a>   
<a href="[http://www.taisha.be/pages/university-credit/"><b>university](http://www.taisha.be/pages/university-credit/"><b>university) credit</b></a>   
<a href="[http://www.taisha.be/g.php/business-daily/"><b>business](http://www.taisha.be/g.php/business-daily/"><b>business) daily</b></a>   
<a href="[http://www.taisha.be/pages/international-travel/"><b>international](http://www.taisha.be/pages/international-travel/"><b>international) travel</b></a>   
<a href="[http://www.taisha.be/g.php/cheap-boat-loan/"><b>cheap](http://www.taisha.be/g.php/cheap-boat-loan/"><b>cheap) boat loan</b></a>   
<a href="[http://www.ourebay.be/pages/visa-cards/"><b>visa](http://www.ourebay.be/pages/visa-cards/"><b>visa) cards</b></a>   
<a href="[http://www.ourebay.be/pages/adult/"><b>adult</b></a>](http://www.ourebay.be/pages/adult/"><b>adult</b></a>)   
<a href="[http://www.ourebay.be/pages/sex-movie/"><b>sex](http://www.ourebay.be/pages/sex-movie/"><b>sex) movie</b></a>   
<a href="[http://www.ourebay.be/pages/jazz-music/"><b>jazz](http://www.ourebay.be/pages/jazz-music/"><b>jazz) music</b></a>   
<a href="[http://www.ourebay.be/g.php/business-angels/"><b>business](http://www.ourebay.be/g.php/business-angels/"><b>business) angels</b></a>   
<a href="[http://www.ourebay.be/g.php/ged-transcript/"><b>ged](http://www.ourebay.be/g.php/ged-transcript/"><b>ged) transcript</b></a>   
<a href="[http://www.ourebay.be/g.php/bussines-loans/"><b>business](http://www.ourebay.be/g.php/bussines-loans/"><b>business) loans</b></a>   
<a href="[http://www.ourebay.be/g.php/direct-car-finance/"><b>direct](http://www.ourebay.be/g.php/direct-car-finance/"><b>direct) car finance</b></a>   
<a href="[http://www.ourtaobao.be/pages/sports-jobs/"><b>sports](http://www.ourtaobao.be/pages/sports-jobs/"><b>sports) jobs</b></a>   
<a href="[http://www.ourtaobao.be/pages/purchase/"><b>purchase</b></a>](http://www.ourtaobao.be/pages/purchase/"><b>purchase</b></a>)   
<a href="[http://www.ourtaobao.be/pages/auction/"><b>auction</b></a>](http://www.ourtaobao.be/pages/auction/"><b>auction</b></a>)   
<a href="[http://www.ourtaobao.be/pages/virus-scan/"><b>virus](http://www.ourtaobao.be/pages/virus-scan/"><b>virus) scan</b></a>   
<a href="[http://www.ourtaobao.be/g.php/debt-relief-usa/"><b>debt](http://www.ourtaobao.be/g.php/debt-relief-usa/"><b>debt) delief usa</b></a>   
<a href="[http://www.ourtaobao.be/g.php/kinkos-inc/"><b>kinkos](http://www.ourtaobao.be/g.php/kinkos-inc/"><b>kinkos) inc</b></a>   
<a href="[http://www.ourtaobao.be/g.php/anti-virus-protection/"><b>anti](http://www.ourtaobao.be/g.php/anti-virus-protection/"><b>anti) virus protection</b></a>   
<a href="[http://www.ourtaobao.be/g.php/new-business-loan/"><b>new](http://www.ourtaobao.be/g.php/new-business-loan/"><b>new) business loan</b></a>   
<a href="[http://www.ebaytaobao.be/g.php/ashland-ky/"><b>ashland](http://www.ebaytaobao.be/g.php/ashland-ky/"><b>ashland) ky</b></a>   
<a href="[http://www.ebaytaobao.be/pages/voip-news/"><b>voip](http://www.ebaytaobao.be/pages/voip-news/"><b>voip) news</b></a>   
<a href="[http://www.ebaytaobao.be/pages/airline-travel/"><b>airline](http://www.ebaytaobao.be/pages/airline-travel/"><b>airline) travel</b></a>   
<a href="[http://www.ebaytaobao.be/pages/credit-services/"><b>credit](http://www.ebaytaobao.be/pages/credit-services/"><b>credit) services</b></a>   
<a href="[http://www.ebaytaobao.be/pages/pregnancy/"><b>pregnancy</b></a>](http://www.ebaytaobao.be/pages/pregnancy/"><b>pregnancy</b></a>)   
<a href="[http://www.ebaytaobao.be/g.php/expedia-co/"><b>expedia](http://www.ebaytaobao.be/g.php/expedia-co/"><b>expedia) co</b></a>   
<a href="[http://www.ebaytaobao.be/g.php/new-jersey-payday-loan/"><b>new](http://www.ebaytaobao.be/g.php/new-jersey-payday-loan/"><b>new) jersey payday loan</b></a>   
<a href="[http://www.gter.be/g.php/the-power-of-kabbalah/"><b>the](http://www.gter.be/g.php/the-power-of-kabbalah/"><b>the) power of kabbalah</b></a>   
<a href="[http://www.gter.be/g.php/lots-make-money-ways/"><b>lots](http://www.gter.be/g.php/lots-make-money-ways/"><b>lots) make money ways</b></a>   
<a href="[http://www.gter.be/pages/sport-picture/"><b>sport](http://www.gter.be/pages/sport-picture/"><b>sport) picture</b></a>   
<a href="[http://www.gter.be/pages/disk-copy/"><b>disk](http://www.gter.be/pages/disk-copy/"><b>disk) copy</b></a>   
<a href="[http://www.gter.be/g.php/card-credit-disney-visa/"><b>card](http://www.gter.be/g.php/card-credit-disney-visa/"><b>card) credit disney visa</b></a>   
<a href="[http://www.gter.be/pages/gay-cruises/"><b>gay](http://www.gter.be/pages/gay-cruises/"><b>gay) cruises</b></a>   
<a href="[http://www.allthemovie.be/pages/job/"><b>job</b></a>](http://www.allthemovie.be/pages/job/"><b>job</b></a>)   
<a href="[http://www.allthemovie.be/pages/money-market/"><b>money](http://www.allthemovie.be/pages/money-market/"><b>money) market</b></a>   
<a href="[http://www.allthemovie.be/pages/SEO/"><b>SEO</b></a>](http://www.allthemovie.be/pages/SEO/"><b>SEO</b></a>)   
<a href="[http://www.allthemovie.be/g.php/school-consolidation/"><b>school](http://www.allthemovie.be/g.php/school-consolidation/"><b>school) consolidation</b></a>   
<a href="[http://www.allthemovie.be/g.php/sears-tower-chicago/"><b>sears](http://www.allthemovie.be/g.php/sears-tower-chicago/"><b>sears) tower chicago</b></a>   
<a href="[http://www.allthemovie.be/g.php/poor-credit-score/"><b>poor](http://www.allthemovie.be/g.php/poor-credit-score/"><b>poor) credit score</b></a>   
<a href="[http://www.moviedoor.be/g.php/server-tomcat-web/"><b>server](http://www.moviedoor.be/g.php/server-tomcat-web/"><b>server) tomcat web</b></a>   
<a href="[http://www.moviedoor.be/pages/amoco/"><b>amoco</b></a>](http://www.moviedoor.be/pages/amoco/"><b>amoco</b></a>)   
<a href="[http://www.moviedoor.be/pages/ocean-county/"><b>ocean](http://www.moviedoor.be/pages/ocean-county/"><b>ocean) county</b></a>   
<a href="[http://www.moviedoor.be/pages/cheap-hosting/"><b>cheap](http://www.moviedoor.be/pages/cheap-hosting/"><b>cheap) hosting</b></a>   
<a href="[http://www.moviedoor.be/g.php/company-google-search/"><b>company](http://www.moviedoor.be/g.php/company-google-search/"><b>company) google search</b></a>   
<a href="[http://www.moviedoor.be/g.php/wireless-go-phone/"><b>wireless](http://www.moviedoor.be/g.php/wireless-go-phone/"><b>wireless) go phone</b></a>   
<a href="[http://www.sing365.be/pages/medications/"><b>medications</b></a>](http://www.sing365.be/pages/medications/"><b>medications</b></a>)   
<a href="[http://www.sing365.be/pages/lawsuit/"><b>lawsuit</b></a>](http://www.sing365.be/pages/lawsuit/"><b>lawsuit</b></a>)   
<a href="[http://www.sing365.be/pages/nokia-accessory/"><b>nokia](http://www.sing365.be/pages/nokia-accessory/"><b>nokia) accessory</b></a>   
<a href="[http://www.sing365.be/pages/dns-lookup/"><b>dns](http://www.sing365.be/pages/dns-lookup/"><b>dns) lookup</b></a>   
<a href="[http://www.sing365.be/g.php/Winter-Sea/"><b>Winter](http://www.sing365.be/g.php/Winter-Sea/"><b>Winter) Sea</b></a>   
<a href="[http://www.sing365.be/g.php/Gobble-the-Goop/"><b>Gobble](http://www.sing365.be/g.php/Gobble-the-Goop/"><b>Gobble) the Goop</b></a>   
<a href="[http://www.sing365.be/g.php/Night-Trips/"><b>Night](http://www.sing365.be/g.php/Night-Trips/"><b>Night) Trips</b></a>   
<a href="[http://www.sing365.be/g.php/The-Dangerous-Blonde/"><b>The](http://www.sing365.be/g.php/The-Dangerous-Blonde/"><b>The) Dangerous Blonde</b></a> [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[btfox](http://clariusconsulting.net/utility/Redirect.aspx?U=http://www.btfox.org/ "Anonymous")

  

[![](/web/20060827132529im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
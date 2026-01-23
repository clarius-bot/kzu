---
layout: post
title: "Daniel Cazzulino's Blog : Monday, September 24, 2007 - Posts"
date: 2008-05-26 00:00:00 +0000
---

## Monday, September 24, 2007 - Posts

#####  [Why we need an EntLib Standalone Validation Application Block](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyweneedanEntLibStandaloneValidationApplicationBlock.aspx)

In my previous post about [XAML and its future as a domain model/DSL serialization format](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.aspx), I've argued that System.Configuration as well as [Enterprise Library](http://msdn2.microsoft.com/en-us/library/aa480453.aspx) Configuration (part of the core of EntLib) will soon become irrelevant. 

The caveat is that now you need to design your classes a bit differently. No more constructors where you validate the required input. Now everything is a property get/set, and validation needs to be done at a separate point in time ([ISupportInitialize.EndInit](https://msdn2.microsoft.com/en-us/library/System.ComponentModel.ISupportInitialize.EndInit)), as well as on every property set (if you only want to allow the setter to be called before initialization is completed) and before every method (if you depend on the properties being initialized). 

This sounds much worse than it actually is. With a fairly trivial base class (say, SupportInitialize), you can code your properties as follows:  
  
public int Timeout  
{  
get { return timeout; }  
set { EnsureNotInitialized(); /* validate value here, finally save value */ timeout = value; }   
}  
  
public void DoSomething()  
{  
EnsureInitialized();  
// do work  
}

Property validation can become an annoying issue now, with validation scattered throughout your class on every property setter. Moreover, you may need to validate property values that depend on other properties, meaning the validation will have to be performed on the EndInit method forcedly. 

It's pretty evident that you need something better for validation. Enter the [SVAB](http://www.codeplex.com/entlibcontrib/Release/ProjectReleases.aspx?ReleaseId=7225) (Enterprise Library [Standalone Validation Application Block](http://www.codeplex.com/entlibcontrib/Release/ProjectReleases.aspx?ReleaseId=7225)). It's basically everything you [like about](http://msevents.microsoft.com/cui/webcasteventdetails.aspx?eventid=1032336429&eventcategory=5&culture=en-us&countrycode=us) the [Validation Application Block](http://msdn2.microsoft.com/en-us/library/bb410105.aspx "Validation Application Block") without any of the "legacy" dependencies on System.Configuration (you only need attribute-driven validation) and [ObjectBuilder](http://www.codeplex.com/objectbuilder) (which doesn't really fit on the XAML picture). The idea is that you can simply rely on the base class to perform the validation based on the properties metadata:

[RangeValidator(1, RangeBoundaryType.Inclusive, 60, RangeBoundaryType.Inclusive)]  
public int Timeout  

By inheriting from the base class, you gain automatic validation. The next step is a seamless integration with WPF (it's [getting tricky](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/23/ForgetaboutextendingWPFdatabindingsupport.aspx)). The existing solution is not ideal as it requires the use of an additional wrapper element in the markup, and incurs quite some overhead in its current implementation.

I'll follow up with the alternative I'm working on right now ;)

posted [Monday, September 24, 2007 9:58 PM](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyweneedanEntLibStandaloneValidationApplicationBlock.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyweneedanEntLibStandaloneValidationApplicationBlock.aspx#comments)

#####  [Why XAML makes System.Configuration and Enterprise Library Configuration obsolete](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.aspx)

It may seem unrelated, but if you haven't read [Fowler's article on DSLs](http://martinfowler.com/bliki/DomainSpecificLanguage.html) ([from Google cache if it's down like now](http://64.233.169.104/search?q=cache:EmIl1AbBKpkJ:martinfowler.com/bliki/DomainSpecificLanguage.html+configuration+dsl+fowler&hl=en&ct=clnk&cd=2&lr=lang_es%7Clang_en)), please do so now. It will help you understand why XAML goes far beyond WPF and presentation.

Configuration is typically nothing more than a DSL (external DSL in Fowler's terms) that serves to setup the variable parts of a certain runtime library or framework. For example, while a logging framework has many "static" or invariant components (i.e. logging "pipeline" execution, interaction between components, registration of variable components, etc.), there are variable parts which determine the runtime behavior, such as concrete trace listeners attached to given trace sources, the specific file a file listener will write to, and so on. 

With careful API design, manipulating the actual runtime classes wouldn't be significantly different than manipulating its corresponding configuration classes or files. Your API is already a sort of DSL for your domain. For example, system.diagnostics can contain the definition of trace sources:
    
    
    <source name="TraceTest" switchName="SourceSwitch" switchType="System.Diagnostics.SourceSwitch" >  
      <listeners>  
        <add name="console" />  
        <remove name ="Default" />  
      </listeners>  
    </source>

To achieve the same using the corresponding runtime classes, you would write:
    
    
    				TraceSource source = newTraceSource("TraceTest");
    source.Switch = newSourceSwitch("SourceSwitch");
    source.Listeners.Add(newConsoleTraceListener());
    source.Listeners.Remove("Default");
    

[ ](http://11011.net/software/vspaste)

Note how close the two are. All you need is a good object (de)serialization format and you can go straight from the external DSL ("config" file) to the runtime objects without any intermediate representation. This wasn't possible before with .NET 1.x and 2.0 due to the lack of extensibility of the XmlSerializer and its excesive (IMO wrong) focus as a generic XML Schema <-> object converter (pretty much [an unattainable goal](http://www.25hoursaday.com/weblog/2004/02/20/TheImpedenceMismatchBetweenW3CXMLSchemaAndTheCLR.aspx) if you want full fidelity both ways) and a webservices-only feature. 

XAML, on the other hand, was thought from the beginning as a fully extensible object serialization format. With it, it's quite easy to achieve what's shown above, straight from the domain/runtime classes. One possible XAML syntax for the TraceSource example could be:
    
    
    <TraceSource Name="TraceTest">  
      <TraceSource.Switch>  
        <SourceSwitch Name="SourceSwitch"/>  
      </TraceSource.Switch>  
      <TraceSource.Listeners>  
        <ConsoleTraceListener />  
      </TraceSource.Listeners>  
    </TraceSource>

(this wouldn't work with current diagnostics classes)

You end up having executable models :)  

The only requirement to enable XAML serialization on your classes is to provide a public parameterless constructor, and public read/write properties for the stuff you want to get serialized. Validation can be done after deserialization by implementing [System.ComponentModel.ISupportInitialize](https://msdn2.microsoft.com/en-us/library/System.ComponentModel.ISupportInitialize). 

So, why would you want to develop and maintain a DSL/configuration model for your domain classes ever again?

And XAML is a v1 release, so I can only expect it to get better, more flexible and powerful over time. 

posted [Monday, September 24, 2007 9:00 PM](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [2 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.aspx#comments)

#####  [How to use Airport Express as a range extender for Linksys WRT54G](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/HowtouseAirportExpressasarangeextenderforLinksysWRT54G.aspx)

I know I'm years behind this, but just solved some range problems I had at home by using my existing Airport Express as a range extender in addition to a remote speaker, as explained in an article about [Linksys WRT54G, Airport Express, and WDS](http://rgbdream.com/2005/09/06/linksys-wrt54g-airport-express-and-wds/).

posted [Monday, September 24, 2007 6:44 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/HowtouseAirportExpressasarangeextenderforLinksysWRT54G.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/HowtouseAirportExpressasarangeextenderforLinksysWRT54G.aspx#comments)

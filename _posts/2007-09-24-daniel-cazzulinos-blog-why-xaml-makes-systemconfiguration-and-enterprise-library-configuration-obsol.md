---
layout: post
title: "Daniel Cazzulino's Blog : Why XAML makes System.Configuration and Enterprise Library Configuration obsolete"
date: 2007-09-24 00:00:00 +0000
---

## Why XAML makes System.Configuration and Enterprise Library Configuration obsolete 

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

posted on Monday, September 24, 2007 9:00 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

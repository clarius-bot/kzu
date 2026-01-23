---
layout: post
title: "Daniel Cazzulino's Blog : Why we need an EntLib Standalone Validation Application Block"
date: 2007-09-24 00:00:00 +0000
---

## Why we need an EntLib Standalone Validation Application Block 

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

/kzu

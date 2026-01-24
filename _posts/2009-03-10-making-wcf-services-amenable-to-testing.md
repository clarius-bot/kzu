---
layout: post
title: "Daniel Cazzulino's Blog - Making WCF services amenable to testing"
date: 2009-03-10 00:00:00 +0000
---

## Making WCF services amenable to testing 

You know that using [WebOperationContext.Current](http://msdn.microsoft.com/en-us/library/system.servicemodel.web.weboperationcontext.current.aspx) is BAD for making your service implementation testable, don't you?

My friend [Pablo Cibraro](http://weblogs.asp.net/cibrax/) continued to evolve [his ideas](http://weblogs.asp.net/cibrax/archive/2008/12/11/testing-wcf-rest-services.aspx) around [decoupling your service implementation](http://weblogs.asp.net/cibrax/archive/2008/05/16/unit-tests-for-wcf.aspx) from this static dependency, and came up with [the most simple yet totally unobtrusive](http://weblogs.asp.net/cibrax/archive/2009/03/08/wcfmock-a-mocking-framework-for-wcf-services.aspx) (for production code) approach to this, which he calls [WCFMock](http://wcfmock.codeplex.com/).

The idea is quite simple: you can leverage C# class aliasing functionality (which few know it even exists) to conditionally (i.e. DEBUG vs RELEASE builds) replace the WebOperationContext implementation, like so:
    
    
    #if DEBUG
    using WebOperationContext = System.ServiceModel.Web.MockedWebOperationContext;
    #endif

What will happen here is that on DEBUG builds, the actual class invoked when your code calls WebOperationContext.Current will be different, and it will be the one that allows easy testability by providing interfaces for the context and all its properties. You can setup this mock context quite easily in your tests:
    
    
    Mock mockContext = new Mock { DefaultValue = DefaultValue.Mock };
     
    using (new MockedWebOperationContext(mockContext.Object))
    {
      var formatter = catalog.GetProducts("foo");
    }
    
    // Just making sure the content type was properly set 
    mockContext.VerifySet(c => c.OutgoingResponse.ContentType = "application/atom+xml");

Of course, WCF service implementations, in my opinion, should not contain much core, and be basically a REST/webservices facade on top of the actual implementation which is something that never depends on any WCF specifics. But for those cases where you must ensure some behavior from your service implementations, this is certainly the best way to do it.

/kzu

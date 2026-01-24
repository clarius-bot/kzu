---
layout: post
title: "Daniel Cazzulino's Blog - Using WSE (1.x) on a per-WebMethod basis"
date: 2003-08-22 00:00:00 +0000
---

## Using WSE (1.x) on a per-WebMethod basis 

WSE is great for several things, but as stated in [Programming with WSE 1.0](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnwebsrv/html/progwse.asp), you have to add the extension in the Web.config. However, this causes ALL exposed WebMethods to require WSE processing, thus, you can't secure some of them and leave others as "plain" ASP.NET WebServices. 

The solution is to use the other type of web service extension available on ASP.NET, an `SoapExtensionAttribute`-inherited class that can be applied to each desired attribute. The code for such an attribute class, allowing you to use WSE only on specific methods, follows:

`
    
    
    [AttributeUsage(AttributeTargets.Method, AllowMultiple=false)]
    public class WseExtensionAttribute : SoapExtensionAttribute
    {
    	public override Type ExtensionType
    	{
    		get { return typeof(WebServicesExtension); }
    	}
    
    	public override int Priority
    	{
    		get { return _priority; }
    		set { _priority = value;    }
    	} int _priority = 0;
    }
    

`

Now you can use the attribute only on the methods that require WSE processing:

`
    
    
    [WebMethod]
    [WseExtension]
    public void WseSecuredMethod()
    {
    }
    
    [WebMethod]
    public void NonWseMethod()
    {
    }
    

`

By looking at the [WSE 2.0 Technical Preview](http://microsoft.com/downloads/details.aspx?FamilyId=21FB9B9A-C5F6-4C95-87B7-FC7AB49B3EDD&displaylang=en) "code", I can say this still holds true, so you will need this code anyway (except if they happen to add it!).

/kzu

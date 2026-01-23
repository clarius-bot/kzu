---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-06 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Wednesday, December 10, 2003 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2003/12/1.aspx "1 Post")| [2](http://clariusconsulting.net/blogs/kzu/archive/2003/12/2.aspx "1 Post")| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2003/12/4.aspx "1 Post")  
5| 6| 7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/12/11.aspx "2 Posts")  
[12](http://clariusconsulting.net/blogs/kzu/archive/2003/12/12.aspx "1 Post")| 13| 14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2003/12/16.aspx "1 Post")| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/12/17.aspx "2 Posts")| [18](http://clariusconsulting.net/blogs/kzu/archive/2003/12/18.aspx "2 Posts")  
[19](http://clariusconsulting.net/blogs/kzu/archive/2003/12/19.aspx "1 Post")| 20| 21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/12/22.aspx "1 Post")| 23| 24| 25  
26| 27| 28| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060206231902im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Wednesday, December 10, 2003 - Posts

#####  [ASP.NET low-level fun](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/115.aspx)

Sometimes you need low level information about the current request in a web application, such as the IP address of the physical network adapter the request came through (cool in clustered multi-NIC servers), or some other weird stuff you can't find in the higher-level view provided by `HttpRequest`, ` HttpResponse`and friends.  
Luckily, the `HttpContext` implements `IServiceProvider`, which means you can ask for services with the following code:

`
    
    
    IServiceProvider provider = (IServiceProvider) HttpContext.Current;
    // Get the request
    HttpRequest util = (HttpRequest)
      provider.GetService(typeof(HttpRequest));

`

OK, I know... who on earth would use that instead of simply calling `HttpContext.Current.Request`??? Well, THE one thing you can get that there's absolutely NO other way of getting, is the current `[ HttpWorkerRequest](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemwebhttpworkerrequestclasstopic.asp)`:

`
    
    
    // Get the worker
    HttpWorkerRequest wr = (HttpWorkerRequest)
      provider.GetService(typeof(HttpWorkerRequest));
    // Get the NIC address!!!!
    string addr = wr.GetLocalAddress();

`

Another very cool use is to retrieve known header values. Usually, you just get the header from the `Request.Header` collection by its name:

`
    
    
    // Would return "Keep-Alive" if enabled.
    string cn = Request.Headers["Connection"]; 
    // Would return "gzip, deflate" for example.
    string enc = Request.Headers["Accept-Encoding"];

`

but that's prone to errors, and you have to sort of guess the casing, etc. This is the cool way: 

`
    
    
    // Get the worker
    HttpWorkerRequest wr = (HttpWorkerRequest)
      provider.GetService(typeof(HttpWorkerRequest));
    
    string cn = wr.GetKnownRequestHeader(HttpWorkerRequest.HeaderConnection); 
    string enc = wr.GetKnownRequestHeader(HttpWorkerRequest.HeaderAcceptEncoding);

`

Have a look at the [ class members](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemwebhttpworkerrequestmemberstopic.asp) , there are quite a few interesting things, now that you can call them ;)... and use them NOW, before they regret making such a beast available...

posted [Wednesday, December 10, 2003 8:01 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/115.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/115.aspx#comments)

#####  [XAML validation rules for XML editors](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/114.aspx)

[Rob](http://longhornblogs.com/rrelyea/) [asks for feeback](http://longhornblogs.com/rrelyea/posts/1623.aspx) on rule description so that any editor can offer validation and intellisense of XAML documents. We certainly know WXS isn't enough, as it has been [discussed](http://weblogs.asp.net/dmarsh/posts/35608.aspx) for the attached properties syntax. Rob says they provide: 

>   1. a schema - xaml.xsd (the Longhorn SDK installs it) 
>   2. a set of rules/constraints that we can't easily describe in schema (not adequately documented yet) 
>   3. a set of assemblies - using reflection tools could understand what elements exist, their properties, events, etc...
> 

The important one is the second, because the third would be useless to any tool that doesn't use .NET code. Expressing rules that can't be described in a WXS is a long standing issue. We all know XPath. Arbitrary complex rules can be expressed with, such as co-occurence constraints, content models dependent on attribute values, etc. Instead of "documenting" those additional rules, why aren't they written as XPath assertions?   
Furthermore, it has been [ demonstrated](http://www.topologi.com/public/Schtrn_XSD/Paper.html) (and free XSLT-based, .NET and Java implementations are available) that an [XPath-based standard language]() can be embedded both in RelaxNG and WXS, offering the best of both worlds. Discussion around the language and its features can be found at [ XML.com](http://xml.coverpages.org/schematron.html), and there are [ many](http://nwalsh.com/xml2001/schematownhall/slides/toc.html) [comparisons](http://www.xml.com/pub/a/2001/12/12/schemacompare.html) that show its advantages and flexibility for rules expression. In a meeting with the most important names in the XML schemas world, analysis by the [ experts](http://www.idealliance.org/papers/xml2001/papers/html/05-00-04.html) in each language showed these results ( adding up the 'yes' to the features [analyzed](http://nwalsh.com/xml2001/schematownhall/slides/toc.html)-see scorecards, with 1/2 point for 'some' support): 

  1. Schematron: 27 
  2. RELAX NG: 20.5 
  3. WXS: 16 
  4. DTD: 8.5

What's more, [it's undergoing](http://www.ascc.net/xml/resource/schematron/schematron.html) ISO standarization, so you can be sure it won't become propietary or dissapear. Therefore, integrating it (either through XSLT or other languages implementation such as [ James Clark's Jing](http://www.thaiopensoftware.com/relaxng/jing.html), SUN's [ MultiSchema validator](http://wwws.sun.com/software/xml/developers/schematronaddon/), [ Schematron.NET](http://sourceforge.net/projects/dotnetopensrc/), etc.) into an editor wouldn't be that much hard. Even [ Cocoon](http://cocoon.apache.org/) uses it for [ validation](http://cocoon.apache.org/2.1/apidocs/org/apache/cocoon/components/validation/schematron/package-summary.html). 

So, the bottom line is: implement WXS + RelaxNG schemas for the document structure. Embed or provide a separate Schematron schema for the additional rules. I'm sure most companies will be much more satisfied than by a document stating these rules in plain english.... 

_Update: SUN provides a[free tool](http://wwws.sun.com/software/xml/developers/relaxngconverter/) to convert from several schema languages (including WXS) to RelaxNG, so MS don't bother to provide it. _

posted [Wednesday, December 10, 2003 11:29 AM](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/114.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/114.aspx#comments)

#####  [XAML: speak now or forever hold your peace](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/113.aspx)

[Chris](http://www.simplegeek.com/), [Don](http://www.gotdotnet.com/team/dbox/default.aspx) and [Rob](http://longhornblogs.com/rrelyea) are asking for [feedback](http://longhornblogs.com/rrelyea/posts/1633.aspx) on XAML design. It's your opportunity to contribute something and be happy when it comes out. If you don't, don't complain later ;)  
[My contribution:](http://longhornblogs.com/rrelyea/posts/1633.aspx#1766)

> No code inline please. No processing instructions, please. Rob has already read my suggestion in a comment elsewhere, but here it goes again: instead of   
>   
>  <?Mapping XmlNamespace="rob" CtrlNamespace="Rob.UI.Controls.RobLink" Assembly="RobControls.dll"?>   
>   
>  use this:   
>   
>  <Xaml>   
>  <rob:RobLink xmlns:rob="RobControls.dll#Rob.UI.Controls.RobLink">Fancy link</rob:RobLink>   
>   
>  Of course, there's some redundancy in the RobLink name, being present as a sort of "fragment identifier" into the assembly, and as the tag name itself. However, I believe if the xmlns path is taken, I could name the element with any other name, provided y give it the appropriate control namespace.   
>   
>  Another (even better, I believe) approach would be for the fragment to end in the control namespace, and leave the class (type) resolution to the element name... this is good as it would allow us to avoid nested namespace declarations, as follows:   
>   
>  <Xaml xmlns:rob="RobControls.dll#Rob.UI.Controls">   
>  <rob:RobLink>Fancy link</rob:RobLink>   
>  <rob:RobButton>Click me!</rob:RobButton>   
>   
>  I believe this is much more XML-friendly than the PI approach... by FAAAR.   
>   
>  Daniel Cazzulino 

Rob [sort of answered](http://donxml.com/allthingstechie/posts/149.aspx#152) when I suggested this in a comment to a post from [DonXML](http://donxml.com/allthingstechie/posts/149.aspx): 

> Please note, each control doesn't need to be in its own assembly. If I have RobButton and RobLink, I can put them both in RobControls.dll. 
> 
> Currently, all controls that you build in markup or code, and hope to use in markup elsewhere, need to be in a different assembly than the one you are building your app into. 
> 
> We had a model like Daniel mentioned at one point...I'll have to go back and have discussions about the pros and cons of those 2 approaches. 
> 
> Please keep the feedback coming. 
> 
> Thanks, Rob Rob Relyea Program Manager, Avalon Team 

I certainly would like to know those pros and cons!!! 

posted [Wednesday, December 10, 2003 9:59 AM](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/113.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/12/10/113.aspx#comments)

  

![](/web/20060206231902im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
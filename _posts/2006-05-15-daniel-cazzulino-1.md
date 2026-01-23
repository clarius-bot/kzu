---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-15 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Thursday, February 12, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2004/2/2.aspx "3 Posts")| 3| [4](http://clariusconsulting.net/blogs/kzu/archive/2004/2/4.aspx "2 Posts")| 5| 6  
7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/2/10.aspx "2 Posts")| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/2/12.aspx "1 Post")| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/2/13.aspx "1 Post")  
14| 15| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/2/16.aspx "7 Posts")| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/2/17.aspx "2 Posts")| [18](http://clariusconsulting.net/blogs/kzu/archive/2004/2/18.aspx "1 Post")| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/2/20.aspx "3 Posts")  
21| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/2/23.aspx "1 Post")| [24](http://clariusconsulting.net/blogs/kzu/archive/2004/2/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/2/25.aspx "1 Post")| 26| [27](http://clariusconsulting.net/blogs/kzu/archive/2004/2/27.aspx "1 Post")  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060515183136im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Thursday, February 12, 2004 - Posts

#####  [Declarative WSE pipeline configuration](http://clariusconsulting.net/blogs/kzu/archive/2004/02/12/156.aspx)

Configuring the WSE pipeline (1.x) is explained in the Configure a Custom Filter section in an [ MSDN article](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnwse/html/insidewsepipe.asp) that also explains how to manipulate programatically the pipeline. The configuration, however, only allows ADDING a filter, not removing or changing the filters execution order or position. In this post I will explain how to achieve what I explained at the end of [ a previous post](http://weblogs.asp.net/cazzu/archive/2003/10/03/30367.aspx), that is, have complete declarative control over WSE pipeline configuration.

Basically, what I wanted is to have a configuration file as follows:

+ Sample configuration file. 

`
    
    
    <configuration>
      <configSections>
        <section name="wse.configuration" 
          type="Wse.WseConfiguration, Wse" />
      </configSections>
    
      <wse.configuration>
        <!-- filters: selection of WSE filters that will be applied to incoming and outgoing messages. -->
        <filters>
          <!-- Disable routing features -->
          <remove type="Microsoft.Web.Services.Routing.RoutingInputFilter, Microsoft.Web.Services, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
          <remove type="Microsoft.Web.Services.Routing.RoutingOutputFilter, Microsoft.Web.Services, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
    
          <!-- Disable referral features -->
          <remove type="Microsoft.Web.Services.Referral.ReferralInputFilter, Microsoft.Web.Services, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
          <remove type="Microsoft.Web.Services.Referral.ReferralOutputFilter, Microsoft.Web.Services, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
    
          <!-- Input filters -->
          <add at="0" type="Wse.SignatureInputFilter, Wse" />
          <move to="0" type="Microsoft.Web.Services.Diagnostics.TraceInputFilter, Microsoft.Web.Services, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
    
          <!-- Output filters -->
          <add type="Wse.Filters.SignatureOutputFilter, Wse" />
          <move to="0" type="Microsoft.Web.Services.Diagnostics.TraceOutputFilter, Microsoft.Web.Services, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
        </filters>
      </wse.configuration>
    </configuration>

`

And have WSE pipeline configured accordingly. In a web application, I would have to force the appropriate config. handler to run at the `Application_Start` event by issuing one of the following:

`
    
    
    FilterConfiguration filters = (FilterConfiguration) 
        ConfigurationSettings.GetConfig(WseConfiguration.SectionName);
    
    
    //Or
    
    
    WseConfiguration.Initialize();

`

This involves creating a section handler and processing each of the elements in the `<filters>` node. The method that is called with the handler is created looks as follows:

+ The filter processing method. 

`
    
    
    public void Process(object parent, object configContext, XmlNode section)
    {
      CheckAtMostOneElement(section as XmlElement, ElementName);
    
      //Process directives in document order.
      XPathNodeIterator nodes = section.CreateNavigator().Select(_expression);
      while (nodes.MoveNext())
      {
        XmlElement node = ((IHasXmlNode)nodes.Current).GetNode() as XmlElement;
        if (String.Compare(node.LocalName, Add, true) == 0)
        {
          AddFilter(node);
        }
        else if (String.Compare(node.LocalName, Remove, true) == 0)
        {
          RemoveFilter(node);
        }
        else if (String.Compare(node.LocalName, Move, true) == 0)
        {
          MoveFilter(node);
        }
        else
        {
          ThrowUnknownElement(node.ParentNode as XmlElement, node);
        }
      }
    }

`

I'm caching the expression that locates the filters so improve performance, and to make the code more maintainable. I keep all element and attribute names in constants:

+ Declared constants. 

`
    
    
    const string ElementName = "filters";
    const string Input = "input";
    const string Output = "output";
    const string Add = "add";
    const string Move = "move";
    const string Remove = "remove";
    const string At = "at";
    const string To = "to";
    const string FilterType = "type";

`

Of course, the real work happens in `AddFilter`, `RemoveFilter` and `MoveFilter`. As WSE has a clear distiction between input and output filters by means of different base classes for them, `SoapInputFilter` and `SoapOutputFilter`, we don't need to bother to specify which kind of filter we're adding/removing/moving, and we can instead infer this in those helper methods. These methods use the approach explained in the aforementioned [ MSDN article](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnwse/html/insidewsepipe.asp) to pipeline handling. Here's the `AddFilter` one:

+ The AddFilter method. 

`
    
    
    private void AddFilter(XmlElement node)
    {
      CheckRequiredAttribute(node, FilterType);
      Type t = Type.GetType(node.Attributes[FilterType].Value);
      if (!(typeof(SoapInputFilter).IsAssignableFrom(t) || typeof(SoapOutputFilter).IsAssignableFrom(t)))
      {
        throw new ArgumentException("Invalid filter type: " + t.AssemblyQualifiedName);
      }
                    
      object filter = Activator.CreateInstance(t);
      XmlAttribute at = node.Attributes[At];
      //Add or insert the filter at the appropriate position if specified.
      if (at != null)
      {
        //We already checked that it's either an input or an output filter. 
        if (filter is SoapInputFilter)
        {
          WebServicesConfiguration.FilterConfiguration.InputFilters.Insert(Convert.ToInt32(at.Value), (SoapInputFilter)filter);
        }
        else
        {
          WebServicesConfiguration.FilterConfiguration.OutputFilters.Insert(Convert.ToInt32(at.Value), (SoapOutputFilter)filter);
        }
      }
      else
      {
        //We already checked that it's either an input or an output filter. 
        if (filter is SoapInputFilter)
        {
          WebServicesConfiguration.FilterConfiguration.InputFilters.Add((SoapInputFilter)filter);
        }
        else
        {
          WebServicesConfiguration.FilterConfiguration.OutputFilters.Add((SoapOutputFilter)filter);
        }
      }
    }

`

Note that we insert or add depending on the presence of the @at attribute. The ` RemoveFilter` does almost the same, so I won't show the full code. The move filter is slightly more complicated as we can only move around filters that already exist on the pipeline. Fortunately the `SoapInputFilterCollection` (and the output too) class exposes an `IndexOf` method that receives the filter type to locate, which comes handy now:

int idx = WebServicesConfiguration.FilterConfiguration.InputFilters.IndexOf(theType);

I've provided this code as a C# project in the [ASPNET2 Incubator](http://aspnet2.com/) (work-in-progress still), and you can download it [from here.](http://aspnet2.com/incubator/code/Wse.zip) I also included the two signature filters discussed in the [ aforementioned post](http://weblogs.asp.net/cazzu/archive/2003/10/03/30367.aspx) for reducing WSE message payload by avoiding sending the binary security token when it is agreed and distributed previously between secured parties/servers. Look for the `SecurityTokenHelper.cs` file. Its static constructor should load the `SecurityToken` you will use to secure communication.

posted [Thursday, February 12, 2004 11:52 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/02/12/156.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/02/12/156.aspx#comments)

  

[![](/web/20060515183136im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
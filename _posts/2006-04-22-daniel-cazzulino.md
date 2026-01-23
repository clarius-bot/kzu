---
layout: post
title: "Daniel Cazzulino"
date: 2006-04-22 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Thursday, March 09, 2006 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))| April 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2312'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
26| 27| 28| 29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2006/3/1.aspx "1 Post")  
2| 3| 4| 5| 6| 7| 8  
[9](http://clariusconsulting.net/blogs/kzu/archive/2006/3/9.aspx "1 Post")| 10| 11| 12| 13| 14| 15  
16| 17| 18| 19| 20| 21| 22  
23| 24| 25| 26| 27| 28| 29  
30| 1| 2| 3| 4| 5| 6  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060422175141im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Thursday, March 09, 2006 - Posts

#####  [How to load a DSL domain model instance file programmatically](http://clariusconsulting.net/blogs/kzu/archive/2006/03/09/LoadDSLModel.aspx)

Say you have a custom DSL file in a solution. Say you want to process the model on that file using GAT or an AddIn or even your custom application code at runtime. You need to deserialize that XML (yes, it’s all XML in the end) into an instance of your domain model (root). 

You will need two pieces of information: the .NET type of the domain model (that is, the parent of your domain model root concept) and its the corresponding designer. The following code does the trick, allowing you to deserialize a model and return the first instance of the given domain model type (i.e. the model root):
    
    
    public static TRootConcept GetModelRoot<TRootConcept>(string modelFile, Type modelType, Type designerType)  
    {  
    **// Create a new store to deserialize the instance to.  
    ** Store newStore = new Store();  
     Type[] metaTypes = new Type[] {  
      typeof(Microsoft.VisualStudio.Modeling.Diagrams.CoreDesignSurface),  
      typeof(Microsoft.VisualStudio.Modeling.Utilities.UtilitiesModel),  
      modelType,   
      designerType };
    
    
    **// Load these types into the store, so that it knows about them for deserialization  
    ** newStore.LoadMetaModels(metaTypes);
    
    
     foreach (Type subStoreType in metaTypes)  
     {  
      // TODO: this will not be required in RC+ versions of DSL tools.  
      Activator.CreateInstance(subStoreType, newStore);  
     }
    
    
    **// Be version resilient  
    ** int majorVersion;  
     int minorVersion;  
     GetModelVersion(modelFile, out majorVersion, out minorVersion);
    
    
    **// Deserialize the file into the store  
    ** using (Stream fileStream = File.OpenRead(modelFile))  
     {  
      XmlSerialization.DeserializeStore(newStore, fileStream, majorVersion, minorVersion, null, null);  
     }
    
    
    **// Locate the attribute that will give you the Guid of the element to find  
    ** MetaObjectAttribute metaObject = Generics.GetCustomAttribute<MetaObjectAttribute>(typeof(TRootConcept));  
     if (metaObject == null)  
     {  
      throw new ArgumentException(String.Format(  
       CultureInfo.CurrentCulture,  
       Properties.Resources.MetaInformationForElementNotFound,  
       elementType));  
     }
    
    
    **// Return the first one we find  
    ** foreach (object element in newStore.ElementDirectory.GetElements(metaObject.Id))  
     {  
      return element;  
     }
    
    
     return null;  
    }

The `GetModelVersion` helper method simply reads the major/minor values from the XML itself:
    
    
    private static void GetModelVersion(string modelFile, out int majorVersion, out int minorVersion)  
    {  
    **// Get versions from model:  
     //<om:MetaModel MajorVersion="1" MinorVersion="1" xmlns:om="**[**http://Microsoft.VisualStudio.Modeling**](http://microsoft.visualstudio.modeling/)**" >   
    ** using (XmlReader reader = XmlReader.Create(modelFile))  
     {  
      reader.MoveToContent();  
      if (reader.LocalName != "MetaModel")  
      {  
       throw new InvalidOperationException(Properties.Resources.FileDoesNotContainModel);  
      }  
      majorVersion = Int32.Parse(reader.GetAttribute("MajorVersion"), CultureInfo.CurrentCulture);  
      minorVersion = Int32.Parse(reader.GetAttribute("MinorVersion"), CultureInfo.CurrentCulture);  
     }  
    } 

posted [Thursday, March 09, 2006 1:57 PM](http://clariusconsulting.net/blogs/kzu/archive/2006/03/09/LoadDSLModel.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/03/09/LoadDSLModel.aspx#comments)

  

[![](/web/20060422175141im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
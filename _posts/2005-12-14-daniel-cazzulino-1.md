---
layout: post
title: "Daniel Cazzulino"
date: 2005-12-14 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Upgrading from GAT May CTP and December CTP

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2005/12/1.aspx "1 Post")| 2| 3| 4  
5| 6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2005/12/8.aspx "2 Posts")| 9| 10| 11  
12| 13| [14](http://clariusconsulting.net/blogs/kzu/archive/2005/12/14.aspx "2 Posts")| 15| 16| 17| 18  
[19](http://clariusconsulting.net/blogs/kzu/archive/2005/12/19.aspx "1 Post")| 20| 21| 22| 23| 24| 25  
26| 27| 28| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060220124427im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Upgrading from GAT May CTP and December CTP 

These are roughly the things that you need to change in your current package:

  1. Search replace "50505" with "51206" in the entire solution. This is the changed assembly version number that appears in all your .vstemplates. 
  2. Delete all references from all projects to Microsoft.Practices.* and re-add them pointing to the new version of the binaries. 
  3. Search replace "igt" with "gax" (for XML and .vstemplate files) 
  4. All T3 templates need to be updated to the [T4 syntax](http://www.google.com/url?sa=t&ct=res&cd=1&url=http%3A//blogs.msdn.com/garethj/archive/2005/09/26/473929.aspx&ei=49yhQ8WYB7n84AGUy7GtDw&sig2=07iUPYS4EcanO4WB8xPzAw) shared with the DSL tools 
  5. Search & replace: **Microsoft.Practices.RecipeFramework.Library.Actions.T3Action, Microsoft.Practices.RecipeFramework.Library** with **Microsoft.Practices.RecipeFramework.VisualStudio.Library.Templates.TextTemplateAction, Microsoft.Practices.RecipeFramework.VisualStudio.Library**
  6. DteHelper class now lives in the Microsoft.Practices.RecipeFramework.Library namespace and assembly. 
  7. In .vstemplate files, you could previously specify initial state for your recipes with the following syntax:

    
    
        <TemplateReference Name="Projects\ServiceAgent\ServiceAgent.vstemplate" Target="\ServiceAgents">  
          <XmlSerializableHashtable xmlns="<http://schemas.microsoft.com/pag/igt-xmlhashtable>" xmlns:xsi="<http://www.w3.org/2001/XMLSchema-instance>" xmlns:xs="<http://www.w3.org/2001/XMLSchema>">  
           <Entries>  
            <Entry>  
             <Key xsi:type="xs:string">Key1</Key>  
             <Value xsi:type="xs:string">Value1</Value>  
            </Entry>  
           </Entries>  
          </XmlSerializableHashtable>  
         </InitialState>-->  
        </TemplateReference>

That has been replaced by the much simpler format: 
    
    
        <TemplateReference Name="Items\SerializableClass.vstemplate" Target="/" >  
         <InitialState xmlns:xsi="<http://www.w3.org/2001/XMLSchema-instance>" xmlns:xs="<http://www.w3.org/2001/XMLSchema>">  
          <Entry>  
           <Key>SerializableField</Key>  
           <Value>Name</Value>  
          </Entry>  
         </InitialState>  
        </TemplateReference> 

Of course, you can still use xsi:type just like the XmlSerializer does to get strongly typed initial values. You can put pretty much whatever you want there, as long as the value is compatible with the corresponding arguments defined for the recipe. 

I think that's all, but let me know if you find anything that's missing or not working!

posted on Wednesday, December 14, 2005 10:51 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/418.aspx) :: 

  

![](/web/20060220124427im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
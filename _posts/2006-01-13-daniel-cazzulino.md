---
layout: post
title: "Daniel Cazzulino"
date: 2006-01-13 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : XLinq: is XML embedded in a host language a good idea or a terrible one?

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2161'\))| January 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2223'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 29| 30| 31  
1| 2| 3| 4| 5| [6](http://clariusconsulting.net/blogs/kzu/archive/2006/1/6.aspx "3 Posts")| [7](http://clariusconsulting.net/blogs/kzu/archive/2006/1/7.aspx "2 Posts")  
8| 9| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2006/1/12.aspx "2 Posts")| [13](http://clariusconsulting.net/blogs/kzu/archive/2006/1/13.aspx "1 Post")| 14  
15| 16| 17| 18| 19| 20| 21  
22| 23| 24| 25| 26| 27| 28  
29| 30| 31| 1| 2| 3| 4  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060115081344im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## XLinq: is XML embedded in a host language a good idea or a terrible one? 

During the MVP Summit, and through [various articles](http://msdn.microsoft.com/Vbasic/future/ "Linq and future of the language \(MSDN\)") and blog [posts](http://blogs.msdn.com/xmlteam/archive/2005/09/16/468846.aspx "XML Team Blog"), Microsoft has been trying to [get community feedback](http://www.xlinq.net/ "Cool community site for Linq and XLinq") on the proposed feature of integrating XML as a first-class concept into a core language (such as VB.NET). It seems so natural, right? After all, they are [not the first ones](http://www.ecma-international.org/publications/standards/Ecma-357.htm "ECMAScript for XML \(E4X\) Specification") to propose such a thing.   
You're dealing with lots XML in your application, what else could you ask than to be able to do something like the [following](http://msdn.microsoft.com/Vbasic/future/default.aspx?pull=/library/en-us/dnvs05/html/vb9overview.asp#vb9overview_topic6 "Deep XML Support in VB9 \(MSDN\)")?:
    
    
    Dim CountriesWithCapital As XElement = _
      <Countries>
        <%= Select <Country Name=(Country.Name)
                            Density=(Country.Population/Country.Area)>
                     <Capital>
                       <Name><%= City.Name %></Name>
                       <Longitude><%= City.Longitude %></Longtitude>
                       <Latitude><%= City.Latitude %></Latitude>
                     </Capital>
                   </Country> _
            From Country In Countries, City In Capitals _
            Where Country.Name = City.Country %>
      </Countries>  

I see at least a couple drawbacks with this approach:

  1. VS already has a full-featured, very responsive and [cool XML editor](http://msdn.microsoft.com/XML/BuildingXML/XMLinNETFramework/default.aspx?pull=/library/en-us/dnxmlnet/html/xmltools.asp "An Introduction to the XML Tools in Visual Studio 2005 \(MSDN\)") that includes intellisense powered by schemas, allows XSLT transformation debugging, etc. We would need to have at least an equally capable inline XML editor in place in order to be really productive
  2. Now the “template” for the “rendered” XML is compiled into the application. If I need to change anything about that XML layout, I’ll need to recompile the application.

Of course, this does not mean that we should stick to using XmlWriter and XmlDocument to create XML. That’s just insane and much harder to maintain. But there is another alternative, which I think is better. 

Text templating is an old technique. The reason why the syntax above looks so familiar is that it’s mostly classic ASP, and people have been using a [similar](http://jakarta.apache.org/velocity/ "Apache Jakarta Velocity") [technique](http://www.codesmithtools.com/ "CodeSmith template language") for generating not only XML or HTML, but all kinds of text assets (such as SQL statements). But so far, no general purpose text template rendering engine has been ever been available from Microsoft. Until now.

The [DSL tools](http://msdn.microsoft.com/vstudio/DSLTools/ "DSL Tools homepage \(MSDN\)") and [GAT](http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/ "Guidance Automation Toolkit \(MSDN\)") come with such an engine code-named [T4](http://blogs.msdn.com/garethj/archive/2005/06/01/T4Syntax.aspx "T4 overview and syntax \(GarethJ's blog\)") (Text Templates Transformation Toolkit, kind of a successor of a previous version code-named T3 which I developed quite some time ago for patterns & practices and bundled in previous versions of GAT). This engine allows you to author very similar XML building code but in a standalone file, that you can later “render” with a given context:
    
    
    <#@ Template Language="C#" #>  
    <#@ Property Processor="PropertyProcessor" Name="Customer" #>  
       
    <?xml version="1.0" encoding="utf-8" ?>  
    <Customer Name="<# this.Customer.Name #>">  
    <# foreach (Order order in this.Customer.Orders) { #>  
     <Order>  
      <Id><#= order.Id #></Id>  
      ... etc ...  
     </Order>  
    <# } #>  
    </Customer>

You can of course choose the language you will use for the template so-called control code, and have properties automatically created by specifying that Property template directive. If you had chosen VB as the language, and were using VB9 runtime/compiler, I suppose nothing would stop you from having almost *exactly* the same code shown at the beginning. Now, forget about T4, as it’s a tool part of an SDK, probably not well tested outside of the scope it was designed for (code generation at designtime), etc. Imagine if you had such an engine but as part of the .NET framework itself. Imagine you had deep support for intellisense in VS for the control code snippets. There are several benefits to such an approach:

  1. One of the main benefits is that now the language used to author the control code is a “plug-in” to the template editor. This ensures that the template editing experience will be consistent independently of which .NET language you decide to code the control code snippets in. The opposite case happens if you embed the template code (XML in XLinq case) into a host language: all host language editors will need to provide this feature, and we have already started seeing that some .NET languages will support such a feature (probably VB9) whereas others will probably not (most likely C#). Even if they all agree to implement the editor and required language features, third-party languages will still be out of the game unless they spend substantial time adding the feature in a way that is consistent with everyone else’s. In a T4–like approach, pretty much all **you would need is a CodeDomProvider**.
  2. Given 1., the designers of the template editor will need to design it with pluggability in mind. In fact, this editor will easily become the **host for all of the other editors in VS** , including the XML editor, SQL editor, C#/VB, ASP.NET, etc. Once this is well done for any one of them, integrating the others will be substantially easier than trying to extend each and every language to support “deep integration” with any of those “languages”.
  3. This will also **maximize the productivity of developers** that are proficient with this template language. Now they will be able to comfortably generate any target source asset using the same tool.
  4. Mixing the “rendering” code (XML in this case) with the model and controller code makes for poor maintainability. You should think of the XML being generated as a view over a model, resembling very much the MVC pattern. There’s a [very interesting paper](http://www.cs.usfca.edu/~parrt/papers/mvc.templates.pdf "Paper by Terence Parr, creator of ANTLR and StringTemplate") regarding that. It's already a bit frightening to have the full .NET power at hand inside the template control code... but having it fully intermixed with the M-C code will probably lead to **spagethi-like code** that we thought we finally got through with ASP.NET. In this regard, I see it as a door for a very likely huge step backwards. (do you **really** think people will NOT generate HTML or other rendering code with it?)
  5. As the templates themselves can be made to inherit from a given base template class (via an **Inherits="MyNamespace.MyBaseClass"** attribute on the template directive), you can maximize reuse of control code and rendering helpers, as well as get intellisense driven by this custom base class too (together with whatever the so-called directive processors provide to the template class). 
  6. If you take this paradigm further enough, you could even end up with an editor that is much like the ASP.NET one, with custom rendering “controls” which can be templatized (just like in ASP.NET), use binding expression, etc.. 
  7. Finally, but not less important, is that you can now evolve your “rendered” views without recompiling your entire application. If missed an attribute that is available on the model, but was not needed previously on the rendered/output XML, you can add it simply by changing the template.

I think this is a very interesting area, but I believe Microsoft should strive not to provide another technology that could potentially bring back the nightmares we lived with ASP in the past. **If it can be missused, it *will* be missused**.

If it were for me, I’d limit the features available on the control code snippets to just control and rendering code: if..else, for/while loops, value retrieval (<#= foo.ToString #>), and that’s it. No object creation, no method calls (as they could have side-effects).

posted on Friday, January 13, 2006 8:55 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/443.aspx) :: 

  

![](/web/20060115081344im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-19 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Wednesday, August 25, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2004/8/2.aspx "2 Posts")| 3| 4| 5| 6  
7| 8| 9| 10| 11| 12| 13  
14| 15| 16| 17| 18| 19| 20  
21| 22| 23| 24| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/8/25.aspx "1 Post")| 26| 27  
28| 29| 30| [31](http://clariusconsulting.net/blogs/kzu/archive/2004/8/31.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060519094109im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Wednesday, August 25, 2004 - Posts

#####  [ASP.NET v2: how to remove an amazing feature and replace it with a bad, already tried and failed one](http://clariusconsulting.net/blogs/kzu/archive/2004/08/25/LosingComponents.aspx)

Before I get to the point where I expect to convince you of what we're loosing with ASP.NET v2, I'll make a brief recap, just in case you haven't used the technique in question.

## What are components?

Components, in the strict .NET sence, is anything that directly or indirectly implements IComponent. You'd be surprised that a lot of classes in .NET (specially visual ones, such as System.Web.UI.Control or System.Windows.Forms.Control) implement IComponent. One of the consequences of a class being a component is that the IDE can offer additional features to it at design time. The key property for the IDE to offer services to components is the IComponent.Site. A so-called sited component is one that has been placed in a Container. This containment is general and is not related to visual containment.

For example, an ASP.NET server control, when dropped in a Web Form, is said to be sited. Its Site property (part of the implementation of the IComponent interface), is set to the host where the component lives now, which inside VS .NET is an instance of the Microsoft.VisualStudio.Designer.Host.DesignSite class. Exactly the same object type is assigned as the Site property of a Windows Forms user control when dropped in the forms designer, and to a non-visual component at design-time. 

The Site property, of type ISite, contains members that allow the component to communicate with other components, with its container (a logical container) and services provided by it. The container is an object that implements the System.ComponentModel.IContainer interface. At design-time, the container is always an instance of the Microsoft.VisualStudio.Designer.Host.DesignerHost. This object is the core of VS .NET IDE features for components.

Now, in ASP.NET 1.x, you have a clear distinction between visual components such as controls and non-visual ones, which appear in a separate area called the "component tray". In the highly unlikely event that you never saw it before, here's how it looks like:

![](https://web.archive.org/web/20060519094109im_/http://aspnet2.com/kzu/weblog/components_tray1.png)

## Why are they cool?

One up-front benefit of non-visual components and the way ASP.NET *and* Windows Forms handle them (up to now, both handle them in the same uniform way), is that they don't clutter the visual design of the form with items that are not supposed to be rendered.

Other important benefits are:

  1. Component designers: you can assign a designer to a component, which will enhance the component behavior at design time. Many of the following points are related to designers. 
  2. Designer verbs, wizards: a component designer can expose so called designer verbs so that the user can trigger pottentially complex actions or even a wizard that will aid him in configuring and using the component. A well-known case of this is the xxDataAdapter components, which allow you to do quite complex manipulation of the data access strategy. The following picture shows a component I developed that aids the user in checking bindings defined for a component, as well as editing them with a UI.   
  
![](https://web.archive.org/web/20060519094109im_/http://aspnet2.com/kzu/weblog/components_tray2.png) ![](https://web.archive.org/web/20060519094109im_/http://aspnet2.com/kzu/weblog/components_tray3.png)   

  3. Customize code generation: code generated for the InitializeComponent can be customized at will, up to the point where you can directly generate CodeDom statements for it. This means the complex component configuration can be translated into code (that will be compiled and very performant, therefore) that will be reloaded at run-time. And all the logic is encapsulated directly a separate class that acts as the CodeDomSerializer for the component, meaning that the component logic isn't even tied to the "serialization" format. You could even store the object's state in an XML file or anything else. Here's the code serialization for the component above:  
  
![](https://web.archive.org/web/20060519094109im_/http://aspnet2.com/kzu/weblog/components_tray4.gif)  

  4. Through 3., participate in UI lifecycle: through the custom code that can be emited, a component can easily attach itself to relevant events in the UI containing it (i.e. a WebForm's Load or PreRender stages), and perform additional automatic processing, all without the user having to write a single line of code. In ASP.NET, this means for example, that a component can attach itself to the PreRender event, and add attributes and code to other controls on the page (for example, to setup required information for a client-side Javascript-based UI framework....). The component above, through the WebFormsAdapter connects the controller Init method with the page Init event, the controller RefreshModels method with the Load event, and the RefreshView method with the PreRender event. 
  5. Revolutionary extension of existing components: we can even go further and implement AOP (Aspect Oriented Programmings) by directly adding "new" properties on other components/controls. This is the IExtenderProvider interface, which you could probably see applied in the Tooltip Windows Forms component. When you drop such a component on a WinForm, you see it in the component tray, and automatically all controls get a new property named after the name of the component. You can configure tooltip feature for all controls on the page on a single place, the component itself, and apply selective tooltip messages to each control you want.   
The component shown above, the publisherControler, adds view-model mapping capabilities to all built-in and third-party controls on a page automatically:  
  
![](https://web.archive.org/web/20060519094109im_/http://aspnet2.com/kzu/weblog/components_tray5.png)  

  6. Component root designers and authoring: components can be composed graphically by dragging and dropping other components on a default design surface area. This results in RAD development of composite components by assembling the features of several constituent parts. You can even go and implement your own root designer, providing a more-compelling design-time experience. Simple attributes allow you to control the ToolBox, so that, for example, only certain components can be dropped on your control design surface. The following picture shows the root designer for the controller component, which allows you to only drop models on it:  
  
![](https://web.archive.org/web/20060519094109im_/http://aspnet2.com/kzu/weblog/components_tray6.png)  

  7. You can go even further and hook into the serialization process of other components, by using the IDesignerSerializationManager to register your own IDesignerSerializationProvider. This way, you could for example add arbitrary attributes to all controls on the page, *at design time*, that is, by emitting additional code for the InitializeComponent method. This makes for an ultimate AOP-enabler, combined with IExtenderProvider.

## What's going on in Whidbey?

You would naturally expect for such a cool technology to be extender, further supported and exploited in the new version, right? Well, it turns out that the ASP.NET team is [ conciounsly stopping to support the feature](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=e2996990-64a5-4308-921d-245071e6f174) in the new Web Forms designer.

One of the reasons they've given in the public bug database (if you haven't used [ MSDN Product Feedback yet](http://lab.msdn.microsoft.com/ProductFeedback/), you definitely should!!!) is:

> The web forms designer has changed to support only ASP.NET controls. It no longer supports component style controls.

There's a fundamental flaw in this reasoning. Components are *not* controls. They are not visual things, neither they are intended to be laid out together with the controls on the page, which DO need to be arranged for visually coherence and UI rendering. MS's comment on the bug goes on and says:

> The primary reason for this change is the newer architecture provides a cleaner and more robust model for persisting controls in the page

Again, the reason is that they see everything as a control. What this means for you as a web app developer, is that instead of having a clean UI surface for laying out controls and designing the graphics aspects of your page, you get something like the following: 

![](https://web.archive.org/web/20060519094109im_/http://aspnet2.com/kzu/weblog/components_tray7.png)

This is not an unreasonable example. You have a SiteMapDataSource datasource, for a navigation control, next you have an XmlDataSource probably for a treeview, and a SqlDataSource to render data on the GridView. Finally, as there's a WebPart, you need to drop a WebPartManager too. The WebPartManager is the extreme case, as you even have to drop it *before* any webpart in document order in order for it to work!!!! 

Now, is it just me or this sounds a lot like a *HUGE* step backwards to the Visual InterDev days and before? It's clear to me that this means I'll be moving those "non-visual-controls" around so they don't mess with my page design experience. But it's worse than you think, you can't even set their top/left to -100!!! As they are not visual controls, you can't set any of the regular visual attributes :S. Ups! 

The reason for deprecating this feature goes on: 

> We no longer rely on an "InitializeComponent" section, and there is not "tools generated" code ever. In the past we had many bugs around InitializeComponent not working correctly and the model was very brittle. 

As I noticed before, being able to generate code from a component is a very powerful feature, and the ability to extend other controls from the outside (Aspect Oriented Programming, does it ring a bell?) is amazing, despite it wasn't publicized enough. Now, if there are bugs around the InitializeComponent method, the reasonable thing to do seems to be to go fix them, don't you think? 

I complained this is a breaking change on ASP.NET v2, but they say: 

> You can still use components within a webform, however you have to do so in code, and the tray is not supported. You can still used components within classes in your web project however. To do so you can create a class that inherits from IComponent and place it in the code directory. You should then be able to open that class using the component designer and place components on it. 

So, in order not to break existing apps, they just left the runtime support, but removed the design-time experience on WebForms. What's important to realize, though, is that the design-time experience, and the aids they represent to the users is that makes components so compelling. Building applications by composing blocks (components) into bigger components (i.e. dropping models on controllers, and controllers on pages) is just what [ some MS architects have been preaching](http://softwarefactories.com/), yet we have to see the ASP.NET team deprecating one of the most revolutionary steps in that direction. 

And just in case I didn't stress it enough: ASP.NET Controls are obviously an ASP.NET-only technology, unlike Components, which can be used without changed in both WebForms and WinForms!!!

##  Call to action

It's not too late. Many developers already voted on the bug to keep the feature. We're not still at Beta2, so I believe if we put enough preasure, we may be lucky enough to get it back. 

Go to the [ MSDN Product Feedback](http://lab.msdn.microsoft.com/ProductFeedback/viewfeedback.aspx?feedbackid=e2996990-64a5-4308-921d-245071e6f174) bug page and vote NOW. Otherwise, don't complain next year if you see this feature missing! 

posted [Wednesday, August 25, 2004 5:11 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/08/25/LosingComponents.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/08/25/LosingComponents.aspx#comments)

  

[![](/web/20060519094109im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
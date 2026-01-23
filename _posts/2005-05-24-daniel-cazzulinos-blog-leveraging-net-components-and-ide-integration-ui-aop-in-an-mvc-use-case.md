---
layout: post
title: "Daniel Cazzulino's Blog : Leveraging .NET Components and IDE Integration: UI AOP in an MVC use case"
date: 2005-05-24 00:00:00 +0000
---

## Leveraging .NET Components and IDE Integration: UI AOP in an MVC use case 

## Introduction

This post is a summary of a much longer article (~60 pages) that for space reasons does not fit well here in its entirety. 

The full article can be viewed at [CodeProject.](http://www.codeproject.com/csharp/components.asp)~~<http://clariusconsulting.net/articles/components/components.html>.~~

The article discuses:

  * .NET and VS .NET vision of components: the building blocks and how they fit together.
  * The design-time architecture.
  * The MVC pattern: separating concerns and components responsibilities. Brief overview and our proposed architecture. 
  * Aspect Oriented Programming (AOP) in the UI: extending existing components with new features. How to do it without inheritance or containment through VS .NET architecture.
  * Integration of components with the IDE: through the property browser. Converters, editors and designers.
  * Taking advantage of services provided by the host (IDE).
  * How to control code generation. 
  * Design patterns to increase component reuse: making components cross-technology (web and windows-aware)
  * How to provide custom services through the VS .NET architecture.
  * Extending design-time infrastructure at run-time.

## Article Overview

  * **A component-oriented architecture** : an overview of the ComponentModel, how it works in Visual Studio, its implications at design and run time.
  * **Hosted components** : .NET components and how they interact with the ComponentModel architecture, how they access services and publish new ones.
  * **Design-time architecture** : how the Visual Studio designers work, overview of designers, type converters and editors.
  * **Root Components and Designers** : how you can extend the architecture for your own components, to the point of completely replacing the root designer if you wanted to.
  * **MVC: the Model-View-Controller design pattern**. Brief overview of how we plan to apply this pattern to showcase the ComponentModel features.
  * **AOP in the .NET era** : how .NET implements a novel way of doing AOP with UI elements through the IExtenderProvider interface, and how to use it to implement the MVC model in a RAD way. 
    * **Custom Code Serialization: the CodeDom power**. How to customize the code that gets injected in the InitializeComponent method.
    * **CodeDom syntax** : brief walkthrough of the CodeDom syntax.
    * Emitting CodeDom: how to emit the code from your component designers.
    * **Back to simplicity** : components built-in support for CodeDom generation is enough in some cases.
  * **Completing the MVC Component Model** : integrating the component-based model with the toolbox and drag & drop. 
    * **.NET Component Model: a closer look and inheritance problems**. What happens when you drop components on the design surface.
  * **Deep IDE Integration** : improving integration of custom components with the IDE, and playing nice with the built-in services when changing values through the Property Browser. 
    * **Extending the Serviced Architecture** : exposing new services through the IDesignerHost for consumption at design-time. Side-note on how CodeDom serialization of properties happens.
    * **Custom Editors** : creating complex UIs for setting component property values, how to integrate them with the Property Browser and be compatible with Visual Studio monitoring of component changes. 
    * **Custom and Global Commands** : exposing commands or designer verbs on a component, but also how to publish commands that apply on the entire components tray area.
  * **Dealing with different view technologies** : implementing the adapter pattern to abstract Windows and Web UIs without losing *any* RAD features in the IDE. 
    * **Model Behavior, the MVC way** : how the UI communicates with controllers to perform operations on the model.
    * **Connecting the Views** : how to connect controllers’ code with the views, so that updating and synchronization with the model happens automatically. 
  * **Beyond your own components** : how to modify the CodeDom injected when serializing components you don’t own (i.e. controls), and add your own stuff on top of them, without needing inheritance or containment (AOP-style) 
  * **The final message** : what did we learn from this journey on the ComponentModel and the IDE features, useful tips for developing IDe integration code, etc.

## Article Summary

During the article I explore the most advanced features available in .NET and VS .NET for component-based development. I offer deep integration with the IDE, and even expand the model to the run-time. 

I discuss the MVC design pattern, and create a concrete implementation that can make application development substantially faster. Not only that, but I create an implementation that can work with the same code base for both Windows and Web Forms. 

posted on Tuesday, May 24, 2005 12:17 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

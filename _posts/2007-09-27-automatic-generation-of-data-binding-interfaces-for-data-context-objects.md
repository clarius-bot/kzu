---
layout: post
title: "Daniel Cazzulino's Blog - Automatic generation of data-binding interfaces for data context objects"
date: 2007-09-27 00:00:00 +0000
---

## Automatic generation of data-binding interfaces for data context objects 

From the new [Clarius Labs release](http://www.codeplex.com/clarius/Release/ProjectReleases.aspx?ReleaseId=7358):

### XamlBinding Custom Tool

This custom tool will generate a partial class file implementing [INotifyPropertyChange](http://msdn2.microsoft.com/en-us/library/system.componentmodel.inotifypropertychanged.aspx) as well as a strongly-typed event for each property declared in the file it's applied to.  
This is very useful when creating models or entities that are used in data-binding scenarios, and where an associated presenter needs to perform certain logic when a given property changes. 

  
Communicating through these strong-typed events prevents tight coupling between the presenter and the UI, which now communicate exclusively through the model/data context.  
A must-have for anyone doing ["Binding Oriented Programming"](http://www.paulstovell.net/blog/index.php/binding-oriented-programming/) ;)

  
The code generator solves the problem of having the presenter attach to the generic [INotifyPropertyChanged.PropertyChanged](http://msdn2.microsoft.com/en-us/library/system.componentmodel.inotifypropertychanged.propertychanged.aspx) event and checking the property by name, which must be kept in sync with the class definition and doesn't participate in refactorings.

  
It will also solve the initialization sequence and validation (post deserialization and afterwards) problem by implementing [ISupportInitialize](http://msdn2.microsoft.com/en-us/library/system.componentmodel.isupportinitialize.aspx), [ISupportInitializeNotification](http://msdn2.microsoft.com/en-us/library/system.componentmodel.isupportinitializenotification.aspx) and [IChangeTracking](http://msdn2.microsoft.com/en-us/library/system.componentmodel.ichangetracking.aspx), which allows it to track changes automatically on its members and nested values. The public interface of your object remains uncluttered by implementing most of these privately. The data context class can simply call the provided `EnsureValid` at the beginning of each method call to make sure that the class has been properly initialized, and that if it's dirty, it's re-validated. 

  
A DoValidate method is added to the main class to implement the actual property validation (where you could use the [Standalone Validation Block](http://www.codeplex.com/entlibcontrib/Wiki/View.aspx?title=Standalone%20Validation%20Block) for example), as well as RaiseXXChanged method calls on each property setter.

  
Finally, the generated code doesn't depend on anything other than `[System.ComponentModel](http://msdn2.microsoft.com/en-us/library/system.componentmodel.aspx)`, so WPF is not even required to use the codegen for other data-binding scenarios (WinForms should work fine).

  
Installation: run the MSI, or compile the included solution.  
Usage: assign the value XamlBinding to any code file in VS. A corresponding file ending in ".XamlBinding.cs" (or .vb) will be generated automatically everytime the main file changes.  

This release supports both VB and C#.

Enjoy!

/kzu

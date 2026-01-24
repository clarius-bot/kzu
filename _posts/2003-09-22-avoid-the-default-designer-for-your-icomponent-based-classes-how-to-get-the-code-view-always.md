---
layout: post
title: "Daniel Cazzulino's Blog - Avoid the default designer for your IComponent-based classes: how to get the code view always!"
date: 2003-09-22 00:00:00 +0000
---

## Avoid the default designer for your IComponent-based classes: how to get the code view always! 

How many times you create a `[WebService](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwebserviceswebserviceclasstopic.asp)`, an `[Installer](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemconfigurationinstallinstallerclasstopic.asp)`, or more generally, any class that directly or indirectly implements `[IComponent](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfSystemComponentModelIComponentClassTopic.asp)`, and wish it doesn't open the default `[ComponentDesigner](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemcomponentmodeldesigncomponentdesignerclasstopic.asp)`?  
The simple way to achieve it is adding the following attribute to your class declaration: 

`
    
    
    [System.ComponentModel.DesignerCategory("Code")]
    public class YouClass : YourComponentBasedClass
    		

`

Now whenever you double-click the class in the solution explorer, the code editor will show up, instead of the designer, all thanks to the `[DesignerCategoryAttribute](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemcomponentmodeldesignercategoryattributeclasstopic.asp)`. 

/kzu

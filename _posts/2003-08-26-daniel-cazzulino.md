---
layout: post
title: "Daniel Cazzulino"
date: 2003-08-26 00:00:00 +0000
---

## XSD.EXE is still useful (or how to get properties instead of fields) 

Getting code form XSD files is a great help when you have to create many entities reflecting your business logic. It also allows for easy extensibility because you only have to change the schema and generate the entities again. Using xsd.exe /c, you can get the XmlSerializer-friendly classes in a snap. What's more, a very usefull tool by [Chris Sells](http://www.sellsbrothers.com/tools/#xsdClassesGen) even makes the process automatic inside the IDE, with a custom tool.  
However, the problem with XSD is that it generates classes with public fields instead of property get/sets, which is far from ideal. 

As you probably know, there's no way of customizing XSD.EXE, so how can we get the properties and still use it? A little work with regular expressions and the Find/Replace dialog does the trick. Use the following values in the dialog:

`
    
    
    Find what:    public {[^ ]+} {[^ ]+};
    Replace with: public \1 \2 \n\t\t{\n\t\t\tget { return _\2; }\n\t\t\tset { _\2 = value; }\n\t\t} private \1 _\2;

`

Remember to check `Use Regular Expressions`. Now you will get the following code:

`
    
    
    /// 
    public int CustomerID;

`

replaced with:

`
    
    
    /// 
    public int CustomerID 
    {
     get { return _CustomerID; }
     set { _CustomerID = value; }
    } private int _CustomerID;

`

Lastly, having public properties lets you bind these custom classes directly to a WinForms datagrid and get the properties as columns automatically (yeah... I know nobody will EVER use that...). But you can always take the blue pill after doing so ;)

posted on Tuesday, August 26, 2003 8:26 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

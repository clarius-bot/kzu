---
layout: post
title: "Configuration"
date: 2004-07-16 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : 100% Managed Wizard Framework from Patterns &amp; Practices

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| [5](http://clariusconsulting.net/blogs/kzu/archive/2004/7/5.aspx "2 Posts")| [6](http://clariusconsulting.net/blogs/kzu/archive/2004/7/6.aspx "1 Post")  
7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/7/9.aspx "2 Posts")| 10| 11| [12](http://clariusconsulting.net/blogs/kzu/archive/2004/7/12.aspx "1 Post")| 13  
14| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/7/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/7/16.aspx "3 Posts")| 17| 18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/7/20.aspx "1 Post")  
[21](http://clariusconsulting.net/blogs/kzu/archive/2004/7/21.aspx "2 Posts")| 22| 23| 24| 25| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060516093107im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## 100% Managed Wizard Framework from Patterns &amp; Practices 

The [Shadowfax Visual Studio Wizards](http://www.gotdotnet.com/community/workspaces/newsitem.aspx?id=9c29a963-594e-4e7a-9c45-576198df8058&newsId=2971) are built on top of a managed framework for constructing wizards automatically from configuration files. When the source code for the wizards is released, you'll see that there's minimum code in them, mostly for those parts of the wizard that actually need to modify information on the current solution, called Commands. The whole wizard UI is built from the configuration file. 

So let's see this XML format to see what's possible with the framework.

## Configuration

Wizard definition file has the following main sections:

\- <wizard>

\-- <typeDefinitions> ?

\-- <step> +

### <wizard>

Root element of config. Contains the following attributes:

Attribute |  Description  
---|---  
title |  A title shown in the initial wizard page.  
description |  Full description of what the wizard does, shown in initial page.  
type |  Full type name of class inheriting from Wizard or reference to a TypeDefinition. If not specified, defaults to the built-in provided form. Optional.  
prompt |  An arbitrary text to show the user to confirm execution of the wizard. May warn about pre-requisites.  
  
Title and description are shown as follows:

![](https://web.archive.org/web/20060516093107im_/http://aspnet2.com/kzu/weblog/SfxWizards1/image001.jpg)

A custom form can be developed and plugged using the Type attribute. 

State is kept in a simple IDictionary.

### <typeDefinitions>

This element contains any number of <typeDefinition> child elements, to create aliases to repeated types being used in the file, having the following attributes:

Attribute |  Description  
---|---  
name |  A alias to assign to this type.  
type |  The full type name.   
  
At any place in the configuration file, all attributes expecting a type can either specify a fully qualified type name, or an alias referring to these type definitions.

### <step>

This element defines each visual step that will be available in the wizard. Steps are visualized through the Next | Previous buttons in the wizard form. It has the following attributes:

Attribute |  Description  
---|---  
title |  The title of the step.  
description |  A description of what this step does.  
tip |  A tip to show to the user about the current step. Optional.  
type |  Full type name of class inheriting from Step or reference to a TypeDefinition. If not specified, defaults to the built-in provided step. Optional.  
dependsOn |  An expression that determines whether the step should be shown or skipped.  
  
They are laid out as follows:

![](https://web.archive.org/web/20060516093107im_/http://aspnet2.com/kzu/weblog/SfxWizards1/image002.jpg)

##### dependsOn 

Some steps may only be executed under certain conditions. For example, a step may collect additional values if a previous step has a certain value, or if an option (such as a radio button) was selected. 

This attribute allows for such conditional execution through a reduced conditional (i.e. "if") expression with the following format: 

([not] ArgumentName [ ( = | < | > | >= | <= | != ) VALUE ] [ ( and | or ) ])* 

That is, an argument name, optionally preceded by the "not" negation, optionally followed by a value comparison (currently only string value comparisons supported) and any number of "and" or "or" operators chaining multiple argument checks. Operators are not case sensitive. 

Semantics for an argument name in the expression is the same as for [XPath boolean function](http://www.w3.org/TR/xpath#function-boolean): if the argument is not defined or it is null, it evaluates to false. If it's present and its not a boolean, it evaluates to true, unless it's a string and its length is zero. Otherwise, the actual boolean value. 

Examples:

Transport = 'WebServiceTransport' 

Depends on a specific string value in an argument

MessageQueueTransport or MSMQDispatchingTransport

Depends on any of the two arguments to be specified, and if any of them is, to evaluate to true according to the rules for boolean evaluation.

WebServiceName

Depends on the argument to exist and actually have a value, subject to the rules for boolean evaluation. 

A step contains the definition of arguments to collect from the user. Arguments can optionally be arranged in option groups (exclusive boolean arguments, i.e. a RadioButton group) or regular groups, with a title such as the one shown in the previous screenshot. Also, the step may contain one or more commands to be executed before moving to the next step (or upon finishing the wizard). Full definition is as follows:

\- <step>

\-- <optionGroup> *  
\--- <argument> *

\-- <group> *  
\--- <argument> *

\-- <argument> *

\-- <execute> *

#### <optionGroup>

This group renders as a set of RadioButtons for each child argument, which are always of type Boolean. It has only one attribute:

Attribute |  Description  
---|---  
title |  The title of the group.  
  
Its child <argument> element is a reduced version of the full argument element explained below. It can only contain the following attributes: label, tooltip, help, storeIn, selected (determines the initial state of the radio button). See explanation below for the full <argument> element.

#### <group>

Like we said, this is only a visual arrangement for arguments. It has only one attribute:

Attribute |  Description  
---|---  
title |  The title of the group.  
  
Both kinds of groups render at the top of the form, before all non-grouped arguments.

#### <argument>

This is the element that defines the way arguments are collected from the user. It has many attributes that control the behavior and appearance of the Value Editor control:

Attribute |  Description  
---|---  
label |  A label to show next to the argument input box.  
tooltip |  Brief hint to the user about the purpose of this argument. Optional.  
help |  Complete help for the argument. Optional.  
type |  Full type name of argument or a reference to a TypeDefinition Defaults to string. Optional.  
converter |  Full type name of a class that can convert values to and from representations other than the argument type or a reference to a TypeDefinition. Defaults to converter associated with the argument type. Optional.  
editor |  Full type name of a class that provides UI editing of the argument or a reference to a TypeDefinition. Defaults to editor associated with the argument type. Optional.  
storeIn |  Key to use to store the value.  
usage |  Enumeration values: Required, Optional. Defaults to Required. It's optional.  
defaultValue |  A value to use as the default when the wizard starts. Either the argument must be of type string, or a converter must be able to transform it to the argument type.  
defaultExpression |  An expression that can be a state key name (stored by another argument) optionally followed by property or field accesses on it. This is useful for setting a value's default to a previously collected argument.  
  
Help causes an icon to appear next to the input box, and clicking on it causes a new window to show the full help for it. 

converter and editor work together to provide the collection strategy. The former provides conversion to/from string (usually) representations of the value. For example, an argument of type Int32 is converted from the string used as a default value or the one entered by the user. Converter can also provide a list of values that are valid. For example, the .NET built-in converter for enums displays an ordered list of valid enum values. This value relies on the .NET TypeConverter base class.

The Editor can provide a UI for editing the value, such as the .NET built-in ColorEditor or CollectionEditor or custom ones such as a ClassBrowserEditor or a ProjectSelectionEditor. This value relies on the .NET UITypeEditor base class.

Collectively, they make for the following argument collection UI:

![](https://web.archive.org/web/20060516093107im_/http://aspnet2.com/kzu/weblog/SfxWizards1/image003.jpg)

Editors and converters build upon the .NET System.ComponentModel features. Therefore, we offer instant availability of all .NET converters and editors. Plus, the documentation and expertise in building them for custom components and controls can be leveraged for the wizard construction process.

To really understand the power of this feature, let's just see a couple more screenshots. Let's say a wizard configuration file has the following argument definition (taken from the Add New Service wizard):

<argument label="Service folder" storeIn="ServiceFolder" 

editor="FolderEditor" defaultValue="BusinessLayer"

tooltip="Parent folder to place the new service folder into." />

Note the editor attribute. It points to an alias in the typeDefinitions section that defines a type inheriting from UITypeEditor, which happens to be a dropdown editor that shows all the projects and folders in the current solution (implemented as a Windows Forms User Control). This is the UI rendered and the editor shown after the user clicked the down arrow:

![](https://web.archive.org/web/20060516093107im_/http://aspnet2.com/kzu/weblog/SfxWizards1/image004.jpg)

And the following shows a similar argument specifying another editor that loads the list of handlers in the current configuration file:

![](https://web.archive.org/web/20060516093107im_/http://aspnet2.com/kzu/weblog/SfxWizards1/image005.jpg)

A converter that shows a list of values is even more easy to develop, although it provides only simple dropdown capabilities.

Finally use attribute determines whether the value associated with the argument can be left unassigned or not. This will affect whether the Next button will be enabled too (only when all required arguments in the current step are filled).

#### <execute>

This element defines an optional command that will be executed when the step is finished (either before moving to the next step, or finishing the whole wizard). It has the following attributes:

Attribute |  Description  
---|---  
command |  Full type name of the command type to execute or a reference to a TypeDefinition.  
description |  Friendly short description of the command. Can contain references to arguments in the wizard state.  
prompt  |  A message that will be displayed to the user before the action is taken This message can contain references to arguments in the wizard state.  
dependsOn  |  Dependency expression that determines whether the command must be executed. See DependsOn for the Step element, as it has the same syntax and semantics.  
  
prompt and description format is a string that can contain argument references with the form $(StateKey). For example:

<execute 

command="AddFolder" 

prompt="Folder $(TargetFolder) will be added. Continue?.">

Prompts allow the user to chose Yes/No options.

The Step class is responsible for executing commands at the appropriate time. At this point, it will request a service from the controller, ICommandService, which allows execution of commands. Commands may support Undo, by implementing a specialized interface called IUndoCommand. Undo functionality is managed by the controller. If a command does not support undo, the developer can let the user know it through the prompt attibute message.

Before execution, the Step sets a restore point in the command service, so that if any one command fails, all commands supporting undo are rolled back. The service implements this restore functionality through the memento design pattern.

The command may receive arguments. The mapping between collected state values and command arguments is performed through use elements:

<execute command="theCommand">

<use stateValue="stateKey" value="expression" asArgument="asKey" />

</execute>

The use element maps a value into an argument to pass to the command. asArgument defines the key to use for the command execution. Value can be either directly pulled from the wizard state by using stateValue, which must be the same key used by storeIn argument element attribute. Alternatively, an expression built of mixed constant string values and argument references (with the same format as the prompt and description attributes) can be used. In this case, this attribute takes precedence over stateValue. For example: 

<execute command="AddFolder">

<use value="BusinessLayer\Services\$(ServiceName)" asArgument="Path" />

</execute>

Here we're mixing a fixed relative path and the actual value for argument ServiceName.

Commands must implement one of the following interfaces:

public interface ICommand : IComponent  
{

void Execute ( IDictionary arguments );

}

public interface IUndoCommand : ICommand  
{

void Undo ( IDictionary arguments );

}

Commands implement IComponent in order for the container to be able to "site" them, giving access to environment services to them.

Note that <execute> element is optional. The reason for this is that complex commands may require multiple input arguments. The wizard developer can split those arguments collection into several UI steps, and only execute the command in the last one in the sequence, passing the values accumulated so far. Steps, therefore, are a UI grouping for argument collection that ultimately are passed to a command for execution. There's no direct 1-to-1 connection between them.

## Built-in arguments

When a wizard is launched from the Add New ... dialogs, the appropriate context arguments as explained Context Parameters for Launching Wizards are added to the wizard state. Therefore, they can be reused inside the wizard configuration file. For example, an Add New Item wizard can use the ItemName state slot as follows:

<argument label="Business action name" storeIn="ItemName" />

The value will be pulled from the pre-filled one the first time it's shown to the user in the wizard.

Likewise, any custom parameter passed through the .vsz file as a key/value pair, will also be filled. For example, the following .vsz file passes the Language state value to the wizard:

VSWIZARD 7.0

Wizard=IPE.IdeWizard

Param="Assembly=Microsoft.ReferenceArchitecture.Wizards"

Param="Wizard=Microsoft.ReferenceArchitecture.Wizards.AddBusinessAction.NewItem.xml"

Param="Language=C#"

An argument on the wizard can use this state slot as follows:

<use stateValue="Language" asArgument="Kind" />

On a future post I'll discuss a concrete wizard distributed with the Shadowfax Wizards, most probably the Add New Service one as it's the most comprehensive, from XML configuration, to Add New Project dialog hook to setup and deployment on top of the base Wizard Framework. 

posted on Friday, July 16, 2004 2:11 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/268.aspx) :: 

  

[![](/web/20060516093107im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
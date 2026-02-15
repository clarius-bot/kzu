---
layout: post
title: 100% Managed Wizard Framework from Patterns &amp; Practices
date: 2004-07-16 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/EverettWizardConfig
tags:
- .NET
- Patterns amp; Practices
- Shadowfax

---

The [Shadowfax Visual Studio Wizards](http://www.gotdotnet.com/community/workspaces/newsitem.aspx?id=9c29a963-594e-4e7a-9c45-576198df8058&newsId=2971) are built on top of a managed framework for constructing wizards automatically from configuration files. When the source code for the wizards is released, you'll see that there's minimum code in them, mostly for those parts of the wizard that actually need to modify information on the current solution, called Commands. The whole wizard UI is built from the configuration file. 

So let's see this XML format to see what's possible with the framework.

## Configuration

Wizard definition file has the following main sections:

\- <wizard>

\-- <typeDefinitions> ?

\-- <step> +

### <wizard>

Root element of config. Contains the following attributes:

Attribute type name ---type 
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

Attribute ---label converter defaultValue command   
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

/kzu

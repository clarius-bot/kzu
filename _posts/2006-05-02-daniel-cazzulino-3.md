---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-02 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, May 14, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| 5| 6  
[7](http://clariusconsulting.net/blogs/kzu/archive/2004/5/7.aspx "1 Post")| [8](http://clariusconsulting.net/blogs/kzu/archive/2004/5/8.aspx "1 Post")| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2004/5/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2004/5/11.aspx "1 Post")| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/5/13.aspx "1 Post")  
[14](http://clariusconsulting.net/blogs/kzu/archive/2004/5/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/5/15.aspx "1 Post")| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2004/5/17.aspx "2 Posts")| 18| 19| 20  
21| 22| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/5/26.aspx "2 Posts")| 27  
28| 29| 30| [31](http://clariusconsulting.net/blogs/kzu/archive/2004/5/31.aspx "1 Post")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502132112im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Friday, May 14, 2004 - Posts

#####  [XSD -& Classes Generator Custom Tool (radically new and extensible)](http://clariusconsulting.net/blogs/kzu/archive/2004/05/14/XsdCodeGenTool.aspx)

This article is a companion to [Code Generation in the .NET Framework Using XML Schema](http://msdn.microsoft.com/xml/default.aspx?pull=/library/en-us/dnxmlnet/html/xsdcodegen.asp) article published in the [MSDN XML DevCenter](http://msdn.microsoft.com/xml/). In that article, I introduce you to the main classes in the .NET framework that enable code generation from XSD files, the very clases the XSD.EXE tool uses. The ideas come from my initial post on [Customizing XSD->Classes code generation, the "easy" way](http://weblogs.asp.net/cazzu/archive/2003/10/24/33302.aspx).   
In this article I'll show how the VS.NET custom tool included in the MSDN article code download is created.

## Building the XsdCodeGen Custom Tool

Creating a custom tool for VS.NET is extremely easy. Microsoft has released a project with all the necessary classes for that purpose, which can be downloaded from GotDotNet (http://www.gotdotnet.com/Community/UserSamples/Details.aspx?SampleGuid=4AA14341-24D5-45AB-AB18-B72351D0371C). Everything we need to do is create a new class library project using that one as a skeleton, and add a new class inheriting from the `BaseCodeGeneratorWithSite` provided:

[Guid( "9B7CF25A-1782-433b-B534-0B94E76A7D62" )] [ComVisible( true )] public class XsdCodeGenerator : BaseCodeGeneratorWithSite

The generator is registered as a COM component, and that’s why we need to specify the GuidAttribute and the ComVisibleAttribute. The former should receive a new GUID which can be created from the Tools -> Create GUID menu. We call it a generator because that’s the registry key they are registered under. That key has two sub keys, one for the VB.NET and another for the C# generators. We should register our tool with both, as we’re using the language-agnostic CodeDom. Therefore, we define two constants that hold the GUIDs of such categories:

private static Guid CSharpCategory = new Guid( "{FAE04EC1-301F-11D3-BF4B-00C04F79EFBC}" ); private static Guid VBCategory = new Guid( "{164B10B9-B200-11D0-8C61-00A0C91E29D5}" ); 

We’ll also store the GUID assigned to the class itself for easy access, as we’ll need it for registration. We also define the custom tool name and description with constants. The former is important as it’s the one that is assigned to a file through the Property Browser in order to execute the tool:

private const string CustomToolName = "XsdCodeGen"; private const string CustomToolDescription = "MSDN Classes Generator"; 

The registry key we need to create looks like the following:

[HKLM\SOFTWARE\Microsoft\VisualStudio\\{Version}\Generators\\{C#/VB}\\{ToolName}] @="{ToolDescription}" "CLSID"="{ToolGUID}" "GeneratesDesignTimeSource"=dword:00000001

As we don’t have any dependencies on any VS version, we should register under both keys, “7.0” and “7.1”, replacing the {Version} part. Also, we will register for both language categories. We will store as a constant the full registry key skeleton to format with the variable parameters. The registration methods are:

private const string KeyFormat = @"SOFTWARE\Microsoft\VisualStudio\\{0}\Generators\\{1}\\{2}"; protected static void Register( Version vsVersion, Guid categoryGuid ) { using( RegistryKey key = Registry.LocalMachine.CreateSubKey( String.Format( KeyFormat, vsVersion, categoryGuid.ToString( "B" ), CustomToolName ) ) ) { key.SetValue( "", CustomToolDescription ); key.SetValue( "CLSID", CustomToolGuid.ToString( "B" ) ); key.SetValue( "GeneratesDesignTimeSource", 1 ); } } protected static void UnregisterCustomTool( Version vsVersion, Guid categoryGuid ) { Registry.LocalMachine.DeleteSubKey( String.Format( KeyFormat, vsVersion, categoryGuid.ToString( "B" ), CustomToolName ), false ); }

Finally, we have to call these methods at COM registration/unregistration time. We can specify the methods to be executed at that time, through the `ComRegisterFunctionAttribute`/`ComUnregisterFunctionAttribute` attributes:

[ComRegisterFunction] public static void RegisterClass( Type t ) { // Register for both VS.NET 2002 & 2003 (C#) Register( new Version( 7, 0 ), CSharpCategory ); Register( new Version( 7, 1 ), CSharpCategory ); // Register for both VS.NET 2002 & 2003 (VB) Register( new Version( 7, 0 ), VBCategory ); Register( new Version( 7, 1 ), VBCategory ); } [ComUnregisterFunction] public static void UnregisterClass( Type t ) { // Unregister for both VS.NET 2002 & 2003 (C#) Unregister( new Version( 7, 0 ), CSharpCategory ); Unregister( new Version( 7, 1 ), CSharpCategory ); // Unregister for both VS.NET 2002 & 2003 (VB) Unregister( new Version( 7, 0 ), VBCategory ); Unregister( new Version( 7, 1 ), VBCategory ); }

After compiling the project, we need to run the following command (in a VS.NET command prompt) on the project output folder to register the custom tool:

regasm /codebase XsdCodeGenerator.CustomTool.dll

And to unregister it:

regasm /unregister XsdCodeGenerator.CustomTool.dll

Alternatively, you can go to the project properties dialog, under Configuration Properties > Build, and set Register for COM Interop to true.   
To run the custom tool for a file, we just need to set its `Custom Tool` property to `XsdCodeGen`.   
Now we can finally move to the actual code generation inside the tool. 

## Generating Code

The first step is to factor out the code we used for the console application. We will associate the custom tool with XSD files, so we will already have the source filename in place. We won’t need the language because the `BaseCodeGeneratorWithSite` base class we used already provides access to a `CodeDomProvider` that is the appropriate one according to the current project type where the file lives in. Finally, as we specified at tool registration time that we would generate source at design-time (`GeneratesDesignTimeSource` registry value), VS.NET will automatically generate a new file dependent on the schema file, much like it does with a `TypedDataset` schema and its corresponding class file, a WebForm and its code-behind, a WinForm and its resource file, etc. All we need is implement the following method from the tool base class:

protected abstract byte[] GenerateCode( string inputFileName, string inputFileContent ); 

In order to better reuse code from the custom tool and the console app, we will separate the XSD processing in a new class and we will make the console app use this one by referencing the custom tool project. We could also create an entirely new class library just for this purpose, too.   
So, the `GenerateCode()` method implementation is: 

protected override byte[] GenerateCode( string inputFileName, string inputFileContent ) { string code = ""; try { // Process the file. CodeNamespace ns = Processor.Process( inputFileName, FileNameSpace ); // Generate code for it. CodeGeneratorOptions opt = new CodeGeneratorOptions(); opt.BracingStyle = "C"; StringWriter sw = new StringWriter(); GetCodeWriter().GenerateCodeFromNamespace( ns, sw, opt ); // Finaly assign it to the result to return. code = sw.ToString(); } catch( Exception e ) { code = String.Format( "#error Couldn't generate code!\n/*\n{0}\n*/", e ); } // Convert to bytes. return System.Text.Encoding.ASCII.GetBytes( code ); } 

The new `Processor` class has almost the same code as the console app, but only generates the `CodeNamespace`, leaving the responsibility of generating the final source form to the caller. Note that the base class for the tool already provides access to the appropriate `ICodeGenerator` instance we mentioned, through the `GetCodeWriter()` method. We can also access the `Custom Tool Namespace` property that appears in the `Property Browser` for a file, through the `FileNameSpace` property. 

We’re done with the tool now. We can start using it right away by associating the `XsdCodeGen` custom tool with any WXS file. Note that VS.NET locks the assembly when the tool is run for the first time. Should we want to keep modifying it and re-compiling, we will have to restart the IDE.

Extensions for codegen can be easily created to leverage the tool, simply by placing the extension assembly next to the custom tool installation folder, and adding the extension to the schema as follows:

`
    
    
         
             
            
            
            
          
        
      

`

You'll need those extensions in order to modify the default output that matches the xsd.exe one. Enjoy!

posted [Friday, May 14, 2004 11:05 AM](http://clariusconsulting.net/blogs/kzu/archive/2004/05/14/XsdCodeGenTool.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [2 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/05/14/XsdCodeGenTool.aspx#comments)

  

[![](/web/20060502132112im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
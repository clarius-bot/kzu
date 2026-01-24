---
layout: post
title: "Daniel Cazzulino's Blog - Configuration with XmlSerializer + codegen (i.e. xsd.exe): how &quot;fix&quot; PascalCase to camelCase for the XML"
date: 2004-05-10 00:00:00 +0000
---

## Configuration with XmlSerializer + codegen (i.e. xsd.exe): how &quot;fix&quot; PascalCase to camelCase for the XML 

Most people (including myself, as you may have noticed from [my previous post on XmlSerializer-based configuration](http://weblogs.asp.net/cazzu/archive/2004/01/23/62141.aspx)) believe an automated XSD->Classes->XmlSerializer config section handler is the optimum approach for dealing with configuration in .NET. You basically start definining your configuration in an XML Schema, then use xsd.exe or another even more cool approach, and finally get XmlSerializer-ready classes for it. Loading configuration afterwards is just a matter of deserializing it. Cool right?

Well, no matter how hard I try, the following sample config looks just awful to me (and believe me, I've created many like this one):
    
    
    <SampleConfig>
      <MySetting Type="TheType, TheAssembly">
        <Enabled>True</Enabled>
        <MakeItFast>True</MakeItFast>
      </MySetting>
    </SampleConfig>

And you know XAML goes the same route, using .NET naming convensions for elements and attributes...   
Well, not only this looks pretty ugly (IMO) to any XML geek, but it also sort of unveils you're using `XmlSerializer` for loading it, and for some guys, this may seem like a less professional approach to configuration (don't ask me why). Learning yet another codegen tool just to overcome this "minor" casing issue sounded overkill for me. On the other hand, I didn't want to write all my configuration loading by hand anymore, specially once I got used to the incredibly fast refactoring that is enabled by the combination of XSD->CodeGen->XmlSerialier: all refactorings in the schema reflect on the classes, and you get inmediate compile-time errors in the code depending on old element names, or now inexistent or relocated elements. This is crucial for evolution.

Another aspect the XmlSerializer-based approach enables is a full programmatic typed configuration API you can use to write changes back to the file. And you don't have to write almost any code! Summarizing, the benefits are: straightforward loading and storing back. MAIN drawback: you have to use the XML-ugly .NET casing. Don't you?

Well, I decided I wanted the best of both worlds, as usual. I wanted camelCase-style elements and attributes, but XmlSerializer-based configuration loading and saving. And I definitely didn't want to write/use yet another codegen extension/tool to do the dirty job of adding all those XML serialization attributes to account for this "little" issue of casing.

So the answer is pretty simple once you know it: write a custom reader that turns the first letter into uppercase as it reads, and a custom writer that turns it back to lower upon saving it back. What's more, the reader should be based on the `XmlTextReader` so I can still layer the `XmlValidatingReader` once the "case normalization" happened, so the on-the-fly-PascalCased document is valid against the schema.

With the two new classes, `XmlFirstUpperReader` and `XmlFirstLowerWriter`, you read and write back XML files with the camelCase style, while having the XSD schema and the generated classes believe you have the proper PascalCase source/destination. So you can turn the previous config file into the nicer format:
    
    
    <sampleConfig>
      <mySetting type="TheType, TheAssembly">
        <enabled>True</enabled>
        <makeItFast>True</makeItFast>
      </mySetting>
    </sampleConfig>

Without changing your classes or schema. The trick is done when you pass the source for deserialization:

XmlFirstUpperReader fr = new XmlFirstUpperReader(config); // You should always validate your config at least with XSD XmlValidatingReader vr = new XmlValidatingReader(fr); // Add the PascalCased XSD. vr.Schemas.Add(theSchema); XmlSerializer ser = new XmlSerializer(typeof(MySetting)); MySetting settings = (MySetting) ser.Deserialize(vr);

After modifying the settings class, you can save it back into the file with the proper camelCase by using the custom writer:

MySettings settings = (MySetting) ser.Deserialize(vr); // Modify the settings at will. XmlFirstLowerWriter fw = new XmlFirstLowerWriter( new XmlTextWriter(config)); ser.Serialize(fw, settings);

Pretty straightforward, right?

## Implementation

This time, I didn't ["cheat" the `XmlTextReader`](http://www.tkachenko.com/blog/archives/000227.html), but directly used it by inheriting it like any decent OO citizen, and overriding the members I needed to change. It turned out to be a little more work than I thought because I had to use the base reader `XmlNameTable` everywhere, or the XSD validation would stop working and values would be lost somehow. The ` XmlFirstUpperReader `has a private method that turns a name into uppercase, and adds it to the `NameTable` before returning. This method uses the optimal "algorithm" discussed in [my previous post](http://weblogs.asp.net/cazzu/archive/2004/01/09/48987.aspx):

public class XmlFirstUpperReader : XmlTextReader { #region Support all XmlTextReader ctors ...etc... #endregion Support all XmlTextReader ctors #region Private methods private string MakeFirstUpper(string name) { // Don't process empty strings. if (name.Length == 0) return name; // If the first is already upper, don't process. if (Char.IsUpper(name[0])) return name; // If there's just one char, make it lower directly. if (name.Length == 1) return name.ToUpper(); // Finally, modify and create a string. Char[] letters = name.ToCharArray(); letters[0] = Char.ToUpper(letters[0]); return NameTable.Add(new string(letters)); } ...

The `XmlFirstLowerWriter` implements the opposite operation:

public class XmlFirstLowerWriter : XmlWriter { internal static string MakeFirstLower(string name) { // Don't process empty strings. if (name.Length == 0) return name; // If the first is already lower, don't process. if (Char.IsLower(name[0])) return name; // If there's just one char, make it lower directly. if (name.Length == 1) return name.ToLower(); // Finally, modify and create a string. Char[] letters = name.ToCharArray(); letters[0] = Char.ToLower(letters[0]); return new string(letters); } ...

This last method is made internal and static because it doesn't depend on an `XmlNameTable` instance, and because it must be used by the reader in some places, as explained next. Note that both only modify the string if it's actually necessary.

The `XmlTextReader` properties that need to be overriden are: 

  * `this (indexer)`: this property is used to access attributes of the current element by name. Client code as well as the validating reader (based on the schema) will expect to access attributes by their PascalCase name. So, I need to ensure the name is camelCased before the access occurs: public override string this[string name, string namespaceURI] { get { return base[ NameTable.Add(XmlFirstLowerWriter.MakeFirstLower(name)), namespaceURI]; } }
  * `LocalName`: this property needs to be properly capitalized only for elements and attributes (you don't want to get the <? xml ?> directive changed!), but only if they are not namespace declarations: public override string LocalName { get { // Capitalize elements and attributes. if ( base.NodeType == XmlNodeType.Element   * `Name`: this property returns the qualified name of the element. That is, it can contain a prefix plus the name. The former needs to remain the same, while the later is capitalized. In addition, for namespace declaration, it returns the prefix, which we don't want to capitalize.: public override string Name { get { // Again, if this is a NS declaration, pass as-is. if (base.NamespaceURI == XmlNamespaces.XmlNs) return base.Name; // If there's no prefix, capitalize it directly. if (base.Name.IndexOf(":") == -1) return MakeFirstUpper(base.Name); else { // Turn local name into upper, not the prefix. string name = base.Name.Substring(0, base.Name.IndexOf(":") + 1); name += MakeFirstUpper(base.Name.Substring(base.Name.IndexOf(":") + 1)); return NameTable.Add(name); } } }

On the methods side, there's only one to override:

  * `MoveToAttribute()`: movement must be done using the lower cased name, as the underlying XML uses this "version": public override bool MoveToAttribute(string name, string ns) { return base.MoveToAttribute( NameTable.Add(XmlFirstLowerWriter.MakeFirstLower(name)), ns); }

The `XmlFirstLowerWriter` implementation, in turn, is based on the `XmlTextWriter` one, overrides just `WriteQualifiedName`, `WriteStartAttribute` and `WriteStartElement`. All three methods a `localName` parameter which is turned into camelCase by a call to the `MakeFirstLower` method shown above.

The full [Mvp.Xml project](http://sf.net/projects/mvp-xml) source code can be downloaded from [ SourceForge](http://prdownloads.sourceforge.net/mvp-xml/Mvp.Xml.zip?download).

Enjoy and please give us feedback on the project!

+ As usual, the full code to copy-paste if you want to (remember to split in two files). #region using using System; using System.IO; using System.Xml; #endregion using namespace Mvp.Xml { /// /// Implements an that turns the /// first letter of incoming elements and attributes into uppercase. /// /// /// To be used in conjunction with for /// serialization. /// public class XmlFirstUpperReader : XmlTextReader { #region Ctors /// /// See constructor overloads. /// public XmlFirstUpperReader(Stream input) : base(input) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(TextReader input) : base(input) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url) : base(url) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(Stream input, XmlNameTable nt) : base(input, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(TextReader input, XmlNameTable nt) : base(input, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, Stream input) : base(url, input) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, TextReader input) : base(url, input) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, XmlNameTable nt) : base(url, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(Stream xmlFragment, XmlNodeType fragType, XmlParserContext context) : base(xmlFragment, fragType, context) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, Stream input, XmlNameTable nt) : base(url, input, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string url, TextReader input, XmlNameTable nt) : base(url, input, nt) {} /// /// See constructor overloads. /// public XmlFirstUpperReader(string xmlFragment, XmlNodeType fragType, XmlParserContext context) : base(xmlFragment, fragType, context) {} #endregion Ctors #region Private methods private string MakeFirstUpper(string name) { // Don't process empty strings. if (name.Length == 0) return name; // If the first is already upper, don't process. if (Char.IsUpper(name[0])) return name; // If there's just one char, make it lower directly. if (name.Length == 1) return name.ToUpper(); // Finally, modify and create a string. Char[] letters = name.ToCharArray(); letters[0] = Char.ToUpper(letters[0]); return NameTable.Add(new string(letters)); } #endregion Private methods #region Properties /// See public override string this[string name, string namespaceURI] { get { return base[ NameTable.Add(XmlFirstLowerWriter.MakeFirstLower(name)), namespaceURI]; } } /// See public override string this[string name] { get { return this[name, String.Empty]; } } /// See public override string LocalName { get { // Capitalize elements and attributes. if ( base.NodeType == XmlNodeType.Element 
/kzu

---
layout: post
title: "Daniel Cazzulino : XPathNavigatorReader: reading, validating and serializing! (XmlReader/XmlTextReader over XPathNavigator)"
date: 2004-04-19 00:00:00 +0000
---

Daniel Cazzulino : XPathNavigatorReader: reading, validating and serializing! (XmlReader/XmlTextReader over XPathNavigator)


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * 

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2100'\))| November 2005| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2161'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2004/4/2.aspx "1 Post")| 3| 4| 5  
6| 7| 8| 9| 10| 11| 12  
[13](http://clariusconsulting.net/blogs/kzu/archive/2004/4/13.aspx "2 Posts")| [14](http://clariusconsulting.net/blogs/kzu/archive/2004/4/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/4/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/4/16.aspx "3 Posts")| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/4/19.aspx "2 Posts")  
20| 21| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/4/23.aspx "1 Post")| 24| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/4/25.aspx "1 Post")| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/4/26.aspx "2 Posts")  
27| 28| 29| 30| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
  

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## XPathNavigatorReader: reading, validating and serializing! (XmlReader/XmlTextReader over XPathNavigator) 

There are many reasons why developers don't use the `XPathDocument` and `XPathNavigator` APIs and resort to `XmlDocument` instead. I outlined some of them with regards to querying functionality in my posts about [how to take advantage of XPath expression precompilation](http://weblogs.asp.net/cazzu/archive/2003/10/07/30888.aspx), and [How to get an XmlNodeList from an XPathNodeIterator (reloaded)](http://weblogs.asp.net/cazzu/archive/2004/04/14/113479.aspx). 

`XPathNavigator` is a far superior way of accessing and querying data because it offers built-in support for XPath querying independently of the store, which automatically gain the feature and more importantly, because it abstracts the underlying store mechanism, which allows multiple data formats to be accessed consistently. The XML WebData team has seriously optimized the internal storage of `XPathDocument`, which results in important improvents both in loading time and memory footprint, as well as general performance. This was possible because the underlying store is completely hidden from the developer behind the `XPathNavigator` class, therefore, even the most drastic change in internal representation does not affect current applications.

However, some useful features of the `XmlDocument` and `XmlReader` classes are not available. Basically, I've created an `XmlReader` facade over the `XPathNavigator` class, which allows you to work against either an streaming or a cursor API. I'll discuss how the missing features are enabled by the use of the new `XPathNavigatorReader` class, part of the opensource [Mvp.Xml project](http://sf.net/projects/mvp-xml). 

Examples use an XML document with the structure of the Pubs database.

## Serialization as XML

Both the `XmlDocument` (more properly, the `XmlNode`) the and `XmlReader` offer built-in support to get a raw string representing the entire content of any node. `XmlNode` exposes `InnerXml` and `OuterXml` properties, whereas the `XmlReader` offers `ReadInnerXml` and `ReadOuterXml` methods.

Once you go the `XPathDocument` route, however, you completely loss this feature. The new `XPathNavigatorReader` is an `XmlReader` implementation over an `XPathNavigator`, thus providing the aforementioned `ReadInnerXml` and `ReadOuterXml` methods. Basically, you work with the `XPathNavigator` object, and at the point you need to serialize it as XML, you simply construct this new reader over it, and use it as you would with any `XmlReader`:

XPathDocument doc = new XPathDocument(input);  
XPathNavigator nav = doc.CreateNavigator();  
// Move navigator, select with XPath, whatever.  
  
XmlReader reader = new XPathNavigatorReader(nav);  
// Initialize it.  
if (reader.Read())  
{  
Console.WriteLine(reader.ReadOuterXml());  
// We can also use reader.ReadInnerXml();  
}

Another useful scenario is directly writing a fragment of the document by means of the `XmlWriter.WriteNode` method:

// Will select the title id.  
XPathExpression idexpr = navigator.Compile("string(title_id/text())");  
  
XPathNodeIterator it = navigator.Select("//titles[price > 10]");  
while (it.MoveNext())  
{  
XmlReader reader = new XPathNavigatorReader(it.Current);  
  
// Save to a file with the title ID as the name.  
XmlTextWriter tw = new XmlTextWriter(  
(string) it.Current.Evaluate(idexpr) + ".xml",   
System.Text.Encoding.UTF8);  
  
// Dump it!  
writer.WriteNode(reader, false);  
writer.Close();  
}

This code saves each book with a price bigger than 10 to a file named after the title id. You can note that the reader works in the scope defined by the navigator passed to its constructor, effectively providing a view over a fragment of the entire document. It's also important to observe that even when an evaluation will cause a cursor movement to the navigator in `it.Current`, the reader we're using will not be affected, as the constructor clones it up-front. Also, note that it's always a good idea to precompile an expression that is going to be executed repeatedly (ideally, application-wide).

### XmlSerializer-ready

The reader implements IXmlSerializable, so you can directly return it from WebServices for example. You could have a web service returning the result of an XPath query without resorting to hacks like loading `XmlDocument` s or returning an XML string that will be escaped. XPathDocument is not XML-serializable either. Now you can simply use code like the following:

[WebMethod]  
public XPathNavigatorReader GetData()  
{  
XPathDocument doc = GetDocument();  
XPathNodeIterator it = doc.CreateNavigator().Select("//titles[title_id='BU2075']");  
if (it.MoveNext())  
return new XPathNavigatorReader(it.Current);  
  
return null;  
}

This web service response will be:

``
    
    
    <XPathNavigatorReader>  
     <titles>  
     <title_id>BU2075</title_id>  
     <title>You Can Combat Computer Stress!</title>  
     <type>business </type>  
     <pub_id>0736</pub_id>  
     <price>2.99</price>  
     <advance>10125</advance>  
     <royalty>24</royalty>  
     <ytd_sales>18722</ytd_sales>  
     <notes>The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.</notes>  
     <pubdate>1991-06-30T00:00:00.0000000-03:00</pubdate>  
     </titles>  
    </XPathNavigatorReader>  
    

## XML Schema Validation

Imagine the following scenario: you are processing a document, where only certain elements and their content need to be validated against an XML Schema, such as the contents of an element inside a `soap:Body`. If you're working with an `XmlDocument`, a known bug in `XmlValidatingReader` prevents you from doing the following: 

XmlDocument doc = GetDocument(); // Get the doc somehow.  
XmlNode node = doc.SelectSingleNode("//titles[title_id='BU2075']");  
// Create a validating reader for XSD validation.  
XmlValidatingReader vr = new XmlValidatingReader(new XmlNodeReader(node));

The validating reader will throw an exception because it expects an instance of an `XmlTextReader` object. This will be fixed in Whidbey, but no luck for v1.x. You're forced to do this: 

XmlDocument doc = GetDocument(); // Get the doc somehow.  
XmlNode node = doc.SelectSingleNode("//titles[title_id='BU2075']");  
  
// Build the reader directly from the XML string taken through OuterXml.  
XmlValidatingReader vr = new XmlValidatingReader(  
new XmlTextReader(new StringReader(node.OuterXml)));

Of course, you're paying the parsing cost twice here. The `XPathNavigatorReader`, unlike the `XmlNodeReader`, derives directly from `XmlTextReader`, therefore, it fully supports fragment validation. You can validate against XML Schemas that only define the node where you're standing. The following code validates all expensive books with a narrow schema, instead of a full-blown Pubs schema:

XmlSchema sch = XmlSchema.Read(expensiveBooksSchemaLocation, null);  
// Select expensive books.  
XPathNodeIterator it = navigator.Select("//titles[price > 10]");  
while (it.MoveNext())  
{  
// Create a validating reader over an XPathNavigatorReader for the current node.  
XmlValidatingReader vr = new XmlValidatingReader(new XPathNavigatorReader(it.Current));  
  
// Add the schema for the current node.  
vr.Schemas.Add(sch);  
  
// Validate it!  
while (vr.Read()) {}  
}

This opens the possiblity for modular validation of documents, which is specially useful when you have generic XML processing layers that validate selectively depending on namespaces, for example. What's more, this feature really starts making the XPathDocument/XPathNavigator combination a more feature-complete option to `XmlDocument` when you only need read-only access to the document.

+ Implementation details. Expand only if you care to know a couple tricks I did ;) 

## Implementation Goodies

If you wonder how did I implement it from `XmlTextReader` instead of ` XmlReader` , read on. If you just want to go straight to downloading and using it, you can safely skip this section. 

Even in the face of the `XmlValidatingReader` bug, I found a workaround that works great. Luckily, the `XmlTextReader` is not a sealed class, so intead of inheriting from `XmlReader`, I inherited from it. I basically cheat it at construction time, passing an empty string to it:

public class XPathNavigatorReader : XmlTextReader { public XPathNavigatorReader(XPathNavigator navigator) : base(new StringReader(String.Empty)) ...

Next, I override all the methods which are abstract on the base `XmlReader`, basically replacing all the functionality from the `XmlTextReader`. Next, I also replaced the functionality of `ReadInnerXml` and `ReadOuterXml` methods, which are new from the `XmlTextReader`:

public override string ReadInnerXml() { if (this.Read()) return Serialize(); return String.Empty; } public override string ReadOuterXml() { if (_state != ReadState.Interactive) return String.Empty; return Serialize(); }

They are both passthrough methods to the `Serialize` one that performs actual writing. I think you will be surprised by the following snippet. There's no interesting or complex code here, and I basically use the same node writing feature I explained above:

private string Serialize() { StringWriter sw = new StringWriter(); XmlTextWriter tw = new XmlTextWriter(sw); tw.WriteNode(this, false); sw.Flush(); return sw.ToString(); }

This is a benefit of having a 100% reader implementation.   
Another interesting thing in the implementation is that the `XPathNavigator` class provides separate handling of namespace attributes and regular ones (`GetAttribute` and `GetNamespace`), unlike the `XmlReader`, which exposes both simply as attributes. The reader `MoveToFirstAttribute` method checks for both cases, moving either to the first regular attribute or the namespace one:

public override bool MoveToFirstAttribute() { if (_isendelement) return false; bool moved = _navigator.MoveToFirstAttribute(); if (!moved) moved = _navigator.MoveToFirstNamespace(XPathNamespaceScope.Local); if (moved) { // Escape faked text node for attribute value. if (_attributevalueread) _depth--; // Reset attribute value read flag. _attributevalueread = false; } return moved; }

The same work is done in the `MoveToNextAttribute`:

public override bool MoveToNextAttribute() { bool moved = false; if (_navigator.NodeType == XPathNodeType.Attribute) { moved = _navigator.MoveToNextAttribute(); if (!moved) { // We ended regular attributes. Start with namespaces if appropriate. _navigator.MoveToParent(); moved = _navigator.MoveToFirstNamespace(XPathNamespaceScope.Local); } } else if (_navigator.NodeType == XPathNodeType.Namespace) { moved = _navigator.MoveToNextNamespace(XPathNamespaceScope.Local); } if (moved) { // Escape faked text node for attribute value. if (_attributevalueread) _depth--; // Reset attribute value read flag. _attributevalueread = false; } return moved; }

I also take into account that the `ReadAttributeValue` method call causes a reader to be moved into the attribute value, where the current node type becomes Text usually (there's also the `Entity` resolution and references stuff). The documentation for the `XmlReader.ReadAttributeValue` method states that the depth is incremented, so I take into account that too. This is basically a matter of setting a flag:

public override bool ReadAttributeValue() { // If this method hasn't been called yet for the attribute. if (!_attributevalueread && (_navigator.NodeType == XPathNodeType.Attribute || _navigator.NodeType == XPathNodeType.Namespace)) { _attributevalueread = true; _depth++; return true; } return false; } bool _attributevalueread = false;

I came across the need to implement this when I used the `XmlWriter.WriteNode` method, which uses it intensively. I studied both the `XmlValidatingReader` and `XmlTextWriter` usage of the underlying `XmlReader`, by creating an `XmlTextReader` descendant that basically logs calls to its methods (yup, I could have used DevPartner Profiler, or any other profiles, I know...), which gave me the following picture on what's used by each:

XmlReader methods  
|  Called by XmlValidatingReader  
|  Called by XmlTextWriter  
  
---|---|---  
AttributeCount  
| AttributeCount  
| AttributeCount  
  
BaseURI  
| BaseURI  
| BaseURI  
  
Close  
|   
|   
  
Depth  
| Depth  
| Depth  
  
EOF  
| EOF  
| EOF  
  
GetAttribute  
|   
|   
  
HasValue  
|   
|   
  
IsDefault  
| IsDefault  
| IsDefault  
  
IsEmptyElement  
| IsEmptyElement  
| IsEmptyElement  
  
Item  
|   
|   
  
LocalName  
| LocalName  
| LocalName  
  
LookupNamespace  
|   
|   
  
MoveToAttribute  
| MoveToAttribute(int)  
| MoveToAttribute(int)  
  
MoveToElement  
| MoveToElement  
| MoveToElement  
  
MoveToFirstAttribute  
| MoveToFirstAttribute  
| MoveToFirstAttribute  
  
MoveToNextAttribute  
| MoveToNextAttribute  
| MoveToNextAttribute  
  
Name  
| Name  
| Name  
  
NamespaceURI  
| NamespaceURI  
| NamespaceURI  
  
NameTable  
| NameTable  
| NameTable  
  
NodeType  
| NodeType  
| NodeType  
  
Prefix  
| Prefix  
| Prefix  
  
QuoteChar  
| QuoteChar  
| QuoteChar  
  
Read  
| Read  
| Read  
  
ReadAttributeValue  
|   
| ReadAttributeValue  
  
ReadState  
| ReadState  
| ReadState  
  
ResolveEntity  
|   
|   
  
Value  
| Value  
| Value  
  
XmlLang  
| XmlLang  
| XmlLang  
  
XmlSpace  
| XmlSpace  
| XmlSpace  
  
  
There's some interesting information here! For example, neither class uses the ` XmlReader.HasValue` property, or the `GetAttribute` or indexer (`Item`) to access attributes. Mostly, access to attributes is done either by calling `MoveToFirstAttribute/MoveToNextAttribute` or by gettting the `AttributeCount` and later using `MoveToAttribute(int index)` for each, something like:

for (int i = 0; i < reader.AttributeCount; i++) { reader.MoveToAttribute(i); // Do something with it. }

I've seen other attempts at this issue (both for `XPathNavigatorReader` and `NavigatorReader` classes) that basically iterate attributes each time `AttributeCount` is retrieved, and do the same until the desired index is reached in `MoveToAttribute(i)`, by calling `MoveToNextAttribute()` repeatedly. From the table above, I could see that was a pretty bad idea. Therefore, I store in an `ArrayList` (therefore accessible by index) the name and namespace of each attribute of the current node, cache it and return its length. When the `MoveToAttribute(i)` is executed, I retrieve he name/namespace combination through the list for the index specified, and simply call the `MoveToAttribute` native method in the navigator with these parameters. I think this is better, although I haven't measured the difference.

As a final word on the implementation: I reviewed Aaron Skonnard attempt at this feature, but I discarded it because it's XmlReader-based, didn't handle attribute/namespace attribute manipulation the way I expected, etc. So I decided to just start from scratch. If you look at his and my code, you'll see they're quite different. I recall Don Box did something too, but `XmlReader`-based too.. 

+ As usual, if you just want the full class code to copy-paste on your project, here it is. I strongly encourage you to take a look at the Mvp.Xml project, as there're other cool goodies there! using System; using System.Collections; using System.Collections.Specialized; using System.IO; using System.Xml; using System.Xml.Serialization; using System.Xml.XPath; namespace Mvp.Xml.XPath { /// <summary> /// Provides an <see cref="XmlReader"/> over an /// <see cref="XPathNavigator"/>. /// </summary> /// <remarks> /// Reader is positioned at the current navigator position. Reading /// it completely is similar to querying for the <see cref="XmlNode.OuterXml"/> /// property. /// <para>The navigator is cloned at construction time to avoid side-effects /// in calling code.</para> /// <para>Author: Daniel Cazzulino, kzu@aspnet2.com</para> /// <para>See: http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx</para> /// </remarks> public class XPathNavigatorReader : XmlTextReader, IXmlSerializable { #region Fields // Cursor that will be moved by the reader methods. XPathNavigator _navigator; // Cursor remaining in the original position, to determine EOF. XPathNavigator _original; // Will track whether we're at a faked end element bool _isendelement = false; #endregion Fields #region Ctor /// <summary> /// Parameterless constructor for XML serialization. /// </summary> /// <remarks>Supports the .NET serialization infrastructure. Don't use this /// constructor in your regular application.</remarks> [System.ComponentModel.EditorBrowsable(System.ComponentModel.EditorBrowsableState.Never)] public XPathNavigatorReader() { } /// <summary> /// Initializes the reader. /// </summary> /// <param name="navigator">The navigator to expose as a reader.</param> public XPathNavigatorReader(XPathNavigator navigator) : base(new StringReader(String.Empty)) { _navigator = navigator.Clone(); _original = navigator.Clone(); } #endregion Ctor #region Private members /// <summary> /// Retrieves and caches node positions and their name/ns /// </summary> private ArrayList OrderedAttributes { get { // List contains the following values: string[] { name, namespaceURI } if (_orderedattributes != null) return _orderedattributes; // Cache attributes position and names. // We do this because when an attribute is accessed by index, it's // because of a usage pattern using a for loop as follows: // for (int i = 0; i < reader.AttributeCount; i++) // Console.WriteLine(reader[i]); // Init list. _orderedattributes = new ArrayList(); // Return empty list for end elements. if (_isendelement) return _orderedattributes; // Add all regular attributes. if (_navigator.HasAttributes) { XPathNavigator attrnav = _navigator.Clone(); _orderedattributes = new ArrayList(); if (attrnav.MoveToFirstAttribute()) { _orderedattributes.Add(new string[] { attrnav.LocalName, attrnav.NamespaceURI }); while (attrnav.MoveToNextAttribute()) { _orderedattributes.Add(new string[] { attrnav.LocalName, attrnav.NamespaceURI }); } } } // Add all namespace attributes declared at the current node. XPathNavigator nsnav = _navigator.Clone(); if (nsnav.MoveToFirstNamespace(XPathNamespaceScope.Local)) { _orderedattributes.Add(new string[] { nsnav.LocalName, XmlNamespaces.XmlNs }); while (nsnav.MoveToNextNamespace(XPathNamespaceScope.Local)) { _orderedattributes.Add(new string[] { nsnav.LocalName, XmlNamespaces.XmlNs }); } } return _orderedattributes; } } ArrayList _orderedattributes; /// <summary> /// Returns the XML representation of the current node and all its children. /// </summary> private string Serialize() { StringWriter sw = new StringWriter(); XmlTextWriter tw = new XmlTextWriter(sw); tw.WriteNode(this, false); sw.Flush(); return sw.ToString(); } #endregion Private members #region Properties /// <summary>See <see cref="XmlReader.AttributeCount"/></summary> public override int AttributeCount { get { // When the user requests the attribute count, it's usually to // use a for iteration pattern for accessing attributes. Therefore, // we force loading the attributes positions to prepare for // indexed access to them. This is done in the OrderedAttributes getter. return OrderedAttributes.Count; } } /// <summary>See <see cref="XmlReader.BaseURI"/></summary> public override string BaseURI { get { return _navigator.BaseURI; } } /// <summary>See <see cref="XmlReader.Depth"/></summary> public override int Depth { get { return _depth; } } int _depth = 0; /// <summary>See <see cref="XmlReader.EOF"/></summary> public override bool EOF { get { return _eof; } } bool _eof = false; /// <summary>See <see cref="XmlReader.HasValue"/></summary> public override bool HasValue { get { return ( _navigator.NodeType == XPathNodeType.Namespace || _navigator.NodeType == XPathNodeType.Attribute || _navigator.NodeType == XPathNodeType.Comment || _navigator.NodeType == XPathNodeType.ProcessingInstruction || _navigator.NodeType == XPathNodeType.SignificantWhitespace || _navigator.NodeType == XPathNodeType.Text || _navigator.NodeType == XPathNodeType.Whitespace); } } /// <summary>See <see cref="XmlReader.IsDefault"/></summary> public override bool IsDefault { get { return false; } } /// <summary>See <see cref="XmlReader.IsDefault"/></summary> public override bool IsEmptyElement { get { return _navigator.IsEmptyElement; } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[string name, string namespaceURI] { get { // Attribute requested may be a namespaces prefix mapping. if (namespaceURI == XmlNamespaces.XmlNs) { return _navigator.GetNamespace(name); } else { return _navigator.GetAttribute(name, namespaceURI); } } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[string name] { get { return this[name, String.Empty]; } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[int i] { get { // List contains the following values: string[] { name, namespaceURI } string[] values = (string[]) OrderedAttributes[i]; return this[values[0], values[1]]; } } /// <summary>See <see cref="XmlReader.LocalName"/></summary> public override string LocalName { get { return _navigator.LocalName; } } /// <summary>See <see cref="XmlReader.Name"/></summary> public override string Name { get { return _navigator.Name; } } /// <summary>See <see cref="XmlReader.NamespaceURI"/></summary> public override string NamespaceURI { get { return _navigator.NodeType == XPathNodeType.Namespace ? XmlNamespaces.XmlNs : _navigator.NamespaceURI; } } /// <summary>See <see cref="XmlReader.NameTable"/></summary> public override XmlNameTable NameTable { get { return _navigator.NameTable; } } /// <summary>See <see cref="XmlReader.NodeType"/></summary> public override XmlNodeType NodeType { get { // Special states. if (_state != ReadState.Interactive) return XmlNodeType.None; if (_isendelement) return XmlNodeType.EndElement; if (_attributevalueread) return XmlNodeType.Text; switch(_navigator.NodeType) { case XPathNodeType.Attribute: // Namespaces are exposed by the XmlReader as attributes too. case XPathNodeType.Namespace: return XmlNodeType.Attribute; case XPathNodeType.Comment: return XmlNodeType.Comment; case XPathNodeType.Element: return XmlNodeType.Element; case XPathNodeType.ProcessingInstruction: return XmlNodeType.ProcessingInstruction; case XPathNodeType.Root: return XmlNodeType.Document; case XPathNodeType.SignificantWhitespace: return XmlNodeType.SignificantWhitespace; case XPathNodeType.Text: return XmlNodeType.Text; case XPathNodeType.Whitespace: return XmlNodeType.Whitespace; default: return XmlNodeType.None; } } } /// <summary>See <see cref="XmlReader.Prefix"/></summary> public override string Prefix { get { return _navigator.Prefix; } } /// <summary>See <see cref="XmlReader.QuoteChar"/></summary> public override char QuoteChar { get { return '"'; } } /// <summary>See <see cref="XmlReader.ReadState"/></summary> public override ReadState ReadState { get { return _state; } } ReadState _state = ReadState.Initial; /// <summary>See <see cref="XmlReader.Value"/></summary> public override string Value { get { return HasValue ? _navigator.Value : String.Empty; } } /// <summary>See <see cref="XmlReader.XmlLang"/></summary> public override string XmlLang { get { return _navigator.XmlLang; } } /// <summary>See <see cref="XmlReader.XmlSpace"/></summary> public override XmlSpace XmlSpace { get { return XmlSpace.Default; } } #endregion Properties #region Methods /// <summary>See <see cref="XmlReader.Close"/></summary> public override void Close() { _state = ReadState.Closed; _eof = true; } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(string name, string namespaceURI) { return this[name, namespaceURI]; } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(string name) { return this[name]; } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(int i) { return this[i]; } /// <summary>See <see cref="XmlReader.LookupNamespace"/></summary> public override string LookupNamespace(string prefix) { return _navigator.GetNamespace(prefix); } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override bool MoveToAttribute(string name, string ns) { return _navigator.MoveToAttribute(name, ns); } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override bool MoveToAttribute(string name) { return MoveToAttribute(name, String.Empty); } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override void MoveToAttribute(int i) { string[] values = (string[]) OrderedAttributes[i]; MoveToAttribute(values[0], values[1]); } /// <summary>See <see cref="XmlReader.MoveToElement"/></summary> public override bool MoveToElement() { if (_navigator.NodeType == XPathNodeType.Attribute || _navigator.NodeType == XPathNodeType.Namespace) { _navigator.MoveToParent(); // Escape faked text node for attribute value. if (_attributevalueread) _depth--; _attributevalueread = false; return true; } return false; } /// <summary>See <see cref="XmlReader.MoveToFirstAttribute"/></summary> public override bool MoveToFirstAttribute() { if (_isendelement) return false; bool moved = _navigator.MoveToFirstAttribute(); if (!moved) moved = _navigator.MoveToFirstNamespace(XPathNamespaceScope.Local); if (moved) { // Escape faked text node for attribute value. if (_attributevalueread) _depth--; // Reset attribute value read flag. _attributevalueread = false; } return moved; } /// <summary>See <see cref="XmlReader.MoveToNextAttribute"/></summary> public override bool MoveToNextAttribute() { bool moved = false; if (_navigator.NodeType == XPathNodeType.Attribute) { moved = _navigator.MoveToNextAttribute(); if (!moved) { // We ended regular attributes. Start with namespaces if appropriate. _navigator.MoveToParent(); moved = _navigator.MoveToFirstNamespace(XPathNamespaceScope.Local); } } else if (_navigator.NodeType == XPathNodeType.Namespace) { moved = _navigator.MoveToNextNamespace(XPathNamespaceScope.Local); } if (moved) { // Escape faked text node for attribute value. if (_attributevalueread) _depth--; // Reset attribute value read flag. _attributevalueread = false; } return moved; } /// <summary>See <see cref="XmlReader.Read"/></summary> public override bool Read() { // Return fast if state is no appropriate. if (_state == ReadState.Closed || _state == ReadState.EndOfFile) return false; if (_state == ReadState.Initial) { _state = ReadState.Interactive; if (_navigator.NodeType == XPathNodeType.Root) { // Sync to the real first node. _original.MoveToFirstChild(); return _navigator.MoveToFirstChild(); } return true; } // Reset temp state. _orderedattributes = null; // Reading attribute values causes movement to faked Text node. if (_attributevalueread) _depth--; // Reset the flag afterwards. _attributevalueread = false; // Reposition if we moved to attributes. if (_navigator.NodeType == XPathNodeType.Attribute || _navigator.NodeType == XPathNodeType.Namespace) _navigator.MoveToParent(); if (_isendelement) { // If we're at the same position we started, it's eof; if (_navigator.IsSamePosition(_original)) { _eof = true; _state = ReadState.EndOfFile; return false; } // If we're at the faked end element, move to next sibling. if (_navigator.MoveToNext()) { _isendelement = false; return true; } else { // Otherwise, move to the parent and set as the // end element of it (we already read all children therefore). _navigator.MoveToParent(); _depth--; // _isendelement remains true. return true; } } else if (_navigator.HasChildren) { _depth++; // Move to child node. return _navigator.MoveToFirstChild(); } else { // Otherwise, try to move to sibling. if (_navigator.MoveToNext()) { return true; } else { // Otherwise, move to the parent and set as the // end element of it (we already read all children therefore). _navigator.MoveToParent(); _depth--; _isendelement = true; return true; } } } /// <summary>See <see cref="XmlReader.ReadAttributeValue"/></summary> public override bool ReadAttributeValue() { // If this method hasn't been called yet for the attribute. if (!_attributevalueread && (_navigator.NodeType == XPathNodeType.Attribute || _navigator.NodeType == XPathNodeType.Namespace)) { _attributevalueread = true; _depth++; return true; } return false; } bool _attributevalueread = false; /// <summary>See <see cref="XmlReader.ReadInnerXml"/></summary> public override string ReadInnerXml() { if (this.Read()) return Serialize(); return String.Empty; } /// <summary>See <see cref="XmlReader.ReadOuterXml"/></summary> public override string ReadOuterXml() { if (_state != ReadState.Interactive) return String.Empty; return Serialize(); } /// <summary>See <see cref="XmlReader.Read"/></summary> public override void ResolveEntity() { // Not supported. } #endregion Methods #region IXmlSerializable Members void IXmlSerializable.WriteXml(XmlWriter writer) { writer.WriteNode(this, false); } System.Xml.Schema.XmlSchema IXmlSerializable.GetSchema() { return null; } void IXmlSerializable.ReadXml(XmlReader reader) { XPathDocument doc = new XPathDocument(reader); _navigator = doc.CreateNavigator(); } #endregion } }

Finally, I imagine you could even think about loading an XmlDocument from an XPathNavigator using the XPathNavigatorReader... although can't think of any good reason why would you want to do such a thing :S...

The full project source code can be downloaded from [ SourceForge](http://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234) . 

Enjoy and please give us feedback on the project!

Special credits: the idea of a reader over a navigator isn't new. [Aaron Skonnard](http://skonnard.com/articles/199.aspx) did an implementation quite some time ago, as well as [Don Box](http://www.gotdotnet.com/team/dbox/default.aspx?month=2003-04) (you'll need to search the page for "XPathNavigatorReader". Mine is not based on theirs, and has features lacking on them, but they came first, that's for sure ;). 

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted on Monday, April 19, 2004 1:16 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

![](/web/20051126220018im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
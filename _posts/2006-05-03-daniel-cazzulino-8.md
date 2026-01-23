---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-03 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Monday, April 26, 2004 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| [2](http://clariusconsulting.net/blogs/kzu/archive/2004/4/2.aspx "1 Post")| 3| 4| 5| 6  
7| 8| 9| 10| 11| 12| [13](http://clariusconsulting.net/blogs/kzu/archive/2004/4/13.aspx "2 Posts")  
[14](http://clariusconsulting.net/blogs/kzu/archive/2004/4/14.aspx "1 Post")| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/4/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/4/16.aspx "3 Posts")| 17| 18| [19](http://clariusconsulting.net/blogs/kzu/archive/2004/4/19.aspx "2 Posts")| 20  
21| 22| [23](http://clariusconsulting.net/blogs/kzu/archive/2004/4/23.aspx "1 Post")| 24| [25](http://clariusconsulting.net/blogs/kzu/archive/2004/4/25.aspx "1 Post")| [26](http://clariusconsulting.net/blogs/kzu/archive/2004/4/26.aspx "2 Posts")| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060503165857im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Monday, April 26, 2004 - Posts

#####  [XmlReader/XmlTextReader from XPathNodeIterator - working with subsets of nodes](http://clariusconsulting.net/blogs/kzu/archive/2004/04/26/219.aspx)

As [ Dare](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=9a344a37-2e08-42b1-83c0-a85ae58826c6) noticed, this is the month of the XmlReader. Here's a new player: the XPathIteratorReader. This time, the scenario is the following: you have an XPathDocument or XPathNavigator, and need to get a reader containing a subset resulting from an XPath query. For example, you may need to return all feeds items from an XML file that contain a certain word in the title: 

public XmlReader GetFeedsContaining(string theWord)  
{  
  
XPathDocument doc = new XPathDocument(theFeed);  
XPathNodeIterator it = doc.CreateNavigator().Select(  
"/rss/channel/item[contains(title,'" + theWord + "')]");  
  
return new XPathIteratorReader(it);  
}

Just like the [ XmlFragmentStream](http://weblogs.asp.net/cazzu/archive/2004/04/23/119263.aspx), this reader fakes a root node for the iterator. Additional constructor overloads allow you to change the default root node which is <root>: 

public XPathIteratorReader(XPathNodeIterator iterator, string rootName)  
public XPathIteratorReader(XPathNodeIterator iterator, string rootName, string ns)

This reader also inherits from XmlTextReader, using the same technique of the [ XPathNavigatorReader](http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx). This means you can validate subsets of nodes against selective XML Schemas too. It also implements IXmlSerializable, so you can directly return this subset of nodes from a web service for example.

Subsets can be written down to disk easily using XmlWriter.WriteNode() method:

public void SaveFeedsContaining(string theWord, string toFile)  
{  
XPathDocument doc = new XPathDocument(theFeed);  
XPathNodeIterator it = doc.CreateNavigator().Select(  
"/rss/channel/item[contains(title,'" + theWord + "')]");  
  
using (StreamWriter sw = new StreamWriter(toFile, false))  
{  
XmlTextWriter tw = new XmlTextWriter(sw);  
tw.WriteNode(new XPathIteratorReader(it), false);  
tw.Close();  
}  
}

There are a couple interesting things inside this class:

  * It leverages the [ XPathNavigatorReader](http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx) for each item in the iterator. So it basically passes through property and method calls to it. 
  * Depth is increased by one all the time, except for the faked root element. 
  * Instead of having ifs on all XmlTextReader overrides checking whether it's at the faked root or not, I decided to go for the more elegant approach of creating a FakedRootReader class. So the code in XPathIteratorReader becomes drastically simpler. It's mostly passing calls down to the current reader and that's it. Therefore, the only braching code exists in the Read method, and it's really trivial, basically checking with the current ReadState and creating the FakedRootReader if necessary: public override bool Read()   
{  
// Return fast if state is no appropriate.  
if (_current.ReadState == ReadState.Closed || _current.ReadState == ReadState.EndOfFile)  
return false;  
  
bool read = _current.Read();  
if (!read)  
{  
read = _iterator.MoveNext();  
if (read)  
{  
// Just move to the next node and create the reader.  
_current = new XPathNavigatorReader(_iterator.Current);  
return _current.Read();  
}  
else  
{  
if (_current is FakedRootReader && _current.NodeType == XmlNodeType.EndElement)  
{  
// We're done!  
return false;  
}  
else  
{  
// We read all nodes in the iterator. Return to faked root end element.  
_current = new FakedRootReader(_rootname.Name, _rootname.Namespace, XmlNodeType.EndElement);  
return true;  
}  
}  
}  
  
return read;  
}
  * The IXmlSerializable implementation uses the following trick: it loads the incoming document, moves to the root and makes this the new "faked" root, and uses an iterator over all root node children as its new internal state :D. Here it is: void IXmlSerializable.ReadXml(XmlReader reader)  
{  
XPathDocument doc = new XPathDocument(reader);  
XPathNavigator nav = doc.CreateNavigator();  
  
// Pull the faked root out.  
nav.MoveToFirstChild();  
_rootname = new XmlQualifiedName(nav.LocalName, nav.NamespaceURI);  
  
// Get iterator for all child nodes.  
_iterator = nav.SelectChildren(XPathNodeType.All);  
}

+ As usual, if you just want the full class code to copy-paste on your project, here it is. As usual too, though, I strongly encourage you to take a look at the Mvp.Xml project ;) namespace Mvp.Xml.XPath { /// <summary> /// Provides an <see cref="XmlReader"/> over an /// <see cref="XPathNodeIterator"/>. /// </summary> /// <remarks> /// The reader exposes a new root element enclosing all navigators from the /// iterator. This root node is configured in the constructor, by /// passing the desired name and optional namespace for it. /// <para>Author: Daniel Cazzulino, kzu@aspnet2.com</para> /// See: http://weblogs.asp.net/cazzu/archive/2004/04/26/120684.aspx /// </remarks> public class XPathIteratorReader : XmlTextReader, IXmlSerializable { #region Fields // Holds the current child being read. XmlReader _current; // Holds the iterator passed to the ctor. XPathNodeIterator _iterator; // The name for the root element. XmlQualifiedName _rootname; #endregion Fields #region Ctor /// <summary> /// Parameterless constructor for XML serialization. /// </summary> /// <remarks>Supports the .NET serialization infrastructure. Don't use this /// constructor in your regular application.</remarks> [System.ComponentModel.EditorBrowsable(System.ComponentModel.EditorBrowsableState.Never)] public XPathIteratorReader() { } /// <summary> /// Initializes the reader, using the default &lt;root&gt; element. /// </summary> /// <param name="iterator">The iterator to expose as a single reader.</param> public XPathIteratorReader(XPathNodeIterator iterator) : this(iterator, "root", String.Empty) { } /// <summary> /// Initializes the reader. /// </summary> /// <param name="iterator">The iterator to expose as a single reader.</param> /// <param name="rootName">The name to use for the enclosing root element.</param> public XPathIteratorReader(XPathNodeIterator iterator, string rootName) : this(iterator, rootName, String.Empty) { } /// <summary> /// Initializes the reader. /// </summary> /// <param name="iterator">The iterator to expose as a single reader.</param> /// <param name="rootName">The name to use for the enclosing root element.</param> /// <param name="ns">The namespace URI of the root element.</param> public XPathIteratorReader(XPathNodeIterator iterator, string rootName, string ns) : base(new StringReader(String.Empty)) { _iterator = iterator.Clone(); _current = new FakedRootReader(rootName, ns, XmlNodeType.Element); _rootname = new XmlQualifiedName(rootName, ns); } #endregion Ctor #region Private members /// <summary> /// Returns the XML representation of the current node and all its children. /// </summary> private string Serialize() { StringWriter sw = new StringWriter(); XmlTextWriter tw = new XmlTextWriter(sw); tw.WriteNode(this, false); sw.Flush(); return sw.ToString(); } #endregion Private members #region Properties /// <summary>See <see cref="XmlReader.AttributeCount"/></summary> public override int AttributeCount { get { return _current.AttributeCount; } } /// <summary>See <see cref="XmlReader.BaseURI"/></summary> public override string BaseURI { get { return _current.BaseURI; } } /// <summary>See <see cref="XmlReader.Depth"/></summary> public override int Depth { get { return _current.Depth + 1; } } /// <summary>See <see cref="XmlReader.EOF"/></summary> public override bool EOF { get { return _current.ReadState == ReadState.EndOfFile || _current.ReadState == ReadState.Closed; } } /// <summary>See <see cref="XmlReader.HasValue"/></summary> public override bool HasValue { get { return _current.HasValue; } } /// <summary>See <see cref="XmlReader.IsDefault"/></summary> public override bool IsDefault { get { return false; } } /// <summary>See <see cref="XmlReader.IsDefault"/></summary> public override bool IsEmptyElement { get { return _current.IsEmptyElement; } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[string name, string ns] { get { return _current[name, ns]; } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[string name] { get { return _current[name, String.Empty]; } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[int i] { get { return _current[i]; } } /// <summary>See <see cref="XmlReader.LocalName"/></summary> public override string LocalName { get { return _current.LocalName; } } /// <summary>See <see cref="XmlReader.Name"/></summary> public override string Name { get { return _current.Name; } } /// <summary>See <see cref="XmlReader.NamespaceURI"/></summary> public override string NamespaceURI { get { return _current.NamespaceURI; } } /// <summary>See <see cref="XmlReader.NameTable"/></summary> public override XmlNameTable NameTable { get { return _current.NameTable; } } /// <summary>See <see cref="XmlReader.NodeType"/></summary> public override XmlNodeType NodeType { get { return _current.NodeType; } } /// <summary>See <see cref="XmlReader.Prefix"/></summary> public override string Prefix { get { return _current.Prefix; } } /// <summary>See <see cref="XmlReader.QuoteChar"/></summary> public override char QuoteChar { get { return _current.QuoteChar; } } /// <summary>See <see cref="XmlReader.ReadState"/></summary> public override ReadState ReadState { get { return _current.ReadState; } } /// <summary>See <see cref="XmlReader.Value"/></summary> public override string Value { get { return _current.Value; } } /// <summary>See <see cref="XmlReader.XmlLang"/></summary> public override string XmlLang { get { return _current.XmlLang; } } /// <summary>See <see cref="XmlReader.XmlSpace"/></summary> public override XmlSpace XmlSpace { get { return XmlSpace.Default; } } #endregion Properties #region Methods /// <summary>See <see cref="XmlReader.Close"/></summary> public override void Close() { _current.Close(); } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(string name, string ns) { return _current.GetAttribute(name, ns); } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(string name) { return _current.GetAttribute(name); } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(int i) { return _current.GetAttribute(i); } /// <summary>See <see cref="XmlReader.LookupNamespace"/></summary> public override string LookupNamespace(string prefix) { return _current.LookupNamespace(prefix); } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override bool MoveToAttribute(string name, string ns) { return _current.MoveToAttribute(name, ns); } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override bool MoveToAttribute(string name) { return _current.MoveToAttribute(name); } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override void MoveToAttribute(int i) { _current.MoveToAttribute(i); } /// <summary>See <see cref="XmlReader.MoveToContent"/></summary> public override XmlNodeType MoveToContent() { return base.MoveToContent(); } /// <summary>See <see cref="XmlReader.MoveToElement"/></summary> public override bool MoveToElement() { return _current.MoveToElement(); } /// <summary>See <see cref="XmlReader.MoveToFirstAttribute"/></summary> public override bool MoveToFirstAttribute() { return _current.MoveToFirstAttribute(); } /// <summary>See <see cref="XmlReader.MoveToNextAttribute"/></summary> public override bool MoveToNextAttribute() { return _current.MoveToNextAttribute(); } /// <summary>See <see cref="XmlReader.Read"/></summary> public override bool Read() { // Return fast if state is no appropriate. if (_current.ReadState == ReadState.Closed || _current.ReadState == ReadState.EndOfFile) return false; bool read = _current.Read(); if (!read) { read = _iterator.MoveNext(); if (read) { // Just move to the next node and create the reader. _current = new XPathNavigatorReader(_iterator.Current); return _current.Read(); } else { if (_current is FakedRootReader && _current.NodeType == XmlNodeType.EndElement) { // We're done! return false; } else { // We read all nodes in the iterator. Return to faked root end element. _current = new FakedRootReader(_rootname.Name, _rootname.Namespace, XmlNodeType.EndElement); return true; } } } return read; } /// <summary>See <see cref="XmlReader.ReadAttributeValue"/></summary> public override bool ReadAttributeValue() { return _current.ReadAttributeValue(); } /// <summary>See <see cref="XmlReader.ReadInnerXml"/></summary> public override string ReadInnerXml() { if (this.Read()) return Serialize(); return String.Empty; } /// <summary>See <see cref="XmlReader.ReadOuterXml"/></summary> public override string ReadOuterXml() { if (_current.ReadState != ReadState.Interactive) return String.Empty; return Serialize(); } /// <summary>See <see cref="XmlReader.Read"/></summary> public override void ResolveEntity() { // Not supported. } #endregion Methods #region IXmlSerializable Members void IXmlSerializable.WriteXml(XmlWriter writer) { writer.WriteNode(this, false); } System.Xml.Schema.XmlSchema IXmlSerializable.GetSchema() { return null; } void IXmlSerializable.ReadXml(XmlReader reader) { XPathDocument doc = new XPathDocument(reader); XPathNavigator nav = doc.CreateNavigator(); // Pull the faked root out. nav.MoveToFirstChild(); _rootname = new XmlQualifiedName(nav.LocalName, nav.NamespaceURI); // Get iterator for all child nodes. _iterator = nav.SelectChildren(XPathNodeType.All); } #endregion #region Internal classes #region FakedRootReader private class FakedRootReader : XmlReader { public FakedRootReader(string name, string ns, XmlNodeType nodeType) { _name = name; _namespace = ns; _nodetype = nodeType; _state = nodeType == XmlNodeType.Element ? ReadState.Initial : ReadState.Interactive; } #region Properties /// <summary>See <see cref="XmlReader.AttributeCount"/></summary> public override int AttributeCount { get { return 0; } } /// <summary>See <see cref="XmlReader.BaseURI"/></summary> public override string BaseURI { get { return String.Empty; } } /// <summary>See <see cref="XmlReader.Depth"/></summary> public override int Depth { // Undo the depth increment of the outer reader. get { return -1; } } /// <summary>See <see cref="XmlReader.EOF"/></summary> public override bool EOF { get { return _state == ReadState.EndOfFile; } } /// <summary>See <see cref="XmlReader.HasValue"/></summary> public override bool HasValue { get { return false; } } /// <summary>See <see cref="XmlReader.IsDefault"/></summary> public override bool IsDefault { get { return false; } } /// <summary>See <see cref="XmlReader.IsDefault"/></summary> public override bool IsEmptyElement { get { return false; } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[string name, string ns] { get { return null; } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[string name] { get { return null; } } /// <summary>See <see cref="XmlReader.this"/></summary> public override string this[int i] { get { return null; } } /// <summary>See <see cref="XmlReader.LocalName"/></summary> public override string LocalName { get { return _name; } } string _name; /// <summary>See <see cref="XmlReader.Name"/></summary> public override string Name { get { return _name; } } /// <summary>See <see cref="XmlReader.NamespaceURI"/></summary> public override string NamespaceURI { get { return _namespace; } } string _namespace; /// <summary>See <see cref="XmlReader.NameTable"/></summary> public override XmlNameTable NameTable { get { return null; } } /// <summary>See <see cref="XmlReader.NodeType"/></summary> public override XmlNodeType NodeType { get { return _state == ReadState.Initial ? XmlNodeType.None : _nodetype; } } XmlNodeType _nodetype; /// <summary>See <see cref="XmlReader.Prefix"/></summary> public override string Prefix { get { return String.Empty; } } /// <summary>See <see cref="XmlReader.QuoteChar"/></summary> public override char QuoteChar { get { return '"'; } } /// <summary>See <see cref="XmlReader.ReadState"/></summary> public override ReadState ReadState { get { return _state; } } ReadState _state; /// <summary>See <see cref="XmlReader.Value"/></summary> public override string Value { get { return String.Empty; } } /// <summary>See <see cref="XmlReader.XmlLang"/></summary> public override string XmlLang { get { return String.Empty; } } /// <summary>See <see cref="XmlReader.XmlSpace"/></summary> public override XmlSpace XmlSpace { get { return XmlSpace.Default; } } #endregion Properties #region Methods /// <summary>See <see cref="XmlReader.Close"/></summary> public override void Close() { _state = ReadState.Closed; } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(string name, string ns) { return null; } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(string name) { return null; } /// <summary>See <see cref="XmlReader.GetAttribute"/></summary> public override string GetAttribute(int i) { return null; } /// <summary>See <see cref="XmlReader.LookupNamespace"/></summary> public override string LookupNamespace(string prefix) { return null; } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override bool MoveToAttribute(string name, string ns) { return false; } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override bool MoveToAttribute(string name) { return false; } /// <summary>See <see cref="XmlReader.MoveToAttribute"/></summary> public override void MoveToAttribute(int i) { } public override XmlNodeType MoveToContent() { if (_state == ReadState.Initial) _state = ReadState.Interactive; return _nodetype; } /// <summary>See <see cref="XmlReader.MoveToElement"/></summary> public override bool MoveToElement() { return false; } /// <summary>See <see cref="XmlReader.MoveToFirstAttribute"/></summary> public override bool MoveToFirstAttribute() { return false; } /// <summary>See <see cref="XmlReader.MoveToNextAttribute"/></summary> public override bool MoveToNextAttribute() { return false; } /// <summary>See <see cref="XmlReader.Read"/></summary> public override bool Read() { if (_state == ReadState.Initial) { _state = ReadState.Interactive; return true; } if (_state == ReadState.Interactive && _nodetype == XmlNodeType.EndElement) { _state = ReadState.EndOfFile; return false; } return false; } /// <summary>See <see cref="XmlReader.ReadAttributeValue"/></summary> public override bool ReadAttributeValue() { return false; } /// <summary>See <see cref="XmlReader.ReadInnerXml"/></summary> public override string ReadInnerXml() { return String.Empty; } /// <summary>See <see cref="XmlReader.ReadOuterXml"/></summary> public override string ReadOuterXml() { return String.Empty; } /// <summary>See <see cref="XmlReader.Read"/></summary> public override void ResolveEntity() { // Not supported. } #endregion Methods } #endregion FakedRootReader #endregion Internal classes } }

The full [Mvp.Xml project](http://sf.net/projects/mvp-xml) source code can be downloaded from [ SourceForge](http://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234).

Enjoy and please give us feedback on the project!

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted [Monday, April 26, 2004 10:25 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/04/26/219.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/04/26/219.aspx#comments)

#####  [Technorati ugly bug](http://clariusconsulting.net/blogs/kzu/archive/2004/04/26/218.aspx)

Last week I wrote a post about the [XPathNavigatorReader](http://weblogs.asp.net/cazzu/archive/2004/04/19/115966.aspx). That post has some XML showing the output of a webservice, output generated from the Pubs sample database. As you know, there's a title table. Well, as I [already said in a previous post](http://weblogs.asp.net/cazzu/archive/2004/01/26/62967.aspx), the `<xmp>` element is a useful one to me: it's like `<pre>` but you can have markup that is not parsed (think C# XML documentation tags...). As it's not parsed, you don't need to escape anything. Cool, IMO.  

So, the following code showed up in that post, *unescaped* inside that xmp element: 

`
    
    
    <XPathNavigatorReader>
      <titles>
        <title_id>BU2075</title_id>
        <title>You Can Combat Computer Stress!</title>
      ...

`

Due to a very ugly bug in [Technorati](http://www.technorati.com/), I had to escape tags in that post. Why? Because they are parsing the whole page (not just the `<head>` section) searching for a `<title>` element to use as the weblog title, and in my case, they found the one in my XML snippet from Pubs!!! Hence, they think this is the title of my weblog :( : 

[![](https://web.archive.org/web/20060503165857im_/http://aspnet2.com/kzu/weblog/technoratibugsmall.png)](http://aspnet2.com/kzu/weblog/technoratibug.png)

Bottom line: escape content to avoid buggy sniffers... Damn, I was so happy to avoid [harmful escaped markup](http://norman.walsh.name/2003/09/16/escmarkup)... 

Special thanks to my friend and partner [VGA](http://weblogs.asp.net/vga) for warning me about this! 

posted [Monday, April 26, 2004 12:42 PM](http://clariusconsulting.net/blogs/kzu/archive/2004/04/26/218.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2004/04/26/218.aspx#comments)

  

[![](/web/20060503165857im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
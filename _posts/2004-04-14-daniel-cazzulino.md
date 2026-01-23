---
layout: post
title: "Daniel Cazzulino"
date: 2004-04-14 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : How to get an XmlNodeList from an XPathNodeIterator (reloaded)

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060509002207im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## How to get an XmlNodeList from an XPathNodeIterator (reloaded) 

In a [previous post](http://weblogs.asp.net/cazzu/archive/2004/03/09/86609.aspx) I showed a possible approach to get an iterator for `XmlNode`s from an `XPathNodeIterator`. Please that post as it explains the problem in depth, and explains the reasons why you should move to using `XPathNodeIterator`. 

However, the solution I showed involved a new class that only had an `IEnumerable` implementation. It wasn't compatible at all with the built-in `XmlNodeList` (abstract) class. This time, for the [Mvp.Xml project](http://sf.net/projects/mvp-xml), I decided to do the right thing: inherit from `XmlNodeList` and implement the whole thing. What this means is that if you have a method that returns an `XmlNodeList`, as follows:

public void DoSomeStuff(XmlDocument document)  
{  
XmlNodeList nodes = GetTheRelevantNodes(document);  
// Process the nodes.  
}  
  
private XmlNodeList GetTheRelevantNodes(XmlDocument document)  
{  
return document.SelectNodes(someQuery);  
}

You can now simply change the method internal implementation to use cached XPathExpressions (as explained in [Performant XML (I)](http://weblogs.asp.net/cazzu/archive/2003/10/07/30888.aspx)) and keep the return value the same:

private XmlNodeList GetTheRelevantNodes(XmlDocument document)  
{  
XPathNodesIterator it = document.CreateNavigator().Select(  
theCachedPerformantPreCompiledXPathExpression);  
return XmlNodeListFactory.CreateNodeList(it);  
}

Now you can focus on the cursor-style XML processing approach (and be ready for Whidbey where it's the "blessed" API), while maintaining "backwards" compatibility for your methods. Note, however, that the factory will throw an exception if you query a non-`XmlDocument` store.

The `XmlNodeList` class has the following signature:

public abstract class XmlNodeList : IEnumerable  
{  
// Methods  
protected XmlNodeList();  
public abstract IEnumerator GetEnumerator();  
public abstract XmlNode Item(int index);  
  
// Properties  
public abstract int Count { get; }  
public virtual XmlNode this[int] { get; }  
}

(Note: for some strange reason, Reflector shows the indexer property of this particular class as a property with the name `ItemOf` (?))

This may seem trival to implement, unless you know how the `XPathNodeIterator` works. When it's returned from a query, the full document isn't evaluated. Rather, the query is advanced each time you move the iterator, thus reducing the initial performance impact of querying a potencially large document. Therefore, in order to maintain this performance advantage, I had to carefully implement the list so as to read from the iterator only the nodes actually needed. Of course, and just like the `XPathNodeIterator` does, retrieving the `Count` property requires the query to be evaluated against the whole document. Therefore:

Avoid retrieving the `Count` property on either an ` XmlNodeList` or an `XPathNodeIterator` at all costs!

So, the implementation basically advances the cursor when needed (for example when you access an item whose position hasn't been reached yet, or when you move the iterator), and caches the `XmlNode` instances that are taken from the iterator through the `IHasXmlNode` interface on the current node. This mechanism was explained in the post mentioned at the beginning.

+ The full code here was already showed in the previous post, but is reproduced here for your convenience. using System; using System.Collections; using System.Xml; using System.Xml.XPath; namespace Mvp.Xml { /// <summary> /// Constructs <see cref="XmlNodeList"/> instances from /// <see cref="XPathNodeIterator"/> objects. /// </summary> public sealed class XmlNodeListFactory { private XmlNodeListFactory() {} #region Public members /// <summary> /// Creates an instance of a <see cref="XmlNodeList"/> that allows /// enumerating <see cref="XmlNode"/> elements in the iterator. /// </summary> /// <param name="iterator">The result of a previous node selection /// through an <see cref="XPathNavigator"/> query.</param> /// <returns>An initialized list ready to be enumerated.</returns> /// <remarks>The underlying XML store used to issue the query must be /// an object inheriting <see cref="XmlNode"/>, such as /// <see cref="XmlDocument"/>.</remarks> public static XmlNodeList CreateNodeList(XPathNodeIterator iterator) { return new XmlNodeListIterator(iterator); } #endregion Public members #region XmlNodeListIterator private class XmlNodeListIterator: XmlNodeList { XPathNodeIterator _iterator; ArrayList _nodes = new ArrayList(); public XmlNodeListIterator(XPathNodeIterator iterator) { _iterator = iterator.Clone(); // Read first one to detect IHasXmlNode interface. ReadTo(0); if (!_done && !(_nodes[0] is IHasXmlNode)) throw new ArgumentException(SR.GetString(SR.XmlNodeListFactory_IHasXmlNodeMissing)); } public override IEnumerator GetEnumerator() { return new XmlNodeListEnumerator(this); } public override XmlNode Item(int index) { return this[index]; } public override int Count { get { if (!_done) ReadToEnd(); return _nodes.Count; } } public override XmlNode this[int index] { get { if (index >= _nodes.Count) ReadTo(index); return (XmlNode) _nodes[index]; } } /// <summary> /// Reads the entire iterator. /// </summary> private void ReadToEnd() { while (_iterator.MoveNext()) { _nodes.Add(((IHasXmlNode)_iterator.Current).GetNode()); } _done = true; } /// <summary> /// Reads up to the specified index, or until the /// iterator is consumed. /// </summary> private void ReadTo(int to) { while (_nodes.Count <= to) { if (_iterator.MoveNext()) { _nodes.Add(((IHasXmlNode)_iterator.Current).GetNode()); } else { _done = true; return; } } } /// <summary> /// Flags that the iterator has been consumed. /// </summary> private bool Done { get { return _done; } } bool _done; #region XmlNodeListEnumerator private class XmlNodeListEnumerator: IEnumerator { XmlNodeListIterator _iterator; int _position = -1; public XmlNodeListEnumerator(XmlNodeListIterator iterator) { _iterator = iterator; } #region IEnumerator Members void System.Collections.IEnumerator.Reset() { _position = -1; } bool System.Collections.IEnumerator.MoveNext() { _position++; _iterator.ReadTo(_position); // If we reached the end and our index is still // bigger, there're no more items. if (_iterator.Done && _position >= _position) return false; return true; } object System.Collections.IEnumerator.Current { get { return _iterator[_position]; } } #endregion } #endregion XmlNodeListEnumerator } #endregion XmlNodeListIterator } }

Note that in order to reduce the API surface, the only available class is the factory itself, and the implementation of the wrapper itself as well as the enumerator are completely hidden from you, so you can keep using the familiar `XmlNodeList` and let us change the implementation in the future at will ;).

The full [Mvp.Xml project](http://sf.net/projects/mvp-xml) source code can be downloaded from [ SourceForge](http://prdownloads.sourceforge.net/mvp-xml/Mvp.Xml.zip?download).

Enjoy and please give us feedback on the project!

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

posted on Wednesday, April 14, 2004 9:07 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/203.aspx) :: 

  

[![](/web/20060509002207im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
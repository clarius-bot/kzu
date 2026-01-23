---
layout: post
title: "Daniel Cazzulino's Blog : XmlNodes from XPathNodeIterator"
date: 2004-03-09 00:00:00 +0000
---

## XmlNodes from XPathNodeIterator 

Every now and then I receive complains about `XPathNodeIterator`. You know, it allows iteration where each `Current` element is an `XPathNavigator`. Not too useful if you're looking for `OuterXml`, or are too-dependant on the XmlNode-based API (i.e. `XmlDocument`). The most worrying issue is that people use this argument against using compiled XPath expressions, which are known to significantly improve performance (see [ Performant XML (I)](http://weblogs.asp.net/cazzu/archive/2003/10/07/30888.aspx) and [ Performant XML (II)](http://weblogs.asp.net/cazzu/archive/2003/10/09/31294.aspx) articles). The reason is that in order to get an XmlNodeList, you have to use the SelectNodes method of the XmlNode (and therefore XmlDocument), whose signature is as follows:

public XmlNodeList SelectNodes(string xpath); public XmlNodeList SelectNodes(string xpath, XmlNamespaceManager nsmgr);

This means that most developers won't compile their expressions simply because in order to use the `XPathExpression`, they have to explicitly create a navigator for the node/document and work against the cursor-style API of the `XPathNodeIterator` and `XPathNavigator`:

// Statically compile and cache the expression. XPathExpression expr; // Init and load a document. XmlDocument document; // Create navigator, clone expression and execute query. XPathNodeIterator it = document.CreateNavigator().Select(expr.Clone()); while (it.MoveNext()) { // Do something with it.Current which is an XPathNavigator. }

This approach generally means that in order to optimize the code by compiling expression, you actually have to refactor significant pieces of your code. And you don't have any other choice if you need to sort the query by using `XPathExpression.AddSort()`. There's a solution to this problem, as usual :). 

You know that the `XPathNavigator` is an abstract class that allows multiple underlying implementations to offer the same cursor-style API and gain the instant benefit of XPath querying. [ Aaron Skonnard](http://skonnard.com/articles/199.aspx) has some interesting implementations showing this concept. Therefore, when you're iterating the results of the query, and asking for the current element, you're actually using something that is dependant on the implementation. Therefore, this object, besides being an XPathNavigator (that is, the XPathNodeIterator.Current property), can also implement other interfaces as part of the underlying implementation. As such, queries executed against an XmlNode-based element will have each Current element implementing `IHasXmlNode` whereas `XPathDocument`-based ones will implement `IXmlLineInfo`. And what is this useful for? Well, just to get access to additional information beyond the standard `XPathNavigator` API that depends on the concrete implementation. So, inside the while look above, we can ask: 

while (it.MoveNext()) { if (it.Current is IHasXmlNode) { XmlNode node = ((IHasXmlNode)it.Current).GetNode(); // Work with your beloved DOM api ;) } }

Still, this doesn't solve the problem that you have to iterate diffently than you're used to, and that significant rewrites are still needed when you use `XPathExpression` for querying.   
The solution is to use the knowledge about the underlying implementation (i.e. you KNOW you're querying against an `XmlDocument`) and get an easier API to it. This can be achieved by creating an `IEnumerable` class that provides iteration ofer the `XPathNodeIterator` but exposing the underlying `XmlNode`. Also, a helper method returning an array of XmlNodes is useful. It would be used as follows:

XPathNodeIterator it = doc.CreateNavigator().Select(expr.Clone()); XmlNodesEnumerable nodes = new XmlNodesEnumerable(it); foreach (XmlNode node in en) { Response.Write(node.OuterXml); } // Or use the array directly: XmlNode[] list = nodes.ToArray();

Complete code for the custom enumerable object and its internal enumerator implementation follows.

+ Collapsible code listing. /// /// Provides enumeration over an but /// exposing the underlying elements. /// public class XmlNodesEnumerable : IEnumerable { XPathNodeIterator _iterator; /// /// Constructs the iterator. /// /// The instance containing the nodes to iterate. public XmlNodesEnumerable(XPathNodeIterator iterator) { _iterator = iterator; } /// /// Returns all nodes in the underlying iterator as an array. /// /// An array with all nodes. public XmlNode[] ToArray() { ArrayList list = new ArrayList(); IEnumerator en = new XmlNodesEnumerator(_iterator); while (en.MoveNext()) { list.Add(en.Current); } return (XmlNode[]) list.ToArray(typeof(XmlNode)); } #region IEnumerable Members IEnumerator IEnumerable.GetEnumerator() { return new XmlNodesEnumerator(_iterator); } #endregion #region Inner XmlNodesEnumerator class /// /// Provides iteration over an but /// exposing the underlying elements. /// private class XmlNodesEnumerator : IEnumerator { XPathNodeIterator _iterator; /// /// Constructs the iterator. /// /// The instance containing the nodes to iterate. public XmlNodesEnumerator(XPathNodeIterator iterator) { _iterator = iterator; } #region IEnumerator Members /// /// Not supported. /// void IEnumerator.Reset() { throw new NotSupportedException("Can't reset this enumerator."); } /// /// Returns the current . /// /// The current item in the /// underlying doesn't point to an . object IEnumerator.Current { get { IHasXmlNode node = _iterator.Current as IHasXmlNode; if (node == null) throw new ArgumentException("Can only traverse XmlNode iterators."); return node.GetNode(); } } /// /// Advances the iteration cursor. /// /// True if more nodes remain in the iterator. bool IEnumerator.MoveNext() { return _iterator.MoveNext(); } #endregion } #endregion }

**Update: check an even better approach[here](http://weblogs.asp.net/cazzu/archive/2004/04/14/113479.aspx).**

Enjoy!

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

/kzu

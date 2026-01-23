---
layout: post
title: "Daniel Cazzulino"
date: 2003-11-20 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Merging XML

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/11/3.aspx "1 Post")| [4](http://clariusconsulting.net/blogs/kzu/archive/2003/11/4.aspx "1 Post")| 5| [6](http://clariusconsulting.net/blogs/kzu/archive/2003/11/6.aspx "1 Post")  
7| 8| 9| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/11/10.aspx "1 Post")| 11| 12| 13  
14| 15| 16| 17| 18| 19| [20](http://clariusconsulting.net/blogs/kzu/archive/2003/11/20.aspx "2 Posts")  
21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/11/22.aspx "1 Post")| 23| 24| 25| 26| 27  
28| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060519214013im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Merging XML 

Sometimes, it's useful to be able to merge two XML nodes/documents. One concrete case is where you have a configuration file where some global element is configured and later it can be specialized by concrete usages. There are other uses too, such as consolidating information from various sources, etc. I "found" a way to do this, "stealing" [Oliver Becker's](http://www.informatik.hu-berlin.de/~obecker/XSLT/#merge) [XSLT stylesheet](http://www.informatik.hu-berlin.de/~obecker/XSLT/merge/merge.xslt) and writing the following .NET class that takes advantage of it:

`
    
    
    /// <summary>
    /// Merges two <see cref="XmlNode"/> objects.
    /// </summary>
    public class XmlMerge
    {
      const string First = "first";
      const string Second = "second";
      static XslTransform Transformation;
      static IXPathNavigable Input;
    
      static XmlMerge()
      {
        Transformation = new XslTransform();
        Transformation.Load( new XmlTextReader( 
          Assembly.GetExecutingAssembly().GetManifestResourceStream(
          "XmlMerger.merge.xslt") ), 
          null, null);
    
        // Dummy input document for the merge stylesheet.
        Input = new XPathDocument( new StringReader ( String.Format( 
          @"<?xml version='1.0'?>
          <merge xmlns='http://informatik.hu-berlin.de/merge'>
            <file1>mem://{0}</file1>
            <file2>mem://{1}</file2>
          </merge>", First, Second ) ) );
      }
    
      private XmlMerge() {}
    
      /// <summary>
      /// Merges the first XML with the second.
      /// </summary>
      /// <param name="first">First XML.</param>
      /// <param name="second">Second XML.</param>
      /// <param name="replace">If set to <see langword="true"/> replaces 
      /// text values from <paramref name="first"/> with the ones in 
      /// <paramref name="second"/> if nodes are equal.</param>
      /// <returns>The merged XML.</returns>
      public static XmlDocument Merge( IXPathNavigable first, IXPathNavigable second, bool replace )
      {
        // Holds the merged results.
        StringBuilder sb = new StringBuilder();
        XmlTextWriter tw = new XmlTextWriter(new StringWriter(sb));
        tw.Formatting = Formatting.None;
    
        // Specify whether second node replaces text from first one.
        XsltArgumentList args = new XsltArgumentList();
        args.AddParam("replace", String.Empty, replace);
    
        Transformation.Transform(Input, args, tw, new XmlNodeResolver(first, second));
        tw.Flush();
    
        XmlDocument doc = new XmlDocument();
        doc.LoadXml(sb.ToString());
    
        return doc;
      }
    }

`

Note that I embedded the stylesheet in the assembly, and loaded everything only once in the static ctor. Oliver' stylesheet receives the names of the two files to process and loads them with the XSLT `document` function. I have "fooled" the XslTransform by providing dummy urls for both files (`mem://first` and `mem://second` and through a custom `XmlResolver` answer the stylesheet request for those files. That's what the `XmlNodeResolver` I created is about (not rocket science, I must admit :o)):

`
    
    
      /// <summary>
      /// Resolves the dummy URL locations to the parameters received.
      /// </summary>
      private class XmlNodeResolver : XmlResolver
      {
        IXPathNavigable _first;
        IXPathNavigable _second;
    
        public XmlNodeResolver(IXPathNavigable first, IXPathNavigable second)
        {
          _first = first;
          _second = second;
        }
    
        public override object GetEntity(Uri absoluteUri, string role, Type ofObjectToReturn)
        {
          if ( absoluteUri.Authority == First )
            return _first.CreateNavigator();
          else if ( absoluteUri.Authority == Second )
            return _second.CreateNavigator();
          return null;
        }
    
        public override System.Net.ICredentials Credentials 
        { 
          set {} 
        }
      }

`

This is a private class nested in the `XmlMerger` class.  
Given the following NUnit test for it: 

`
    
    
        [Test]
        public void MergeNodes()
        {  
          XmlDocument first = new XmlDocument();
          XmlDocument second = new XmlDocument();
    
          first.LoadXml(@"
       <themes>
          <theme id='appl'>
             <title xml:lang='nl'>Toepassingen</title>
          </theme>
       </themes>");
    
          second.LoadXml(@"
       <themes>
          <theme id='doc' />
          <theme id='appl'>
             <title xml:lang='en'>Applications</title>
          </theme>
       </themes>");
          
          XmlNode result = XmlMerge.Merge(first, second, true);
          System.Diagnostics.Debug.Write(result.OuterXml);
        }

`

The merged results are:

`
    
    
    <themes>
      <theme id="doc" />
      <theme id="appl">
        <title xml:lang="nl">Toepassingen</title>
        <title xml:lang="en">Applications</title>
      </theme>
    </themes>

`

+ The 'real' NUnit test without pretty indenting and a proper assert for passing: 

`
    
    
    [Test]
    public void MergeNodes()
    {  
      XmlDocument first = new XmlDocument();
      XmlDocument second = new XmlDocument();
    
      first.LoadXml(@"<themes><theme id='appl'><title xml:lang='nl'>Toepassingen</title></theme></themes>");
      second.LoadXml(@"<themes><theme id='doc' /><theme id='appl'><title xml:lang='en'>Applications</title></theme></themes>");
      
      XmlNode result = XmlMerge.Merge(first, second, true);
      Assertion.AssertEquals("Merged documents are not equal", 
        "<themes><theme id='doc' /><theme id='appl'><title xml:lang='nl'>Toepassingen</title><title xml:lang='en'>Applications</title></theme></themes>", 
        result.OuterXml);
    }
    

`

posted on Thursday, November 20, 2003 3:33 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/107.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2003/11/20/107.aspx#452 "permalink") re: Merging XML @ Monday, January 30, 2006 7:50 PM

Hey Daniel,   
great code - helped me out a lot. I converted it to vb.net 2005 with a few minor changes...   
XslCompiledTransform replaced XslTransform   
and the other major one was   
Transformation.Load(Directory.GetCurrentDirectory.ToString & "/xslt/merge.xslt", XsltSettings.TrustedXslt, New XmlUrlResolver())   
  
I had to use the last point to alleviate the xsltsettings permissions on document()   
  
<http://72.14.203.104/search?q=cache:v3tT_wvp89oJ:blogs.msdn.com/xmlteam/articles/Introducing_XslCompiledTransform.aspx+Execution+of+the+%27document>()%27+function+was+prohibited.+&hl=en&gl=ca&ct=clnk&cd=2 [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

Andrew Renner

  

[![](/web/20060519214013im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
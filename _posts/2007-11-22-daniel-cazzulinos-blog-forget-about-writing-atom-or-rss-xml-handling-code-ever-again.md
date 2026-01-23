---
layout: post
title: "Daniel Cazzulino's Blog : Forget about writing Atom or RSS XML handling code ever again"
date: 2007-11-22 00:00:00 +0000
---

Daniel Cazzulino's Blog : Forget about writing Atom or RSS XML handling code ever again


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20080622141023im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080622141023im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080622141023im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080622141023im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Forget about writing Atom or RSS XML handling code ever again 

A *very* welcome addition to .NET 3.5, which just went [RTM for MSDN](http://www.danielmoth.com/Blog/2007/11/vs2008-rtm-for-non-msdn-subscribers.html) subscribers and [trial for the rest](http://msdn2.microsoft.com/en-gb/vstudio/products/aa700831.aspx "Download VS2008 RTM from MSDN") before general availability early next year: [System.ServiceModel.Syndication](msdn2.microsoft.com/library/system.servicemodel.syndication.aspx "MSDN Library").

This namespace, which lives in the System.ServiceModel.Web.dll assembly which provides the [WCF Syndication](http://msdn2.microsoft.com/en-us/library/bb412202\(VS.90\).aspx "WCF Syndication") functionality, contains useful classes for working with feeds and items. I won't go over the [Architecture of Syndication](http://msdn2.microsoft.com/bb412203\(VS.90\).aspx), [How the WCF Syndication Object Model Maps to Atom and RSS](http://msdn2.microsoft.com/bb412166\(VS.90\).aspx), [How to: Create a Basic RSS Feed](http://msdn2.microsoft.com/bb412174\(VS.90\).aspx), [How to: Create a Basic RSS Feed](http://msdn2.microsoft.com/bb412174\(VS.90\).aspx), [How to: Expose a Feed as both Atom and RSS](http://msdn2.microsoft.com/bb412205\(VS.90\).aspx) or the basics of [Syndication Extensibility](http://msdn2.microsoft.com/bb924494\(VS.90\).aspx). All those links provide enough to get you started.

The typical usage is:

  * Create [XmlReader](http://msdn2.microsoft.com/library/system.xml.xmlreader.aspx "MSDN library")/[XmlWriter](http://msdn2.microsoft.com/library/system.xml.xmlwriter.aspx "MSDN library") of the feed you will be reading/writing. 
  * Create [Atom10FeedFormatter](http://msdn2.microsoft.com/library/system.servicemodel.syndication.atom10feedformatter.aspx "MSDN library")/[Rss20FeedFormatter](http://msdn2.microsoft.com/library/system.servicemodel.syndication.rss20feedformatter.aspx "MSDN library") which knows how to read/write the given format (there are [Atom10ItemFormatter](http://msdn2.microsoft.com/library/system.servicemodel.syndication.atom10itemformatter.aspx "MSDN library") and [Rss20ItemFormatter](http://msdn2.microsoft.com/library/system.servicemodel.syndication.rss20itemformatter.aspx "MSDN library") too) 
  * Read or write a [SyndicationFeed](http://msdn2.microsoft.com/library/system.servicemodel.syndication.syndicationfeed.aspx "MSDN library") or a [SyndicationFeedItem](http://msdn2.microsoft.com/library/system.servicemodel.syndication.syndicationitem.aspx "MSDN library").

The only thing I felt was missing was a factory that abstracts me from having to decide which formatter to create for a given source: the factory should be able to determine this automatically depending on the first element of the feed/item. 

With the factory in place, reading a feed without caring for its format, is as simple as:
    
    
    using (XmlReader reader = XmlReader.Create(atomFeedUrl))
    {
    ** SyndicationFeedFormatter formatter = SyndicationFormatterFactory.CreateFeedFormatter(reader);
    **    formatter.ReadFrom(reader);
        SyndicationFeed feed = formatter.Feed;
    }
    

[](http://11011.net/software/vspaste)

Note that there's nothing in my code that knows about RSS or Atom.

Processing of the item and extensions is very friendly and quite flexible, making for a very nice platform to base syndication extension processing plugins: 
    
    
        foreach (SyndicationItem item in feed.Items)
        {
            // ... process item
    
            foreach (SyndicationElementExtension extension in item.ElementExtensions)
            {
                // ... process extensions
                // example: SSE sync
                if (extension.OuterNamespace == Sync.NamespaceUri)
                {
                    // NOTE: we don't need to pass an explicit XmlSerializer because we implement 
                    // IXmlSerializable, so the library figures out it needs one :)
                    Sync sync = extension.GetObject<Sync>();
                    // ... do something with the extension
                }
                else if (extension.OuterName == "Mock")
                {
                    // this extension does not implement IXmlSerializable neither is a WCF data 
                    // contract, so we need to pass an XmlSerializer
                    Mock m = extension.GetObject<Mock>(new XmlSerializer(typeof(Mock)));
                    // ... do something with the extension.
                }
            }
        }
    

So here goes such a factory:
    
    
    /// <summary>
    /// Creates formatters for RSS 2.0 and Atom 1.0 according to the input content.
    /// </summary>  
    /// <remarks>
    /// <see cref="http://www.clariusconsulting.net/kzu">Created by Daniel Cazzulino.</see>
    /// </remarks>  
    public static class SyndicationFormatterFactory
    {
        static XmlReaderSettings settings;
    
        static SyndicationFormatterFactory()
        {
            // Makes the processing faster for the readers we create.
            settings = new XmlReaderSettings();
            settings.IgnoreComments = true;
            settings.IgnoreProcessingInstructions = true;
            settings.IgnoreWhitespace = true;
            settings.CheckCharacters = true;
            settings.CloseInput = true;
        }
    
        /// <summary>
        /// Creates a <see cref="SyndicationFeedFormatter"/> according to the 
        /// input format.
        /// </summary>
        /// <param name="uriString">Feed location</param>
        /// <exception cref="NotSupportedException">The input does not contain a valid RSS 2.0 or Atom 1.0 feed.</exception>
        public static SyndicationFeedFormatter CreateFeedFormatter(string uriString)
        {
            using (XmlReader reader = XmlReader.Create(uriString, settings))
                return CreateFeedFormatter(reader);
        }
    
        /// <summary>
        /// Creates a <see cref="SyndicationFeedFormatter"/> according to the 
        /// input format.
        /// </summary>
        /// <param name="uri">Feed location</param>
        /// <exception cref="NotSupportedException">The input does not contain a valid RSS 2.0 or Atom 1.0 feed.</exception>
        public static SyndicationFeedFormatter CreateFeedFormatter(Uri uri)
        {
            using (XmlReader reader = XmlReader.Create(uri.ToString(), settings))
                return CreateFeedFormatter(reader);
        }
    
        /// <summary>
        /// Creates a <see cref="SyndicationFeedFormatter"/> according to the 
        /// input format.
        /// </summary>
        /// <param name="reader">Feed source</param>
        /// <exception cref="NotSupportedException">The input does not contain a valid RSS 2.0 or Atom 1.0 feed.</exception>
        public static SyndicationFeedFormatter CreateFeedFormatter(XmlReader reader)
        {
            if (reader.ReadState == ReadState.Initial)
            {
                reader.MoveToContent();
            }
    
            Rss20FeedFormatter rss = new Rss20FeedFormatter();
            if (rss.CanRead(reader))
            {
                return rss;
            }
    
            Atom10FeedFormatter atom = new Atom10FeedFormatter();
            if (atom.CanRead(reader))
            {
                return atom;
            }
    
            throw new NotSupportedException("Invalid feed root element: " + reader.Name);
        }
    
        /// <summary>
        /// Creates a <see cref="SyndicationItemFormatter"/> according to the 
        /// input format.
        /// </summary>
        /// <param name="uriString">Item location</param>
        /// <exception cref="NotSupportedException">The input does not contain a valid RSS 2.0 or Atom 1.0 item.</exception>
        public static SyndicationItemFormatter CreateItemFormatter(string uriString)
        {
            using (XmlReader reader = XmlReader.Create(uriString, settings))
                return CreateItemFormatter(reader);
        }
    
        /// <summary>
        /// Creates a <see cref="SyndicationItemFormatter"/> according to the 
        /// input format.
        /// </summary>
        /// <param name="uri">Item location</param>
        /// <exception cref="NotSupportedException">The input does not contain a valid RSS 2.0 or Atom 1.0 item.</exception>
        public static SyndicationItemFormatter CreateItemFormatter(Uri uri)
        {
            using (XmlReader reader = XmlReader.Create(uri.ToString(), settings))
                return CreateItemFormatter(reader);
        }
    
        /// <summary>
        /// Creates a <see cref="SyndicationItemFormatter"/> according to the 
        /// input format.
        /// </summary>
        /// <param name="reader">Item source</param>
        /// <exception cref="NotSupportedException">The input does not contain a valid RSS 2.0 or Atom 1.0 item.</exception>
        public static SyndicationItemFormatter CreateItemFormatter(XmlReader reader)
        {
            if (reader.ReadState == ReadState.Initial)
            {
                reader.MoveToContent();
            }
    
            Rss20ItemFormatter rss = new Rss20ItemFormatter();
            if (rss.CanRead(reader))
            {
                return rss;
            }
    
            Atom10ItemFormatter atom = new Atom10ItemFormatter();
            if (atom.CanRead(reader))
            {
                return atom;
            }
    
            throw new NotSupportedException("Invalid item element: " + reader.Name);
        }
    }
    

[](http://11011.net/software/vspaste)

You can also [download the plain text representation](http://www.clariusconsulting.net/images/blogs/kzu/SyndicationFormatterFactory.cs.txt) for easier copying.

[![Creative Commons License](https://web.archive.org/web/20080622141023im_/http://i.creativecommons.org/l/by/3.0/88x31.png) ](http://creativecommons.org/licenses/by/3.0/)  
This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/). 

posted on Thursday, November 22, 2007 9:02 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/42820.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/11/22/ForgetaboutwritingAtomorRSSXMLhandlingcodeeveragain.aspx#42821 "permalink") Forget about writing Atom or RSS XML handling code ever again @ Thursday, November 22, 2007 9:38 AM

A *very* welcome addition to .NET 3.5, which just went RTM for MSDN subscribers and trial for the rest [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/11/22/forget-about-writing-atom-or-rss-xml-handling-code-ever-again.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/11/22/ForgetaboutwritingAtomorRSSXMLhandlingcodeeveragain.aspx#43360 "permalink") Forget about writing Atom or RSS XML handling code ever again @ Sunday, November 25, 2007 3:42 AM

You've been kicked (a good thing) - Trackback from DotNetKicks.com [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.dotnetkicks.com/other/Forget_about_writing_Atom_or_RSS_XML_handling_code_ever_again "TrackBack")

  

[![](/web/20080622141023im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
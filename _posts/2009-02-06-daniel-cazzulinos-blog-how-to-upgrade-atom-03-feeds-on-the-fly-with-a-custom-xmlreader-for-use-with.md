---
layout: post
title: "Daniel Cazzulino's Blog : How to upgrade Atom 0.3 feeds on the fly with a custom XmlReader for use with WCF Syndication APIs"
date: 2009-02-06 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to upgrade Atom 0.3 feeds on the fly with a custom XmlReader for use with WCF Syndication APIs


  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20090210130253im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090210130253im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090210130253im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090210130253im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## How to upgrade Atom 0.3 feeds on the fly with a custom XmlReader for use with WCF Syndication APIs 

Even now that Atom 1.0 has been approved and official for some time, there's a feed every now and then that still uses Atom 0.3 (i.e. Google News! [http://news.google.com/?ned=us&topic=w&output=atom](http://news.google.com/?ned=us&topic=w&output=atom "http://news.google.com/?ned=us&topic=w&output=atom")).

The .NET APIs for feeds, [System.ServiceModel.Syndication](http://msdn.microsoft.com/en-us/library/bb412203.aspx), handles RSS 2.0 and Atom 1.0 fine, and you just have to make a single call to load a feed regardless of its format:
    
    
    SyndicationFeed.Load(xmlReader);

I searched the web looking for an easy answer, but I couldn't find any that would let me seamlessly plug into the .NET APIs to do the feed format upgrade on the fly. So I put one together myself :)

I found [Aaron Cope](http://www.aaronland.info/) had created [XSLT stylesheets to transform Atom 0.3 to RSS 1.0 and 2.0](http://www.aaronland.info/xsl/atom/0.3/), so I could use that. That used the [XSLT Standard Library](http://xsltsl.sourceforge.net/) too. So, I wanted something that would be blazingly fast and transparent to users of WCF: I wanted a [compiled XSLT](http://msdn.microsoft.com/en-us/library/0610k0w4.aspx) and a [custom XmlReader](http://msdn.microsoft.com/en-us/magazine/cc302171.aspx) layered on top!

So, after a couple very minor fixes, I got Aaron's XSLT to compile with the following command:
    
    
    xsltc /out:Atom03ToRss20.dll /class:NetFx.ServiceModel.Syndication.Atom03ToRss20XslTransform atom03-to-rss20.xsl

That gave me an assembly I could reference, containing the specified type, which can be used as follows:
    
    
    var atom03ToRss20 = new XslCompiledTransform();
    atom03ToRss20.Load(typeof(Atom03ToRss20XslTransform));
    
    // transform the document with the compiled XSLT into an output writer
    atom03ToRss20.Transform(someXPathDocument, someXmlWriter);
    

That's the fastest way of doing XSLT transformations in .NET, mind you.

Now for the custom XmlReader, I used a base class we created for the Mvp.Xml project, the [XmlWrappingReader](http://www.codeplex.com/MVPXML/SourceControl/changeset/view/28478#258394), which makes creating the derived [LegacyFeedXmlReader](http://code.google.com/p/netfx/source/browse/trunk/Source/ServiceModel/Syndication/LegacyFeedXmlReader.cs) a breeze:
    
    
    #if NetFx    
        public class LegacyFeedXmlReader : XmlWrappingReader
    #else
        internal class LegacyFeedXmlReader : XmlWrappingReader
    #endif
        {
            static XslCompiledTransform atom03ToRss20;
            MemoryStream mem;
    
            static LegacyFeedXmlReader()
            {
                atom03ToRss20 = new XslCompiledTransform();
                atom03ToRss20.Load(typeof(Atom03ToRss20XslTransform));
            }
    
            public LegacyFeedXmlReader(XmlReader baseReader)
                : base(baseReader)
            {
                if (baseReader.ReadState == ReadState.Initial)
                    baseReader.MoveToContent();
                
                UpgradeReader();
            }
    
            private void UpgradeReader()
            {
                if (BaseReader.NamespaceURI == "http://purl.org/atom/ns#")
                {
                    var doc = new XPathDocument(BaseReader);
                    mem = new MemoryStream();
                    using (var writer = XmlWriter.Create(mem))
                    {
                        atom03ToRss20.Transform(doc, writer);
                    }
    
                    mem.Position = 0;
                    BaseReader = XmlReader.Create(mem, BaseReader.Settings);
                }
            }
    
            protected override void Dispose(bool disposing)
            {
                base.Dispose(disposing);
    
                if (mem != null)
                {
                    mem.Dispose();
                }
            }
        }
    

Note how the reader will only run the transformation and expose the transformed content if the root element namespace matches that of Atom 0.3 :). So, for Atom 1.0 and RSS 2.0 feeds it will do nothing and delegate all calls to the underlying reader.

Usage is straightforward: you just instantiate your XmlReader as usual, but wrap the new legacy one on top before passing it to the SyndicationFeed class:
    
    
    WebRequest request = CreateWebRequest(feedUri, credentials, modifiedSince);
    XmlReaderSettings settings = new XmlReaderSettings { CloseInput = true };
    using (XmlReader reader = XmlReader.Create(request.GetResponse().GetResponseStream(), settings))
    {
        using (var legacyReader = new LegacyFeedXmlReader(reader))
        {
            SyndicationFeed feed = SyndicationFeed.Load(legacyReader);
            return feed.Items;
        }
    }

This code is part of the [NetFx](http://code.google.com/p/netfx/) project, a collection of utilities to augment various pieces of .NET. You can grab just the [Syndication folder](http://code.google.com/p/netfx/source/browse/trunk/Source/ServiceModel/Syndication/) if you want. The goal of the project is to provide reusable pieces that you can just use in isolation (i.e. linking or copy/pasting a file or a folder). For your convenience, you can also just [download the ZIP](http://kzu.s3.amazonaws.com/public/NetFx.Syndication.zip).

Enjoy!

posted on Friday, February 06, 2009 5:42 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://clariusconsulting.net/blogs/kzu/archive/2009/02/06/116679.aspx#116683 "permalink") How to upgrade Atom 0.3 feeds on the fly with a custom XmlReader for use with WCF Syndication APIs @ Friday, February 06, 2009 5:54 AM

Even now that Atom 1.0 has been approved and official for some time, there&amp;#39;s a feed every now and [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2009/02/06/how-to-upgrade-atom-0-3-feeds-on-the-fly-with-a-custom-xmlreader-for-use-with-wcf-syndication-apis.aspx "TrackBack")

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2009/02/06/116679.aspx#116712 "permalink") Daniel Cazzulino's Blog : How to upgrade Atom 0.3 feeds on the fly with a custom XmlReader for use with WCF Syndication APIs @ Friday, February 06, 2009 1:11 PM

Thank you for submitting this cool story - Trackback from DotNetShoutout [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://clariusconsulting.net/utility/Redirect.aspx?U=http://dotnetshoutout.com/Daniel-Cazzulinos-Blog-How-to-upgrade-Atom-03-feeds-on-the-fly-with-a-custom-XmlReader-for-use-with-WCF-Syndication-APIs "TrackBack")

  

[![](/web/20090210130253im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
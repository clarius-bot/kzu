---
layout: post
title: "How to upgrade Atom 0.3 feeds on the fly with a custom XmlReader for use with WCF Syndication APIs"
date: 2009-02-06 00:00:00 +0000
---

##  [How to upgrade Atom 0.3 feeds on the fly with a custom XmlReader for use with WCF Syndication APIs](<http://blogs.clariusconsulting.net/kzu/how-to-upgrade-atom-0-3-feeds-on-the-fly-with-a-custom-xmlreader-for-use-with-wcf-syndication-apis/> "How to upgrade Atom 0.3 feeds on the fly with a custom XmlReader for use with WCF Syndication APIs")

February 6, 2009 1:35 pm

Even now that Atom 1.0 has been approved and official for some time, there’s a feed every now and then that still uses Atom 0.3 (i.e. Google News! [http://news.google.com/?ned=us&topic=w&output=atom](<http://news.google.com/?ned=us&topic=w&output=atom> "http://news.google.com/?ned=us&topic=w&output=atom")).

The .NET APIs for feeds, [System.ServiceModel.Syndication](<http://msdn.microsoft.com/en-us/library/bb412203.aspx>), handles RSS 2.0 and Atom 1.0 fine, and you just have to make a single call to load a feed regardless of its format:
    
    
    SyndicationFeed.Load(xmlReader);

I searched the web looking for an easy answer, but I couldn’t find any that would let me seamlessly plug into the .NET APIs to do the feed format upgrade on the fly. So I put one together myself ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

I found [Aaron Cope](<http://www.aaronland.info/>) had created [XSLT stylesheets to transform Atom 0.3 to RSS 1.0 and 2.0](<http://www.aaronland.info/xsl/atom/0.3/>), so I could use that. That used the [XSLT Standard Library](<http://xsltsl.sourceforge.net/>) too. So, I wanted something that would be blazingly fast and transparent to users of WCF: I wanted a [compiled XSLT](<http://msdn.microsoft.com/en-us/library/0610k0w4.aspx>) and a [custom XmlReader](<http://msdn.microsoft.com/en-us/magazine/cc302171.aspx>) layered on top!

So, after a couple very minor fixes, I got Aaron’s XSLT to compile with the following command:
    
    
    xsltc /out:Atom03ToRss20.dll /class:NetFx.ServiceModel.Syndication.Atom03ToRss20XslTransform atom03-to-rss20.xsl

That gave me an assembly I could reference, containing the specified type, which can be used as follows:
    
    
    var atom03ToRss20 = new XslCompiledTransform();
    atom03ToRss20.Load(typeof(Atom03ToRss20XslTransform));
    
    // transform the document with the compiled XSLT into an output writer
    atom03ToRss20.Transform(someXPathDocument, someXmlWriter);
    

That’s the fastest way of doing XSLT transformations in .NET, mind you.

Now for the custom XmlReader, I used a base class we created for the Mvp.Xml project, the [XmlWrappingReader](<http://www.codeplex.com/MVPXML/SourceControl/changeset/view/28478#258394>), which makes creating the derived [LegacyFeedXmlReader](<http://code.google.com/p/netfx/source/browse/trunk/Source/ServiceModel/Syndication/LegacyFeedXmlReader.cs>) a breeze:
    
    
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
    

Note how the reader will only run the transformation and expose the transformed content if the root element namespace matches that of Atom 0.3 ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) . So, for Atom 1.0 and RSS 2.0 feeds it will do nothing and delegate all calls to the underlying reader.

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

This code is part of the [NetFx](<http://code.google.com/p/netfx/>) project, a collection of utilities to augment various pieces of .NET. You can grab just the [Syndication folder](<http://code.google.com/p/netfx/source/browse/trunk/Source/ServiceModel/Syndication/>) if you want. The goal of the project is to provide reusable pieces that you can just use in isolation (i.e. linking or copy/pasting a file or a folder). For your convenience, you can also just [download the ZIP](<http://kzu.s3.amazonaws.com/public/NetFx.Syndication.zip>).

Enjoy!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=116679)

Posted by kzu
---
layout: post
title: "Daniel Cazzulino's Blog : XmlSerializerFactory caching issues and leaks"
date: 2008-11-13 00:00:00 +0000
---

Daniel Cazzulino's Blog : XmlSerializerFactory caching issues and leaks

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081223084449im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081223084449im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081223084449im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081223084449im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## XmlSerializerFactory caching issues and leaks 

You'd think that after the [serious leaks](http://www.google.com.ar/search?client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&channel=s&hl=en&q=xmlserializer%20leaks) people was hitting with the XmlSerializer, the "new" (in .NET 2.0!!! but which many seem to forget about, just like AVOID doing [new XmlTextReader in a PDC *keynote*](http://twitter.com/kzu/status/979325718 "My tweet in real-time from PDC on the mostruosity :\)")) [XmlSerializerFactory](http://msdn.microsoft.com/en-us/library/system.xml.serialization.xmlserializerfactory.aspx) would [do away with those](http://blogs.msdn.com/kaevans/archive/2006/03/08/546172.aspx). 

Well, bad news: you need to be AS careful as you are with the XmlSerializer in order to avoid those leaks (which are [BY DESIGN](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=98384), BTW). Turns out that apparently the same designer made the same "by design" decisions with the XmlSerializerFactory.

For those not using the factory yet: it was basically meant to be the cache of XmlSerializer types that you had to do manually in the past). If provides a factory method with all the same overloads the XmlSerializer receives and hands you back an instance of a serializer, supposedly caching the generated types (as the [documentation says](http://msdn.microsoft.com/en-us/library/system.xml.serialization.xmlserializerfactory_members.aspx): "Creates typed versions of the [XmlSerializer](http://msdn.microsoft.com/en-us/library/system.xml.serialization.xmlserializer.aspx) for more efficient serialization."). You can read my friend [Kirk's blog](http://blogs.msdn.com/kaevans/archive/2006/03/08/546172.aspx) on how to use the factory.

[Nowhere does the documentation mention](http://msdn.microsoft.com/en-us/library/system.xml.serialization.xmlserializerfactory.createserializer.aspx) that depending on which overloads you use, the cache will be in effect or not, JUST LIKE THE "good" old XmlSerializer!!! 

VERY easy repro:
    
    
    class Program
    {
        static void Main(string[] args)
        {
            var factory = new XmlSerializerFactory();
    
            var cached1 = factory.CreateSerializer(typeof(Foo));
            var cached2 = factory.CreateSerializer(typeof(Foo));
    
            // IT WORKS!!! RIGHT???
            Debug.Assert(cached1.GetType() == cached2.GetType());
    
            var serializer1 = factory.CreateSerializer(typeof(Foo), new XmlRootAttribute("foo"));
            var serializer2 = factory.CreateSerializer(typeof(Foo), new XmlRootAttribute("foo"));
            var serializer3 = factory.CreateSerializer(typeof(Foo), new XmlRootAttribute("foo"));
            var serializer4 = factory.CreateSerializer(typeof(Foo), new XmlRootAttribute("foo"));
    
            var allsame = serializer1.GetType() == serializer2.GetType();
            allsame &= serializer2.GetType() == serializer3.GetType();
            allsame &= serializer3.GetType() == serializer4.GetType();
    
            // FAIL!!!!!
            Debug.Assert(allsame);
        }
    }
    
    public class Foo { }

[](http://11011.net/software/vspaste)

Now, I understand the myriad of overloads supported by the class are hard to manage, but how hard do you think it is to create a smart cache key that properly compares if the XmlRootAttribute I'm passing, which has only four properties to compare, is the same I passed before and therefore hand me a cached type??

Very dissapointing. I had to (once again) implement this myself (on the [ULTIMATE serializable generics dictionary](http://code.google.com/p/netfx/source/browse/trunk/Source/Collections/Generic/SerializableDictionary.cs) I'll EVER need to write, which I'll blog about sometime...). This time I even used dynamic method generation to have a blazingly fast instantiation of the cached generated type :). Another time I said... 

Anyway, [please vote for the bug](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=381858) so this gets fixed (hopefully it's not too late for C# 4.0!).

posted on Thursday, November 13, 2008 7:42 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/112025.aspx) :: 

  

[![](/web/20081223084449im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
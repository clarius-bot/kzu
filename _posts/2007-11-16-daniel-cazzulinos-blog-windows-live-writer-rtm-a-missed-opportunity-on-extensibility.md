---
layout: post
title: "Daniel Cazzulino's Blog : Windows Live Writer RTM: a missed opportunity on extensibility"
date: 2007-11-16 00:00:00 +0000
---

Daniel Cazzulino's Blog : Windows Live Writer RTM: a missed opportunity on extensibility


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080907143945im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080907143945im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080907143945im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080907143945im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Windows Live Writer RTM: a missed opportunity on extensibility 

The [Window Live suite final version](http://get.live.com/) was finally released. I've been following quite closely its evolution since Beta2, and have done a quite complicated (although not from the point of view of the end user) plugin which goes quite deep into WLW libraries (deeper than I dare to confess, if you know what I mean ;)).

What works:

  1. Plugins are easy to author for simple cases: adding "body" content via a plugin is very easy. Pretty much anybody can cook a plugin in a matter of minute.s 
  2. Good deploy options: can deploy plugins to WLW\Plugins folder or to your own folder anywhere on disk. This is good if your company plans to provide many plugins, and you want to avoid polluting the "main" plugins folder. Also good to place documentation and other assets in a single place. 
  3. Cool "design-time" experience: smart content works very much like ASP.NET controls. Plugins add them, but you can't modify them in-place in the post body, you have to go through your plugin properties dialog or sidebar. 
  4. Broad blog engine support: with support for LiveJournal, MovableType, MSN Spaces, Blogger, Metaweblog and Atom (both 0.3 and 1.0) APIs, it covers pretty much every blog engine in existence.

What doesn't work:

  1. Plugins can only add "body" content: remember how the whole point of RSS/Atom was to provide an *extensible* XML format that can be augmented with elements from other namespaces in addition to the "description"/"content" and title? Well, **WLW does not allow** ANY kind of authoring of that **extensible content** by plugins. It's basically absolutely impossible, not even using ugly private reflection.   
  
The problem goes all the way down to the way it represents an `AtomEntry` internally, which is just a `Title` and `ContentHtml`. Very unfortunate. The `BlogPost` class, however, does have a `MainContents` and `ExtraContents` properties, but they are simply concatenated in the body :S. 
  2. Blog providers aren't extensible: when I saw the `WindowsLive.Writer.BlogClient.Providers.BlogProvider` namespace, I thought this would be a very good place to start solving the previous issue. I just have to create a new provider that knows how to take the `ExtraContents` property and post it alongside the body (instead of *inside* the body). There are a number of reasons why this is impossible as currently designed: 
     * The IBlogProvider interface doesn't provide the methods for actually posting to the blog. It's more of the interface for the XML providers configuration. 
     * The list of providers is being pulled from the web (from <http://g.msn.com/4SAWLWww/BlogProviders>, which redirects to <http://spaces.live.com/editorial/writer/BlogProvidersB5.xml> which is also interesting to look at to learn the differences between the supported engines). This can fortunately be overriden from your plugin by using the user settings functionality:  

           
           ApplicationEnvironment.UserSettingsRoot.GetSubSettings("glinks").SetString("BlogProviders", myAlternativeProvidersList);

This provider list contains a clientType element which tells WLW which is the actual "blog client" type to load, which is the one that performs the actual operations against the blog engine. Unfortunately, the list of blog client provider types is *hardcoded* in a *private* static property inside the BlogClientManager. It almost hurts to see this:  

           
           private static IList get_ClientTypes()  
           {  
               lock (_classLock)  
               {  
                   if (_clientTypes == null)  
                   {  
                       _clientTypes = new ArrayList();  
                       AddClientType(typeof(Blogger2Client));  
                       AddClientType(typeof(LiveJournalClient));  
                       AddClientType(typeof(MetaweblogClient));  
                       AddClientType(typeof(MovableTypeClient));  
                       AddClientType(typeof(WindowsLiveSpacesClient));  
                       AddClientType(typeof(GenericAtomClient));  
                       AddClientType(typeof(BloggerAtomClient));  
                       AddClientType(typeof(SharePointClient));  
                       AddClientType(typeof(WordPressClient));  
                   }  
                   return _clientTypes;  
               }  
           }  
             
           
           

This is especially sad since all the blog client types are public, and you could conceivable create your own client without resorting to any hacks. You even have an attribute on your blog client that is used to match the configuration pulled from the web:  

           
           [BlogClient("Blogger2")]  
           public class Blogger2Client : BloggerCompatibleClient 

  3. Minor documentation/implementation bug on plugin folder registration: according to the [Distributing Plugins guide](http://msdn2.microsoft.com/en-us/library/aa738841.aspx), you have to register the folder for your plugin in the SOFTWARE\Windows Live\Writer\PluginAssemblies key. I couldn't get it to work and instead had to register on the older one at SOFTWARE\Windows Live Writer\PluginAssemblies.

The combination of lack of support for extended XML elements in the item payload, and the impossibility to extend the blog providers/clients, means that WLW is out of the game for serious uses of RSS/Atom feeds outside of the most basic publishing scenarios (i.e. forget about enabling geo-tagging your entries, for example, unless you use an (X)HTML ["in-body"](http://en.wikipedia.org/wiki/Geo_%28microformat%29 "Geo microformat at Wikipedia") [microformat](http://en.wikipedia.org/wiki/HCalendar "hCalendar microformat at Wikipedia")).

posted on Friday, November 16, 2007 7:41 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/11/16/41821.aspx#41829 "permalink") Windows Live Writer RTM: a missed opportunity on extensibility @ Friday, November 16, 2007 8:12 AM

The Window Live suite final version was finally released. I've been following quite closely its evolution [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/11/16/windows-live-writer-rtm-a-missed-opportunity-on-extensibility.aspx "TrackBack")

  

[![](/web/20080907143945im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
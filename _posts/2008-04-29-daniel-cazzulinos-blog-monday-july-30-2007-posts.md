---
layout: post
title: "Daniel Cazzulino's Blog : Monday, July 30, 2007 - Posts"
date: 2008-04-29 00:00:00 +0000
---

Daniel Cazzulino's Blog : Monday, July 30, 2007 - Posts


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2982'\))| April 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3043'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| 7| 8| 9| 10| 11| 12  
13| 14| 15| [16](http://www.clariusconsulting.net/blogs/kzu/archive/2007/7/16.aspx "1 Post")| 17| 18| 19  
20| 21| 22| 23| 24| 25| 26  
27| 28| 29| [30](http://www.clariusconsulting.net/blogs/kzu/archive/2007/7/30.aspx "2 Posts")| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080429195256im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080429195256im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080429195256im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080429195256im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Monday, July 30, 2007 - Posts

#####  [Setting HTTP headers in .NET: This header must be modified using the appropriate property](http://www.clariusconsulting.net/blogs/kzu/archive/2007/07/30/29105.aspx)

If you're trying to set HTTP headers such as If-Modified-Since (to do conditional GET based on the previous request Last-Modified response header, which you should strive to do as much as possible), you may come across this error message.

This happens if you're trying to set these headers through WebRequest.Headers.Set (or Add), when the request instance you got is an HttpWebRequest. This class provides explicit properties to set those values, and what the message is (quite unsuccessfully IMO) trying to tell you is that you should downcast to HttpWebRequest, and set the headers through its properties, such as IfModifiedSince.

If you're using WebClient you'll get the same exception, as it doesn't downcast to set the headers either.

To summarize:

Wrong:
    
    
    WebRequest request = WebRequest.Create("http://example.com/index.html");
    request.Headers.Add("If-Modified-Since", previousValue);
    
    try
    {
    	using (WebResponse response = request.GetResponse())
    	{
    		// Do something if the resource has changed.
    	}
    }
    catch (WebException wex)
    {
    	HttpWebResponse httpResponse = wex.Response as HttpWebResponse;
    	if (httpResponse.StatusCode = HttpStatusCode.NotModified)
    	{
    		// resource was not modified.
    	}
    
    	// Something else happened. Rethrow or log.
    	throw;
    }
    

Right:
    
    
    **HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://example.com/index.html");
    // Note that previousValue is a DateTime now!
    request.IfModifiedSince = previousValue;**
    
    try
    {
    	using (WebResponse response = request.GetResponse())
    	{
    		// Do something if the resource has changed.
    	}
    }
    catch (WebException wex)
    {
    	HttpWebResponse httpResponse = wex.Response as HttpWebResponse;
    	if (httpResponse.StatusCode == HttpStatusCode.NotModified)
    	{
    		// resource was not modified.
    	}
    
    	// Something else happened. Rethrow or log.
    	throw;
    }
    

In the case of the If-Modified-Since it makes a lot of sense, since the request class will take care of serializing the DateTime in a consistent format without you having to care about it (same as with the returned HttpWebResponse.LastModified).

Also, note that when doing conditional GET, the "not modified" response (HTTP 304 status code) actually generates an exception that you need to catch and recover gracefully from (i.e. doing nothing ;)). I find this behavior very much an anti-pattern, as it's a perfectly valid response to get a 304, which I could check inmediately after getting the response, like so:
    
    
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://example.com/index.html");
    request.IfModifiedSince = previousValue;
    
    using (WebResponse response = request.GetResponse())
    {
    	**if ((HttpWebResponse)response).StatusCode == HttpStatusCode.NotModified)**
    		return;
    
    	// Do something if the resource has changed.
    }
    

posted [Monday, July 30, 2007 8:05 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2007/07/30/29105.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2007/07/30/29105.aspx#comments)

#####  [I couldn't care less about documentation](http://www.clariusconsulting.net/blogs/kzu/archive/2007/07/30/29103.aspx)

I've been subconsciously hunt by this statement I made during the last MVP Summit among a bunch of very smart people, specially because I'm pretty sure I was misinterpreted as I didn't have a chance to explain my assertion.

I do care about code documentation, clarity, and self-explaining code. You can tell how much I (and the rest of the development team I worked with) care if you take a look at the source code for the Composite UI Application Block. I frequently use the Documentor extension to VS heavily to help me create nice-looking code comments. I do believe [if a feature is not documented, for all practical purposes it's as if it doesn't exist](http://www.codinghorror.com/blog/archives/000776.html).

What I don't care at all is about the debate we were having about [Sandcastle](http://blogs.msdn.com/sandcastle/) vs [NDoc](http://ndoc.sourceforge.net/), and which tools you use to generate documentation, packaging format (do you use a chm? an hxs? html?), etc. In my mind, those are things that should happen automatically when I do "File -> New Project" (setting up the MSBuild tasks to do everything automatically on release builds). I shouldn't have to worry about any of that. Even today, once the continuous integration is running and configured to generate the docs automatically, I can simply forget about it, almost forever. That's why I said I couldn't care less about it. 

posted [Monday, July 30, 2007 8:04 AM](http://www.clariusconsulting.net/blogs/kzu/archive/2007/07/30/29103.aspx) by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004) with [1 Comments](http://www.clariusconsulting.net/blogs/kzu/archive/2007/07/30/29103.aspx#comments)

  

[![](/web/20080429195256im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog - Monday, July 30, 2007 - Posts"
date: 2008-04-29 00:00:00 +0000
---

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

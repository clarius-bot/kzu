---
layout: post
title: "Setting HTTP headers in .NET: This header must be modified using the appropriate property"
date: 2007-07-30 00:00:00 +0000
---

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
    

/kzu

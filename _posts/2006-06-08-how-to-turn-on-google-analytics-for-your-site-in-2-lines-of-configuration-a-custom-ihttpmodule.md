---
layout: post
title: "How to turn on Google Analytics for your site in 2 lines of configuration: a custom IHttpModule"
date: 2006-06-08 00:00:00 +0000
---

##  [How to turn on Google Analytics for your site in 2 lines of configuration: a custom IHttpModule](<http://blogs.clariusconsulting.net/kzu/how-to-turn-on-google-analytics-for-your-site-in-2-lines-of-configuration-a-custom-ihttpmodule/> "How to turn on Google Analytics for your site in 2 lines of configuration: a custom IHttpModule")

June 8, 2006 7:10 am

Ok, so I got excited with [Google Analytics](<http://www.google.com/analytics>) , thanks to [Scott Hanselman](<http://www.hanselman.com/blog/GoogleAnalyticsItDoesntSuck.aspx>). So I decided to give it a quick try. 

Turns out, you cannot give it a quick try unless you start changing your site's pages to include a piece of script before the </body>… yuck!

I searched the web and found no one who had done the simplest possible thing to have transparent support for Google Analytics on your site without touching a single page: a custom IHttpModule that uses the HttpResponse.Filter property to detect </body> and add the script automatically before sending the buffered output. 

If your site is not a high-traffic, performance-sensitive one (i.e. your corporate site/blog/small community site), you may find this little guy useful (note that I only had about 20′ to get it working ![;-\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) ). Download the [module for .NET v.2.0](<http://clariusconsulting.net/kzu/GoogleAnalyticsModule.cs.v2.txt>) or [the one for .NET 1.1](<http://clariusconsulting.net/kzu/GoogleAnalyticsModule.cs.v1.txt>). Configuration is mininal:

<  
configuration  
>

<  
appSettings  
>

<  
add  
  
  
key  
=“GoogleAnalyticsAccount“value=“[Google Analytics Account #]“/>

</  
appSettings  
>

<  
connectionStrings  
/>

<  
system.web  
>

<  
compilation  
  
  
debug  
=“true“/>

<  
authentication  
  
  
mode  
=“Windows“/>

<  
httpModules  
>

<  
add  
  
  
name  
=“GoogleAnalytics“type=“Clarius.GoogleAnalyticsModule“/>

</  
httpModules  
>

</  
system.web  
>

</  
configuration  
>

Enjoy!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=538)

Posted by kzu

---
layout: post
title: "Daniel Cazzulino's Blog - Integrating SMS-based data entry with geographical visualization: a TED demo"
date: 2008-02-29 00:00:00 +0000
---

## Integrating SMS-based data entry with geographical visualization: a TED demo 

For the past couple weeks, [we]( "Clarius Consulting")'[ve](http://www.instedd.org/ "InSTEDD") been very busy putting together a prototype that was running at an [InSTEDD](http://www.instedd.org/) booth in the prestigious [TED](http://www.ted.com/) conference. Of anecdotal interest is the fact that it's the first time in TED's history that such a demo is run remotely from South America (Buenos Aires, Argentina, in this case :)). 

The purpose was to show how deep-field data collection can be performed using ubiquitous and generally cheap (in some places even free!) text messages from cell phones (a.k.a. SMS), and how that data can be surfaced quite easily in geographically meaningful representations (i.e. Google Earth, Google Maps and Microsoft Virtual Earth) to support decision making in scenarios such as pandemic/outbreak detection and disaster/emergency responses. Also very important was to show that such a mechanism by no means has to be one-way.

You can go to the [live demo site](http://www.tedster.org/) right now if you're eager to see the real thing :). *

Let's first see what's in there from the functionality point of view. Later on, I'll talk about the various technologies we used to make this possible (all of it available on the web for free).

## The Prototype

  * See a tag cloud generated from tags detected in the incoming messages:  
  
[![image](/web/20080504005059im_/http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image.png)   

  * See the most recently received messages, either from direct SMS (*) to our server or Twitter:  
  
[![image](/web/20080504005059im_/http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_thumb_3.png)](http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_3.png)  

  * Visualize all messages, or those matching a given tag, on Google Earth, Google Maps and Microsoft Virtual Earth:  
  
[![image](/web/20080504005059im_/http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_thumb_4.png)](http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_4.png)  
  
[![image](/web/20080504005059im_/http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_thumb_5.png)](http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_5.png)  
  
[![image](/web/20080504005059im_/http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_thumb_6.png)](http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_6.png)  

  * Show relative "weight" according to message count by region (country or province), for the selected tag (if any):  
  
[![image](/web/20080504005059im_/http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_thumb_7.png)](http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_7.png)  

  * Enable responses to be sent to a given individual right from the geographical visualization:  
  
[![image](/web/20080504005059im_/http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_thumb_8.png)](http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_8.png)  
(also works from Google Maps and Virtual Earth)  

  * See timeline with the path traveled by every individual (timestamped so you can "replay" it in Google Earth).   
In a screenshot, this is just the lines connecting the bubbles as you see above. A video of Google Earth "replaying" the sequence would be more appropriate here, as it would show the messages appearing together with the line departing from the previous message from the same individual.  

  * Enable group replies by country and/or tag:  
  
[![image](/web/20080504005059im_/http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_thumb_9.png)](http://www.clariusconsulting.net/images/blogs/kzu/IntegratingSMSbaseddataentrywithgeograph_12E7A/image_9.png)

The demo is quite compelling I think, and the messages being exchanged simulate an H5N1 (a.k.a. bird influenza) outbreak in Southeast Asia. 

## The Technology

For the demo, we used C#, plus the following tools:

  * SMS gateway: we connected a regular Windows Mobile phone to the server, and used the [MSR India](http://research.microsoft.com/aboutmsr/labs/india/)[SMS Toolkit](http://www.codeplex.com/smstoolkit) to receive incoming messages sent to it. 
  * Twitter bot: we used the [twitter bot framework](http://instedd.org/twitterbots) we had already created for [another project](http://instedd.org/contactsnearby "Contacts Nearby"), which is [open source](http://code.google.com/p/twitterbots/).
  * [KML](http://code.google.com/apis/kml/documentation/) creation: we used [LINQ to XSD](http://blogs.msdn.com/xmlteam/archive/2008/02/21/linq-to-xsd-alpha-0-2.aspx "Microsoft XML Team announcement"), which conveniently enough was released (*preview alpha 0.2*, can't get any more scary than that, eh?) about a week ago!
  * [GeoRSS](http://www.georss.org/): for this we created our own data model. The original code was created for [Golden Shadow](http://instedd.org/goldenshadow "Golden Shadow demonstration project page at InSTEDD") last year, so we didn't have WCF 3.5 [SyndicationFeed](http://www.clariusconsulting.net/blogs/kzu/archive/2007/11/22/ForgetaboutwritingAtomorRSSXMLhandlingcodeeveragain.aspx) yet.
  * VS Web Developer "server": because of some COM-related issues, we couldn't use the [SMS Toolkit](http://www.codeplex.com/smstoolkit) from IIS, so we had to do with VS built-in ASP.NET server. In order for it to "accept" requests originating outside the localhost, we used:
  * [PortTunnel](http://www.steelbytes.com/?mid=18): this nice app allowed us to tunnel external incoming on port 80 requests as if they were originated in the localhost to port 81 :). Details on that for another post..

All in all, we had great fun developing this, and I'm convinced this mashup of existing technologies and tools can be applied to humanitarian scenarios with great success. It's been a thrilling experience putting this together for TED.

Will follow-up with details about the [technologies and open source projects](http://instedd.org/technology_field_lab) we're contributing to the community :).

/kzu

* sending direct SMS messages is no longer working as the TED demo finished. You can still tweet ted08 and have the messages appear.  
Also, we're no longer on-site monitoring the demo server/wesite, so it may be down sporadically (see all the alpha/ctp/preview stuff we're using? ;)), so please be patient. 

/kzu

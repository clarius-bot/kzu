---
layout: post
title: "Daniel Cazzulino's Blog - How to tweet automatically when you push a new package to nuget.org"
date: 2013-06-17 00:00:00 +0000
---

##  [How to tweet automatically when you push a new package to nuget.org](<http://blogs.clariusconsulting.net/kzu/how-to-tweet-automatically-when-you-push-a-new-package-to-nuget-org/> "How to tweet automatically when you push a new package to nuget.org")

June 17, 2013 2:59 pm

Wouldn’t it be nice if your followers could be notified whenever you publish a new version of a NuGet package? Currently, nuget.org offers no support for this, but with the following tricks, you can get it working without programming.

The essential idea is to use the OData feed that nuget.org exposes to build an RSS feed with new items as you publish them, and have [IFTTT](<http://ifttt.com/>) do the tweeting from it.

The tools we’ll use to get this working are:

  1. [LinqPad](<http://linqpad.net/>): to examine the nuget.org OData feed at <https://nuget.org/api/v2>
  2. [Yahoo Pipes](<http://pipes.yahoo.com/>): to tweak the OData feed output so that it looks like a “plain” feed
  3. [IFTTT](<http://ifttt.com/>): to consume the pipe output and auto-tweet on new items

## Exploring NuGet OData Feed with LinqPad

In order to build the query that will become your tweets’ source, we will add a new connection in LinqPad by clicking on the “Add Connection” link:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image6.png)

Make sure you pick WCF Data Services in this dialog and enter the OData Url <https://nuget.org/api/v2> in the next screen:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image7.png)

After the connection is set up and selected as the active connection in a new query, you can use Linq like the following:
    
    
    Packages
        .Where (p => p.Authors.Contains("kzu") || p.Authors.Contains("Daniel Cazzulino"))
        .OrderByDescending(p => p.Published)
        .Select(p => new { p.Id, p.Title, p.GalleryDetailsUrl, p.Published })
        .Take(10)

Which will run in LinqPad and show the results as follows:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image8.png)

Note how the entire set of available properties for querying is shown under the connection on the left pane. Also, if you have the premium version of LinqPad, you’ll get very nice intellisense for all available types and operators.

The feed exposes all versions available for the same package, which is normal (and unavoidable, since there’s no support for Distinct here AFAIK). The ordering by Published will take care of getting the newest items first. 

Once you’re happy with the results, you can click the Request Log tab and get the actual Url for that query:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image9.png)

I first tried to use this Url directly in IFTTT, but it didn’t work. The service complied that it was not a standard feed. And it’s true, since the information for an item in OData looks like the following:
    
    
    <entry>
      <id>https://nuget.org/api/v2/Packages(Id='NuDoc',Version='0.4.1306.1409')</id>
      <title type="text">NuDoc</title>
      <summary type="text"></summary>
      <updated>2013-06-17T10:13:16Z</updated>
      <author>
        <name>Daniel Cazzulino,  kzu,  Clarius Labs</name>
      </author>
      <link rel="edit-media" title="V2FeedPackage" href="Packages(Id='NuDoc',Version='0.4.1306.1409')/$value" />
      <link rel="edit" title="V2FeedPackage" href="Packages(Id='NuDoc',Version='0.4.1306.1409')" />
      <category term="NuGetGallery.V2FeedPackage" scheme="http://schemas.microsoft.com/ado/2007/08/dataservices/scheme" />
      <content type="application/zip" src="https://nuget.org/api/v2/package/NuDoc/0.4.1306.1409" />
      <m:properties xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices">
        <d:GalleryDetailsUrl>https://nuget.org/packages/NuDoc/0.4.1306.1409</d:GalleryDetailsUrl>
        <d:Published m:type="Edm.DateTime">2013-06-14T06:58:00.087</d:Published>
        <d:Title>NuDoc: A .NET XML API Documentation Reader</d:Title>
        <d:Summary m:null="true"></d:Summary>
      </m:properties>
    </entry>

Clearly from the standard Atom properties we can’t do much: the title is actually the package Id and the links point to OData-formatted URLs whereas we’d typically like to point users to the nuget.org package page instead. The actual Url we’re interested in is inside a custom m:properties element, as d:GalleryDetailsUrl. We need to extract that info and make it part of the Atom/RSS entry itself.

## Tweaking Feeds with Yahoo Pipes

Yahoo Pipes is a rarely used but insanely useful [free service by Yahoo](<http://pipes.yahoo.com/>) that enables arbitrary web mashups without writing a single line of code. In our case, we’ll use it to fetch the OData feed, and rewrite it as standard RSS, by projecting the properties we want from OData. 

Head over to the [Yahoo Pipes](<http://pipes.yahoo.com/>) site, sign in and click the big blue [Create a pipe](<http://pipes.yahoo.com/pipes/pipe.edit>) button.

Drop a Fetch Feed source onto the designer and paste your OData Url in the Url field of the widget:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image10.png)

While widgets are selected in the designer, Yahoo Pipes will run the configured action and show a preview of the output in the Debugger pane. This is very useful to see how your output is progressing through the modules. If we expanded the first node now, we’d see a tree representation of the same Atom entry we saw above:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image11.png)

Next we’ll use the Rename operator to “lift” the link and title from within m:properties. Yahoo Pipes simplifies XML manipulation by letting you forget about namespaces and their added complexity. You can reference a node by name just as it appears on the above tree. So if you want to rename the d:Title, you just reference it as item.m:properties.d:Title from the Rename module. “item” refers to the current item in the feed, and you use dots to navigate down the tree. The node label is all you need to keep navigating or retrieve a value.

In the module configuration we use item.m:properties.d:Title, item.m:properties.d:GalleryDetailsUrl and item.m:properties.d:Published and renames them as title, link and pubDate respectively. You just need to connect the output of the Fetch Feed to the Rename module and you’ll immediately see how it’s turning out:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image12.png)

Now this is very close to what we need. In terms of the entries, we’re done! Note that the entry id properly points to a Url that is indeed unique within nuget.org for the package and version. This is good as it means we can use it as-is for the feed, since this id is used by IFTTT to determine if an entry is a new one or not (we only want to publish once when they are new). The problem, however, is that it’s based on the underlying OData implementation. It seems safer to use the package web address as a unique identifier. Also, we can get rid of all the other stuff we don’t need in IFTTT. This is not strictly necessary, and we could be done with this now, but it’s neater if we go just a bit further. 

We’ll use another couple modules for this: the Loop operator with a nested RSS Item Builder one:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image13.png)

Things to note from this screenshot:

  * We connected the Rename module to the Loop module. This enables the dropdowns in the RSS Item Builder to populate with properties coming from the Rename module
  * We have to select the “emit all results” radio button, since we want one RSS item for each source item
  * Finally we connect the loop to the pipe output. 

Once we’re done and saved the pipe after giving it a name, we can run it to see how it looks:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/06/image14.png)

We will copy the “Get as RSS” link and use in the next step.

## Tweeting from IFTTT

This is the easiest part, and [Scott has already explained the basis of IFTTT](<https://bit.ly/QFQJYM>) better than I could. You just activate your Twitter channel, and pick if[Feed]then[Twitter]. 

I’ve configured my IFTTT Twitter action as: just pushed new version of {{EntryTitle}} #nuget {{EntryUrl}}

You can see it in action in this tweet: <https://twitter.com/kzu/status/345444465114234880>

I’ve found that having both IFTTT and Yahoo Pipes in my toolset, you can get the web to work for you, automatically and without programming ![Sonrisa](http://blogs.clariusconsulting.net/kzu/files/2013/06/wlEmoticon-smile.png).

Enjoy!

/kzu

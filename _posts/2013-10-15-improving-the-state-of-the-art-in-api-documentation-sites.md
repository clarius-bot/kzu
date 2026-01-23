---
layout: post
title: "Improving the state of the art in API documentation sites"
date: 2013-10-15 00:00:00 +0000
---

##  [Improving the state of the art in API documentation sites](<http://blogs.clariusconsulting.net/kzu/improving-the-state-of-the-art-in-api-documentation-sites/> "Improving the state of the art in API documentation sites")

October 15, 2013 4:04 pm

Go straight to the site if you want: [http://nudoq.org](<http://nudoq.org/>). You can then come back and continue reading ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)

Compare some of the most popular NuGet packages API documentation sites:

  * [Json.NET](<http://james.newtonking.com/json/help/index.html>)
  * [EntityFramework](<http://msdn.microsoft.com/en-us/library/system.data.entity\(v=vs.103\).aspx>)
  * [NLog](<http://nlog-project.org/documentation/v2.0.1/>)
  * [Autofac](<http://autofac.org/apidoc/>)

You see the pattern? Huge navigation tree views, static content with no comments/community content, very hard (if not impossible) to search/filter, etc.

These are the product of automated tools that have been developed years ago, in a time where CHM help files were common and even expected from libraries. Nowadays, most of the top packages in NuGet.org don’t even provide an online documentation site at all: it’s such a hassle for such a crappy user experience in the end!

Good news is that it doesn’t have to be that way.

## Introducing NuDoq

A lot has changed since those early days of .NET. We now have NuGet packages and the awesome channel that is [http://nuget.org](<http://nuget.org/>). We can certainly do better! 

Here’s an explanation of what it is, straight from the site’s home page:

* * *

**TL;DR**

  * __Fast indexing and quick search (tree views are so 90′s!)
  * __Community involvement via discussions and wiki-style content contributions
  * __Automatically updated from[NuGet.org](<http://www.nuget.org/>) packages (ALL of them!) 
  * __Automatic grouping of packages by project and cross linking
  * __Offline support: just download a zip file!

* * *

NuDoq provides the missing link between straightforward access and updates to NuGet packages, and their corresponding API documentation. If you’re familiar with tools like Sandcastle and NDoc, they were built for an entirely different era: that of static documentation, with no community involvement, no peer-to-peer support, no frequently updated packages!

With all of the new shiny technologies available at our disposal, why limit ourselves to 90′s looking documentation sites, with no built-in search or filter, with endless tree views that take forever to navigate, and so on?

In short, NuDoq is:

> ___Socialized API documentation for the XXI century_

### Community

We know how much better community-driven content can be, compared to the official documentation on pretty much every open source project. The rich discussions among actual users of a feature, their tips and tricks, and innovative usage of a library. All of that is sometimes even more important than the actual API documentation itself.

NuDoq embraces the community by including a Disqus thread for every page of content (i.e. project landing page, package, assembly, namespace and all public members), as well as a wiki-style section of content that can be edited by anyone with a GitHub account.

### Feedback

We want to make NuDoq the best API documentation platform ever and we value immensely your feedback on how to make it better. We’d love to hear your ideas, bugs or comments on our [feedback forums](<https://nudoq.uservoice.com/>) .

If you want to leverage the platform for your own privately hosted NuGet feeds, [contact us](<https://web.archive.org/web/20131026022609/mailto:hello@nudoq.com>).

## Why NuGet?

NuGet is quickly becoming the de-facto distribution mechanism for libraries for all things .NET, and [not just for Windows](<https://github.com/mrward/monodevelop-nuget-addin>). Even the[.NET framework has started to move](<http://blogs.msdn.com/b/dotnet/p/nugetpackages.aspx>) towards more fine-grained packages that will be delivered via [NuGet.org](<http://www.nuget.org/>).

So why not leverage the tremendous potential of having centralized repositories of most (eventually all?) packages to build a unified API documentation layer on top?

One of the key benefits of using NuGet to drive the API documentation site is that NuDoq can provide

___Automatically updated API documentation when NuGet packages are published_

So now the same XML documentation that’s shipped with NuGet packages to drive intellisense tooltips within the IDE, is used to drive a corresponding site, _automatically_ and _seamlessly_.

### How it works

We regularly poll [NuGet.org](<http://www.nuget.org/>) for the latest package updates, unpack and process the library documentation files, and update the site accordingly.

To improve the searching experience, we group packages by project, like [Autofac](<http://www.nudoq.org/#/Projects/Autofac>). This allows you to easily and quickly locate the documentation and associated discussions.

If you’re a project author and want to tune the way we group your packages or make any other suggestions, feel free to [contact us](<https://web.archive.org/web/20131026022609/mailto:hello@nudoq.com>).

Yes, this might have just been a hugely overkill solution to [Moq’s lack of an API documentation site](<https://moq.uservoice.com/forums/11304-general/suggestions/1726871-please-fix-the-broken-api-documentation-link-i-w>), but it surely was fun and I hope you find it useful too!

/kzu

---
layout: post
title: Static GitHub powered blog engine
date: 2012-11-04 00:00:00 +0000
tags:
- msbuild
- .NET
- All Technology
- ef
- XML
---
Blog engines were the new "cool thing to write" after the fever of writing a new DI framework was over. It was kinda like the new "hello world++" example. Almost every single engine uses a database of some sort to keep posts and comments. Almost every one is not leveraging the web as a consequence ![;\)](/img/2012-11-04-1.gif)

I was intrigued by the possibilities that a flexible and general-purpose hosting solution like Github could offer for a static blog engine: basically keeping plain markdown/HTML/razor/WLW/whatever files that through a publish/build time process generate static files that pass for a "blog engine". GitHub even supports custom domain names, so why not?

Such an "engine" would have a number of benefits:

  * Plain CSS styling 
  * Arbitrary JavaScript 
  * Leverage the web infrastructure (caching, CDNs, etc.) 
  * Easy to restyle: just change templates, and rebuild 
  * Hosting anywhere, including plain Amazon S3 

Comments and trackbacks are trickier, but the "app server-less" plus is just too compelling.

I even found a couple projects that actually do this, using Ruby or Phython for the build/transform on publish. Just search for "static blog engine".

But I found that they didn’t leverage GitHub’s native capabilities. What if comments on the blog were just GitHub comments on the entry source itself? That would mean that as the blog admin, I could get to moderate and reply using standard github interface, or even answer by email.

Anyone could also just branch my blog and send pull requests whenever my samples or content could use some improvement. It could even be the basis for some wiki-style collaborative editing of sorts, with the built in versioning and diff viewer that works so great for code.

Maybe this is a service a third party site could provide automatically: using a GitHub service hook it could automatically pull changes, build static site and check back in the updates. And when users want to comment, automatically ask in a nice UI for GitHub credentials (maybe even registering you automatically if you want to?). Maybe even allow "anonymous" comments by using a well-known GitHub account just for this purpose? And it could also take care of creating trackbacks as comments too…

The cool thing about such a service, is that it could evolve to support multiple input formats and template languages for the static site building phase, and maybe even provide migration tools if you want to switch formats.

What else does a "proper" blog engine buy you that would render this idea useless? Is it just stupid or actually makes sense?

/kzu

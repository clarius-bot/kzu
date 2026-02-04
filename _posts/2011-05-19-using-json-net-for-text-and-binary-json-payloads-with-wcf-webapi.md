---
layout: post
title: "Daniel Cazzulino's Blog - Using Json.NET for text and binary Json payloads with WCF WebApi"
date: 2011-05-19 00:00:00 +0000
---

## Using Json.NET for text and binary Json payloads with WCF WebApi

There is anaging post by Christianon how to use theawesome Json.NET libraryas a default serializer for the new WCF Web Api.

Rather than having two media type formatters (in the latest bits lingo), I wanted to have a single one and have it pick the flavor of Json/Bsonon the fly depending on the accept header on the request. This makes configuration simpler as you have to add only one formatter to the pipeline:

```
var config = HttpHostConfiguration.Create();
config.Configuration.OperationHandlerFactory.Formatters.Insert(0, new JsonNetMediaTypeFormatter());
```

The code above adds the formatter at thebeginning of the pipelineas suggested by@gblock.

Even simpler is to use just an extension method over the configuration:

```
var config = HttpHostConfiguration.Create().UseJsonNet()
```

Given the simplicity of this class, this doesn’t deserve anything less but being aNETFxNuGet. Goget itor search forWebApi,Json.NETorMediaTypeFormatterin the package library dialog in VS (doesn’t work if you enter multiple words):

![Confused smile](http://blogs.clariusconsulting.net/kzu/files/2011/05/wlEmoticon-confusedsmile.png)

![image](http://blogs.clariusconsulting.net/kzu/files/2011/05/image28.png)

The correspondingunit tests are available too.

Enjoy!

/kzu

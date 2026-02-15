---
layout: post
title: Using Json.NET for text and binary Json payloads with WCF WebApi
date: 2011-05-19 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/using-json-net-for-text-and-binary-json-payloads-with-wcf-webapi
tags:
- .NET

---

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

![Confused smile](/img/2011-05-19-1.png)

![image](/img/2011-05-19-2.png)

The correspondingunit tests are available too.

Enjoy!

/kzu

---
layout: post
title: "Querying WCF endpoints using Web API"
date: 2011-05-19 00:00:00 +0000
---

##  [Querying WCF endpoints using Web API](<http://blogs.clariusconsulting.net/kzu/querying-wcf-endpoints-using-web-api/> "Querying WCF endpoints using Web API")

May 19, 2011 9:46 pm

In previous versions of the [Web API](<http://wcf.codeplex.com/>), you [could query your REST endpoints](<http://codebetter.com/glennblock/2010/11/01/wcf-web-apis-http-your-way/>) that exposed an IQueryable<T> server-side, kinda “Linq to WCF” as [@gblock](<http://twitter.com/#!/gblock>) said. This was immensely useful and an important driver (among others) for me to move away from ~~Astoria~~ ADO.NET Data Services. That functionality is [gone](<http://twitter.com/#!/gblock/status/70315843627659264>) now ([vote to get it back](<http://wcf.codeplex.com/workitem/41>)!).

So I was wondering how to bring it back. Would I need to refactor the monstrous (as in big, not ugly) [OData client source](<http://odata.codeplex.com/SourceControl/list/changesets>) to reuse just the Uri query translator? This started to look like a daunting task.

Fortunately, after a few back & forth and spelunking in Reflector and the source code, I figured out a way to essentially reuse the entire query translator from the OData services client (built-in .NET 4.0 in the System.Data.Services.Client namespace) and layer it on top of the [HttpClient](<nuget.org/List/Packages/httpclient>). Awesomeness ensued ![Smile](http://blogs.clariusconsulting.net/kzu/files/2011/05/wlEmoticon-smile3.png). Here’s a [test](<http://netfx.codeplex.com/SourceControl/changeset/view/53244828f9cc#Extensions%2fSystem%2fNet%2fHttp%2fHttpClientQuery%2fTests%2fHttpClientQuerySpec.cs>) from the [NETFx](<http://netfx.codeplex.com/>) [NuGet](<http://nuget.org/>) that shows how it works:
    
    
    [Fact]
    public void WhenQuerying_ThenGetsResponse()
    {
        var config = HttpHostConfiguration.Create();
        config.Configuration.OperationHandlerFactory.Formatters.Insert(0, new JsonNetMediaTypeFormatter());
    
        using (var ws = new HttpWebService<TestService>("http://localhost:20000", "products", config))
        {
            var client = new HttpClient("http://localhost:20000");
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("text/json"));
    
            // THIS IS THE DEAL!
            var response = client.Query<Product>("products", x => x.Id <= 2);
    
            Assert.True(response.IsSuccessStatusCode);
    
            var products = new JsonSerializer().Deserialize<List<Product>>(new JsonTextReader(new StreamReader(response.Content.ContentReadStream)));
    
            Assert.Equal(2, products.Count);
            Assert.True(products.All(x => x.Id <= 2));
        }
    }

And it even works for sub-properties of the main resource:
    
    
    var response = client.Query<Product>("products", x => x.Owner.Name == "kzu");
    
    Assert.True(response.IsSuccessStatusCode);
    
    var products = new JsonSerializer().Deserialize<List<Product>>(new JsonTextReader(new StreamReader(response.Content.ContentReadStream)));
    
    Assert.Equal(2, products.Count);
    Assert.True(products.All(x => x.Owner.Name == "kzu"));

Yay!

Note that this is a low-level API that follows HttpClient approach: it knows nothing about deserializing the payloads into entities or supported content types, etc. That’s another nuget that’s coming, the HttpEntityClient ![Smile](http://blogs.clariusconsulting.net/kzu/files/2011/05/wlEmoticon-smile3.png). Stay tunned.

Enjoy this one by searching for HttpClient (or HttpClientQuery) in the Library Reference dialog:

![image](http://blogs.clariusconsulting.net/kzu/files/2011/05/image25.png)

Posted by kzu
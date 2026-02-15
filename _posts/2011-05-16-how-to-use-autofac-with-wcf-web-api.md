---
layout: post
title: How to use Autofac with WCF Web API
date: 2011-05-16 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/how-to-use-autofac-with-wcf-web-api
tags:
- .NET

---

The new configuration model in the latestWCFWeb APIsallows extending the service instantiation via what is called aresource factory.

For Autofac, I wanted to support a per-request lifetime scope, so I used the concept of instance context extensions in the Web APIs to place our scope so that it can be disposed on release.

```
public class AutofacResourceFactory : IResourceFactory
{
    private IContainer container;

    public AutofacResourceFactory(IContainer container)
    {
        this.container = container;
    }

    public object GetInstance(Type serviceType, InstanceContext instanceContext, HttpRequestMessage request)
    {
        // Begin lifetime scope when the service is instantiated.
        var lifetime = this.container.BeginLifetimeScope();
        // Hold the lifetime as an extension in the instance context
        instanceContext.Extensions.Add(new AutofactLifetimeExtension(lifetime));

        return lifetime.Resolve(serviceType);
    }

    public void ReleaseInstance(System.ServiceModel.InstanceContext instanceContext, object service)
    {
        var extension = instanceContext.Extensions.OfType<AutofactLifetimeExtension>().FirstOrDefault();
        // If we find our extension there, dispose it so the lifetime gets disposed.
        if (extension != null)
            extension.Dispose();
    }

    private class AutofactLifetimeExtension : IExtension<InstanceContext>, IDisposable
    {
        private ILifetimeScope lifetime;
        private bool isDisposed;

        public AutofactLifetimeExtension(ILifetimeScope lifetime)
        {
            this.lifetime = lifetime;
        }

        public void Attach(InstanceContext owner)
        {
        }

        public void Detach(InstanceContext owner)
        {
            Dispose();
        }

        public void Dispose()
        {
            if (this.isDisposed)
                return;

            this.lifetime.Dispose();
            this.isDisposed = true;
        }
    }
}
```

Configuring the factory is straightforward:

```
IContainer container = BuildContainer();
var config = HttpHostConfiguration.Create()
    .SetResourceFactory(new AutofacResourceFactory(container));

routes.MapServiceRoute<FooResource>("foo", config);
```

Pretty sleek! WCF is looking like a usable technology now…

![Smile](/img/2011-05-16-1.png)

/kzu

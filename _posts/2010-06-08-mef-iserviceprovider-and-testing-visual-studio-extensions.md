---
layout: post
title: "Daniel Cazzulino's Blog - MEF, IServiceProvider and Testing Visual Studio Extensions"
date: 2010-06-08 00:00:00 +0000
---

##  [MEF, IServiceProvider and Testing Visual Studio Extensions](<http://blogs.clariusconsulting.net/kzu/mef-iserviceprovider-and-testing-visual-studio-extensions/> "MEF, IServiceProvider and Testing Visual Studio Extensions")

June 8, 2010 11:42 pm

In the latest and greatest version of [Visual Studio](<http://www.microsoft.com/visualstudio/products/2010/default.mspx>), [MEF](<http://mef.codeplex.com/>) plays a critical role, one that makes extending VS much more fun than it ever was.

So typically, you just [[Export]](<http://mef.codeplex.com/wikipage?title=Declaring%20Exports&referringTitle=Guide>) something, and then someone [[Import]](<http://mef.codeplex.com/wikipage?title=Declaring%20Imports&referringTitle=Guide>)s it and that’s it. [MEF](<http://mef.codeplex.com/>) in all its glory kicks in and gets all your dependencies satisfied.

Cool, you say, so let’s now import [ITextTemplating](<http://msdn.microsoft.com/en-us/library/microsoft.visualstudio.texttemplating.vshost.itexttemplating.aspx>) and have some [T4-based](<http://www.visualt4.com/>) codegen going! Ah, if only it was that easy. Turns out by default, none of the VS built-in services are exposed to MEF, apparently because there wasn’t enough time to analyze the lifetime, initialization, dependencies, etc. for each one before launch, which makes perfect sense. You don’t want to blindly export everything now just in case. There’s also the whole VS package initialization thing which in this version of VS is not so transparently integrated with the MEF publishing side (i.e. a MEF export from a package can get instantiated before its owning package, and in fact, the package can remain unloaded forever and the export will continue to be visible to anyone).

So, you just have to calm down, and re-encounter “good”-old [IServiceProvider](<http://msdn.microsoft.com/en-us/library/system.iserviceprovider.aspx>). Turns out, that’s still the “blessed” way to get your dependencies, but now you can get the service provider from MEF instead:
    
    
    [ImportingConstructor]
    public TextTemplate([Import(typeof(SVsServiceProvider))] IServiceProvider serviceProvider)
    

Note that in typical VS fashion, the actual exported contract (interface) is SVsServiceProvider, which can be converted automatically to an IServiceProvider.

But, if you make your entire class just work off of this [service locator](<http://martinfowler.com/articles/injection.html>) (doing GetService here and there), you lose all the “explicit-ness” that comes from having a proper constructor that declares that this class needs, say, an [ITextTemplating](<http://msdn.microsoft.com/en-us/library/microsoft.visualstudio.texttemplating.vshost.itexttemplating.aspx>). This makes it much harder for consumers attempting to reuse the implementation to figure out what this component needs.

Fortunately, MEF does not require your importing constructors to be public, so you can provide the MEF-exclusive constructor as internal, and make the constructor with your explicit dependencies public:
    
    
    [ImportingConstructor]
    private TextTemplate([Import(typeof(SVsServiceProvider))] IServiceProvider serviceProvider)
        : this(serviceProvider.GetService<STextTemplating, ITextTemplating>())
    {
    }
    
    public TextTemplate(ITextTemplating templating)
    {
        Guard.NotNull(() => templating, templating);
    
        this.templating = templating;
    }
    

Your tests will also instantiate this class exclusively from the non-MEF constructor, and pass [moqs](<http://moq.me/>) as needed. (note I’m using a simple generic GetService extension method on IServiceProvider to make code more concise). 

/kzu

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=247751)

/kzu

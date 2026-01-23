---
layout: post
title: "Daniel Cazzulino's Blog : How to mock extension methods"
date: 2009-12-22 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to mock extension methods

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

Source code published in this blog is [public domain](http://en.wikipedia.org/wiki/Public_domain) unless otherwise specified.

[![](https://web.archive.org/web/20100317104915im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100317104915im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100317104915im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100317104915im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100317104915im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100317104915im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## How to mock extension methods 

. without paying for a TypeMock Isolator license to do it ;-)

There's going to be no magic here. You have to explicitly design for testability. That's one of the things I like about mocking: if you can mock a dependency, then it means your design is loosely coupled (e.g. not tied to a particular implementation of that dependency), and you're not "cheating or taking any shortcuts. If a test can replace a dependency at test-time, your'll surely be able to replace the real implementation with something different when/if time comes to do so.

Extension methods are tricky because they are static methods, really just syntactic sugar for a "good" old static class with static methods (typically a "helper" of some sort. But what is special about them, is that they show up (provided you have the right usings/imports) in the target type API as if they were its own instance methods. This is significant, because it also means that it's very easy to pollute the target type API as you (and other referenced libraries) keep piling up these methods on it.

I therefore prefer an approach where you group your extensions under a single API, and access that API via a single extension method on the target type that becomes the entry point to your extensions. For example, say you have an IPerson interface, and you want to add secutity-related helper methods that you can use consistently from other logic or services. One way of adding a GetPermissions security helper extension method (that will get the rights of the user over a given resource, for example), would be to plug it right into IPerson as an extension method:
    
    
    [Flags]
    public enum Permissions
    {
        Read = 0, 
        Modify = 1, 
        Delete = 2, 
        FullControl = Read | Modify | Delete
    }
    
    public static class SecurityExtensions
    {
        public static Permissions GetPermissions(this IPerson person, Uri resource)
        {
            // get permissions for the given resource from somewhere
        }
    }
    
    

This would get you the API right on the IPerson object:

![plainextension](https://web.archive.org/web/20100317104915im_/http://www.clariusconsulting.net/images/blogs/kzu/Howtomockextensionmethods_59FB/plainextension.png)

If you go overboard with this "extension in the root" approach, you might end up with an ugly looking assorted collection of helpers attached to the main class, such as what happened to the UML APIs in Visual Studio 2010. Look at the before and after we reference and import the assembly containing the extensions to IClass (the interface that represents a class in a UML Logical Class Diagram):

[![classplain](https://web.archive.org/web/20100317104915im_/http://www.clariusconsulting.net/images/blogs/kzu/Howtomockextensionmethods_59FB/classplain_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/Howtomockextensionmethods_59FB/classplain.png)

After referencing Microsoft.VisualStudio.Uml.Extensions.dll and adding the corresponding using/import:

[![classextensions](https://web.archive.org/web/20100317104915im_/http://www.clariusconsulting.net/images/blogs/kzu/Howtomockextensionmethods_59FB/classextensions_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/Howtomockextensionmethods_59FB/classextensions.png)

(I pasted together four pages of intellisense for added effect, but you see the point, rigth?)

## Extension Interfaces

Another alternative is to group extension methods that provide related functionality under what I'd _extension interfaces_. In our person example, we might find out that the security-related methods start growing, and we'd like to keep the main API clean, so we introduce the ISecurity extension interface, and provide an extension method that is the entry point to it:
    
    
    public interface ISecurity
    {
        Permissions GetPermissions(Uri resource);
    }
    
    public static class SecurityExtensions
    {
        public static ISecurity Security(this IPerson person)
        {
            throw new NotImplementedException();
        }
    }
    

Now, the consumer of the IPerson object can see that there is security-related behavior available to him, but won't see what those are unless he needs to:

![extensioninterface](https://web.archive.org/web/20100317104915im_/http://www.clariusconsulting.net/images/blogs/kzu/Howtomockextensionmethods_59FB/extensioninterface.png)

Typically, the SecurityExtensions class will instantiate a non-public implementation of ISecurity that does the real work, passing the person to work on as a constructor argument:
    
    
    internal class Security : ISecurity
    {
        private IPerson person;
    
        public Security(IPerson person)
        {
            this.person = person;
        }
    
        public Permissions GetPermissions(Uri resource)
        {
            // get the real permissions for the person 
            // field we have received, for the given resource
            throw new NotImplementedException();
        }
    }
    
    public static class SecurityExtensions
    {
        public static ISecurity Security(this IPerson person)
        {
            return new Security(person);
        }
    }
    

The attentive reader might have noticed that, being a regular interface, the extension interface now can expose properties where it makes sense, overcoming the lack of support for extension properties in C#. For example we could add a Roles property quite easily:

![extensionproperty](https://web.archive.org/web/20100317104915im_/http://www.clariusconsulting.net/images/blogs/kzu/Howtomockextensionmethods_59FB/extensionproperty.png)

And because the extension interface is nothing more than a fluent interface in the end, you can use the trick I blogged about before to hide those pesky System.Object members:

![fluentextension](https://web.archive.org/web/20100317104915im_/http://www.clariusconsulting.net/images/blogs/kzu/Howtomockextensionmethods_59FB/fluentextension.png)

## How to mock extension methods, again?

Back to the testing subject, in order to test the Update method above, we'll need to replace the ISecurity implementation, right? Because we followed the extension interface design approach, we now have a single extension method to replace, the one that creates the default implementation of the ISecurity inteface. And if you look at that method, all it is being a factory for creating an implementation of ISecurity given an IPerson:
    
    
    public static class SecurityExtensions
    {
        public static ISecurity Security(this IPerson person)
        {
            return new Security(person);
        }
    }
    

So for testing purposes we can just add an internal factory that will isolate the extension method behavior, and that we'll replace for testing purposes:
    
    
    public static class SecurityExtensions
    {
        internal static Func<IPerson, ISecurity> SecurityFactory = person => new Security(person);
    
        public static ISecurity Security(this IPerson person)
        {
            return SecurityFactory(person);
        }
    }
    

The test for the Update method above, which will have [internals visibility](http://msdn.microsoft.com/en-us/library/0tke9fxk.aspx) enabled from the project under test, will simply replace the factory with one that returns a mock:
    
    
    public void WhenPersonHasNoModifyPermission_ThenThrowsSecurityException()
    {
        var security = new Mock<ISecurity>();
        security.Setup(x => x.GetPermissions(It.IsAny<Uri>())).Returns(Permissions.Read);
    
        SecurityExtensions.SecurityFactory = person => security.Object;
    
        var controller = new DocumentsController();
    
        Assert.Throws<SecurityException>(() => 
            controller.Update(new Mock<IPerson>().Object, new Uri("http://foo")));
    }

And voila! We have just passed a test where the class under test uses an extension method:
    
    
    public class DocumentsController
    {
        public void Update(IPerson person, Uri document)
        {
            if (!person.Security().GetPermissions(document).HasFlag(Permissions.Modify))
                throw new SecurityException();
    
            // ...
    

Also note that the intenal Security class that implements ISecurity can also be fully tested in isolation. 

Happy [moqing](http://moq.me/)!

PS: remember the focus of this post is on mocking extension methods, not on how to design security for your domain ;-). Feel free to mentally replace ISecurity with IFoo, GetPermissions with DoSomething, etc., as needed.

posted on Tuesday, December 22, 2009 11:27 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/194707.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/12/22/Howtomockextensionmethods.aspx#194717 "permalink") How to mock extension methods @ Tuesday, December 22, 2009 11:51 AM

. without paying for a TypeMock Isolator license to do it ;-) There&amp;#39;s going to be no magic here. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2009/12/22/how-to-mock-extension-methods.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/12/22/Howtomockextensionmethods.aspx#194723 "permalink") How to mock extension methods @ Tuesday, December 22, 2009 12:05 PM

You've been kicked (a good thing) - Trackback from DotNetKicks.com [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.dotnetkicks.com/tipsandtricks/How_to_mock_extension_methods "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/12/22/Howtomockextensionmethods.aspx#194724 "permalink") re: How to mock extension methods @ Tuesday, December 22, 2009 12:06 PM

Best blog post of the year. Anywhere. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

Will

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/12/22/Howtomockextensionmethods.aspx#194794 "permalink") Social comments and analytics for this post @ Tuesday, December 22, 2009 3:38 PM

This post was mentioned on Twitter by kzu: How to mock extension methods <http://ff.im/-dfIvA> [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.ubervu.com/conversations/www.clariusconsulting.net/blogs/kzu/archive/2009/12/22/Howtomockextensionmethods.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/12/22/Howtomockextensionmethods.aspx#199916 "permalink") re: How to mock extension methods @ Tuesday, January 05, 2010 4:38 AM

Except, of course that you've introduced a global (non-thread-safe) delegate. Not sure how else you would achieve it ([ThreadStatic] on the internal member?), but there's an implicit assumption that the testing framework won't spawn multiple threads.   
  
Not to mention the fact that a Security() is a method which is (arguably) a little ugly. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl4$EditLink',''\))

[Eric Smith](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://thelimberlambda.com/ "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2009/12/22/Howtomockextensionmethods.aspx#219058 "permalink") Cheap watson soma online. @ Thursday, March 04, 2010 8:39 AM

Cheap soma watson. Cheap soma. Soma buy soma cheap soma soma online. Cheap soma indice. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl5$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.youtube.com/user/SomaOnline "TrackBack")

  

[![](/web/20100317104915im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
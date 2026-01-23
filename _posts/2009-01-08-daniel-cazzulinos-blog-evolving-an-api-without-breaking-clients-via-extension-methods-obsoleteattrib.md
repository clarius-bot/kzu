---
layout: post
title: "Daniel Cazzulino's Blog : Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute"
date: 2009-01-08 00:00:00 +0000
---

Daniel Cazzulino's Blog : Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20090118224850im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090118224850im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090118224850im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090118224850im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute 

API evolution is tough and versioning is a complex enough issue that deserves not one but several posts. So I will only focus on one specific kind of evolution and backwards compatibility: [Source](http://en.wikipedia.org/wiki/Source_code_compatibility) [Compatibility](http://en.wikipedia.org/wiki/Backward_compatibility).

Let's say you have a class with a given functionality:
    
    
    public class Mock
    {
        public void VerifyAll()
        {
            // ...
        }
    }

At a certain point, let's say you realize it was not such a good idea to have that method, and would rather have people using another method by default, but still being able to opt-in to the "old" behavior. One way of achieving this is to move this method to a new assembly (i.e. MyProduct.Legacy.dll), as an extension method:
    
    
    public static class MockExtensions
    {
        public static void VerifyAll(this Mock mock)
        {
            // ...
        }
    }
    

[](http://11011.net/software/vspaste)

Existing code can remain unchanged, and you only need to add a reference to the newly created "legacy support" assembly to recompile:
    
    
    public void Test()
    {
        var mock = new Mock();
        // ...
        mock.VerifyAll();
    }
    

[](http://11011.net/software/vspaste)

A slightly different scenario, is where you have an existing method that you want to deprecate from the core API (i.e. you renamed a method). In this case, you can still move the existing behavior to the new "legacy support" assembly, but you don't want the obsolete member to appear in intellisense at all. It's there just to get source compatibility: 
    
    
    public static class MockExtensions
    {
        [Obsolete("Expect has been renamed to Setup.", false)]
        [EditorBrowsable(EditorBrowsableState.Never)]
        public static ISetup Expect<T>(this Mock<T> mock, Expression<Action<T>> expression)
            where T : class
        {
            // ...
        }
    }
    

[](http://11011.net/software/vspaste)

The [ObsoleteAttribute](http://msdn.microsoft.com/en-us/library/system.obsoleteattribute.aspx) is there to remind developers that they should be using the new feature, but it doesn't cause a compile error (otherwise it wouldn't be source compatible, would it?). 

The [EditorBrowsableAttribute](http://msdn.microsoft.com/en-us/library/system.componentmodel.editorbrowsableattribute.aspx) is there to hide the obsolete member from users (doesn't show up in intellisense), so that new functionality is always using the new API.

This approach ensures that existing users know where legacy features went (you get a compile warning from the Obsolete attribute), while new users/functionality don't get confused with backwards-compatible APIs (they would typically NOT add a reference to a *.Legacy.dll on a new project).

posted on Thursday, January 08, 2009 7:14 AM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/115183.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2009/01/08/115183.aspx#115317 "permalink") re: Evolving an API without breaking clients via extension methods, ObsoleteAttribute and EditorBrowsableAttribute @ Sunday, January 11, 2009 11:07 AM

You may have noticed that EditorBrowsableAttribute is not honored by VS intellisense for extension methods :((((   
  
Vote for it at <https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=395913> [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[kzu](http://clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

  

[![](/web/20090118224850im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
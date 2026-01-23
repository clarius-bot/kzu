---
layout: post
title: "Daniel Cazzulino's Blog : Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement"
date: 2010-04-15 00:00:00 +0000
---

Daniel Cazzulino's Blog : Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

Source code published in this blog is [public domain](http://en.wikipedia.org/wiki/Public_domain) unless otherwise specified.

[![](https://web.archive.org/web/20100420104018im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100420104018im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100420104018im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100420104018im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100420104018im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100420104018im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement 
    
    
    public static IEnumerable<ValidationResult> Validate(object component)
    {
        return from descriptor in TypeDescriptor.GetProperties(component).Cast<PropertyDescriptor>()
                from validation in descriptor.Attributes.OfType<System.ComponentModel.DataAnnotations.ValidationAttribute>()
                where !validation.IsValid(descriptor.GetValue(component))
                select new ValidationResult(
                    validation.ErrorMessage ?? string.Format(CultureInfo.CurrentUICulture, "{0} validation failed.", validation.GetType().Name),
                    new[] { descriptor.Name });
    }
    
    

Enjoy!

posted on Thursday, April 15, 2010 10:08 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/04/15/234739.aspx#234742 "permalink") re: Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement @ Thursday, April 15, 2010 10:16 AM

Very cool!   
  
To support localization, you should be calling validation.FormatErrorMessage() rather than validation.ErrorMessage. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Brad Wilson](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://bradwilson.typepad.com "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/04/15/234739.aspx#234745 "permalink") Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement @ Thursday, April 15, 2010 10:28 AM

public static IEnumerable&amp;amp;lt;ValidationResult&amp;amp;gt; Validate(object component) { return from descriptor [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2010/04/15/crazy-linq-performing-system-componentmodel-dataannotations-validation-in-a-single-statement.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/04/15/234739.aspx#235240 "permalink") re: Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement @ Saturday, April 17, 2010 10:57 AM

Good solution!   
  
One addition to this. If you are using a 'buddy' class for the metadata (ie your validation attributes are in another class associated with [MetadataType(typeof(...))]) you need to register these associations by hand for unit testing (no framework to do it for you) using something like:   
  
TypeDescriptor.AddProvider(new AssociatedMetadataTypeTypeDescriptionProvider(model.GetType()), model.GetType()); [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Jaime del Palacio](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/jaimedelpalacio "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/04/15/234739.aspx#235615 "permalink") re: Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement @ Monday, April 19, 2010 1:22 AM

What is this? A Perl contest in the 90s? Try this: <http://www.refactoring.com/catalog/extractMethod.html> [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

Dennis

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/04/15/234739.aspx#235648 "permalink") re: Crazy Linq: performing System.ComponentModel.DataAnnotations validation in a single statement @ Monday, April 19, 2010 5:49 AM

This is a brilliant example of the kind of code we should strive to avoid.   
It's unreadable and difficult to maintain, and every time someone looks at it they will need to stare at it for about 5-10 minutes to work out what the hell it is doing...   
  
Pray tell: what exactly is the advantage of doing this in a single statement? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl4$EditLink',''\))

anon

  

[![](/web/20100420104018im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
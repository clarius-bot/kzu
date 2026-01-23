---
layout: post
title: "Daniel Cazzulino's Blog : Automatic input validation in WPF with data binding and Enterprise Library Validation Application Block"
date: 2007-09-26 00:00:00 +0000
---

Daniel Cazzulino's Blog : Automatic input validation in WPF with data binding and Enterprise Library Validation Application Block

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081207061108im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081207061108im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081207061108im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081207061108im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Automatic input validation in WPF with data binding and Enterprise Library Validation Application Block 

WPF provides validation infrastructure for databinding scenarios through [ValidationRule](http://msdn2.microsoft.com/en-us/library/ms752347.aspx#validation_process) objects. Only one built-in rule is provided, and you're expected to write most of these yourself. The way they work is by assigning one or more explicit rules to a binding:
    
    
    <TextBox ...>  
      <TextBox.Text>  
        <Binding .>  
          <Binding.ValidationRules>  
            <local:JpgValidationRule/>   
          </Binding.ValidationRules>  
        </Binding>  
      </TextBox.Text>  
    </TextBox> 

[Example from [Adam Nathan](http://www.adamnathan.net/)'s [excelent book on WPF](http://adamnathan.net/wpf/)]

Note that the syntax is much more involved than the simple non-validating binding:
    
    
    <TextBox Text="{Binding ...}">  
    </TextBox> 

Another consequence of the provided support is that even if you reuse the data context (i.e. you provide more than one screen that binds to a given object type, say "Customer" object) in more than one editing scenario, you will need to duplicate the validators and make sure you keep them in sync. Also, you will typically be performing the same validation again in the object itself (i.e. the above binding probably sets a "Photo" string property), so you either take a dependency on WPF from your entities project just to call the same validation rules, or you duplicate the code to perform the validation (or you make your rules just expose a WPF interface over the same objects). In any case, there's no straight-forward way to reuse the logic, and maintaining the XAML and entities internal validation rules in sync is far from ideal.

The [Microsoft Enterprise Library Validation Block](http://msdn2.microsoft.com/en-us/library/bb410105.aspx) (EntLib VAB) solves this problem by providing attribute (or configuration) driven rules that you can validate on the UI as well as on your entities. For example:
    
    
    				public
    				class
    				Customer
    				
    				{
      privatestring firstName;
    
      [StringLengthValidator(1, RangeBoundaryType.Inclusive, 0, RangeBoundaryType.Ignore)]
      [NotNullValidator]
      publicstring FirstName
    

[ ](http://11011.net/software/vspaste)

The code above specifies that the `FirstName` property must be a non-null, non-empty string. You could very easily create a custom validation rule such as `NotNullOrEmptyValidator` ;), but you get the idea. 

EntLib VAB provides integration with WinForms and ASP.NET validation architectures, but not for WPF. [Up to now](http://www.codeplex.com/entlibcontrib/Wiki/View.aspx?title=Standalone%20Validation%20Block), that is ;). 

I've been working for the past few days on getting a kick-ass integration with WPF. It [wasn't easy](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/23/ForgetaboutextendingWPFdatabindingsupport.aspx), and I found a couple [not-so-nice](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/25/SeriousflawinWPFvalidationinfrastructureforValidationRuleandBinding.aspx) things in the way, but I finally got the following working flawlessly (and without any hacks):
    
    
    <Window ... xmlns:v="http://www.codeplex.com/entlibcontrib">
      <Grid>
        ...
        <Label Content="First Name:"/>
        <TextBox Text="{v:ValidationBinding FirstName}" .../>
        ...
        <TextBox Text="{v:ValidationBinding Address.USState}" .../>
        ...
      </Grid>
    </Window>

This sample markup and the class above are part of a sample available with the [download](http://www.codeplex.com/entlibcontrib/Release/ProjectReleases.aspx?ReleaseId=7342).

You can now do a simple search&replace of Binding with v:ValidationBinding and that's it. If your data context objects (or entities) provide validation attributes, they will get automatically applied to the binding, and all the WPF-specific handling on the UI for [showing the errors and styling the elements with errors](http://msdn2.microsoft.com/en-us/library/ms752347.aspx#data_validation) will be available to you for free.

The `ValidationBinding` is nothing more than a [MarkupExtension](http://msdn2.microsoft.com/en-us/library/system.windows.markup.markupextension.aspx) that acts as a decorator for a [Binding](http://msdn2.microsoft.com/en-us/library/system.windows.data.binding.aspx). Hence, the full data binding behavior is preserved, as I'm basically returning from my extension the result of evaluating the binding I'm decorating (prior to attaching my validation rule). From that point on, it's plain built-in validation rules and a few creative tricks to get around EntLib VAB's a bit weird "integration" model. It may be interesting to look for someone looking to implement their own markup extensions. In order to allow for the drop-in replacement scenario with the [Binding](http://msdn2.microsoft.com/en-us/library/system.windows.data.binding.aspx) class, I also expose all of the public properties of a binding, so that if you're using any of them, you get full fidelity behavior as they are all just pass-through getters/setters to the inner instance of the binding I'm constructing.

I've contributed this code to the [EntLib Contrib](http://www.codeplex.com/entlibcontrib) project as part the [Standalone Validation Application Block](http://www.codeplex.com/entlibcontrib/Wiki/View.aspx?title=Standalone%20Validation%20Block), which is a version of the VAB that doesn't depend on configuration at all. I've written about [why XAML makes System.Configuration and Enterprise Library Configuration obsolete](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyXAMLmakesSystemConfigurationandEnterpriseLibraryConfigurationobsolete.aspx) and [why we need an EntLib Standalone Validation Application Block](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/24/WhyweneedanEntLibStandaloneValidationApplicationBlock.aspx) before. I may integrate this with the official EntLib 3.1, but it's not a high priority for me as I don't believe we need all the System.Configuration/ObjectBuilder baggage just for validation. If there's enough demand for it through the project discussions, though, I'm sure someone (maybe myself?) will get it done eventually. 

Go [get the release](http://www.codeplex.com/entlibcontrib/Wiki/View.aspx?title=Standalone%20Validation%20Block), and enjoy developing apps with full input validation and data binding in (almost) pure markup :

posted on Wednesday, September 26, 2007 8:25 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/33083.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/26/AutomaticinputvalidationinWPFwithdatabindingandEnterpriseLibraryValidationApplicationpBlock.aspx#33087 "permalink") Automatic input validation in WPF with data binding and Enterprise Library Validation Application pBlock @ Wednesday, September 26, 2007 8:36 PM

WPF provides validation infrastructure for databinding scenarios through ValidationRule objects. Only [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2007/09/27/automatic-input-validation-in-wpf-with-data-binding-and-enterprise-library-validation-application-pblock.aspx "TrackBack")

  

[![](/web/20081207061108im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
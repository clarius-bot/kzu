---
layout: post
title: "Daniel Cazzulino's Blog : Forget about extending WPF data binding support"
date: 2007-09-23 00:00:00 +0000
---

Daniel Cazzulino's Blog : Forget about extending WPF data binding support


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20081208141111im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20081208141111im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20081208141111im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20081208141111im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## Forget about extending WPF data binding support 

Databinding in WPF is implemented in the [Binding](http://msdn2.microsoft.com/en-us/library/system.windows.data.binding) class, which in principle looks like just a [MarkupExtension](http://msdn2.microsoft.com/en-us/library/ms747254.aspx). A MarkupExtension is a core piece of XAML markup "magic". It's rather simple, though:
    
    
    public abstract class MarkupExtension  
    {  
        // Methods  
        protected MarkupExtension();  
        public abstract object ProvideValue(IServiceProvider serviceProvider);  
    } 
    

You're supposed to return a value to assign to the property that is using the markup extension, such as:
    
    
    <TextBox Text="{l:MyMarkup}" />

[](http://11011.net/software/vspaste)

A [binding markup extension does a LOT more](http://msdn2.microsoft.com/en-us/library/ms752347.aspx), though. The trick is that the binding ProvideValue implementation returns a [BindingExpression](http://msdn2.microsoft.com/en-us/library/system.windows.data.bindingexpression) object, not the straight value resulting from the evaluation (which is typically not even available at "markup resolution" time, when the file is being deserialized, which is the time that the XAML reader will call your markup extensions).

Now, so far, it doesn't look like there are many scenarios where you'd want to extend this infrastructure. After all, this is doesn't seem like much more than the old [DataBinder.Eval](http://msdn2.microsoft.com/en-us/library/system.web.ui.databinder).

Enter data [validation and ValidationRules](http://msdn2.microsoft.com/en-us/library/ms752347.aspx#data_validation). This functionality is also baked-in the binding, and is key for showing input errors on WPF apps. Now this does look like an area where I might want some extensibility points. WPF gives you [ValidationRule](http://msdn2.microsoft.com/en-us/library/system.windows.controls.validationrule), which also looks straightforward enough:
    
    
    public abstract class ValidationRule  
    {  
        // Methods  
        protected ValidationRule();  
        public abstract ValidationResult Validate(object value, CultureInfo cultureInfo);  
    }  

It's so straightforward that it falls short in many real-world scenarios: the value of one property depends on the value of another, or on the (data) context. Moreover, I can totally see myself using some [attribute-driven validation library](http://www.codeplex.com/entlibcontrib/Release/ProjectReleases.aspx?ReleaseId=7225 "Enterprise Library Validation Block \(Standalone\)") to avoid writing a ton of validation rules myself. So, it would be very cool to be able to just attribute my data context properties with the validation information, and let an extended binding take care of the rest.
    
    
    public class MyData : INotifyPropertyChanged  
    {  
        private int value;   
    
    
    
        **[RangeValidator(1, RangeBoundaryType.Inclusive, 5, RangeBoundaryType.Inclusive)]  
    **    public int IntValue  
        {  
            get { return value; }  
            set { this.value = value; RaiseNotify("IntValue"); }  
        }
    
    
    ...

That's when things get pretty ugly pretty fast. See, the ValidationRule has no context whatesoever. You can't access the binding where the rule is attached to, neither the data item/context, or the property you're validating, etc. It's utterly useless and impossible to extend. 

So, I went deeper: why not create a Binding-derived class and override that? After all, it looks like I can inherit it:
    
    
    public class Binding : BindingBase

![intellisense for overrides on Binding](https://web.archive.org/web/20081208141111im_/http://www.clariusconsulting.net/images/blogs/kzu/ForgetaboutextendingWPFdatabindingsuppor_14338/image.png)

Crap, that doesn't look good. So let's try with BindingBase. If it's "Base", I bet it has some useful overrides!

[![image](https://web.archive.org/web/20081208141111im_/http://www.clariusconsulting.net/images/blogs/kzu/ForgetaboutextendingWPFdatabindingsuppor_14338/image_thumb.png)](http://www.clariusconsulting.net/images/blogs/kzu/ForgetaboutextendingWPFdatabindingsuppor_14338/image_3.png)

If you're wondering how come I can't override ProvideValue which is a virtual inherited from MarkupExtension, here it is why:
    
    
    public abstract class BindingBase : MarkupExtension  
    {  
      public sealed override object ProvideValue(IServiceProvider serviceProvider)  
      ...  
    }
    

Damn... if only that "sealed" was not there!!! 

So, how about creating a plain markup extension, and simply wrapping a true Binding? Remember the Binding.ProvideValue actually returns a BindingExpression? Maybe I can inherit that one and do something!
    
    
    public sealed class BindingExpression : BindingExpressionBase, IDataBindEngineClient, IWeakEventListener

Mmm... there's another "Base" class there...

[![image](https://web.archive.org/web/20081208141111im_/http://www.clariusconsulting.net/images/blogs/kzu/ForgetaboutextendingWPFdatabindingsuppor_14338/image_thumb_3.png)](http://www.clariusconsulting.net/images/blogs/kzu/ForgetaboutextendingWPFdatabindingsuppor_14338/image_4.png)

That looks promising, but....

public abstract class BindingExpressionBase : Expression, IWeakEventListener  
{  
internal abstract void ChangeSourcesForChild(BindingExpressionBase bindingExpression, WeakDependencySource[] newSources);  
internal abstract void InvalidateChild(BindingExpressionBase bindingExpression);  
internal abstract void ReplaceChild(BindingExpressionBase bindingExpression);  
...  
} 

*internal abstract*? Dead end there too.

So, backing up a little, if I were creating such a reflection-based intelligent validation for a binding, all I would need is a way to get at the PropertyInfo/DependencyProperty/PropertyDescriptor (whichever applies) of the property I'm binding to, right? Surely the Binding needs the same thing eventually and must provide something like that. It does, but it's all internal stuff. 

Summary: don't try to extend WPF data binding. If what's provided is not enough (i.e. ValidationRule), you're better off writing your own mechanism (will try to follow-up with another post if I manage to get the [reflection-based validation](http://www.codeplex.com/entlibcontrib/Release/ProjectReleases.aspx?ReleaseId=7225) to integrate somehow). For me, this is the first time I find a feature in WPF which sucks from the extensibility point of view :(.

posted on Sunday, September 23, 2007 8:18 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/32702.aspx) :: 

  

[![](/web/20081208141111im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog : A really simple ViewModel base class with strongly-typed INotifyPropertyChanged"
date: 2010-05-14 00:00:00 +0000
---

Daniel Cazzulino's Blog : A really simple ViewModel base class with strongly-typed INotifyPropertyChanged


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

Source code published in this blog is [public domain](http://en.wikipedia.org/wiki/Public_domain) unless otherwise specified.

[![](https://web.archive.org/web/20100521014655im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20100521014655im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20100521014655im_/http://twittercounter.com/counter/?username=kzu) ](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20100521014655im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20100521014655im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20100521014655im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

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

## A really simple ViewModel base class with strongly-typed INotifyPropertyChanged 

I have already written about other alternative ways of [implementing INotifyPropertyChanged](http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx), as well as [augment your view models](http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/30/AnnouncingthefreeViewModelTool.aspx) with a bit of automatic code generation for the same purpose. But for some co-workers, either one seemed a bit too much :o). 

So, back on the drawing board, we came up with the following view model authoring experience:
    
    
    public class MyViewModel : ViewModel, IExplicitInterface
    {
        private int value;
    
        public int Value
        {
            get { return value; }
            set { this.value = value; RaiseChanged(() => this.Value); }
        }
    
        double IExplicitInterface.DoubleValue
        {
            get { return value; }
            set { this.value = (int)value; RaiseChanged(() => ((IExplicitInterface)this).DoubleValue); }
        }
    }
    

You can see how raising property changed on a property is just a matter of passing an expression like "this.PropertyName" to the base RaiseChanged method. This is 100% refactoring friendly. No magic strings.

Also, we support raising a property changed for an interface that you implemented explicitly, like the second case. 

The base class defines the RaiseChanged method as follows:
    
    
    protected void RaiseChanged<TProperty>(Expression<Func<TProperty>> propertyExpresion)
    

Note how the TProperty type parameter can be completely omitted from the call to RaiseChanged() from the derived class, letting the compiler figure it out. The expression, being anything matching a Func<T>, could conceivable be an invalid reference to a property the object does not own, so we validate that in the method body by inspecting the expression tree:
    
    
    protected void RaiseChanged<TProperty>(Expression<Func<TProperty>> propertyExpresion)
    {
        var property = propertyExpresion.Body as MemberExpression;
        if (property == null || !(property.Member is PropertyInfo) ||
            !IsPropertyOfThis(property))
        {
            throw new ArgumentException(string.Format(
                CultureInfo.CurrentCulture,
                "Expression must be of the form 'this.PropertyName'. Invalid expression '{0}'.",
                propertyExpresion), "propertyBLOCKED EXPRESSION;
        }
    
        this.OnPropertyChanged(property.Member.Name);
    }
    

We first ensure the expression references a member and that the member is actually a property. Next, the IsPropertyOfThis method verifies that the target of that property access is actually a reference to "this". This is kinda cool:
    
    
    private bool IsPropertyOfThis(MemberExpression property)
    {
        var constant = RemoveCast(property.Expression) as ConstantExpression;
        return constant != null && constant.Value == this;
    }
    
    

We just look for a constant expression and compare its value to "this" :). For the explicitly implemented property case, there will be a cast before the reference to "this", so we remove it if necessary to get access to the constant:
    
    
    private Expression RemoveCast(Expression expression)
    {
        if (expression.NodeType == ExpressionType.Convert ||
            expression.NodeType == ExpressionType.ConvertChecked)
            return ((UnaryExpression)expression).Operand;
    
        return expression;
    }
    

All in all, a fairly simple base class with a tiny bit of strong-typed help for raising notify property changed events for view models. 

Next, we'll augment it with knowledge of IDataErrorInfo and System.ComponentModel.DataAnnotations attributes.

Full [ViewModel class code available](http://pastie.org/960139).

Enjoy!

posted on Friday, May 14, 2010 5:03 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/05/14/244098.aspx#244099 "permalink") re: A really simple ViewModel base class with strongly-typed INotifyPropertyChanged @ Friday, May 14, 2010 5:24 AM

That's great but somtimes you don't want you model to be bound to a base class. That is why I came up with a helper class that works almost the same. Take a look at <http://blog.decarufel.net/2010/03/how-to-use-strongly-typed-name-with.html>. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Eric De Carufel](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://blog.decarufel.net "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/05/14/244098.aspx#244101 "permalink") A really simple ViewModel base class with strongly-typed INotifyPropertyChanged @ Friday, May 14, 2010 5:25 AM

I have already written about other alternative ways of implementing INotifyPropertyChanged , as well [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2010/05/14/a-really-simple-viewmodel-base-class-with-strongly-typed-inotifypropertychanged.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/05/14/244098.aspx#244150 "permalink") re: A really simple ViewModel base class with strongly-typed INotifyPropertyChanged @ Friday, May 14, 2010 10:46 AM

great post ...   
  
All is fine except i dont really like the Overhead being added in 04-11 lines of RaiseChanged.   
  
A well tested View model implementation should not require these argument validations...but again its just me and may be i m wrong.   
  
Btw, your MOQ rocks. [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl2$EditLink',''\))

[Krishna](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://krishnabhargav.blogspot.com "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/05/14/244098.aspx#244735 "permalink") re: A really simple ViewModel base class with strongly-typed INotifyPropertyChanged @ Monday, May 17, 2010 4:22 AM

Hi Daniel,   
  
great code!   
Just implemented it in base class in my project.   
  
Here is Visual Studio regex replace strings to replace old-style Notify property changed calls to new:   
  
search string: OnPropertyChanged\\("{[^"]+}"\\)   
replase string: RaiseChanged(() => this.\1)   
  
Best Wishes,   
Kirill [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl3$EditLink',''\))

[Kirill Chilingarashvili](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://blog.devarchive.net "Anonymous")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2010/05/14/244098.aspx#244980 "permalink") re: A really simple ViewModel base class with strongly-typed INotifyPropertyChanged @ Tuesday, May 18, 2010 10:01 AM

Cool Kirill!   
  
Krishna: validating arguments doesn't really add any impact to the runtime behavior, so it's mostly a safety measure you typically always take... [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl4$EditLink',''\))

[kzu](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://clariusconsulting.net/kzu "kzu")

  

[![](/web/20100521014655im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
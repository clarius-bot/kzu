---
layout: post
title: "A really simple ViewModel base class with strongly-typed INotifyPropertyChanged"
date: 2015-10-08 00:00:00 +0000
---

##  [A really simple ViewModel base class with strongly-typed INotifyPropertyChanged](<http://blogs.clariusconsulting.net/kzu/a-really-simple-viewmodel-base-class-with-strongly-typed-inotifypropertychanged/> "A really simple ViewModel base class with strongly-typed INotifyPropertyChanged")

May 14, 2010 12:03 pm

I have already written about other alternative ways of [implementing INotifyPropertyChanged](<http://www.clariusconsulting.net/blogs/kzu/archive/2010/03/08/SimplifiedINotifyPropertyChangedImplementationwithWeakReferenceSupportandTypedPropertyAccessAPI.aspx>), as well as [augment your view models](<http://www.clariusconsulting.net/blogs/kzu/archive/2009/03/30/AnnouncingthefreeViewModelTool.aspx>) with a bit of automatic code generation for the same purpose. But for some co-workers, either one seemed a bit too much ![:o](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_surprised.gif) ). 

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
    

You can see how raising property changed on a property is just a matter of passing an expression like “this.PropertyName” to the base RaiseChanged method. This is 100% refactoring friendly. No magic strings.

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
    

We first ensure the expression references a member and that the member is actually a property. Next, the IsPropertyOfThis method verifies that the target of that property access is actually a reference to “this”. This is kinda cool:
    
    
    private bool IsPropertyOfThis(MemberExpression property)
    {
        var constant = RemoveCast(property.Expression) as ConstantExpression;
        return constant != null && constant.Value == this;
    }
    

We just look for a constant expression and compare its value to “this” ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) . For the explicitly implemented property case, there will be a cast before the reference to “this”, so we remove it if necessary to get access to the constant:
    
    
    private Expression RemoveCast(Expression expression)
    {
        if (expression.NodeType == ExpressionType.Convert ||
            expression.NodeType == ExpressionType.ConvertChecked)
            return ((UnaryExpression)expression).Operand;
    
        return expression;
    }
    

All in all, a fairly simple base class with a tiny bit of strong-typed help for raising notify property changed events for view models. 

Next, we’ll augment it with knowledge of IDataErrorInfo and System.ComponentModel.DataAnnotations attributes.

Full [ViewModel class code available](<http://pastie.org/960139>).

Enjoy!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=244098)

Posted by kzu
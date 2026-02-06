---
layout: post
title: "How to use T4 templates in WP7, Silverlight, Desktop or even MonoDroid apps"
date: 2010-12-09 00:00:00 +0000
---

In other words, how to use T4 templates without ANY runtime dependencies? Yes, it is possible, and quite simple and elegant actually.

In a desktop project, just open the Add New Item dialog, and search for "text template":

![image](/img/2010-12-09-1.png)

From the two available templates, the one that gives you a zero-dependency runtime-usable template is the first one: Preprocessed Text Template.

Once unfolded, you get the .tt file, but also a dependent .cs file automatically generated. Note the Custom Tool associated with the file is TextTemplatingFilePreProcessor:

![image](/img/2010-12-09-2.png)

If you open up the .cs file, you will see that it doesn’t contain the rendered "Hello World!!!" I added in the .tt, but rather a full class named after the template file itself:
    
    
    namespace ClassLibrary1
    {
        using System;
    
        #line 1 "C:\Temp\ClassLibrary1\ClassLibrary1\PreTextTemplate1.tt"
        [System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.TextTemplating", "10.0.0.0")]
        public partial class PreTextTemplate1 : PreTextTemplate1Base
        {
            public virtual string TransformText()
            {
                this.GenerationEnvironment = null;
                this.Write("Hello World!!!");
                return this.GenerationEnvironment.ToString();
            }
        }
    
        #region Base class
        ...
        #endregion
    }

In order to render the template, we just need to create an instance of this template class, and invoke TransformText:
    
    
    var template = new PreTextTemplate1();
    
    Console.WriteLine(template.TransformText());

If you look at the generated template class (called the "rendering class"), you will see that it has no external dependencies whatsoever. You don’t need any extra reference in your project in order to compile it. None.

For Silverlight, WP7, MonoDroid and other custom project types, the item template will likely not appear in the dialog. But simply adding a text file with (using .tt or .t4 as a convention for the file extension) and setting the file Custom Tool property to TextTemplatingFilePreprocessor, you will get the same rendering class in those project types.

Now, how do you pass input data to the template? Well, being a partial class, you can add properties or custom constructors to it via another partial class file, or you can do it from within the template itself:

![image](/img/2010-12-09-3.png)

Note that class-level "features" (properties, constructors, fields, etc.) are defined at the bottom of the template, in <#+ #> sections.

Once we have the property declared, we can use it in the template itself:

![image](/img/2010-12-09-4.png)

Now when we instantiate the template, we can just set the "model" to render by setting the property:
    
    
    var customer = LoadCustomer();
    var template = new CustomerTemplate { Customer = customer };
    
    Console.WriteLine(template.TransformText());

I hope the new [Razor](<http://weblogs.asp.net/scottgu/archive/2010/07/02/introducing-razor.aspx>) rendering engine also supports such a lightweight reuse approach.

Enjoy!

[PS: the T4 screenshots show the intellisense provided by [VS2010 beta of Visual T4](<http://blog.visualt4.com/2010/11/visual-t4-beta-1-is-now-available.html>)]

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=301122)

/kzu

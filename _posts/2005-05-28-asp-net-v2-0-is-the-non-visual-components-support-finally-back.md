---
layout: post
title: 'ASP.NET v2.0: is the non-visual components support finally back?'
date: 2005-05-28 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/ComponentsNotBack
tags:
- .NET
- All Technology
- ASP.NET

---

## ASP.NET v2.0: is the non-visual components support finally back?

Quite some time agoI started warning people about an important feature that was removed from ASP.NET Whidbey: non-visual components (IComponent-based classes).I logged the bug in Product Feedback, which resulted in a major number of votes that eventually draw some attention internally and resulted in the last update status which isFixed.Now thatWhidbey Beta2 has finally hit the streets, it's time to regress the bug and see if it's really fixed. What follows is what I found (hint: another deception point).I focus the discussion of the features that are missing onthe article I published on CodeProjectthat showcases the full power of non-visual components and the extender provider model in v1.x.

First of all, instead of restoring the "Components Tray", they force you to right-click on the .aspx file and select View Component Designer:

![](http://aspnet2.com/kzu/weblog/ComponentsNotBack1.png)

That wouldn't be terribly bad, except for the consequences:

- Extender Providers no longer work: the component is no longer officially part of the web form, but something that lives "behind" and that you have to see through a different designer. This means that the forms designer has no knowledge whatesoever about extender providers as it used to have. The following extension of built-in controls is no longer possible:Designers/editors no longer work: if a designer relied on showing information from the current page, that won't work either. That's basically because the new designer surface you get is not the one for the form at all, but a new one created for non-visual components. That means that all controls on the form, which used to live in the same container (IContainer, specifically) as your own components, no longer do. Effectively, you have no way of retrieving the controls that exist on the design surface of the forms editor. This is even if theIDesignerHostservice (that you can still ask for) Container property contains aPageobject, and that's because it's empty of controls :S:S. The following kind of editor is no longer possible:Components don't show up in the Toolbox: there's no way to make components appear in the toolbox. Even if they do show up in the Customize Toolbox dialog, and you can select them, they will never show up in the toolbox. As a consequence, there's no way to drop new components on a form. How are you supposed to use them therefore? The only way is through the components designer surface, with the problems mentioned above.

![](http://aspnet2.com/kzu/weblog/components_tray5.png)

```
IContainer
```

```
IDesignerHost
```

```
Page
```

![](http://aspnet2.com/kzu/weblog/components_tray2.png)

![](http://aspnet2.com/kzu/weblog/components_tray3.png)

Therefore, one of the most important uses of a component, which was to extend and interact with the form's UI elements, in nicely decoupled way (you didn't need to inherit any of the built-in controls to add functionality to them), is no longer possible.

Interestingly, WinForms developers continue to enjoy this feature, and the code generation part was made more robust and clean with the introduction of partial classes. I see this as a sign of commiting with an existing feature and working to improve it where it was lacking, as opposed to starting from scratch again and leaving the customers guessing what the hell happened to their investment.

Maybe I'm just too pesimist. But this doesn't look like a fix at all for my bug, and it certainly cuts so many of the features of non-visual components that it renders them pretty much useless. Hence, it only makes sense for me to reactivate the bug and ask once more for your cooperation in voting for this feature to come back once more.Go and vote the bug if you feel this is an important feature being lost.

posted on Saturday, May 28, 2005 12:30 AM
						bykzu

/kzu

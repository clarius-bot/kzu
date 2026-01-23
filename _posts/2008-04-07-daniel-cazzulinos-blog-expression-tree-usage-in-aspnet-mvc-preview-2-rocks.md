---
layout: post
title: "Daniel Cazzulino's Blog : Expression tree usage in ASP.NET MVC Preview 2 rocks!"
date: 2008-04-07 00:00:00 +0000
---

Daniel Cazzulino's Blog : Expression tree usage in ASP.NET MVC Preview 2 rocks!


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2982'\))| April 2008| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V3043'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 31| 1| 2| 3| 4| 5  
6| [7](http://www.clariusconsulting.net/blogs/kzu/archive/2008/4/7.aspx "2 Posts")| 8| 9| 10| 11| 12  
13| 14| 15| 16| 17| 18| 19  
20| 21| 22| 23| 24| 25| 26  
27| 28| 29| 30| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20080415103902im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### News

[![](https://web.archive.org/web/20080415103902im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080415103902im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](/web/20080415103902im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Expression tree usage in ASP.NET MVC Preview 2 rocks! 

The latest MVC release adds some pretty cool usage of LINQ expression trees. It's another example of how cool (and WAY beyond querying) LINQ is. 

Specifically, you can now replace untyped, "magic" strings when rendering links like:
    
    
    <%= Html.ActionLink("Sign up", "SignUp", "UserController", true) %>

[](http://11011.net/software/vspaste)

to type-safe and therefore compile-time checked code:
    
    
    <%= Html.ActionLink((UserController c) => c.SignUp(true), "Sign up") %>

[](http://11011.net/software/vspaste)

or the equivalent syntax:
    
    
    <%= Html.ActionLink<UserController>(c => c.SignUp(true), "Sign up") %>

[](http://11011.net/software/vspaste)

Basically MVC takes an Expression Tree with the invocation (which is actually a "potential" invocation) and makes up an HTML anchor with the url that corresponds to the controller, action and parameters. The relevant code from the [MVC sources](http://www.codeplex.com/aspnet/Release/ProjectReleases.aspx?ReleaseId=11833) is in Mvc\Extensions\LinkExtensions.cs:
    
    
    public static string ActionLink<T>(this HtmlHelper helper, Expression<Action<T>> action, string linkText, object htmlAttributes) where T : Controller {
    
        //TODO: refactor this to work with ActionLink in the core
        string linkFormat = "<a href=\"{0}\" {1}>{2}</a>";
        string atts = string.Empty;
    
        if (htmlAttributes != null)
            atts = HtmlExtensionUtility.ConvertObjectToAttributeList(htmlAttributes);
    
        string link = BuildUrlFromExpression(helper, action);
        string result = string.Format(CultureInfo.InvariantCulture, linkFormat, link, atts, helper.Encode(linkText));
        return result;
    }
    

[](http://11011.net/software/vspaste)

and LinkBuilder.cs:
    
    
    public static string BuildUrlFromExpression<T>(ViewContext context, Expression<Action<T>> action) where T : Controller {
        MethodCallExpression call = action.Body as MethodCallExpression;
        if (call == null) {
            throw new InvalidOperationException("Expression must be a method call");
        }
        if (call.Object != action.Parameters[0]) {
            throw new InvalidOperationException("Method call must target lambda argument");
        }
    
        string actionName = call.Method.Name;
        // TODO: Use better logic to chop off the controller suffix
        string controllerName = typeof(T).Name;
        if (controllerName.EndsWith("Controller", StringComparison.OrdinalIgnoreCase)) {
            controllerName = controllerName.Remove(controllerName.Length - 10, 10);
        }
    
        RouteValueDictionary values = BuildParameterValuesFromExpression(call);
    
        values = values ?? new RouteValueDictionary();
        values.Add("controller", controllerName);
        values.Add("action", actionName);
    
        VirtualPathData vpd = RouteTable.Routes.GetVirtualPath(context, values);
        return (vpd == null) ? null : vpd.VirtualPath;
    }
    

Together with other examples like the [type-safe/strong-typed reflection sample](http://www.clariusconsulting.net/blogs/kzu/archive/2006/07/06/TypedReflection.aspx) and [Moq](http://code.google.com/p/moq/), I hope you're starting to see the possibilities enabled by turning code into data.

## Extending RedirectToAction

I think we'll see the same pattern throughout the MVC framework, but at this time, you still have to use magic strings in some places:
    
    
    this.RedirectToAction("AddNew", "RegistrationController");

It's quite common the need to redirect from one controller action to a different controller action, passing some data around. In order to avoid having magic strings with controller names and action names throughout the place, we had this pattern in a few places (with the previous ASP.NET MVC release):
    
    
    public class RegistrationController : Controller
    {
        public static object AddNewRedirectData(string id)
        {
            return new { controller = "Registration", action = "AddNew", id = id };
        }
    
        public void AddNew(string id)
        {  
        }
    } 

Then another controller that wanted to redirect to the AddNew action, instead of referring to the controller and action by name, would do:
    
    
    RedirectToAction(RegistrationController.AddNewRedirectData(id));

[](http://11011.net/software/vspaste)

This was less than ideal, but it worked. But we needed to add a "xxxRedirectData" method for each action that wanted to encapsulate the magic strings. So I set to fix this by using the same approach shown above with expression trees, and came up with the following:
    
    
    this.RedirectToAction((RegistrationController c) => c.AddNew(id));

[](http://11011.net/software/vspaste)

And it's looking much better now :). The code is very similar to the one shown above:
    
    
    public static void RedirectToAction<T>(this Controller controller, Expression<Action<T>> action)
    {
        MethodCallExpression call = action.Body as MethodCallExpression;
        if (call == null)
        {
            throw new InvalidOperationException("Expression must be a method call");
        }
        if (call.Object != action.Parameters[0])
        {
            throw new InvalidOperationException("Method call must target lambda argument");
        }
    
        string actionName = call.Method.Name;
        // TODO: Use better logic to chop off the controller suffix
        string controllerName = typeof(T).Name;
        if (controllerName.EndsWith("Controller", StringComparison.OrdinalIgnoreCase))
        {
            controllerName = controllerName.Remove(controllerName.Length - 10, 10);
        }
    
        var values = LinkBuilder.BuildParameterValuesFromExpression(call);
        values.Add("action", actionName);
        values.Add("controller", controllerName);
    
        VirtualPathData vpd = RouteTable.Routes.GetVirtualPath(controller.ControllerContext, values);
        string target = null;
        if (vpd != null)
        {
            target = vpd.VirtualPath;
        }
    
        controller.HttpContext.Response.Redirect(target);
    }

posted on Monday, April 07, 2008 2:01 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/59274.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/07/59274.aspx#59275 "permalink") Expression tree usage in ASP.NET MVC Preview 2 rocks! @ Monday, April 07, 2008 2:35 PM

The latest MVC release adds some pretty cool usage of LINQ expression trees. It&amp;#39;s another example [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/04/07/expression-tree-usage-in-asp-net-mvc-preview-2-rocks.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/04/07/59274.aspx#59366 "permalink") Daniel Cazzulino's Blog : Expression tree usage in ASP.NET MVC Preview @ Wednesday, April 09, 2008 10:15 PM

You've been kicked (a good thing) - Trackback from DotNetKicks.com [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://www.dotnetkicks.com/aspnet/Daniel_Cazzulino_s_Blog_Expression_tree_usage_in_ASP_NET_MVC_Preview "TrackBack")

  

[![](/web/20080415103902im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
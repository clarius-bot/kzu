---
layout: post
title: "Expression tree usage in ASP.NET MVC Preview 2 rocks!"
date: 2008-04-07 00:00:00 +0000
---

##  [Expression tree usage in ASP.NET MVC Preview 2 rocks!](<http://blogs.clariusconsulting.net/kzu/expression-tree-usage-in-asp-net-mvc-preview-2-rocks/> "Expression tree usage in ASP.NET MVC Preview 2 rocks!")

April 7, 2008 9:01 pm

The latest MVC release adds some pretty cool usage of LINQ expression trees. It’s another example of how cool (and WAY beyond querying) LINQ is.

Specifically, you can now replace untyped, "magic" strings when rendering links like:
    
    
    <%= Html.ActionLink("Sign up", "SignUp", "UserController", true) %>

to type-safe and therefore compile-time checked code:
    
    
    <%= Html.ActionLink((UserController c) => c.SignUp(true), "Sign up") %>

or the equivalent syntax:
    
    
    <%= Html.ActionLink<UserController>(c => c.SignUp(true), "Sign up") %>

Basically MVC takes an Expression Tree with the invocation (which is actually a "potential" invocation) and makes up an HTML anchor with the url that corresponds to the controller, action and parameters. The relevant code from the [MVC sources](<http://www.codeplex.com/aspnet/Release/ProjectReleases.aspx?ReleaseId=11833>) is in Mvc\Extensions\LinkExtensions.cs:
    
    
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

Together with other examples like the [type-safe/strong-typed reflection sample](<http://www.clariusconsulting.net/blogs/kzu/archive/2006/07/06/TypedReflection.aspx>) and [Moq](<http://code.google.com/p/moq/>), I hope you’re starting to see the possibilities enabled by turning code into data.

## Extending RedirectToAction

I think we’ll see the same pattern throughout the MVC framework, but at this time, you still have to use magic strings in some places:
    
    
    this.RedirectToAction("AddNew", "RegistrationController");

It’s quite common the need to redirect from one controller action to a different controller action, passing some data around. In order to avoid having magic strings with controller names and action names throughout the place, we had this pattern in a few places (with the previous ASP.NET MVC release):
    
    
    public class RegistrationController : Controller
    {
        public static object AddNewRedirectData(string id)
        {
            return new { controller = "Registration", action = "AddNew", id = id };
        }
    
        public void AddNew(string id)
        {    }
    } 

Then another controller that wanted to redirect to the AddNew action, instead of referring to the controller and action by name, would do:
    
    
    RedirectToAction(RegistrationController.AddNewRedirectData(id));

This was less than ideal, but it worked. But we needed to add a "xxxRedirectData" method for each action that wanted to encapsulate the magic strings. So I set to fix this by using the same approach shown above with expression trees, and came up with the following:
    
    
    this.RedirectToAction((RegistrationController c) => c.AddNew(id));

And it’s looking much better now ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) . The code is very similar to the one shown above:
    
    
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

Posted by kzu
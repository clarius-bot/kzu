---
layout: post
title: "Daniel Cazzulino"
date: 2004-07-21 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Forms authentication and role-based security: improving performance

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2223'\))| March 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
26| 27| 28| 1| 2| 3| 4  
[5](http://clariusconsulting.net/blogs/kzu/archive/2004/7/5.aspx "2 Posts")| [6](http://clariusconsulting.net/blogs/kzu/archive/2004/7/6.aspx "1 Post")| 7| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2004/7/9.aspx "2 Posts")| 10| 11  
[12](http://clariusconsulting.net/blogs/kzu/archive/2004/7/12.aspx "1 Post")| 13| 14| [15](http://clariusconsulting.net/blogs/kzu/archive/2004/7/15.aspx "1 Post")| [16](http://clariusconsulting.net/blogs/kzu/archive/2004/7/16.aspx "3 Posts")| 17| 18  
19| [20](http://clariusconsulting.net/blogs/kzu/archive/2004/7/20.aspx "1 Post")| [21](http://clariusconsulting.net/blogs/kzu/archive/2004/7/21.aspx "2 Posts")| 22| 23| 24| 25  
26| 27| 28| 29| 30| 31| 1  
2| 3| 4| 5| 6| 7| 8  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060302083608im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Forms authentication and role-based security: improving performance 

The usual approach to custom role-based security using forms authentication (i.e. roles and users fetched from a database) on web apps is the following: 

protected void Application_AuthenticateRequest(Object sender, EventArgs e) { // Only replace the context if it has already been handled // by forms authentication module (user is authenticated) if (Context.Request.IsAuthenticated) { string roles[]; // Fetch roles from the database somehow. // Reuse the identity created by Forms authentication. GenericPrincipal ppal = new GenericPrincipal( Context.User.Identity, roles); Context.User = ppal; } }

There's one *huge* drawback to this approach, and it's that it will hit the database on every single request! So, the proposed improved solution is:

protected void Application_AuthenticateRequest(Object sender, EventArgs e) { if (Context.Request.IsAuthenticated) { // Retrieve user's identity from context user FormsIdentity ident = (FormsIdentity) Context.User.Identity; // Retrieve roles from the authentication ticket userdata field string[] roles = ident.Ticket.UserData.Split('|'); // If we didn't load the roles before, go to the DB if (roles[0].Length == 0) { // Fetch roles from the database somehow. // Store roles inside the Forms ticket. FormsAuthenticationTicket newticket = new FormsAuthenticationTicket( ident.Ticket.Version, ident.Ticket.Name, ident.Ticket.IssueDate, ident.Ticket.Expiration, ident.Ticket.IsPersistent, String.Join("|", roles), ident.Ticket.CookiePath); // Create the cookie. HttpCookie authCookie = new HttpCookie( FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(newticket)); authCookie.Path = FormsAuthentication.FormsCookiePath + "; HttpOnly; noScriptAccess"; authCookie.Secure = FormsAuthentication.RequireSSL; if (newticket.IsPersistent) authCookie.Expires = newticket.Expiration; Context.Response.Cookies.Add(authCookie); } // Create principal and attach to user Context.User = new System.Security.Principal.GenericPrincipal(ident, roles); } }

The new version only goes to the DB once. It also uses the same encryption features of forms authentication, as well as its ticket and cookie. A huge performance boost, that's for sure.

Thanks to [Hernan](http://weblogs.asp.net/hernandl) for pointing this out while reviewing the security chapter of [ my last book](http://www.amazon.com/exec/obidos/ASIN/1590593618/clarius-20). 

posted on Wednesday, July 21, 2004 3:28 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/272.aspx) :: 

  

[![](/web/20060302083608im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
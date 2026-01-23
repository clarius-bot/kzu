---
layout: post
title: "Daniel Cazzulino's Blog : How to get ASP.NET MVC Preview 4 to run with .NET SP1"
date: 2008-08-24 00:00:00 +0000
---

## How to get ASP.NET MVC Preview 4 to run with .NET SP1 

As you probably know by now (i.e. from [Phill's blog](http://haacked.com/archive/2008/08/14/aspnetmvc-not-in-sp1.aspx "ASP.NET MVC Is Not Part of ASP.NET 3.5 SP1")), however both [Routing](http://msdn.microsoft.com/en-us/library/system.web.routing.aspx) and [Abstractions](http://msdn.microsoft.com/en-us/library/system.web.httpcontextbase.aspx) are. [MVC Preview 4](http://www.asp.net/mvc/), however, has its own version of both assemblies.

In order to get MVC to use the new RTM bits of both assemblies (and avoid weird side-by-side errors), you just need to add the following binding redirect to the web.config file:
    
    
        <runtime>
            <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
                <dependentAssembly>
                    <assemblyIdentity name="System.Web.Abstractions" publicKeyToken="31bf3856ad364e35"/>
                    <bindingRedirect oldVersion="0.0.0.0" newVersion="3.5.0.0"/>
                </dependentAssembly>
                <dependentAssembly>
                    <assemblyIdentity name="System.Web.Routing" publicKeyToken="31bf3856ad364e35"/>
                    <bindingRedirect oldVersion="0.0.0.0" newVersion="3.5.0.0"/>
                </dependentAssembly>
                <dependentAssembly>
                    <assemblyIdentity name="System.Web.Extensions" publicKeyToken="31bf3856ad364e35"/>
                    <bindingRedirect oldVersion="1.0.0.0-1.1.0.0" newVersion="3.5.0.0"/>
                </dependentAssembly>
                <dependentAssembly>
                    <assemblyIdentity name="System.Web.Extensions.Design" publicKeyToken="31bf3856ad364e35"/>
                    <bindingRedirect oldVersion="1.0.0.0-1.1.0.0" newVersion="3.5.0.0"/>
                </dependentAssembly>
            </assemblyBinding>
        </runtime>
    

The other two redirects are added automatically by a Dynamic Data website, so I figured out it's better to put them there too :)

[](http://11011.net/software/vspaste)

/kzu

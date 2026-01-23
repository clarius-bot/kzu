---
layout: post
title: "Daniel Cazzulino"
date: 2006-02-07 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Friday, October 03, 2003 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))| February 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2251'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
29| 30| 31| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/10/3.aspx "1 Post")| 4  
[5](http://clariusconsulting.net/blogs/kzu/archive/2003/10/5.aspx "1 Post")| 6| [7](http://clariusconsulting.net/blogs/kzu/archive/2003/10/7.aspx "1 Post")| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2003/10/9.aspx "2 Posts")| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10.aspx "3 Posts")| [11](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11.aspx "1 Post")  
[12](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12.aspx "2 Posts")| 13| 14| 15| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17.aspx "2 Posts")| 18  
19| 20| [21](http://clariusconsulting.net/blogs/kzu/archive/2003/10/21.aspx "1 Post")| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2003/10/24.aspx "1 Post")| [25](http://clariusconsulting.net/blogs/kzu/archive/2003/10/25.aspx "1 Post")  
[26](http://clariusconsulting.net/blogs/kzu/archive/2003/10/26.aspx "1 Post")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/10/27.aspx "1 Post")| [28](http://clariusconsulting.net/blogs/kzu/archive/2003/10/28.aspx "1 Post")| 1| 2| 3| 4  
5| 6| 7| 8| 9| 10| 11  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060207043302im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Friday, October 03, 2003 - Posts

#####  [Cut-down WS-Security (x509 signed) message payload](http://clariusconsulting.net/blogs/kzu/archive/2003/10/03/80.aspx)

WSE specifies how to sign and send an x509 certificate token with a SOAP message. You can find many examples on how to do that (see [ MSDN](http://msdn.microsoft.com/library/en-us/dnwssecur/html/wssecauthwse.asp?frame=true#wssecauthwse_topic4) and [ other articles](http://www.google.com/search?num=20&hl=en&lr=lang_en%7Clang_es&ie=UTF-8&oe=utf-8&q=signing+WSE+X509&btnG=Google+Search)). What they don't say (at least explicitly) is that sending the token with the message adds a HUGE payload to it, which may be completely unnecessary if you KNOW that both ends will sign with a specific certificate. This is exactly the case when you have distributed machines that exchange messages as part as your own company infrastructure, where each server has the same corporate certificate installed locally. 

A simple message containing a method call with no parameters, signed with an x509 certificate as suggested in MSDN , can weight an aproximate 4kb, being the binary token itself about 1.5kb of that. That's more than 30% of the message payload! Consider sending that with each request through a WAN or worse, a dial-up connection...

WSE 2 solves this problem (and others) by implementing the [ WS-SecureConversation](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnglobspec/html/ws-secureconversation.asp) spec., as explained in [ a recent article at MSDN](http://msdn.microsoft.com/webservices/default.aspx?pull=/library/en-us/dnwebsrv/html/wssecdrill.asp#ws-securitydrill_topic10), but it involves more complexity (and features, for sure) than required only to solve "our" problem. And it's a technical preview, don't forget. 

So, how do you avoid sending the base-64 encoded binary chunk at all? The answer lies in signing the message, but not adding the token to the envelope. You can do so by adding the signature alone:

`
    
    
    SecurityToken token = SecurityTokenHelper.GetToken();
    
    //Create the signature.
    Signature sgn = new Signature(token);
    
    envelope.Context.Security.Elements.Add(sgn);
    //Don't sent token to avoid PK binary payload
    //envelope.Context.Security.Tokens.Add(token);

`

The last (commented) line is the one you're avoiding, and therefore the message will now include all the WS-Security elements that belong to the signature EXCEPT the `wsse:BinarySecurityToken` element. On the receiving end, you need to add that same token to the context, BEFORE WSE processes the signature/encryption. You can achieve this by writing a custom WSE input filters and adding it in the appropriate place in the processing pipeline. The filter code is simple: 

`
    
    
    public class SignatureInputFilter : SoapInputFilter
    {
      public override void ProcessMessage(SoapEnvelope envelope)
      {
        //Locate the WS-Security elements.
        XPathNodeIterator security = envelope.CreateNavigator().Select(SecurityExpression);
        //Is the WS-Security element is found, add the token.
        if (security.MoveNext())
        {
          XmlNode secnode = ((IHasXmlNode)security.Current).GetNode();
    
          //If the token is already present, replace it with our own framework token (avoids security holes).
          XPathNodeIterator token = secnode.CreateNavigator().Select(TokenExpression);
          if (token.MoveNext())
            secnode.RemoveChild(((IHasXmlNode)token.Current).GetNode());
    
          SecurityToken fw = SecurityTokenHelper.GetToken();
          //Insert the token at the beginning of the security element.
          secnode.InsertBefore(fw.GetXml(envelope), secnode.FirstChild);
        }
      }
    }

`

As a security measure, we remove any existing token that pretends to be our token. But the critical piece is the `secnode.InsertBefore` method call. At that moment, we're recreating the message structure exactly as it's expected by the WSE `SecurityInputFilter`, the one that handles WS-Security aspects.   
We also use two variables, `SecurityExpression` and `TokenExpression` which are precompiled XPath expressions to make the filter more performant. They are defined and compiled as follows: 

`
    
    
    public class SignatureInputFilter : SoapInputFilter
    {
      private static XPathExpression SecurityExpression; 
      private static XPathExpression TokenExpression; 
      
      static SignatureInputFilter()
      {
        //Dummy document for compilation.
        XmlDocument doc = new XmlDocument();
    
        //The namespace manager for all our expressions.
        XmlNamespaceManager mgr = new XmlNamespaceManager(doc.NameTable);
        mgr.AddNamespace(Soap.Prefix, Soap.NamespaceURI);
        mgr.AddNamespace(WSSecurity.Prefix, WSSecurity.NamespaceURI);
        mgr.AddNamespace(WSTimestamp.Prefix, WSTimestamp.NamespaceURI);
        //Our custom prefix and namespace defined elsewhere.
        mgr.AddNamespace(FrameworkServices.Prefix, FrameworkServices.NamespaceURI);
    
        //Create expression to locate wsse:Security.
        SecurityExpression = doc.CreateNavigator().Compile("/" +
          Soap.Prefix + ":" + Soap.ElementNames.Envelope + "/" + 
          Soap.Prefix + ":" + Soap.ElementNames.Header + "/" + 
          WSSecurity.Prefix + ":" + WSSecurity.ElementNames.Security);
        SecurityExpression.SetContext(mgr);
    
        //Create expression to locate a previously existing token.
        TokenExpression = doc.CreateNavigator().Compile(SecurityExpression.Expression + "/" + 
          WSSecurity.Prefix + ":" + WSSecurity.ElementNames.BinarySecurityToken + "[@" +
          WSTimestamp.Prefix + ":" + WSTimestamp.AttributeNames.Id + "='" + 
          FrameworkServices.AttributeNames.SecurityTokenId + "']");
        TokenExpression.SetContext(mgr);
      }
    ...

`

Note that I use all the namespaces and prefixes defined in WSE itself, so we're safe against future namespace changes. I've seen far too many projects that use hardcoded strings for that. You will notice I defined a FrameworkServices class with constants for my own namespace, prefix and special names, such as the `FrameworkServices.AttributeNames.SecurityTokenId`. It's a good practice I borrowed from WSE itself. FrameworkServices is a class that contains only constants, and two inner classes, AttributeNames and ElementNames, which provide a single maintenance point for all your XML-related tokens. I stripped-out the comments and #regions to make it more readable, and it looks like the following:

`
    
    
    public class FrameworkServices
    {
      public const string NamespaceURI = "urn:my-framework";
      public const string Prefix = "fw";
    
      private FrameworkServices() {}
    
      public class ElementNames
      {
        public const string Service = "Service";
        ...
        private ElementNames() {}
      }
    
      public class AttributeNames
      {
        public const string SecurityTokenId = "urn:my-framework:token";
        ...
        private AttributeNames() {}
      }
    }

`

When you sign a message, WSE adds a reference to the token (which is supposed to be inside the message) identifier, which is taken from the `SecurityToken.Id` property. Needless to say, this Id MUST be the same when we restore the token at the receiver end, and that's what we ensure by using the same token returned by the helper class `SecurityTokenHelper`:

`
    
    
    internal class SignatureHelper
    {
      private static SecurityToken _token;
      
      static SignatureHelper()
      {
        X509CertificateStore store = null;
    
        try
        {
          //Open the certificate store and retrieve it
          store = X509CertificateStore.LocalMachineStore(X509CertificateStore.MyStore);
          store.OpenRead();
    
          X509Certificate cert = null;
          //We assume the appSettings section contains the certificate to use.
          X509CertificateCollection certs = store.FindCertificateBySubjectName(
            ConfigurationSettings.AppSettings["certificate"]);
            
          if (certs.Count == 0)
            throw new SecurityFormatException(SR.GetString(SR.sig_NoCertificateFound));
          else
            cert = certs[0];
    
          //Construct a token with it.
          _token = new X509SecurityToken(cert);
          //Set a fixed Id
          _token.Id = FrameworkServices.AttributeNames.SecurityTokenId;
        } 
        finally 
        {
          if (store != null) 
          {
            try { store.Close(); } catch {}
          }
        }
      }
    
      internal static X509SecurityToken GetToken()
      {
        return _token;
      }
    }

`

The static constructor tries to locate the certificate specified in the appSettings section, and assignes a fixed Id to it, which is used by WSE to reference the token inside the message, as we said.  
Now, everything is in-place, we just have to configure the WSE pipeline to include our input filter at the appropriate position. This can be done in the ` Global.asax`:

`
    
    
    protected void Application_Start(object sender, EventArgs e)
    {
      WebServicesConfiguration.FilterConfiguration.InputFilters.Insert(
        0, new SignatureInputFilter());
    }

`

Here we added our filter to the top of the input chain, which means it's the closest to the wire. Therefore, if you enable WSE tracing, you will actually see the message with the token in-place, but it wouldn't have travelled through the wire!

In a future article I will explain how to fully configure WSE filters declaratively (something I asked through the newsgroup some time ago; unfortunately the post has vanished...), as follows:

`
    
    
    			
    <configuration>
      <configSections>
        <section name="framework.web.services" 
          type="Framework.Web.Services.Configuration.FrameworkServicesConfiguration, Framework.Web.Services" />
      </configSections>
    
      <framework.web.services>
        <!-- filters: selection of WSE filters that will be applied to incoming and outgoing messages. -->
        <filters>
          <!-- Disable routing features -->
          <remove type="Microsoft.Web.Services.Routing.RoutingInputFilter, 
                Microsoft.Web.Services, Version=1.0.0.0, 
                Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
          <remove type="Microsoft.Web.Services.Routing.RoutingOutputFilter, 
                Microsoft.Web.Services, Version=1.0.0.0, 
                Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
    
          <!-- Disable referral features -->
          <remove type="Microsoft.Web.Services.Referral.ReferralInputFilter, 
                Microsoft.Web.Services, Version=1.0.0.0, 
                Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
          <remove type="Microsoft.Web.Services.Referral.ReferralOutputFilter, 
                Microsoft.Web.Services, Version=1.0.0.0, 
                Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
    
          <!-- Input filters -->
          <add at="0" type="Framework.Web.Services.Filters.SignatureInputFilter, Framework.Web.Services" />
          <move to="0" type="Microsoft.Web.Services.Diagnostics.TraceInputFilter, 
                Microsoft.Web.Services, Version=1.0.0.0, 
                Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
    
          <!-- Output filters -->
          <add type="Framework.Web.Services.Filters.SignatureOutputFilter, Framework.Web.Services" />
          <move to="0" type="Microsoft.Web.Services.Diagnostics.TraceOutputFilter, 
                Microsoft.Web.Services, Version=1.0.0.0, 
                Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
        </filters>
      </framework.web.services>
    </configuration>

`

Needless to say, you can save quite a lot bandwidth by disabling the features you don't use, such as Routing and Referral as shown above. You can see it's possible to remove filters by their type, move their position, and add new ones to specific positions (@at attribute) or to the top of the list (no @at attribute). The more comments asking for that second part, the faster I'll get it ;).

posted [Friday, October 03, 2003 1:39 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/10/03/80.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/10/03/80.aspx#comments)

  

![](/web/20060207043302im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
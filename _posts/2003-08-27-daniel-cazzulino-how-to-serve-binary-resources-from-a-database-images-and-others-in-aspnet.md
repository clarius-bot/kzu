---
layout: post
title: "Daniel Cazzulino : How to serve binary resources from a database (images and others) in ASP.NET?"
date: 2003-08-27 00:00:00 +0000
---

Daniel Cazzulino : How to serve binary resources from a database (images and others) in ASP.NET?

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2131'\))| December 2005| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/8/22.aspx "3 Posts")| 23| 24  
25| [26](http://clariusconsulting.net/blogs/kzu/archive/2003/8/26.aspx "3 Posts")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/8/27.aspx "1 Post")| [28](http://clariusconsulting.net/blogs/kzu/archive/2003/8/28.aspx "1 Post")| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
  

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

## How to serve binary resources from a database (images and others) in ASP.NET? 

This is such a frequent question, that I thought I’d better spend some time outlining a customizable and versatile solution so that it can be reused in future scenarios.   
Often, binary resources such as employee pictures, office documents in a document management system, and others, are stored in a database. Now the issue is how to pull that information out of it and show it using ASP.NET. One way to solve this problem is creating a dummy ASP.NET page that simply uses `Response.BinaryWrite()` to output the binary field brought by the DB query, as is explained in an [ASP Alliance](http://aspalliance.com/das/datagridimages.aspx) article. However, you don’t get encapsulation and reusability, having to resort to copy/paste as new projects need such a feature.   
My advice is to always use a custom `IHttpHandler` that serves these binary resources. Of course this is not a new idea, I'm just putting it here so I can refer to the countless persons that asked me.   
You have to map a path to your handler in the `Web.config` file, and to avoid having to modify the IIS extensions mapping, you should use one of the built-in extensions that are already mapped to ASP.NET at installation time: .ashx or .axd. It's always better to use an specific "file name" for your handler, to avoid interfering with the ASP.NET built-in handlers. Such a handler should be configured in the `Web.config` as follows: 

`
    
    
    <configuration>
      <system.web>
        ...
        <httpHandlers>
          <add verb="GET" path="getresource.axd" type="NMatrix.Web.BinaryResourceHandler, NMatrix.Core" />
        </httpHandlers>
    

`

From now on, each request sent to the "file" getresource.axd will be passed to our handler. The ".ashx" extension could have been used too: it's already mapped in IIS to the ASP.NET ISAPI filter, it doesn't affect the normal ASP.NET execution, and it was conceived as the natural extension to use by so-called "web handlers" (see [other articles](http://www.google.com/search?q=%22%40+webhandler%22+asp.net+IHttpHandler)). However, that extension is usually applied to files that look like .aspx with inline server-side code with an @ webhandler directive. That's why I prefer the "axd" extension. We map only the `GET` verb as it's the only one we will need to retrieve resources. This could easily be extended by allowing the `POST` verb meaning a new resource should be stored. I'll leave that as homework for the reader. Mostly, uploading resources is a more complex process that involves authorization at least, maybe even a full document management system. 

The handler will need two parameters: the resource ID and the connection string to the repository. The first one will be provided by the calling client, as a query string value. The later is stored in the `Web.config` for simplicity: 

`
    
    
    <configuration>
      <appSettings>
      <add key="connection" value="Data Source=.\NetSdk;Initial Catalog=Resources;User Id=sa;Pwd=;" />
      </appSettings>

`

To make the storage flexible, the table storing the resources will also contain a ContentType to allow the storage of arbitrary types. Now the handler code: 

`
    
    
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Data.SqlTypes;
    using System.Web;
    
    namespace NMatrix.Web
    {
      /// <summary>
      /// Serves binary resources stored in a database.
      /// </summary>
      /// <author>Daniel Cazzulino</author>
      public class BinaryResourceHandler : IHttpHandler
      {
        #region Ctor & Vars
    
        //Key used in Web.config
        public const string ConnectionStringKey = "connection";
        //Holds the DB connection
        private static string _connectionstring;
        //Size of the chunk to read from the DB
        private const int ChunkSize = 1024;
    
        static BinaryResourceHandler()
        {
          _connectionstring = ConfigurationSettings.AppSettings[ConnectionStringKey];
          if (_connectionstring == null || _connectionstring.Length == 0)
            throw new ArgumentException("A 'connection' attribute must be provided to the handler.");
        }
    
        #endregion Ctor & Vars
    
        #region IHttpHandler Members
    
        public void ProcessRequest(HttpContext context)
        {
          string id = context.Request.QueryString["id"];
          if (id == null || id.Length == 0)
            throw new ArgumentException("An 'id' query string value must be specified.");
    
          using (SqlConnection cn = new SqlConnection(_connectionstring))
          {
            SqlCommand cmd = new SqlCommand("SELECT ContentType, BinaryData FROM Resources WHERE ResourceId=@id", cn);
            cmd.Parameters.Add("@id", SqlDbType.VarChar, 50);
            cmd.Parameters["@type"].Value = id
            cn.Open();
            //CommandBehavior.SequentialAccess avoids loading the entire BLOB in-memory.
            SqlDataReader r = cmd.ExecuteReader(CommandBehavior.SequentialAccess);
            if (r.Read())
            {
              context.Response.ContentType = r.GetString(0);
              byte[] buffer = new byte[ChunkSize];
              long idx = 0;
              long size = 0;
              //Write the BLOB chunk by chunk.
              while ((size = r.GetBytes(1, idx, buffer, 0, ChunkSize)) == ChunkSize)
              {
                context.Response.BinaryWrite(buffer);
                idx += ChunkSize;
              }
               //Write the last bytes.
               byte[] remaining = new byte[size];
               Array.Copy(buffer, 0, remaining, 0, size);
               context.Response.BinaryWrite(remaining);
            }
    
          }
        }
    
        /// <summary>
        /// This instance is freely reusable.
        /// </summary>
        public bool IsReusable
        {
          get { return true; }
        }
    
        #endregion IHttpHandler Members
      }
    }

`

The code is straightforward. The only tip is that by using `CommandBehavior.SequentialAccess`, the SqlDataReader can read the binary data in chunks, avoiding to load it completely in-memory (thanks Pablo Castro!).   
A client application performing uploads could simply have a file upload HTML control (with `runat="server"` to allow our code to access the `Request.Files` collection) and with the following code could simply save arbitrary files to the database: 

`
    
    
    private void btnUpload_ServerClick(object sender, System.EventArgs e)
    {
      using (SqlConnection cn = new SqlConnection(ConfigurationSettings.AppSettings[
             NMatrix.Web.BinaryResourceHandler.ConnectionStringKey]))
      {
        SqlCommand cmd = new SqlCommand("INSERT INTO Resources (ContentType, BinaryData) VALUES (@type, @data)", cn);
        cmd.Parameters.Add("@type", SqlDbType.VarChar, 50);
        cmd.Parameters.Add("@data", SqlDbType.Image);
        cmd.Parameters["@type"].Value = txtContent.Text;
        byte[] data = new byte[Request.Files[0].InputStream.Length];
        //Trunc the stream length. Nobody will be able to send Int.MaxValue bytes (around 2Gb!)
        Request.Files[0].InputStream.Read(data, 0, (int) Request.Files[0].InputStream.Length);
        cmd.Parameters["@data"].Value = data;
        cn.Open();
        cmd.ExecuteNonQuery();
      }         
    }
    

`

The `ContentType` field has a purpose: if someone specifies `application/msword` or `application/msexcel` (or any other content type understood and handled specially by the browser), IE will automatically instantiate the appropriate Office application inside the browser window to open the incoming "file" (stream, more properly).  
To refer to a resource of type `image/jpg` from an `<img>` HTML tag, we could use: 

`
    
    
    <img alt="Dynamically served image" src="getresource.axd?id=3">

`

To directly open a Word document from the server, we could simply point IE to the same handler passing its id.

posted on Wednesday, August 27, 2003 4:14 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/74.aspx) :: 

#### [#](http://clariusconsulting.net/blogs/kzu/archive/2003/08/27/74.aspx#392 "permalink") re: How to serve binary resources from a database (images and others) in ASP.NET? @ Sunday, November 13, 2005 4:19 AM

Hi   
It was a nice article. And Thanks a lot for showing this idea to the dev community ! :)   
  
I tried to use this code to check pdf docs..but doesnt open. I tried with word, imgs it opens but pdf doesnt open.   
I gave the mime type as application/pdf.   
  
IT shows a blank page when it opens.   
  
Can you suggest me possible reasons for that ? [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

Pack

  

![](/web/20051225010056im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)
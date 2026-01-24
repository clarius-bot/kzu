---
layout: post
title: "Daniel Cazzulino's Blog - How to serve binary resources from a database (images and others) in ASP.NET?"
date: 2003-08-27 00:00:00 +0000
---

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
          if (_connectionstring == null             throw new ArgumentException("An 'id' query string value must be specified.");
    
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

/kzu

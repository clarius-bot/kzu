---
layout: post
title: "Daniel Cazzulino"
date: 2003-08-28 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Encrypted server control licensing? Naahh...

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2282'\))| May 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2343'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
30| 1| 2| 3| 4| 5| 6  
7| 8| 9| 10| 11| 12| 13  
14| 15| 16| 17| 18| 19| 20  
21| [22](http://clariusconsulting.net/blogs/kzu/archive/2003/8/22.aspx "3 Posts")| 23| 24| 25| [26](http://clariusconsulting.net/blogs/kzu/archive/2003/8/26.aspx "3 Posts")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/8/27.aspx "1 Post")  
[28](http://clariusconsulting.net/blogs/kzu/archive/2003/8/28.aspx "1 Post")| 29| 30| 31| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060502001952im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Encrypted server control licensing? Naahh... 

I'd think more than twice before implementing the [Encrypted Licence Scheme](http://www.msdn.microsoft.com/library/en-us/dnaspp/html/aspnetcontrollicensing.asp?frame=true#aspnetcontrollicensing_topic8) proposed by [Nikhil Kotari](http://www.nikhilk.net/). He's proposing to embed the bytes of the key in the assembly itself, and use that as the encryption (for the generator) and decryption (at run-time).  
Any decent programmer knows that dumping the IL code with ILDASM will easily expose those bytes as follows (even in Release mode compilation): 

`
    
    
    .data D_00002408 = bytearray (
                     35 46 42 32 38 31 46 36)                         // 5FB281F6

`

Now you can write a trivial console app to hack the expiration limit proposed in the same document, for example:

`
    
    
    [STAThread]
    static void Main(string[] args)
    {
      byte[] encryptionKeyBytes = ASCIIEncoding.ASCII.GetBytes("5FB281F6");
      string license;
    
      DESCryptoServiceProvider des = new DESCryptoServiceProvider();
      des.Key = encryptionKeyBytes;
      des.IV = encryptionKeyBytes;
    
      // Read the encrypted file.
      ICryptoTransform desDecryptor = des.CreateDecryptor();
      using (FileStream fs = new FileStream(@"..\..\LicensedControls.EncryptedLicensedLabel.lic", FileMode.Open))
      {
        using (Stream crypt = new CryptoStream(fs, desDecryptor, CryptoStreamMode.Read))
        {
          byte[] licbytes = new byte[fs.Length];
                crypt.Read(licbytes, 0, licbytes.Length);
          license = UTF8Encoding.UTF8.GetString(licbytes);
        }
      }
    
      Console.WriteLine("Decrypted licence: {0}", license);
      
      // Spoof the license with a bigger limit.
      license = String.Concat(
        license.Substring(0, license.LastIndexOf(".") + 1), 
        ";", Int32.MaxValue);
      Console.WriteLine("Hacked licence: {0}", license);
    
      // Persist it encrypted again.
      ICryptoTransform desEncryptor = des.CreateEncryptor();
      using (FileStream fs = new FileStream(@"..\..\LicensedControls.EncryptedLicensedLabel.lic", FileMode.Create))
      {
        using (CryptoStream crypt = new CryptoStream(fs, desEncryptor, CryptoStreamMode.Write))
        {
          byte[] licbytes = UTF8Encoding.UTF8.GetBytes(license);
          crypt.Write(licbytes, 0, licbytes.Length);
          crypt.FlushFinalBlock();
        }
        fs.Flush();
      }
    
      Console.WriteLine("Finished");
      Console.ReadLine();
    }
    

`

Voila! Now your licensed control can be used almost forever without expiration (I could have used Int64.MaxValue to get even more, but you get the idea).   
I believe we have to come up with a better solution. Maybe signing the license file with the assembly private key (sn.exe-generated), and then checking its integrity with the assembly public key... what about building something like that right inside ASP.NET 2.0? That would really great! 

posted on Thursday, August 28, 2003 1:51 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/75.aspx) :: 

  

[![](/web/20060502001952im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
---
layout: post
title: "Daniel Cazzulino's Blog : Binary serialization, the smarter way: reloaded"
date: 2003-08-26 00:00:00 +0000
---

Daniel Cazzulino's Blog : Binary serialization, the smarter way: reloaded

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20080827163158im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080827163158im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080827163158im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080827163158im_/http://clariusconsulting.net/img/mail-to-button.gif) Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Binary serialization, the smarter way: reloaded 

[VGA](http://weblogs.asp.net/vga/posts/25121.aspx) posted about a way to improve the binary serialization, by using a compact format. We work together, and I was surprised he didn't post some code for all the code-hungry guys, so here it is: 

`
    
    
    public sealed class BinaryHelper
    {
    	private enum TypeID : byte
    	{
    		Boolean = 0x03, 
    		Byte = 0x06, 
    		...
    	}
    
    	private static Type[] _types;
    
    	static IOHelper()
    	{
    		_types = new Type[19];
    		_types[0] = typeof(string);
    		_types[1] = typeof(int);
    		_types[2] = typeof(bool);
    		...
    	}
    
    	private BinaryHelper(){}
    
    	public static object ReadBinary(BinaryReader reader)
    	{
    		TypeID code = (TypeID) reader.ReadByte();
    
    		switch (code)
    		{
    			case TypeID.Boolean:
    				return reader.ReadBoolean();
    			case TypeID.Byte:
    				return reader.ReadByte();
    			...
    			case TypeID.Object:
    				BinaryFormatter fmt = new BinaryFormatter();
    				MemoryStream stm = new MemoryStream(reader.ReadBytes(reader.ReadInt32()));
    				return fmt.Deserialize(stm);
    			...
    		}
    	}
    
    	public static void WriteBinary(BinaryWriter writer, object value)
    	{
    		if (value == null)
    		{
    			writer.Write((byte)TypeID.Null);
    			return;
    		}
    
    		Type t = value.GetType();
    		//Write according to type.
    
    		if (t == _types[0])
    		{
    			writer.Write((byte)TypeID.String);
    			writer.Write((String)value);
    			return;
    		}
    		if (t == _types[1])
    		{
    			writer.Write((byte)TypeID.Int32);
    			writer.Write((int)value);
    			return;
    		}
    		...
    		//Other types serialized to binary directly.
    		try
    		{
    			writer.Write((byte)TypeID.Object);
    			BinaryFormatter fmt = new BinaryFormatter();
    			MemoryStream stm = new MemoryStream();
    			fmt.Serialize(stm, value);
    			writer.Write(stm.Length);
    			writer.Write(stm.ToArray());
    		}
    		catch (Exception ex)
    		{
    			throw new InvalidOperationException("Couldn't serialize object.", ex);
    		}
    	}
    }

`

Note that for arbitrary object serialization, the class relies in built-in `BinaryFormatter`, which makes it an improvement of if but not a replacement. The types specified in the TypeID enumeration will be highly optimized, and could even expand on the future if you find better ways of serializing other types.  
You can figure out the missing parts. It's pretty clear in the IL code (maybe Reflector can help more). What's important is that whether or not you saw System.Web AltSerialization class, this approach is so logic and common that I doubt many more developers haven't arrived to very similar code before (at least I did, even before .NET existed). 

posted on Tuesday, August 26, 2003 5:29 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/71.aspx) :: 

  

[![](/web/20080827163158im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
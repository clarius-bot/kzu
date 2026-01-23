---
layout: post
title: "Daniel Cazzulino"
date: 2006-05-26 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Tuesday, August 26, 2003 - Posts

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
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060526143920im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## Tuesday, August 26, 2003 - Posts

#####  [Visitor Design Pattern: revisited for .NET](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/73.aspx)

The somewhat forgot Visitor Design Pattern exposed by Gamma et all (the legendary GoF book), is explored under the light of .NET and C#, and a new way of implementing it in an extensible yet easy way is discussed in [my article](http://weblogs.asp.net/cazzu/posts/25488.aspx). 

posted [Tuesday, August 26, 2003 9:17 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/73.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/73.aspx#comments)

#####  [XSD.EXE is still useful (or how to get properties instead of fields)](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/72.aspx)

Getting code form XSD files is a great help when you have to create many entities reflecting your business logic. It also allows for easy extensibility because you only have to change the schema and generate the entities again. Using xsd.exe /c, you can get the XmlSerializer-friendly classes in a snap. What's more, a very usefull tool by [Chris Sells](http://www.sellsbrothers.com/tools/#xsdClassesGen) even makes the process automatic inside the IDE, with a custom tool.  
However, the problem with XSD is that it generates classes with public fields instead of property get/sets, which is far from ideal. 

As you probably know, there's no way of customizing XSD.EXE, so how can we get the properties and still use it? A little work with regular expressions and the Find/Replace dialog does the trick. Use the following values in the dialog:

`
    
    
    Find what:    public {[^ ]+} {[^ ]+};
    Replace with: public \1 \2 \n\t\t{\n\t\t\tget { return _\2; }\n\t\t\tset { _\2 = value; }\n\t\t} private \1 _\2;

`

Remember to check `Use Regular Expressions`. Now you will get the following code:

`
    
    
    /// 
    public int CustomerID;

`

replaced with:

`
    
    
    /// 
    public int CustomerID 
    {
     get { return _CustomerID; }
     set { _CustomerID = value; }
    } private int _CustomerID;

`

Lastly, having public properties lets you bind these custom classes directly to a WinForms datagrid and get the properties as columns automatically (yeah... I know nobody will EVER use that...). But you can always take the blue pill after doing so ;)

posted [Tuesday, August 26, 2003 8:26 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/72.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/72.aspx#comments)

#####  [Binary serialization, the smarter way: reloaded](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/71.aspx)

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

posted [Tuesday, August 26, 2003 5:29 PM](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/71.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [0 Comments](http://clariusconsulting.net/blogs/kzu/archive/2003/08/26/71.aspx#comments)

  

[![](/web/20060526143920im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
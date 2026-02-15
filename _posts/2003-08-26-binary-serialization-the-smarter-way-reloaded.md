---
layout: post
title: 'Binary serialization, the smarter way: reloaded'
date: 2003-08-26 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/25440
tags:
- .NET

---

[VGA](http://weblogs.asp.net/vga/posts/25121.aspx) posted about a way to improve the binary serialization, by using a compact format. We work together, and I was surprised he didn't post some code for all the code-hungry guys, so here it is: 

```
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
```

Note that for arbitrary object serialization, the class relies in built-in `BinaryFormatter`, which makes it an improvement of if but not a replacement. The types specified in the TypeID enumeration will be highly optimized, and could even expand on the future if you find better ways of serializing other types.  
You can figure out the missing parts. It's pretty clear in the IL code (maybe Reflector can help more). What's important is that whether or not you saw System.Web AltSerialization class, this approach is so logic and common that I doubt many more developers haven't arrived to very similar code before (at least I did, even before .NET existed). 

/kzu

---
layout: post
title: "Daniel Cazzulino's Blog : Reading XML fragments with XmlTextReader - XmlFragmentStream"
date: 2004-04-23 00:00:00 +0000
---

## Reading XML fragments with XmlTextReader - XmlFragmentStream 

Back at the [2004 MVP Global Summit](http://mvp.support.microsoft.com/default.aspx?scid=fh;en-us;mvpsmt2004), I met fellow XML fan [Kirk](http://weblogs.asp.net/kaevans), who was seeking a solution to the following problem: you have a (several) megabytes file containing multiple XML fragments, and you want to read it (in [his case](http://weblogs.asp.net/kaevans/archive/2004/04/24/119508.aspx) specially through the [SgmlReader](http://www.gotdotnet.com/Community/UserSamples/Details.aspx?SampleGuid=B90FDDCE-E60D-43F8-A5C4-C3BD760564BC)). The problem is, of course, that the `XmlTextReader` will throw an exception as soon as it finds the second fragment, unless you use the special ctor. overload that takes an `XmlParsingContext`.[ Dare](http://www.25hoursaday.com/) [shows](http://msdn.microsoft.com/xml/default.aspx?pull=/library/en-us/dnxmlnet/html/largexml.asp) an alternate solution based on XML inclusion techniques, either DTD external entities or [XInclude](http://workspaces.gotdotnet.com/xinclude). 

These techniques effectively expose a fully well-formed document to your application, which has a number of benefits, including the ability to transform it if you need to, for example. But I was thinking more along the lines of providing a class that could actually read the fragments without resorting to those mechanisms. I couldn't cheat the `XmlTextReader`, so I decided to go one step lower. The result is the `XmlFragmentStream`, a class that wraps any `System.IO.Stream` and fakes the missing root element, so that an `XmlTextReader` layered on top of it, will think the document is well-formed. Here's how to use it: 

Given the following XML fragments:

127.0.0.1 GET ... 127.0.0.1 POST ...   
...

You can read (and even validate with an `XmlValidatingReader`) using this code:

using (Stream stm = File.OpenRead("events.xml"))  
{  
XmlTextReader tr = new XmlTextReader(new XmlFragmentStream(stm));  
// Do performant ref comparison  
string ev = tr.NameTable.Add("event");  
while (tr.Read())  
{  
if (tr.LocalName == ev)  
// Process it!  
}  
}

The `XmlFragmentStream` class also contain two contructor overloads that allow you to specify the name and namespace of the enclosing root element (by default `<root>`):
    
    
    public XmlFragmentStream(Stream innerStream, string rootName)  
    public XmlFragmentStream(Stream innerStream, string rootName, string namespaceURI)

This technique is proven by a real world (surely happy) customer Kirk helped ;). What's more, he even contributed a bug-fix he found when using it.   
The performance impact of this approach in negligible because the class is basically an intermediary with minimal processing.

As Oleg noted pointed in a comment (and motivated a slight editing in this post), as well as [showed in his weblog](http://www.tkachenko.com/blog/archives/000053.html), you can do this with the aforementioned special `XmlTextReader` constructor overload, passing an `XmlParsingContext`. This is more cumbersome, in my opinion, and still leaves you with the problem of not having a valid XML document.

+ As usual, if you just want the full class code to copy-paste on your project, here it is. I strongly encourage you to take a look at the Mvp.Xml project, as there're other really cool goodies there! `
    
    
    #region using  
      
    using System;  
    using System.IO;  
    using System.Text;  
      
    #endregion using  
      
    namespace Mvp.Xml.Common  
    {  
     /// <summary>  
     /// Allows streams without a root element (i.e. multiple document   
     /// fragments) to be passed to an <see cref="System.Xml.XmlReader"/>.  
     /// </summary>  
     /// <remarks>A faked root element is added at the stream   
     /// level to enclose the fragments, which can be customized   
     /// using the overloaded constructors.  
     /// <para>Author: Daniel Cazzulino, kzu@aspnet2.com</para>  
     /// See: http://weblogs.asp.net/cazzu/archive/2004/04/23/119263.aspx.  
     /// </remarks>  
     public class XmlFragmentStream : Stream  
     {  
     #region Fields  
      
     // Holds the inner stream with the XML fragments.  
     Stream _stream;  
      
     bool _first = true;  
     bool _done = false;  
     bool _eof = false;  
      
     // TODO: there's a potential encoding issue here.  
     byte[] _rootstart = UTF8Encoding.UTF8.GetBytes("<root>");  
     byte[] _rootend = UTF8Encoding.UTF8.GetBytes("</root>");  
     int _endidx = -1;  
      
     #endregion Fields  
      
     #region Ctors  
      
     /// <summary>  
     /// Initializes the class with the underlying stream to use, and   
     /// uses the default <root> container element.   
     /// </summary>  
     /// <param name="innerStream">The stream to read from.</param>  
     public XmlFragmentStream(Stream innerStream)  
     {  
     if (innerStream == null)  
     throw new ArgumentNullException("innerStream");  
     _stream = innerStream;  
     }  
      
     /// <summary>  
     /// Initializes the class with the underlying stream to use, with   
     /// a custom root element.   
     /// </summary>  
     /// <param name="innerStream">The stream to read from.</param>  
     /// <param name="rootName">Custom root element name to use.</param>  
     public XmlFragmentStream(Stream innerStream, string rootName) : this (innerStream)  
     {  
     _rootstart = UTF8Encoding.UTF8.GetBytes("<" + rootName + ">");  
     _rootend = UTF8Encoding.UTF8.GetBytes("</" + rootName + ">");  
     }  
      
     /// <summary>  
     /// Initializes the class with the underlying stream to use, with   
     /// a custom root element.   
     /// </summary>  
     /// <param name="innerStream">The stream to read from.</param>  
     /// <param name="rootName">Custom root element name to use.</param>  
     /// <param name="ns">The namespace of the root element.</param>  
     public XmlFragmentStream(Stream innerStream, string rootName, string ns) : this (innerStream)  
     {  
     _rootstart = UTF8Encoding.UTF8.GetBytes("<" + rootName + " xmlns=\"" + ns + "\">");  
     _rootend = UTF8Encoding.UTF8.GetBytes("</" + rootName + ">");  
     }  
      
     #endregion Ctors  
      
     #region Stream abstract implementation  
      
     /// <summary>See <see cref="Stream.Flush"/>.</summary>  
     public override void Flush()  
     {  
     _stream.Flush();  
     }  
      
     /// <summary>See <see cref="Stream.Seek"/>.</summary>  
     public override long Seek(long offset, SeekOrigin origin)  
     {  
     return _stream.Seek(offset, origin);  
     }  
      
     /// <summary>See <see cref="Stream.SetLength"/>.</summary>  
     public override void SetLength(long value)  
     {  
     _stream.SetLength(value);  
     }  
      
     /// <summary>See <see cref="Stream.Write"/>.</summary>  
     public override void Write(byte[] buffer, int offset, int count)  
     {  
     _stream.Write(buffer, offset, count);  
     }  
      
     /// <summary>See <see cref="Stream.CanRead"/>.</summary>  
     public override bool CanRead { get { return _stream.CanRead; } }  
      
     /// <summary>See <see cref="Stream.CanSeek"/>.</summary>  
     public override bool CanSeek { get { return _stream.CanSeek; } }  
       
     /// <summary>See <see cref="Stream.CanWrite"/>.</summary>  
     public override bool CanWrite { get { return _stream.CanWrite; } }  
       
     /// <summary>See <see cref="Stream.Length"/>.</summary>  
     public override long Length { get { return _stream.Length; } }  
       
     /// <summary>See <see cref="Stream.Position"/>.</summary>  
     public override long Position   
     {   
     get { return _stream.Position; }  
     set { _stream.Position = value; }  
     }  
      
     #endregion Stream abstract implementation  
      
     #region Read method   
      
     /// <summary>See <see cref="Stream.Read"/>.</summary>  
     public override int Read(byte[] buffer, int offset, int count)  
     {  
     if (_done)   
     {  
     if(!_eof)  
     {  
     _eof = true;  
     return 0;  
     }  
     else  
     {  
     throw new System.IO.EndOfStreamException(SR.GetString(SR.XmlFragmentStream_EOF));   
     }  
     }  
      
     // If this is the first one, return the wrapper root element.  
     if (_first)  
     {  
     _rootstart.CopyTo(buffer, 0);  
      
     _stream.Read(buffer, _rootstart.Length, count - _rootstart.Length);  
      
     _first = false;  
     return count;  
     }  
      
     // We have a pending closing wrapper root element.  
     if (_endidx != -1)  
     {  
     for (int i = _endidx; i < _rootend.Length; i++)  
     {  
     buffer[i] = _rootend[i];  
     }  
     return _rootend.Length - _endidx;  
     }  
      
     int ret = _stream.Read(buffer, offset, count);  
      
     // Did we reached the end?  
     if (ret < count)  
     {  
     _rootend.CopyTo(buffer, ret);  
     if (count - ret > _rootend.Length)  
     {  
     _done = true;  
     return ret + _rootend.Length;  
     }  
     else  
     {  
     _endidx = count - ret;  
     return count;  
     }  
     }  
      
     return ret;  
     }  
      
     #endregion Read method   
     }  
    }

`

The full [Mvp.Xml project](http://sf.net/projects/mvp-xml) source code can be downloaded from [SourceForge](http://sourceforge.net/project/showfiles.php?group_id=102352&package_id=112234).

Enjoy and please give us feedback on the project!

Check out the [Roadmap to high performance XML](http://weblogs.asp.net/cazzu/posts/HiPerfXML.aspx).

/kzu

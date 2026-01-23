---
layout: post
title: "Daniel Cazzulino's Blog : MakePascal identifier (the XmlSerializer way)"
date: 2004-01-16 00:00:00 +0000
---

## MakePascal identifier (the XmlSerializer way) 

[In a previous post](http://weblogs.asp.net/cazzu/archive/2004/01/09/48987.aspx), I proposed an implementation of a simple method to make the first letter of an identifier uppercase, to get a pseudo PascalCase from an xml name. I've found that a better and more consistent way is to reuse the method used by the XmlSerializer to build the code identifiers, which is `System.Xml.Serialization.CodeIdentifier.MakePascal(string identifier)`

The class also exposes `MakeValid` and `MakeCamel` methods, which are usefull too. `MakeValid` is automatically called by the other two.

The pascal casing implementation is the following (reflectoring - that is, using Reflector):

`
    
    
    public static string MakePascal(string identifier)
    { 
      char ch1;
      identifier = CodeIdentifier.MakeValid(identifier);
      if (identifier.Length 

`

Using [the ToCharArray()](http://weblogs.asp.net/cazzu/archive/2004/01/09/48987.aspx) approach looks to me like a little more efficient string handling. The code above, near the end concatenates two strings, building a third one which is returned. If it used something like the following, it would save those two temporary strings:

`
    
    
      if (char.IsLower(identifier.Chars[0]))
      {
        Char[] letters = identifier.ToCharArray();
        letters[0] = Char.ToUpper( letters[0] );
        return new string( letters );
      }
    }

`

By the way, it looks like [readers' concerns](http://weblogs.asp.net/cazzu/archive/2004/01/09/48987.aspx#FeedBack) with regards to I18N are non-issues, as the .NET class uses the same approach I showed, basically making a unicode Char uppercase. Finally, note that this is not actually PascalCase, but only FirstLetterUpperCase, although such a method name wouldn't be cool at all... 

/kzu

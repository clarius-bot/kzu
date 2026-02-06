---
layout: post
title: "RssBandit, XML rendering and &amp;lt;xmp&amp;gt; element"
date: 2004-01-26 00:00:00 +0000
---

For those showing XML in a post, you surely know how annoying it is to be forced to convert all the tags to the corresponding escaped sequence in order to get it properly rendered. That is, change the < and > characters. There's a cool element, [<xmp>](http://devedge.netscape.com/library/manuals/1998/htmlguide/tags4.html#1424741), which allows arbitrary markup and tells the browser to show it as-is, without any processing. It's a kind of <pre> but better because you don't have to escape reserved characters. 

Even though it was made [obsolete by the HTML 4 specification](http://www.w3.org/TR/html401/appendix/changes.html#h-A.3.1.3), it remains a very useful element. In fact, despite the suggestion to use the <pre> element, there's no other element that offers the possibility to show markup without escaping it. What's more, both Gecko-based browsers (Netscape, Mozilla and Firebird) and IE properly render the element content untouched. Open [this page](http://weblogs.asp.net/cazzu/archive/2004/01/23/62141.aspx) in both and you'll see the XML at the very beginning properly displayed, even when it has not been escaped. 

The strange thing is that even when RssBandit uses an embedded IE for post display, it's modifying the contents of the <xmp> and removing my formatting (tabs, whitespaces and line breaks), and that's why you would see the post rather ugly. Even more strange, it's doing so ONLY for XML content, not for the C# code I embedd... :S

/kzu

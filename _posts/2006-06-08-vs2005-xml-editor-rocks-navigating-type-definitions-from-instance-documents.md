---
layout: post
title: "VS2005 XML Editor rocks! Navigating type definitions from instance documents!"
date: 2006-06-08 00:00:00 +0000
---


Today, I was working on some [GAX](<http://lab.msdn.microsoft.com/teamsystem/workshop/gat/> "Guidance Automation Toolkit homepage")[software factory](<http://practices.gotdotnet.com/mobile> "Mobile Client Software Factory home page") stuff. I just couldn’t remember if a particular element I had at hand in an instance document supported xs:anyAttribute or not in the corresponding schema. So I though “how handy it would be if I could press F12 (Go to Definition) and be taken to the schema for it”. I tried it:

![XmlEditorGoToDefinition.png](http://www.clariusconsulting.net/ImageGallery/kzu/XmlEditorGoToDefinition.png)

Imagine my surprise when I saw:

![XmlEditorGoToDefinition2.png](http://www.clariusconsulting.net/ImageGallery/kzu/XmlEditorGoToDefinition2.png)

Quite unexpected for me, I was presented with the XSD for the document with the relevant element definition focused under the cursor! Now, the element happens to he a ref to the definition which is somewhere else. So I thought “how handy it would be if I could press F12 and be taken to the definition of that referenced element”. I tried it:

![XmlEditorGoToDefinition3.png](http://www.clariusconsulting.net/ImageGallery/kzu/XmlEditorGoToDefinition3.png)

And I was inmediately taken to:

![XmlEditorGoToDefinition4.png](http://www.clariusconsulting.net/ImageGallery/kzu/XmlEditorGoToDefinition4.png)

Simply amazing. I didn’t know about this feature. What’s more, you can use Ctrl+[minus sign] to navigate back, just like you do when you F12 to definitions in any code window. 

Impressive job, XML team. Thank again!!!!!!

![](http://clariusconsulting.net/aggbug.aspx?PostID=540)

/kzu

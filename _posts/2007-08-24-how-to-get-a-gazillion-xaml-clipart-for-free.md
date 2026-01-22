---
layout: post
title: "How to get a gazillion XAML clipart for free"
date: 2007-08-24 00:00:00 +0000
---

##  [How to get a gazillion XAML clipart for free](<http://blogs.clariusconsulting.net/kzu/how-to-get-a-gazillion-xaml-clipart-for-free/> "How to get a gazillion XAML clipart for free")

August 24, 2007 3:45 pm

You surely know [XAML subsumes pretty much all of SVG](<http://www.google.com/search?hl=en&q=xaml%20vs%20svg>), right?

[SVG](<http://www.w3.org/TR/SVG/>) has been around for quite more time than XAML, and even if hasn’t taken off as fast as many expected, at least I could find a [huge collection](<http://www.openclipart.org/> "Open Clip Art Library") of [freely](<http://creativecommons.org/license/publicdomain> "Public Domain license!") available clipart.

Now all I needed was a way to convert all that stuff that you can [get in a single gigantic download](<http://openclipart.org/media/downloads>) if you want to XAML. 

I wish it was always this simple: go download [ViewerSvg](<http://www.wpf-graphics.com/ViewerSvg.aspx>)� ![](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/) . 

Not only does the tool work great, it also comes with a [library](<http://www.wpf-graphics.com/ReaderSvg.aspx>) you can use too ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) . So instead of using the UI, I used the library to create a very simple console application ([Svg2Xaml project](<http://www.codeplex.com/clarius/Release/ProjectReleases.aspx?ReleaseId=6612> "Project source and binaries at CodePlex")) that will convert one or more files (or every file it finds recursively in one or more folders) to XAML.

The end result is not a gazillion (but you already guessed that, right?) but a very nice 7557 XAML files ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) . You can get the [self-extracting exe](<http://downloads.clariusconsulting.net/openclipart-0.18-full-xaml.exe> "49,4 MB should fly from Amazon") (powered by the very fast and excellent compression tool [7zip](<http://www.7-zip.org/>)) or a [standard zip](<http://downloads.clariusconsulting.net/openclipart-0.18-full-xaml.zip> "90,4 MB almost 2x size just to get it as a ZIP? :p"). If you're using IE, use Save Target As because Amazon S3 doesn't send the content-type for the file and IE might try to open it as text :S (a post for another day, why Amazon S3 sucks for standard web hosting). 

The download contains the PNG version from the original SVG so that you can not only compare, but also browse the clipart more easily from windows explorer.

I offered this converted library to the guys at the [Open Clip Art Library](<http://www.openclipart.org/>), so it may end up there soon too.

Enjoy!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=30180)

Posted by kzu
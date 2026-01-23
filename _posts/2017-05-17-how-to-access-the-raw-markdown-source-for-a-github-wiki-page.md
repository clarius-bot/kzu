---
layout: post
title: "How to access the raw markdown source for a github wiki page"
date: 2017-05-17 00:00:00 +0000
tags: [ddd, ef, eventsourcing, extensibility, gadgets, mocking, moq, msbuild, mvc, nuget, patterns, programming, t4, technology, vsx, wcf, webapi]
---

##  [How to access the raw markdown source for a github wiki page](http://blogs.clariusconsulting.net/kzu/how-to-access-the-raw-markdown-source-for-a-github-wiki-page/ "How to access the raw markdown source for a github wiki page")

November 30, 2012 1:44 am

This is not entirely obvious (at least it wasn’t for me), but since Github wikis are actually backed by a [proper Git repo](https://github.com/blog/699-making-github-more-open-git-backed-wikis), I figured it should be possible to access the raw markdown for a page by using Github’s <https://raw.github.com/> style URLs.

After some minor trial/error, it turns out to be very predictable (as many things in github):

https://raw.github.com/wiki/[user]/[project]/[page].md

Just replace the square brackets’ stuff with your values and that’s it. I think I’ll be trying this out with a wiki page as a Release Notes landing page, which I just pull in raw format on a build script and replace the Nuget <releaseNotes> node with its content…

Posted by kzu

![Comments](https://web.archive.org/web/20170517233040im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/hr.png)

### 5 Comments

  1. [![](https://web.archive.org/web/20170517233040im_/http://0.gravatar.com/avatar/4706d1179c3cef5311929b17ef19882a?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)](http://lemurheavy.com/)

[Nick Merwin](http://lemurheavy.com/) [ February 1, 2013 at 2:37 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-access-the-raw-markdown-source-for-a-github-wiki-page/#comment-1756)

Another tip for private repos:

[https://raw.github.com/wiki/user/repo/page.md?login=login&token=token](https://raw.github.com/wiki/user/repo/page.md?login=login&token=token)

You can get your token by appending “.md” to any wiki page; it will redirect you to the raw URL.

     * [![](https://web.archive.org/web/20170517233040im_/http://0.gravatar.com/avatar/6230e73ab381af22df10156ad5b9bcf4?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[kzu]() [ August 2, 2013 at 7:05 am. ](http://blogs.clariusconsulting.net/kzu/how-to-access-the-raw-markdown-source-for-a-github-wiki-page/#comment-2044)

Great tip Nick, thanks!

  2. [![](https://web.archive.org/web/20170517233040im_/http://0.gravatar.com/avatar/0ca52abaa9fce14c44a351fccd1b9fc5?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Bob]() [ August 2, 2013 at 4:40 am. ](http://blogs.clariusconsulting.net/kzu/how-to-access-the-raw-markdown-source-for-a-github-wiki-page/#comment-2043)

THANK YOU!

  3. [![](https://web.archive.org/web/20170517233040im_/http://0.gravatar.com/avatar/019644d4736f937210977f0131e50875?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[eMBee]() [ April 10, 2014 at 6:20 am. ](http://blogs.clariusconsulting.net/kzu/how-to-access-the-raw-markdown-source-for-a-github-wiki-page/#comment-2441)

to further specify, as i just found out: because it is a git repo, wiki files can be moved into subdirectories. this does not affect their public url, but it does affect the raw url.

in general replace the name of the page with the full path inside the repo.

so if the above hint does not work, clone the repo and check for the path, then use that.

example: <https://github.com/sup-heliotrope/sup/wiki/manpage> ->  
<https://github.com/sup-heliotrope/sup/wiki/man/manpage.md>  
(which then redirects to <https://raw.githubusercontent.com/wiki/sup-heliotrope/sup/man/manpage.md> but can also be accessed as <https://raw.github.com/wiki/sup-heliotrope/sup/man/manpage.md> )

greetings, eMBee.

  4. [![](https://web.archive.org/web/20170517233040im_/http://1.gravatar.com/avatar/de8006bc117d96525c475036dcfb7fbf?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Jason Rylance]() [ August 28, 2015 at 3:36 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-access-the-raw-markdown-source-for-a-github-wiki-page/#comment-2929)

Your tip about, “How to access the raw markdown source for a github wiki page,” just helped me.

Thanks!

Comments are closed
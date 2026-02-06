---
layout: post
title: "Updated WLW Cross-Post plugin"
date: 2009-02-05 00:00:00 +0000
---

Now that there's an [official installer of Live Writer](http://get.live.com/) that works on x64, I updated my [plugin](http://www.codeplex.com/clarius/Release/ProjectReleases.aspx?ReleaseId=6626) that allows you to cross-post a blog entry to a second WLW account, optionally summarizing the entry and always linking back to the source blog. I summarized the reasons why you might need to do this as well as the feature set in [How to cross post entries across blogs from Windows Live Writer](http://www.clariusconsulting.net/blogs/kzu/archive/2007/08/24/HowtocrosspostentriesacrossblogsfromWindowsLiveWriter.aspx).

The plugin options are still the same:

![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image.png)

And after you posted successfully your original entry, cross-posting to the selected account is one click away:

![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_3.png)

The cross-posted entry, if summarized, will be intelligently stripped at the specified * **content** * characters (i.e. 300 chars counting actual text content, not markup/attributes) while preserving your markup surroundings, therefore properly cutting not only text paragraphs:

[ ![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_thumb.png) ](http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_4.png)

but also right in the middle of bullet lists:

[ ![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_thumb_3.png) ](http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_5.png)

and even inside code blocks which might even include formatting markup:

[ ![image](/web/20090212134554im_/http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_thumb_4.png) ](http://www.clariusconsulting.net/images/blogs/kzu/UpdatedWLWCrossPostplugin_2A7A/image_6.png)

Go get the [WLW Cross-Post Plugin](http://www.codeplex.com/clarius/Release/ProjectReleases.aspx?ReleaseId=6626), another resounding success from your friends at [Clarius](http://www.clariusconsulting.net/)[Labs](http://www.codeplex.com/clarius) :)

/kzu

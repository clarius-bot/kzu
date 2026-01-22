---
layout: post
title: "Contributing to OSS projects made easy"
date: 2013-09-14 00:00:00 +0000
---

##  [Contributing to OSS projects made easy](<http://blogs.clariusconsulting.net/kzu/contributing-to-oss-projects-made-easy/> "Contributing to OSS projects made easy")

August 20, 2013 7:31 pm

I recently came across what I believe is a [missing feature](<https://github.com/JamesNK/Newtonsoft.Json/issues/122>) (bug?) in [Json.NET](<https://nuget.org/packages/newtonsoft.json>) most excellent library: when using custom constructor, default values are not populated for properties ![:\(](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_sad.gif)

Being open source, I just went to its [GitHub project](<https://github.com/JamesNK/Newtonsoft.Json>), created the mentioned [Issue](<https://github.com/JamesNK/Newtonsoft.Json/issues/122>), and proceeded to [fork the repo](<https://github.com/danielkzu/Newtonsoft.Json>).

Immediately after getting the source and opening the VS solution, I noticed it used different settings than my default ones, i.e. it uses two whitespace “tabs”. That’s typically the first barrier to contributing: am I supposed to now go to the project website, read some coding standards page, change my VS settings to match, just to start coding?

Luckily, I also noticed alongside the solution, the [Newtonsoft.Json.vssettings](<https://github.com/JamesNK/Newtonsoft.Json/blob/master/Src/Newtonsoft.Json.vssettings>) file. Now that’s useful! Not only that, but by being named the same as the solution file (just changing the file extension), it’s automatically picked up by the [Quick Settings](<http://kzu.to/13DVpIL>) extension! What this means is that just by opening the Newtonsoft.Json.sln, my current settings are backed-up, the new settings are loaded, and I’m ready to code. Once I close the solution, my previously backed-up settings are re-applied and I can go on working with my own style preferences ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) .

So, I just had to go ahead, write my repro test, fix it, [push to my fork](<https://github.com/danielkzu/Newtonsoft.Json/commit/143f01f333c0e134868fe7eec0c314135d9d1f29>) and [send my pull request](<https://github.com/JamesNK/Newtonsoft.Json/pull/123>). Now THAT’s a great way to remove the first barrier to contributing to open source projects ![:\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif) .

I just wish every project (including mine :S) provided [this mechanism](<http://kzu.to/193xqnL>) *always*.

Posted by kzu
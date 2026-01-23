---
layout: post
title: "Daniel Cazzulino's Blog : Running cleanup powershell command from MSBuild for Team Build Continuous Integration"
date: 2007-08-05 00:00:00 +0000
---

Daniel Cazzulino's Blog : Running cleanup powershell command from MSBuild for Team Build Continuous Integration


  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

[![](https://web.archive.org/web/20080828232215im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20080828232215im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20080828232215im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20080828232215im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Running cleanup powershell command from MSBuild for Team Build Continuous Integration 

Team Build is great, with its tight integration into the WorkItem tracking feature of TFS. It can be setup pretty easily to do [continuous integration](http://www.clariusconsulting.net/blogs/kzu/archive/2006/07/26/TFS_CI.aspx) and I use [a modified version](http://www.clariusconsulting.net/kzu/rss.aspx.txt) of the [Team Build RSS Feed](http://blogs.msdn.com/abhinaba/archive/2005/12/21/506277.aspx) generator so that I get a nice ([authenticated](http://www.rssbandit.org/ "RSS Bandit supports authenticated feeds")) feed with entries like:

[Failed Build CI_20070805.10](http://tfs:8080/Build/Build.aspx?TeamProject=MyProject&BuildNumber=CI_20070805.10)

****

[Build CI_20070805.10](http://tfs:8080/Build/Build.aspx?TeamProject=MyProject&BuildNumber=CI_20070805.10) was fired by _TFS\TFSSERVICE_ on 8/5/2007 8:31:22 PM. You can view the details of the build by selecting the provided link.
    
    
    <BuildData>
      <DropLocation>[blah]</DropLocation>
      <BuildStatus>Failed</BuildStatus>
      <StartTime>2007-08-05T20:31:22.85-03:00</StartTime>
      <BuildType>CI</BuildType>
      <RequestedBy>TFS\TFSSERVICE</RequestedBy>
      <BuildNumber>CI_20070805.10</BuildNumber>
      <BuildQuality>Unexamined</BuildQuality>
      <BuildUri>vstfs:///Build/Build/08052007_233122_84860</BuildUri>
      <FinishTime>2007-08-05T20:38:32.787-03:00</FinishTime>
      <LastChangedOn>0001-01-01T00:00:00</LastChangedOn>
      <BuildStatusId>200</BuildStatusId>
    </BuildData>

Clicking on the links take me to the build report as expected, etc. One problem with the out-of-the-box experience with Team Build (other than the manual steps to set CI in the first place) is that over time, it will kill your build server's harddrive space. It seems that the build machine/location that you select when you set up the team build is reused on all builds (to get the sources and compile from there) but the drops folder (as expected) keeps growing forever. 

I first tried implementing a quick cleanup routing in straight MSBuild (no custom tasks to avoid external dependencies), but turned out to be quite tricky (using <Exec> to do a dir, output that to a file, then use ReadFileLines or something like that, only to find you can not append items created from that with <CreateItem> in a subsequent path to <Exec>, etc. etc.). So I ended up creating a one-liner in PowerShell which works very nice, runs fast and is easily executed using the <Exec> MSBuild task. So my team build type overrides the BeforeGet target (pretty much the first to run in a TFS build server):

<Target Name="BeforeGet">  
<!-- Clean drops older than 15 days\-->  
<Exec Command="%windir%\system32\windowspowershell\v1.0\powershell -noprofile -command &quot;gci -i * -path $(DropLocation) | where { $_ -is [System.IO.DirectoryInfo] -and $_.LastWriteTime -lt ([DateTime]::Now - [TimeSpan]::FromDays(15)) } | remove-item -recurse&quot;" />  
</Target>  

[](http://11011.net/software/vspaste)

A couple things to notice:

  * -noprofile should speed up the execution 
  * -command followed by the quoted one-liner is required 
  * I'm just keeping two weeks' worth of drops. You can change that by changing the "FromDays" value.

Enjoy!

BTW, this is going to be [SO much easier with Orcas](http://channel9.msdn.com/Showpost.aspx?postid=291350 "Channel9 video showing CI in Orcas") :)

posted on Sunday, August 05, 2007 9:11 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)


  

[![](/web/20080828232215im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
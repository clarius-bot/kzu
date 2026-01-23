---
layout: post
title: "Daniel Cazzulino's Blog : How to create and run Compact Framework unit tests with VS2008 and TestDriven.NET"
date: 2008-12-31 00:00:00 +0000
---

Daniel Cazzulino's Blog : How to create and run Compact Framework unit tests with VS2008 and TestDriven.NET

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20090102072259im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090102072259im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090102072259im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090102072259im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

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

## How to create and run Compact Framework unit tests with VS2008 and TestDriven.NET 

Unlike VS2005, where you didn't have a unit testing framework for the .NET Compact Framework (and that's the reason why we had to create one for the [Mobile Client Software Factory](http://msdn.microsoft.com/en-us/library/aa480471.aspx)), VS2008 (Team System Test or Suite editions) comes with the same test framework you probably use for desktop applications. 

Rather than trying to emulate another great post on how to get the first test running on the emulator or device, just go ahead and read [Device Unit Testing using Visual Studio 2008 Team System](http://www.simonrhart.com/2008/03/device-unit-testing-using-visual-studio.html). 

One thing I'll add is that if you get the following exception on first run:

> The test adapter ('Microsoft.VisualStudio.TestTools.TestTypes.Unit.UnitTestAdapter, Microsoft.VisualStudio.QualityTools.Tips.UnitTest.Adapter, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a') required to execute this test could not be loaded. Check that the test adapter is installed properly. Exception of type 'Microsoft.VisualStudio.SmartDevice.TestHostAdapter.DeviceAgent.NetCFNotInstalledException' was thrown.

go ahead and just use the Deploy context menu on your main CF assembly, to get the .NET CF 3.5 installed on the device. But immediately after that, close the emulator and SAVE ITS STATE. Otherwise you'll see the same error next time.

Now, running the tests always on your emulator or device is SLOWWWW. You don't want to have such a painful turnaround for doing TDD. You'll want to run the tests in your local machine, and only before doing a checkin run the full suite on the device to ensure everything works as expected. The easiest way to do it is by installing the most excellent [TestDriven.NET](http://testdriven.net/) tool (don't have it yet???) which allows you to run tests from any test framework right from the editor (method, class, project, solution folder, entire solution):

![image](https://web.archive.org/web/20090102072259im_/http://www.clariusconsulting.net/images/blogs/kzu/HowtocreateandrunCompactFrameworkuni.NET_8EC8/image.png)

Now, when you run the test you may get the following exception:

> TestCase 'M:Tests.ContainerFixture.RegistersDelegateForType'  
> failed: Could not load file or assembly 'Microsoft.VisualStudio.SmartDevice.UnitTestFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a' or one of its dependencies. The system cannot find the file specified.  
>  System.IO.FileNotFoundException: Could not load file or assembly 'Microsoft.VisualStudio.SmartDevice.UnitTestFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a' or one of its dependencies. The system cannot find the file specified.  
>  File name: 'Microsoft.VisualStudio.SmartDevice.UnitTestFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'  
>  at CeeDeeEye.Tests.ContainerFixture.RegistersDelegateForType()

This is because (don't ask me why) that particular assembly is not registered in the GAC. Just run the usual gacutil command and you should be fine:

> gacutil -i "C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\IDE\PublicAssemblies\Microsoft.VisualStudio.SmartDevice.UnitTestFramework.dll"

(remove the (x86) if you're not running 64bit)

Now back to TDD for CF too!

posted on Wednesday, December 31, 2008 4:33 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://www.clariusconsulting.net/blogs/kzu/comments/114595.aspx) :: 

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/12/31/114595.aspx#114596 "permalink") How to create and run Compact Framework unit tests with VS2008 and TestDriven.NET @ Wednesday, December 31, 2008 4:51 AM

Unlike VS2005, where you didn&amp;#39;t have a unit testing framework for the .NET Compact Framework (and [](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl0$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://weblogs.asp.net/cazzu/archive/2008/12/31/how-to-create-and-run-compact-framework-unit-tests-with-vs2008-and-testdriven-net.aspx "TrackBack")

#### [#](http://www.clariusconsulting.net/blogs/kzu/archive/2008/12/31/114595.aspx#114607 "permalink") Interesting Finds: December 31, 2008 @ Wednesday, December 31, 2008 7:38 AM

[](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$_ctl0$Comments$_ctl0$Comments$_ctl1$EditLink',''\))

[Anonymous](http://www.clariusconsulting.net/utility/Redirect.aspx?U=http://jasonhaley.com/blog/archive/2008/12/31/142654.aspx "TrackBack")

  

[![](/web/20090102072259im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
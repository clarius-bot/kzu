---
layout: post
title: "How to create and run Compact Framework unit tests with VS2008 and TestDriven.NET"
date: 2012-02-03 00:00:00 +0000
---

##  [How to create and run Compact Framework unit tests with VS2008 and TestDriven.NET](<http://blogs.clariusconsulting.net/kzu/how-to-create-and-run-compact-framework-unit-tests-with-vs2008-and-testdriven-net/> "How to create and run Compact Framework unit tests with VS2008 and TestDriven.NET")

December 31, 2008 12:33 pm

Unlike VS2005, where you didn’t have a unit testing framework for the .NET Compact Framework (and that’s the reason why we had to create one for the [Mobile Client Software Factory](<http://msdn.microsoft.com/en-us/library/aa480471.aspx>)), VS2008 (Team System Test or Suite editions) comes with the same test framework you probably use for desktop applications. 

Rather than trying to emulate another great post on how to get the first test running on the emulator or device, just go ahead and read [Device Unit Testing using Visual Studio 2008 Team System](<http://www.simonrhart.com/2008/03/device-unit-testing-using-visual-studio.html>). 

One thing I’ll add is that if you get the following exception on first run:

> The test adapter (‘Microsoft.VisualStudio.TestTools.TestTypes.Unit.UnitTestAdapter, Microsoft.VisualStudio.QualityTools.Tips.UnitTest.Adapter, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a’) required to execute this test could not be loaded. Check that the test adapter is installed properly. Exception of type ‘Microsoft.VisualStudio.SmartDevice.TestHostAdapter.DeviceAgent.NetCFNotInstalledException’ was thrown.

go ahead and just use the Deploy context menu on your main CF assembly, to get the .NET CF 3.5 installed on the device. But immediately after that, close the emulator and SAVE ITS STATE. Otherwise you’ll see the same error next time.

Now, running the tests always on your emulator or device is SLOWWWW. You don’t want to have such a painful turnaround for doing TDD. You’ll want to run the tests in your local machine, and only before doing a checkin run the full suite on the device to ensure everything works as expected. The easiest way to do it is by installing the most excellent [TestDriven.NET](<http://testdriven.net/>) tool (don’t have it yet???) which allows you to run tests from any test framework right from the editor (method, class, project, solution folder, entire solution):

![image](http://www.clariusconsulting.net/images/blogs/kzu/HowtocreateandrunCompactFrameworkuni.NET_8EC8/image.png)

Now, when you run the test you may get the following exception:

> TestCase ‘M:Tests.ContainerFixture.RegistersDelegateForType’  
> failed: Could not load file or assembly ‘Microsoft.VisualStudio.SmartDevice.UnitTestFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a’ or one of its dependencies. The system cannot find the file specified.  
>  System.IO.FileNotFoundException: Could not load file or assembly 'Microsoft.VisualStudio.SmartDevice.UnitTestFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a' or one of its dependencies. The system cannot find the file specified.  
>  File name: 'Microsoft.VisualStudio.SmartDevice.UnitTestFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'  
>  at CeeDeeEye.Tests.ContainerFixture.RegistersDelegateForType()

This is because (don’t ask me why) that particular assembly is not registered in the GAC. Just run the usual gacutil command and you should be fine:

> gacutil -i “C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\IDE\PublicAssemblies\Microsoft.VisualStudio.SmartDevice.UnitTestFramework.dll”

(remove the (x86) if you’re not running 64bit)

Now back to TDD for CF too!

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=114595)

Posted by kzu
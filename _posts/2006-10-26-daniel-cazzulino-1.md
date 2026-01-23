---
layout: post
title: "Daniel Cazzulino"
date: 2006-10-26 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : PowerShell: how to unit test your cmdlet

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2588'\))| March 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2647'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
25| 26| 27| 28| 1| 2| 3  
4| 5| 6| 7| 8| 9| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| 22| 23| 24  
25| [26](http://www.clariusconsulting.net/blogs/kzu/archive/2006/10/26.aspx "2 Posts")| 27| 28| 29| 30| [31](http://www.clariusconsulting.net/blogs/kzu/archive/2006/10/31.aspx "1 Post")  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070306231812im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## PowerShell: how to unit test your cmdlet 

If you miss VS, intellisense, [TD.NET](http://www.testdriven.net/), etc., you might want to try extending PowerShell with custom cmdlets, which are .NET classes deriving from Cmdlet. They allow you to extend PowerShell while still programming in your favorite language.

Read [Pablo Galiano's post](http://www.clariusconsulting.net/blogs/pga/archive/2006/08/08/643.aspx) for a step-by-step introduction to Cmdlets.

I'm hooked to PowerShell. It's been really fun to learn, and I'm loving it. 

I'm also hooked to Test Driven Design (that's what TDD should mean, IMO), so I naturally looked for a way to develop my cmdlets in a TDD way. Turns out that it's fairly easy. For this example, I will show a simple cmd-let that should load an assembly in a flexible way (by file name, full name or partial name).

First, create your unit test (ha! you thought I was going to create the cmdlet first?? :p):

[TestMethod]

public void ShouldCreateCmdLet()

{

LoadCommand cmd = newLoadCommand();

Assert.IsTrue(cmd isCmdlet);

}

In order to get that test to compile, create your class deriving from CmdLet:

[Cmdlet("Load" , "Item", DefaultParameterSetName="Item")]

public class LoadCommand : Cmdlet

{

protectedoverridevoid ProcessRecord()

{

base.ProcessRecord();

}

}

For comprehensive guidelines on CmdLet development, see the MSDN documentation. 

Next, create the test that passes input to the cmdlet. Here's where the real cmdlet testing occurs:

[TestMethod]

public void ShouldLoadAssemblyWithFileName()

{

string asmFile = this.GetType().Module.FullyQualifiedName;

LoadCommand cmd = newLoadCommand();

cmd.Item = asmFile;

IEnumerator result = cmd.Invoke().GetEnumerator();

Assert.IsTrue(result.MoveNext());

Assert.IsTrue(result.Current isAssembly);

Assert.AreEqual(this.GetType().Assembly.FullName, ((Assembly)result.Current).FullName);

}

Note that there's no way to call ProcessRecord directly. The way to run the cmdlet is to call Invoke, and getting an enumerator from it. Remember that when placed in the pipeline, the cmdlet will be called once for each input in the pipeline. Let's now implement the cmdlet to make the test pass (and compile!):

[Cmdlet("Load" , "Item", DefaultParameterSetName="Item")]

public class LoadCommand : Cmdlet

{

private string assembly;

[Parameter(Mandatory=true, ValueFromPipeline=true, ParameterSetName="Item", Position=0, HelpMessageResourceId="LoadCmdlet_Item")]

public string Assembly

{

get { return assembly; }

set { assembly = value; }

}

protectedoverridevoid ProcessRecord()

{

base.ProcessRecord();

if (File.Exists(assembly))

{

WriteObject(Assembly.LoadFrom(fileName));

return;

}

}

}

Note that in order to return output from your cmdlet, you call WriteObject. It's interesting to debug the test we wrote. You will notice that the call to Invoke doesn't actually execute the cmdlet. Instead, moving the enumerator does. This is how the pipeline achieves lazy evaluation of each "step" and continues executing with the following commands. Very cool.

And that's pretty much all there is to it. Now you can start adding tests and the corresponding features to your cmdlet, with the amazing piece of mind that comes from having a unit test that says that it actually works ;). Needless to say, this test-code-run is much faster than testing the cmdlet directly in PowerShell (you need to constantly exit PS and re-enter, re-add your snapin, etc., otherwise the output assembly gets locked). 

posted on Thursday, October 26, 2006 9:02 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070306231812im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
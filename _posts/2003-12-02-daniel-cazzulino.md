---
layout: post
title: "Daniel Cazzulino"
date: 2003-12-02 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : I got my ICodeParser implementation!

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2677'\))| June 2007| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2738'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 31| [1](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/1.aspx "1 Post")| [2](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/2.aspx "1 Post")  
3| [4](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/4.aspx "1 Post")| 5| 6| 7| 8| 9  
[10](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/10.aspx "3 Posts")| [11](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/11.aspx "2 Posts")| [12](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/12.aspx "1 Post")| 13| 14| 15| [16](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/16.aspx "1 Post")  
[17](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/17.aspx "2 Posts")| [18](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/18.aspx "2 Posts")| [19](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/19.aspx "1 Post")| 20| 21| [22](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/22.aspx "1 Post")| 23  
24| 25| 26| 27| 28| [29](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/29.aspx "2 Posts")| [30](http://www.clariusconsulting.net/blogs/kzu/archive/2003/12/30.aspx "1 Post")  
1| 2| 3| 4| 5| 6| 7  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20070611170206im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

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

## I got my ICodeParser implementation! 

Well, sort of :S. After "reflectoring" quite a while, I found the `VsCodeDomGenerator`, `VsCodeDomProvider` and `VsCodeDomParser` in the `Microsoft.VisualStudio.dll` assembly. After trying to create those classes through reflection, using all sorts of hacks and ugly tricks, I was about to give up, as everything failed with exceptions, as it expected a DTE ProjectItem and the like.  
But then, I remembered that if you develop a custom tool using the [MS provided helper classes](http://www.gotdotnet.com/Community/UserSamples/Details.aspx?SampleGuid=4AA14341-24D5-45AB-AB18-B72351D0371C), you get a member called `CodeProvider`, which is a reference to a valid `CodeDomProvider`. One of the cool things of the `BaseCodeGeneratorWithSite` is that it automatically "knows" which provider to give you depending on the current project type, so don't need to worry about file extensions and the like. Unlike what you may think, the base implementation doesn't "switch" according to the file extension, but does a more "complicate" operation: being a "sited" component (as the class name suggests), it can query for services from the IDE like any "sited" component would, through the `GetService` method, and that's what it does:

`
    
    
    protected virtual CodeDomProvider CodeProvider {
        get {
            if (codeDomProvider == null) {
                IVSMDCodeDomProvider vsmdCodeDomProvider = (IVSMDCodeDomProvider) GetService(CodeDomServiceGuid);
                if (vsmdCodeDomProvider != null) {
                    codeDomProvider = (CodeDomProvider) vsmdCodeDomProvider.CodeDomProvider;
                }
                Debug.Assert(codeDomProvider != null, "Get CodeDomProvider Interface failed.");
            }
            return codeDomProvider;
        }

`

Now I started to get excited!!! It turns out that this member gives you a `VsCodeDomProvider` instead of the appropriate `VBCodeProvider` or `CSharpCodeProvider`, which always return `null` from their `CreateParser` method. You guessed right, the `VsCodeDomProvider` returns an instance of the `VsCodeDomParser`!! Now everything I needed was grasp it, get the project item selected, parse it, and play with the CodeDom before writing it back!!! 

Well, that turned out to be harder than it sounds. First, getting the project item. How do you get that from inside a custom tool?!?! No help whatsoever. Add-ins are blessed there, but no luck with custom tools... until after a good time hacking here and there, I found a way, through the marvelous `GetService` method:

`
    
    
    // Get the item.
    EnvDTE.ProjectItem item = base.GetService(typeof(EnvDTE.ProjectItem)) 
        as EnvDTE.ProjectItem;

`

Now I can get the selected file, open it and parse it:

`
    
    
    // Create the parser for the item.
    ICodeParser parser = base.CodeProvider.CreateParser();
    
    if (item == null || parser == null)
      throw new ArgumentException("This custom tool can only be applied to code items.");
    
    // Parse the file as CodeDom.
    using (FileStream fs = new FileStream(item.get_FileNames(0), FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
    {
      using (StreamReader sr = new StreamReader(fs))
      {
        CodeCompileUnit unit = parser.Parse(sr);
        //Play with the CodeDom!!!!

`

At this point, I had to do some cleaning on the resulting unit because the parser sets the `LinePragma` property on every member/class/statement, which results in code full of preprocessor directives such as `#ExternalSource` (VB) and `#line` (C#). This is just a mater of iterating the `CodeCompileUnit` and setting that property to null.

After such a success, I ran to create a project, and two samples for round-tripping VB and C# code, which is only natural if you have a CodeDom at hand. I even submitted it to GotDotNet about a week ago (didn't get online yet, don't know why).  
I was all too happy, really... until I saw the code generated from that unit. The parser fails to parse methods, converts array fields into simple (single item) elements, completely loses properties and all custom attributes. As I had done my early tests from an XSD passed through [Chris Sells](http://www.sellsbrothers.com/news/rss2.aspx) [XsdClassesGenerator](http://www.sellsbrothers.com/tools/#xsdClassesGen), or, what is the same, through XSD.EXE, I didn't see these failures early on my testings... :(. Well, but I don't lose my faith that maybe Whidbey will give me a much better CodeProvider, right?

Update:My library and tests can be downloaded from [GotDotNet](http://www.gotdotnet.com/Community/UserSamples/Details.aspx?SampleGuid=01493935-e29e-4a52-964a-6a912ec59b1a)

posted on Tuesday, December 02, 2003 1:49 AM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20070611170206im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
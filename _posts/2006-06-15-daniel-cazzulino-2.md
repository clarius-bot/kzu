---
layout: post
title: "Daniel Cazzulino"
date: 2006-06-15 00:00:00 +0000
---

Daniel Cazzulino : eXtensible Mind Lounge : Thursday, June 01, 2006 - Posts

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2312'\))| June 2006| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2373'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
28| 29| 30| 31| [1](http://clariusconsulting.net/blogs/kzu/archive/2006/6/1.aspx "1 Post")| 2| 3  
4| 5| 6| 7| [8](http://clariusconsulting.net/blogs/kzu/archive/2006/6/8.aspx "2 Posts")| [9](http://clariusconsulting.net/blogs/kzu/archive/2006/6/9.aspx "2 Posts")| 10  
11| 12| 13| 14| 15| 16| 17  
18| 19| 20| 21| 22| 23| 24  
25| 26| 27| 28| 29| 30| 1  
2| 3| 4| 5| 6| 7| 8  
  
[![Microsoft MVP Profile](https://web.archive.org/web/20060615045841im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](http://aspnet2.com/mvp.ashx?kzu)

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Thursday, June 01, 2006 - Posts

#####  [How to add GAX/GAT recipes to arbitrary VS menus](http://clariusconsulting.net/blogs/kzu/archive/2006/06/01/GATMenus.aspx)

So you're hooked to this cool [Guidance](http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/)[Automation](http://www.clariusconsulting.net/blogs/kzu/archive/2005/07/28/GATAdvantages.aspx)[Toolkit](http://guidanceautomation.net/). Now, say you have a cool recipe you'd like to place in an arbitrary context menu, such as the context menu over a Web Reference. In VS any menu is called a command bar. Now that particular context menu is not one of the command bars that GAT provides friendly aliases for:

![Intellisense for GAT command bar element](/web/20060615045841im_/http://clariusconsulting.net/ImageGallery/kzu/GAT/gatmenu1.png)

Fortunately, GAT allows you to specify Guid and ID attributes that uniquely identify any menu in VS, so you can place your recipe anywhere you want. That's great, you say, but how in the world are you gonna know what values to use there? Turns out that until last week, I was fishing myself for those numbers in the VS SDK .ctc files (you don't even want to know what those are, believe me). Turns out that there's a much better and easy way, so I'd like to share it here.

The trick involves customizing the menu you want to put your recipe on, and then comparing the exported VS settings with a previous unmodified version, so you can tell the diff. The steps are:

  1. Go to Tools > Import and Export Settings... 
  2. Select `Export selected Environment Settings` option. 
  3. From the tree, unckeck the root and then select only the `All Settings\General Settings\Menu and Command Bar Customizations` node. 
  4. Click Next. Ensure the message displayed says the export was successful and without errors (IMPORTANT!).   
If you get an error, close and reopen VS, and try again without any solution opened. If you keep getting an error, I'm afraid you may need to reset your settings to the defaults (in the same dialog, select `Reset all settings` instead of Export... 
  5. Open a project where you have a Web Reference. Select the Web Reference in the solution explorer 
  6. Right-click on the toolbar and select `Customize`
  7. On the `Toolbars` tab, mark the `Context Menus`. At this point, a new toolbar with a number of dropdown menus should have appeared. Those are all the context menus currently available. 
  8. Expand `Project and Solution Context Menus`. You will see a number of entries. Now it's just a matter of finding the context menu you're looking for. In the case of the web reference, it's a little tricky (and that's why I chose this example) as the one you have to look for is named `Folder` (yuck!). But in general the names are pretty intuitive. 
  9. Now we need to introduce a customization in this menu so that it shows up in the exported settings later on. So make a trivial change inside it, such as renaming one of its child items. 
  10. Close the `Customize` window. 
  11. Repeat steps 2 to 4 to export the settings again, with a different file name this time. 

The safest way to do the process above without risking your current settings is to use a virtual machine and reset all settings before doing the export. For the cleanest possible .settings file, it's also recommented that you reset to General Development profile.

Now open [a diff program](http://winmerge.sf.net/) and compare the two files. You should look into the <UserCustomizations> node, and you should see a <modify> element with the change you made. In my case, I got:
    
    
    <modify Cmd="{1496A755-94DE-11D0-8C3F-00C04FC2AAE2}:0000045c"   
            CmdPri="03000000"   
            Group="{D309F791-903F-11D0-9EFC-00A0C911004F}:000002a3"   
            GroupPri="02000000"   
    **Menu="{D309F791-903F-11D0-9EFC-00A0C911004F}:00000431"**  
            Name="Updates Web Reference"/>

Note that I changed the name of the `Server Explorer` item to `Server Explorer**s**`. You can then rollback by simply importing the original settings you exported. The important piece is in bold above: the Menu attribute. That value is the Guid and ID you're looking for! Keep in mind that the ID after the ":" is an hexadecimal value, so you have to convert it to an integer.

From the information above, I can now place a new recipe in the View menu just by specifying:
    
    
    <CommandBar Guid="D309F791-903F-11D0-9EFC-00A0C911004F" ID="1073" />

Here's the proof ;-)

![A recipe in the context menu of a Web Reference](/web/20060615045841im_/http://clariusconsulting.net/ImageGallery/kzu/GAT/gatmenu2.png)

Now, the most interesting thing is that you don't have to do *anything* at all in order for that menu to be hidden whenever the associated recipe is not available (i.e. it's associated with an unbound recipe reference that specifies that it should only be enabled on certain targets, or it's a bound recipe associated with a particular solution element). In cases like the above, when you're already putting the recipe in a very specific context menu, that may not be such a compelling feature, but if you're placing your recipe in a common menu (like some of the main menus), it's a good feature to have. It makes for a less cluttered user experience.

posted [Thursday, June 01, 2006 7:32 AM](http://clariusconsulting.net/blogs/kzu/archive/2006/06/01/GATMenus.aspx) by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004) with [2 Comments](http://clariusconsulting.net/blogs/kzu/archive/2006/06/01/GATMenus.aspx#comments)

  

[![](/web/20060615045841im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")
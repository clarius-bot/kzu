---
layout: post
title: "How to add GAX/GAT recipes to arbitrary VS menus"
date: 2006-06-01 00:00:00 +0000
---

##  [How to add GAX/GAT recipes to arbitrary VS menus](<http://blogs.clariusconsulting.net/kzu/how-to-add-gaxgat-recipes-to-arbitrary-vs-menus/> "How to add GAX/GAT recipes to arbitrary VS menus")

June 1, 2006 6:32 am

So you’re hooked to this cool [Guidance](<http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/>)[Automation](<http://www.clariusconsulting.net/blogs/kzu/archive/2005/07/28/GATAdvantages.aspx>)[Toolkit](<http://guidanceautomation.net/>). Now, say you have a cool recipe you’d like to place in an arbitrary context menu, such as the context menu over a Web Reference. In VS any menu is called a command bar. Now that particular context menu is not one of the command bars that GAT provides friendly aliases for:

![Intellisense for GAT command bar element](http://www.clariusconsulting.net/ImageGallery/kzu/GAT/gatmenu1.png)

Fortunately, GAT allows you to specify Guid and ID attributes that uniquely identify any menu in VS, so you can place your recipe anywhere you want. That’s great, you say, but how in the world are you gonna know what values to use there? Turns out that until last week, I was fishing myself for those numbers in the VS SDK .ctc files (you don’t even want to know what those are, believe me). Turns out that there’s a much better and easy way, so I’d like to share it here.

The trick involves customizing the menu you want to put your recipe on, and then comparing the exported VS settings with a previous unmodified version, so you can tell the diff. The steps are:

  1. Go to Tools > Import and Export Settings… 
  2. Select `Export selected Environment Settings` option. 
  3. From the tree, unckeck the root and then select only the `All Settings\General Settings\Menu and Command Bar Customizations` node. 
  4. Click Next. Ensure the message displayed says the export was successful and without errors (IMPORTANT!).   
If you get an error, close and reopen VS, and try again without any solution opened. If you keep getting an error, I’m afraid you may need to reset your settings to the defaults (in the same dialog, select `Reset all settings` instead of Export… 
  5. Open a project where you have a Web Reference. Select the Web Reference in the solution explorer 
  6. Right-click on the toolbar and select `Customize`
  7. On the `Toolbars` tab, mark the `Context Menus`. At this point, a new toolbar with a number of dropdown menus should have appeared. Those are all the context menus currently available. 
  8. Expand `Project and Solution Context Menus`. You will see a number of entries. Now it’s just a matter of finding the context menu you’re looking for. In the case of the web reference, it’s a little tricky (and that’s why I chose this example) as the one you have to look for is named `Folder` (yuck!). But in general the names are pretty intuitive. 
  9. Now we need to introduce a customization in this menu so that it shows up in the exported settings later on. So make a trivial change inside it, such as renaming one of its child items. 
  10. Close the `Customize` window. 
  11. Repeat steps 2 to 4 to export the settings again, with a different file name this time. 

The safest way to do the process above without risking your current settings is to use a virtual machine and reset all settings before doing the export. For the cleanest possible .settings file, it’s also recommented that you reset to General Development profile.

Now open [a diff program](<http://winmerge.sf.net/>) and compare the two files. You should look into the <UserCustomizations> node, and you should see a <modify> element with the change you made. In my case, I got:
    
    
    <modify Cmd="{1496A755-94DE-11D0-8C3F-00C04FC2AAE2}:0000045c"         CmdPri="03000000"         Group="{D309F791-903F-11D0-9EFC-00A0C911004F}:000002a3"         GroupPri="02000000" **Menu="{D309F791-903F-11D0-9EFC-00A0C911004F}:00000431"**        Name="Updates Web Reference"/>

Note that I changed the name of the `Server Explorer` item to `Server Explorer**s**`. You can then rollback by simply importing the original settings you exported. The important piece is in bold above: the Menu attribute. That value is the Guid and ID you’re looking for! Keep in mind that the ID after the “:” is an hexadecimal value, so you have to convert it to an integer.

From the information above, I can now place a new recipe in the View menu just by specifying:
    
    
    <CommandBar Guid="D309F791-903F-11D0-9EFC-00A0C911004F" ID="1073" />

Here’s the proof ![;-\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif)

![A recipe in the context menu of a Web Reference](http://www.clariusconsulting.net/ImageGallery/kzu/GAT/gatmenu2.png)

Now, the most interesting thing is that you don’t have to do *anything* at all in order for that menu to be hidden whenever the associated recipe is not available (i.e. it’s associated with an unbound recipe reference that specifies that it should only be enabled on certain targets, or it’s a bound recipe associated with a particular solution element). In cases like the above, when you’re already putting the recipe in a very specific context menu, that may not be such a compelling feature, but if you’re placing your recipe in a common menu (like some of the main menus), it’s a good feature to have. It makes for a less cluttered user experience.

![](http://clariusconsulting.net/aggbug.aspx?PostID=531)

Posted by kzu
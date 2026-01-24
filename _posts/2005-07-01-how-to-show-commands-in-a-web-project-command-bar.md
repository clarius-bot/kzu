---
layout: post
title: "Daniel Cazzulino's Blog - How to show commands in a web project command bar"
date: 2005-07-01 00:00:00 +0000
---

## How to show commands in a web project command bar 

In the good old days of Everett (VS 2003), all project kinds, either web, win, class library, etc, shared the same command bar. You could put a command in all of them at once just by adding to that one. Nowadays, web projects (Venus) no longer use the C#/VB project systems. Hence, your commands in projects that were supposed to appear on web projects too, will certainly dissapear.   
  
In [GAT](http://lab.msdn.microsoft.com/teamsystem/workshop/gat/), you specify the command bar you want a command to appear, as follows:  

    
    
    <CommandBar Name="Project" />

  
The supported named command bars are just a subset, and nothing more than a facility to the guidance package author. In reallity, they are just shorcuts for the real GUIDs and IDs of the package and command bar respectively. And you can pass those two values instead of a name. For web projects, you specifically use:  

    
    
     <CommandBar ID="1136" Guid="d309f791-903f-11d0-9efc-00a0c911004f"/>

  
That will make a recipe appear in the context menu of a web project.  
  

/kzu

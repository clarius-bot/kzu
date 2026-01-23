---
layout: post
title: "Daniel Cazzulino's Blog : vsCommandStatus illogical rules put to work"
date: 2004-09-23 00:00:00 +0000
---

## vsCommandStatus illogical rules put to work 

I spend quite a bit of time trying to make the most "natural" scenario work:   

  * you have an addin that creates some commands
  * you want those commands to be invisible when the addin is not loaded  

  * you want your code (through QueryStatus) to determine if the command is shown or not when the addin is loaded  

Well, look at these illogical rules for vsCommandStatus:  

  1. vsCommandStatusInvisible: QueryStatus never gets called even if the addin is loaded (?!?!)
  2. vsCommandStatusInvisible + vsCommandStatusSupported: commands are always visible and enabled even if the addin is not loaded (?!)
  3. vsCommandStatusInvisible + vsCommandStatusEnabled: when the addin is loaded, commands are always grayed-out and QueryStatus is never called (?!). When the addin is not loaded, commands do not appear (OK).
  4. vsCommandStatusInvisible + vsCommandStatusUnsupported: commands are always visible, but grayed-out, even if the addin is not loaded and the QueryStatus is never called (?!)
  5. vsCommandStatusInvisible + vsCommandStatusEnabled + vsCommandStatusSupported: when the addin is loaded, commands are always visible/enabled and QueryStatus is never called (?!). When the addin is not loaded, commands do not appear (OK).
  6. vsCommandStatusInvisible + vsCommandStatusEnabled + vsCommandStatusLatched: commands are always visible but grayed-out and QueryStatus is never called (?!).  

Is it just me or the vsCommandStatus rules don't make any sense at all?!?!?!?!  
  
****So far, I couldn't find a @#$%@#$%^ way to do the simplest thing in the world.... I'm runing out of ideas/status combinations... any ideas?!  

posted on Thursday, September 23, 2004 3:54 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

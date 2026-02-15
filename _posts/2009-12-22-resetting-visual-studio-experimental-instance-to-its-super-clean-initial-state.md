---
layout: post
title: Resetting Visual Studio Experimental Instance to its super-clean initial state
date: 2009-12-22 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/resetting-visual-studio-experimental-instance-to-its-super-clean-initial-state
tags:
- .NET
- All Technology

---

If you are doing Visual Studio extensibility (VSX) work, you are probably aware of the existence of the Visual Studio "Experimental" instance. This is basically an instance of VS that has its own isolated registry, settings, extensions, etc. This allows you to test your extensions to VS without polluting your main development environment.

Sometimes, the environment might get corrupted for whatever reason, or it might be that you just want to test your extension with a clean environment after messing with it for a while. 

The Visual Studio SDK does come with a tool to reset the experimental instance, available from your Start menu with the name "Reset the Microsoft Visual Studio 2010 Experimental instance". That will not, however, give you the pristine environment you got the first time you start the experimental instance to test your first extension.

In order to get a super-clean environment, here's what you need to do:

  1. Close any running instance of VS Experimental. 
  2. Delete the entire folder %LocalAppData%\Microsoft\VisualStudio\10.0Exp 
  3. Run regedit.exe 
  4. Delete the registry key HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\10.0Exp 
  5. Delete the registry key HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\10.0Exp_Config 
  6. Run the command "Reset the Microsoft Visual Studio 2010 Experimental instance" from your start menu.

Now you'll have a fully restored environment. Also, any existing extensions you have in your main environment will be copied over to the experimental instance, with one caveat: you'll have to manually enable them from the Extension Manager UI from a running experimental instance to get them running.

If you've been doing VSX work in previous versions of VS, you'll sure appreciate the drastically simplified install/reset experience enabled by the new deployment mechanism in VS2010 via Extension Manager and VSIX files. If you have not, then this doesn't sound so scary anymore, does it? ;-)

Happy extending!

/kzu

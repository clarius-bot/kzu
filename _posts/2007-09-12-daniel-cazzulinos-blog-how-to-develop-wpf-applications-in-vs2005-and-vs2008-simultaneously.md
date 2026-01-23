---
layout: post
title: "Daniel Cazzulino's Blog : How to develop WPF applications in VS2005 and VS2008 simultaneously"
date: 2007-09-12 00:00:00 +0000
---

## How to develop WPF applications in VS2005 and VS2008 simultaneously 

In order to develop WPF apps in VS2005, you must install the corresponding CTP tools for it. These will basically bring in some new project templates, project types, MSBuild taks and designers. The designers are quite slow, and don't always work as expected. Being a CTP, and with VS2008 ("Orcas") already in the beta phase, I don't expect these to be updated anymore. Wouldn't it be great if you had a choice to use VS2008 or VS2005 with the same project files?

I'm not suggesting your entire team moves to VS2008. It's a pain to work with beta versions for your main development environment. Believe me, I developed GAX/GAT using pre-Beta1 versions of VS2005 (then "Whidbey") which we used to upgrade every couple weeks because it was quite unstable. It's no fun. Lots of time wasted. 

That's why I think it's better if whoever on the team is willing to take the risk goes ahead and sets up VS2008 on a virtual machine (**don't mess your main machine with betas**!) and works there. 

The process is quite straightforward:

  1. Clone your solution file, typically ending it with "VS2008.sln" to make it explicit that this is the "beta" solution file. 
  2. Open in VS2008, and complete the upgrade wizard. This will remove from the project files the MSBuild import of WPF targets, as they are built-in VS2008. 
  3. Close the solution, and open each project file with a text/XML editor. Towards the end of the file, add the following Import:

    
    
        ...      
        <Import Project="$(MSBuildBinPath)\Microsoft.CSharp.targets" />
        <Import Project="$(MSBuildBinPath)\Microsoft.WinFX.targets" />
    </Project>

That import is required by VS2005 in order to properly compile the XAML files, but fortunately, it works just fine also in VS2008. 

Now you can have half your team with VS2005 and the adventurous ones on VS2008 :)

/kzu

---
layout: post
title: "Daniel Cazzulino's Blog - How to add an MSBuild import to a project on NuGet install"
date: 2011-04-19 00:00:00 +0000
---

## How to add an MSBuild import to a project on NuGet install

This functionality has beendiscussedandrequestedas a feature for a future version ofNuGet.

UPDATE:this is now a built-in supported feature inNuGet.

While this gets into the core of NuGet, you can use this code in an install.ps1 script (seeAutomatically Running PowerShell Scripts During Package Installation and Removalsection if you don’t know what that file is for):

```
param($installPath, $toolsPath, $package, $project)
    # This is the MSBuild targets file to add
    $targetsFile = [System.IO.Path]::Combine($toolsPath, 'Funq.Build.targets')

    # Need to load MSBuild assembly if it's not loaded yet.
    Add-Type -AssemblyName 'Microsoft.Build, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'
    # Grab the loaded MSBuild project for the project
    $msbuild = [Microsoft.Build.Evaluation.ProjectCollection]::GlobalProjectCollection.GetLoadedProjects($project.FullName) | Select-Object -First 1

    # Make the path to the targets file relative.
    $projectUri = new-object Uri('file://' + $project.FullName)
    $targetUri = new-object Uri('file://' + $targetsFile)
    $relativePath = $projectUri.MakeRelativeUri($targetUri).ToString().Replace([System.IO.Path]::AltDirectorySeparatorChar, [System.IO.Path]::DirectorySeparatorChar)

    # Add the import and save the project
    $msbuild.Xml.AddImport($relativePath) | out-null
    $project.Save()
```

When I have the uninstall part figured out, this will probably make it to thePackage authoring tipspage.

Update: uninstall part via @teajay on the comments:

```
param($installPath, $toolsPath, $package, $project)

  # Need to load MSBuild assembly if it’s not loaded yet.
  Add-Type -AssemblyName ‘Microsoft.Build, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a’
  # Grab the loaded MSBuild project for the project
  $msbuild = [Microsoft.Build.Evaluation.ProjectCollection]::GlobalProjectCollection.GetLoadedProjects($project.FullName) | Select-Object -First 1
  $importToRemove = $msbuild.Xml.Imports | Where-Object { $_.Project.Endswith(‘Funq.Build.targets’) }
  # Add the import and save the project
  $msbuild.Xml.RemoveChild($importToRemove) | out-null
  $project.Save()
```

Enjoy!

/kzu

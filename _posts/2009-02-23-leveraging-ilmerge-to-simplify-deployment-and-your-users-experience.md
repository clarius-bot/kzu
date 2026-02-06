---
layout: post
title: "Leveraging ILMerge to simplify deployment and your users experience"
date: 2009-02-23 00:00:00 +0000
---

[ILMerge](http://research.microsoft.com/en-us/people/mbarnett/ilmerge.aspx) is one of those little-known gems that are an absolute must-have once you know how to apply them effectively to scenarios you didn't even think about.

Specifically, whenever you work on a multi-project solution that may also use external projects in turn, forcing your users to add (say) five assembly references just to your "entry point" library is clearly a bad experience. One example that comes to mind is [Enterprise Library](http://msdn.microsoft.com/entlib), where you add a minimum of 3 (IIRC) assembly references to use just about *any* block in isolation. If you use more than one, it quickly becomes quite a big list. Wouldn't you want to just give your users a single EnterpriseLibrary.dll?

Of course, you wouldn't do it if the price of that end-user simplicity was that you had to merge all your projects into a single one, complicating the dependency management and isolation between layers. 

Also, if you use a bunch of external libraries, do you think your users care? Having a single Dll gives a feeling that "this is small, I can manage to take a dependency on this single library".

## ILMerge to the rescue

The two scenarios are precisely ILMerge targets. It allows you to merge multiple assemblies into a single one, offering various options when doing so.

Let's see a concrete example: [Moq](http://moq.me/). Moq is a (fairly popular) mocking library for .NET. It depends on two awesome external libraries: Castle.Core.dll and Castle.DynamicProxy2.dll, which provide the runtime interception infrastructure that Moq builds upon. Moq users are not exposed to that internal implementation detail ever: they just add a reference to a single Moq.dll assembly and that's it. 

Typically, you will merge all the assembly references that have Copy Local = true (that is, dependencies that you distribute with your project as local, non-GAC'ed assemblies). So in order to automate this, in Moq we use an MSBuild target that is enabled only on release builds:
    
    
    <Target Name="AfterBuild" Condition=" '$(Configuration)' == 'Release' ">
     <Exec Command="&quot;$(MSBuildProjectPath)..\Tools\Ilmerge.exe&quot; /ndebug /keyfile:$(AssemblyOriginatorKeyFile) /out:@(MainAssembly) &quot;@(IntermediateAssembly)&quot; @(ReferenceCopyLocalPaths->'&quot;%(FullPath)&quot;', ' ')" />
     <Delete Files="@(ReferenceCopyLocalPaths->'$(OutDir)%(DestinationSubDirectory)%(Filename)%(Extension)')" />
    </Target>

Let's go over it:

  * The target has a condition that it will run only on Release builds.
  * The /ndebug parameter to ilmerge tells it to merge the PDB/debug files if present. Very handy :)
  * The /keyfile ensures that the merged assembly is signed with the same key file as your original project.
  * The /out is obvious, and we specify the MainAssembly item reference so as to replace the main output of the compilation.
  * Finally, the ilmerge tool receives the list of assemblies to merge. In addition to passing the IntermediateAssembly item which is the current output of the compilation process, we need to build a list of references that have CopyLocal set to true. We use the ReferenceCopyLocalPaths items, which is conveniently populated by the core MSBuild targets file Microsoft.Common.targets which is automatically imported in all your projects (and contains the resolved primary assembly references). We basically project the full path of those references and build a coma-separated list for ilmerge.
  * Finally, we delete all these references as they are now merged in the main assembly.

### ILMerge Silverlight assemblies

For Silverlight, the above command will generate a desktop .NET assembly, which doesn't work in Silverlight, even if the original assembly was a Silverlight one. You need to pass a couple more arguments to ilmerge:

  * /targetplatform: need to explicitly specify v2 as well as the platform directory, which is basically the folder that contains mscorlib.dll. In my case, for Windows x64 and Silverlight 2.0, I specified: /targetplatform:v2,"C:\Program Files (x86)\Microsoft SDKs\Silverlight\v2.0\Reference Assemblies"
  * /lib: all other non-mscorlib assemblies need to be resolved to the Silverlight folder too, rather than the GAC/desktop ones. This switch receives the same path as the previous one.

So for Silverlight, the full task looks like this for Moq.Silverlight:
    
    
      <Target Name="AfterBuild" Condition=" '$(Configuration)' == 'Release' ">
        <Exec Command="&quot;$(MSBuildProjectPath)..\Tools\Ilmerge.exe&quot; /targetplatform:v2,&quot;C:\Program Files (x86)\Microsoft SDKs\Silverlight\v2.0\Reference Assemblies&quot; /lib:&quot;C:\Program Files (x86)\Microsoft SDKs\Silverlight\v2.0\Reference Assemblies&quot; /ndebug /keyfile:$(AssemblyOriginatorKeyFile) /out:@(MainAssembly) &quot;@(IntermediateAssembly)&quot; @(ReferenceCopyLocalPaths->'&quot;%(FullPath)&quot;', ' ')" />
        <Delete Files="@(ReferenceCopyLocalPaths->'$(OutDir)%(DestinationSubDirectory)%(Filename)%(Extension)')" />
      </Target>

## Internalizing Dependencies

Merging multiple assemblies into one gets you a long way towards making your library look dead-simple. However, it may be the case that after adding a reference to your main assembly, users get a ton of foreign namespaces that they don't know about and they will never need to know about. These are the external dependencies of your library that are only used internally in your product. You can change the visibility of all these dependencies just by specifying one additional switch to the ilmerge tool: /internalize.

Internalize receives an optional "exclude file" which is a text file containing a type name on each line for types you don't want to touch (leave their visibility intact). In Moq case, the runtime interception needs for runtime-generated code a few public types from Castle, so we provide an exclude file with the following content:
    
    
    Castle.Core.Interceptor.IProxyTargetAccessor
    Castle.DynamicProxy.AbstractInvocation
    Castle.DynamicProxy.Generators.AttributesToAvoidReplicating

So the full Exec task looks like the following:
    
    
    <Exec Command="&quot;$(MSBuildProjectPath)..\Tools\Ilmerge.exe&quot; /internalize:&quot;$(MSBuildProjectPath)ilmerge.exclude&quot; /ndebug /keyfile:$(AssemblyOriginatorKeyFile) /out:@(MainAssembly) &quot;@(IntermediateAssembly)&quot; @(ReferenceCopyLocalPaths->'&quot;%(FullPath)&quot;', ' ')" />

Happy ILmerging ;)

/kzu

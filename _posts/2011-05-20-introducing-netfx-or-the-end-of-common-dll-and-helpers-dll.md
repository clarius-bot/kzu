---
layout: post
title: "Introducing NETFx, or the end of Common.dll and Helpers.dll"
date: 2011-05-20 00:00:00 +0000
---

From theproject home page:

## What

Lightweight NuGet packages with reusable source code extending core .NET functionality, typically in self-contained source files added to your projects as internal classes that can be easily kept up-to-date with NuGet.

## Why

Who doesn’t have an ever growing and ever less cohesive miscellaneous collection of helpers, extension methods and utility classes in the usual “Common.dll”? Well, the problem is that there’s really no good place for all that baggage: do we split them by actual behavioral area and create “proper” projects for them?

In most cases, that’s totally overkill and you end up in short time with the same pile of assorted files as you try to avoid setting up an entire new project to contain just a couple cohesive classes.

But, it turns out that in the vast majority of cases, those helpers are just meant for internal consumption by the actual important parts of your code. In many cases, they are just little improvements and supplements over the base class libraries, such as adding missing overloads via extension methods, adding factory methods for otherwise convoluted object initialization, etc. It’s almost inevitable that as the .NET framework and its languages evolve, existing APIs will start to look dated and lacking (i.e. lack of generics from v1 APIs, or eventually lack of async-friendly Task-based APIs once C# 5 is with us, etc.).

But with the advent ofNuGetthere’s anew wayto maintain, evolve and share those useful little helpers: just make them content files in a NuGet package!

And thusNETFxwas born: a repository of the source and accompanying unit tests for all those helpers, neatly organized (under the Extensions folder in thesource tree, by target namespace being extended), deployed exclusively usingNuGet, and licensed entirely underBSDfor everyone to use and contribute.

## How

You install NETFx nugets via the Add Library Package Reference dialog (this is easiest, since the individual package ids are fairly long and organized by extended namespace):

![](/img/2011-05-20-1.png)

Note that you don’t get a single monolithic gigantic “NETFx Package”, but rather you get to pick precisely what you need and nothing more.

From thePackage Manager Console, you can also just type install-package netfx-[TAB] and see a list of NETFx packages:

![](/img/2011-05-20-2.png)

Or even filter by area by entering a fragment of the namespace:

![](/img/2011-05-20-3.png)

And unlike most nugets, what you always get from NETFx is the actual source, as internal classes (the point of helpers!) that you build together with your own source. Need to debug it? Found a bug? No problem! The source is right *there* for you to see, patch or whatever:

![](/img/2011-05-20-4.png)

And every NETFx has its own place forSource + Unit Testsso that anyone can read the tests and see how to use a class, contribute patches and improvements for existing ones, or even send a pull request for a new one.

Publishing new NETFx nugets has been made so straightforward that a new one can pop-up inhttp://nuget.orgin about 15’ (time it takes to write an extension method and its unit tests).

The list is alreadyfairly extensive, and growing all the time.

Read ourdocumentationto get involved and contribute fixes or new netfx extensions! We even have a project template to make the entire process enjoyable

![Smile](/img/2011-05-20-5.png)

This project is sponsored byClarius Labs.

/kzu

---
layout: post
title: "NuGet References: publishing my first open source extension to the DevStore"
date: 2013-05-18 00:00:00 +0000
---

##  [NuGet References: publishing my first open source extension to the DevStore](<http://blogs.clariusconsulting.net/kzu/nuget-references-publishing-my-first-open-source-extension-to-the-devstore/> "NuGet References: publishing my first open source extension to the DevStore")

May 18, 2013 7:49 pm

Last week I had the pleasure of spending time with a bunch of friends at the [OuterConf 2013](<https://bit.ly/outerconf>), including pretty much the entire NuGet team. I also could attend to the hackathon they organized, and I got to hack what I think is a pretty cool Visual Studio 2012 extension: NuGet References. 

## An improved NuGet experience

The idea is simple enough: I wanted to leverage some new extensibility hooks in VS2012 to show installed nuget packages right inside a packages.config file, like so:

![Nodes](http://blogs.clariusconsulting.net/kzu/files/2013/05/Nodes.png)

And once you have the nodes in there, wouldn’t it be cool to be able to update and uninstall right from there?

![Menus](http://blogs.clariusconsulting.net/kzu/files/2013/05/Menus.png)

And why not allow me to see key information about the package on the properties window?

![Properties](http://blogs.clariusconsulting.net/kzu/files/2013/05/Properties.png)

Cool enough ![Sonrisa](http://blogs.clariusconsulting.net/kzu/files/2013/05/wlEmoticon-smile.png)

## Monetizing your creations

Now, after the extension was “done” (there’s a TON more that can be added to it! This is just the start), I realized I had put quite a few hours (more like days by now!) into it. So even if I do want my work to be open source so that eventually it can make it into NuGet’s core tooling, I could certainly use a few bucks to pay for the coffee and beer I put into it ![Guiño](http://blogs.clariusconsulting.net/kzu/files/2013/05/wlEmoticon-winkingsmile.png).

In the past, attempting to monetize small extensions was either a matter of placing a Donate button somewhere and hope that users would notice, or investing serious time in some sort of payment method (i.e. PayPal) and issuing product keys and implementing some activation mechanism. 

I believe the Donate button doesn’t work because you have mainly two choices on how to expose it:

  * At installation time 
  * Sporadic nagging dialogs afterwards 

At installation time, I usually don’t know yet if what I’m installing is any good and if I will be willing to donate and how much. And everybody hates nagging dialogs. So there you have it: it won’t work. 

And the alternative is simply not worth it most of the time (like for this cool extension I just built). I’m done with the fun part of building it, I just want to move on to the next fun thing. I’m hardly looking forward to building the payment and product activation stuff, much less maintain that up and running and the like. It’s just too much work.

This is the reason we (Clarius Consulting) built the [DevStore](<http://devstore.com/>): it allows me to quickly and effortlessly publish my extension for sale and be done in minutes. So let’s do that right now!

## Publishing to the DevStore

So let’s go to [http://devstore.com](<http://devstore.com/>) and click on the prominent Upload button:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image.png)

I get to sign in with either a Google or Windows Live account, and after that quick permissions acceptance dialog, I get to fill in basic information about myself and accept the DevStore terms of service.

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image1.png)

That will send an email to our inbox for verification purposes, after which we can log in with our credentials by clicking the Login button at the top. Of course this is only required the first time ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) .

After we’re logged in, if we now click again the Upload button, we get to accept the Seller terms of service (which is different than for users, just like every other app store), and with that out of the way, we can just go ahead and upload our VSIX!

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image10.png)

Here I have already chosen my extension file. Note that the file I’m uploading is the output of a regular VSIX project in Visual Studio. I haven’t modified the manifest in any way for now. Upon submitting the file, we get some data extracted from the manifest, which we can now tweak as needed:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image11.png)

For one thing, I know I want to change the Full Price value! So let’s click Edit. You can edit quite a bit of information about how you want to sell your extension, including full price (for first-time purchases), upgrade price (for v1 users when I come out with v2), what countries I want to sell it on, screenshots, and so on. I just happen to love Stella Artois beer which is [about $2 on Amazon Fresh](<http://fresh.amazon.com/product?asin=B0016XMXZK&qid=156589851&rank=1&sr=1-1&tag=title>), so I’ll just round it up to $2.99 and you can buy me a beer for this extension ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif) .

After I’ve saved the information, I can click Submit/Publish, at which point it’s live on the site on the Recently Added section:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image4.png)

## Buying from the DevStore

Now you can all go buy me a beer for this extension by either going to the website and downloading the VSIX from there, or, much more conveniently, do it from within Visual Studio!

All you need to do is first get the DevStore extension via the Extension Manager (remember, my extension only works on VS2012):

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image5.png)

After a quick VS restart, you will get a new node in the extension manager window, the DevStore:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image6.png)

You cannot buy your own extensions, so here I’m buying it from another account I have, just to show you how it looks. The user will first have to register/sign in (right after clicking the Buy button), at which point they will get the Checkout dialog:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image7.png)

The next step takes you to your default browser, to the PayPal website. We had this step baked into Visual Studio at some point, but the overwhelming feedback from early beta testers was that they felt more confident and secure if we just took them to the regular browser window. In there, you get to log in and pay as usual:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image8.png)

Right after confirming the payment, I can go back to Visual Studio, and notice that the button changed from Buy to Download (as well as a new little world icon that tells me I own this extension in the cloud). And sure enough , after a quick download, I get the regular VSIX install dialog plus optional EULA if any, and I get to finish the install:

![image](http://blogs.clariusconsulting.net/kzu/files/2013/05/image9.png)

## What about Open Source, Freedom and Love?

Well, I’m a complete fan of open source. I always ask myself “why NOT make this open source?”, rather than the opposite (and more common) question. I believe a very low-friction way to contribute with a few bucks with an open source project or developer is a great way to encourage more open source, independent developers and innovation. 

The DevStore provides a great way to encourage developers to automate more of their daily programming activities, boosting productivity. I believe bite sized extensions in the range of $2-10 are a much better option that monster-sized tools that completely take over most of your IDE or pollute it unnecessarily with myriad (and totally unrelated) commands all over the place.

In order to prove the point that both open source and paid convenience delivery of binaries can actually be a commercially viable option, I’m also publishing the entire source for this extension in [GitHub](<https://bit.ly/10x7FXt>).

And that’s it! I just bought myself a beer with that demo above, so it’s time for me to go enjoy it. I hope you like the extension and gift me a beer too ![;\)](http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif)

/kzu

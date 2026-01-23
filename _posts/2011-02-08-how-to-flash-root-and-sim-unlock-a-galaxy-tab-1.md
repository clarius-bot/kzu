---
layout: post
title: "How to flash, root and SIM unlock a Galaxy Tab"
date: 2011-02-08 00:00:00 +0000
tags: [ddd, ef, eventsourcing, extensibility, gadgets, mocking, moq, msbuild, mvc, nuget, patterns, programming, t4, technology, vsx, wcf, webapi]
---

## ![](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/KZUblogtitle.gif)  
  

Daniel Cazzulino  
Data MVP  
(a.k.a. KZU)

Dev Lead @ Clarius

Buenos Aires - Argentina

[![vcard](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/BTNvcard_N.gif)](aaa)

![KZU picture](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/KZUpic.jpg)

![KZU front](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/KZUcard_front.png)

![KZU back](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/card_back.png)

[![Twitter](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/BTNtwitter_N.gif)](http://twitter.com/#!/KZU)[![Email](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/BTNemail_N.gif)](https://web.archive.org/web/20140528155806/mailto:kzu@clariusconsulting.net)[![linked](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/BTNlink_N.gif)](http://www.linkedin.com/in/danielcazzulino)[![google+](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/BTNgoogle_N.gif)](http://plus.cazzulino.com/)[![RSS](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/BTNrss_N.gif)](http://feeds2.feedburner.com/danielcazzulino)

## Tags

[ddd](http://blogs.clariusconsulting.net/kzu/tag/ddd/ "2 topics") [ef](http://blogs.clariusconsulting.net/kzu/tag/ef/ "1 topic") [eventsourcing](http://blogs.clariusconsulting.net/kzu/tag/eventsourcing/ "3 topics") [extensibility](http://blogs.clariusconsulting.net/kzu/tag/extensibility/ "1 topic") [gadgets](http://blogs.clariusconsulting.net/kzu/tag/gadgets/ "3 topics") [mocking](http://blogs.clariusconsulting.net/kzu/tag/mocking/ "6 topics") [moq](http://blogs.clariusconsulting.net/kzu/tag/moq/ "7 topics") [msbuild](http://blogs.clariusconsulting.net/kzu/tag/msbuild/ "4 topics") [mvc](http://blogs.clariusconsulting.net/kzu/tag/mvc/ "1 topic") [nuget](http://blogs.clariusconsulting.net/kzu/tag/nuget/ "8 topics") [patterns](http://blogs.clariusconsulting.net/kzu/tag/patterns/ "3 topics") [programming](http://blogs.clariusconsulting.net/kzu/tag/programming/ "35 topics") [t4](http://blogs.clariusconsulting.net/kzu/tag/t4/ "1 topic") [Technology](http://blogs.clariusconsulting.net/kzu/tag/technology/ "5 topics") [VSX](http://blogs.clariusconsulting.net/kzu/tag/vsx/ "3 topics") [wcf](http://blogs.clariusconsulting.net/kzu/tag/wcf/ "4 topics") [webapi](http://blogs.clariusconsulting.net/kzu/tag/webapi/ "4 topics")

## Latest Tweets

  * No Tweets Available

[@kzu](http://twitter.com/kzu "Follow @kzu")

## Recent Posts

  * [Joining Xamarin](http://blogs.clariusconsulting.net/kzu/xamarin/ "Joining Xamarin")
  * [OutDir vs OutputPath](http://blogs.clariusconsulting.net/kzu/outdir-vs-outputpath/ "OutDir vs OutputPath")
  * [Smarter Visual Studio Template Authoring](http://blogs.clariusconsulting.net/kzu/smarter-visual-studio-template-authoring/ "Smarter Visual Studio Template Authoring")
  * [Complex traces you can actually understand by leveraging Activity Tracing](http://blogs.clariusconsulting.net/kzu/complex-traces-you-can-actually-understand-by-leveraging-activity-tracing/ "Complex traces you can actually understand by leveraging Activity Tracing")
  * [How to transform T4 templates on build without installing a Visual Studio SDK](http://blogs.clariusconsulting.net/kzu/how-to-transform-t4-templates-on-build-without-installing-a-visual-studio-sdk/ "How to transform T4 templates on build without installing a Visual Studio SDK")

http://blogs.clariusconsulting.net/kzu

# Daniel Cazzulino's Blog

[Go Back to  
**kzu** ′s Latest post](http://blogs.clariusconsulting.net/kzu)

[« Previous Post](http://blogs.clariusconsulting.net/kzu/how-to-use-t4-templates-in-wp7-silverlight-desktop-or-even-monodroid-apps/)

[Next Post »](http://blogs.clariusconsulting.net/kzu/check-your-embed-interop-types-flag-when-doing-visual-studio-extensibility-work/)

##  [How to flash, root and SIM unlock a Galaxy Tab](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/ "How to flash, root and SIM unlock a Galaxy Tab")

February 8, 2011 3:09 pm

These instructions worked for me on two AT&T devices, 850/1900 WCDMA (the one that works in Argentina), model SGH-i987 to be precise.

AT&T decided to cripple its ROM for the Galaxy Tab: it doesn’t do USB debugging, it can’t install apps from outside the Android Market (this prevents the z4root unlock), it doesn’t have 3G video calls (what’s the front camera for?!), etc.

So I decided to flash it with a Europe ROM, root and unlock it to get the full power of the hardware you can get for [$550 now at Amazon](http://www.amazon.com/gp/product/B004CYEQF0?ie=UTF8&tag=deverest-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=B004CYEQF0).

These instructions are an aggregate of my own for a total newbie with a Win7 x64 OS and [instructions I found on the great XDA forum](http://forum.xda-developers.com/showthread.php?t=847273). You will need the excelent and free [7zip](http://www.7-zip.org/) to extract the downloaded files, which I placed on my own public share in Amazon S3 for future reference and to avoid depending on sites that may go away or files that are linked in various forum posts, etc.

  1. With the Tab unplugged from USB, go to Settings, Applications, Development and see if you can turn on USB debugging. 
  2. If you can’t, it seems that running the Samsung Kies software at least once fixes it. There is a new [v2](http://org.downloadcenter.samsung.com/content/SW/201010/20101015082300359/Kies_2.0.0.11011_16_5.exe) out that I couldn’t get to connect to my Tab. I uninstalled Kies as soon as I got what I needed form it, so I don’t really care for v2. So I uploaded the version that did work for me to [S3](http://share.cazzulino.com/public/tab/kies_win.exe). 
     * After installing [the software](http://share.cazzulino.com/public/tab/kies_win.exe) (a 135 MB download), plug-in the Tab, and select "Kies (Firmware update)" in the "Select USB mode" screen that shows up. 
     * Run the Kies software. 
  3. If you get a dreaded "Unsupported device alert" or something like that, it’s because the drivers for the device were not properly installed. I manually extracted all drivers from the Kies installer executable above as follows (you can also [download the 7zip file directly](http://share.cazzulino.com/public/tab/SAMSUNG_USB_Driver_for_Mobile_Phones.7z) if you don’t mind an extra 14 MB download): 
     * Open the Kies*.exe installer file with [7zip](http://www.7-zip.org/)
     * Browse to the CabFile\USB Driver\ folder 
     * Extract SAMSUNG_USB_Driver_for_Mobile_Phones.exe.cab to a temporary location 
     * Open SAMSUNG_USB_Driver_for_Mobile_Phones.exe.cab from the temporary location, and extract the SAMSUNG_USB_Driver_for_Mobile_Phones.exe file from it 
     * Finally, open the extracted SAMSUNG_USB_Driver_for_Mobile_Phones.exe file and extract all its contents to a temporary folder 
     * Go to the Device Manager, find the devices that didn’t start successfully, open its properties, select Update Driver, and use the "Browse my computer for driver software" choice. 
       * Note: I had to do this twice after the drivers for the first device were successfully installed, as a new unrecognized device showed up and later installed correctly. 
     * Browse to the folder where you extracted the entire contents of the SAMSUNG_USB_Driver_for_Mobile_Phones.exe file, and it will install the appropriate driver. 
  4. In the Kies software, the device will now show up. Just exit, and uninstall Kies. Yup, weird :S. 
  5. Download the following files: 
     * [Firmware P1000XWJJ4](http://share.cazzulino.com/public/tab/P1000XWJJ4.7z) (198 MB) 
     * [Firmware P1000XXJK5](http://share.cazzulino.com/public/tab/P1000XXJK5.7z) (186 MB) 
     * [Odin3](http://share.cazzulino.com/public/tab/Odin3.7z) (< 200 KB) 
     * [Bell modem](http://share.cazzulino.com/public/tab/modem_bell_i9000.7z) (3 MB) 
  6. Extract them all. 
  7. Start the Tab in download mode by pressing the volume down and power buttons together. A big yellow sign right on boot will tell you you’re in download mode. 
  8. Run the Odin3 program. Select PIT: P1_add_hidden.pit , PDA: P1000XWJJ4-REV03-ALL-CL639474.tar.md5, and check the Re-Partition option. Click Start. 

The phone will reboot and may be in Russian. (it started in English on the second Tab I did this ![:o](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_surprised.gif) )).   
Close Odin3.

  9. Start the Tab in download mode again (volume down + power) 
  10. Run Odin3 (you may need to unplug/plug the Tab from USB at this point, and restart Odin if it does not show up in ID:COM like above, although it mostly detects automatically when you plug the device again). Select PDA: P1000OXAJK5.tar with NO repartition and NO PIT file. Click Start. 

The phone will reboot with the latest euro firmware in English. Yay!

  11. Start the Tab in download mode again (volume down + power) 
  12. Run Odin again. Select PHONE: modem.bin (from the [modem_bell_i9000.7z](http://share.cazzulino.com/public/tab/modem_bell_i9000.7z) download) with NO repartition and NO PIT file. Click Start. 

You’re done with the flashing part. The OS is now fully featured for the hardware you bought.

  13. Now in order to unlock the SIM card, you first need to root the OS. First check if the z4root application is available in the market. If it’s now, [download it](http://share.cazzulino.com/public/tab/z4root.1.1.0.apk) to the Tab SD card (plug it via USB and select Mount in the UI) and run it from there using a file manager (like the built-in My Files application or the FileManager from the Market which is free and pretty good). Clicking the apk will install it, and you can run it then. Just click the Root button. 
  14. Install Busybox from the Market. 
  15. To unlock the SIM card (adapted from [XDA forum](http://forum.xda-developers.com/showthread.php?t=843323)): 
     * Install the [Java Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/index.html) (JDK) 
     * Install the [Android SDK](http://developer.android.com/sdk/installing.html)
     * Open a command prompt, cd to the android platform-tools folder (in my machine, using the default installation path, it’s C:\Program Files (x86)\Android\android-sdk-windows\platform-tools) and type: adb shell 
     * Then paste all the following commands into the shell window at once, in other words, **one big copy and paste** : 
           
           sucd /sdcardecho "this takes about 45 seconds. run only ONCE"busybox cp /efs/nv_data.bin /sdcard/nv_data.bin.origecho -en \\x00 > out0dd if=nv_data.bin.orig of=out1 bs=1 count=1578089dd if=nv_data.bin.orig of=out2 bs=1 skip=1578090 count=163dd if=nv_data.bin.orig of=out3 bs=1 skip=1578254 cat out1 out0 out2 out0 out3 > nv_data.bin.unlockedrm out0 out1 out2 out3rm /efs/nv_data.binbusybox cp nv_data.bin.unlocked /efs/nv_data.binrm /efs/nv_data.bin.md5reboot

Now you have a fully unlocked and full featured Galaxy Tab!!!

Among the cool things you now have, you can do a video call right from the Phone dialer with anyone that has the standard 3G video calls enabled (I’m told oldish WinMo phones have this capability, as well as Nokia and Samsung phones. We tried this with a Samsung Galaxy S and it worked like a charm). Needless to say, you’ll need a SIM with a data plan to do that. No VoIP involved.

![](https://web.archive.org/web/20140528155806im_/http://www.clariusconsulting.net/aggbug.aspx?PostID=314327)

Posted by kzu

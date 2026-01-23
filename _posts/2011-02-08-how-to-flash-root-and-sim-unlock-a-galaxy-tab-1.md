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

![Comments](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/hr.png)

### 20 Comments

  1. [How To Install New Rom In Galaxy Tab | | TABLET PC REVIEWSTABLET PC REVIEWS](http://www.tabletpc-review.tk/about/tablet-pc-technical-support/how-to-install-new-rom-in-galaxy-tab) [ April 23, 2011 at 12:20 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-17)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=17#respond)

[...] How to flash, root and SIM unlock a Galaxy Tab … Description : AT&T decided to cripple its ROM for the Galaxy Tab: it doesn’t do USB debugging, it can’t install apps from outside the Android Market (this prevents the z4root unlock), it doesn’t have 3G video calls (what’s the front camera for? … [http://blogs.clariusconsulting](http://blogs.clariusconsulting/) .. [...]

  2. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/5b51e0e9724834980d4206c4ed21228b?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Pam]() [ May 9, 2011 at 1:27 am. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-43)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=43#respond)

I am not understanding how to do the unlock the sim part? I am new at this…need alittle more detail. Where I am running into problems is the java and android sdk part. I can not get it to run correctly. I am currently running windows 7 and there seems to be some conflicts.

     * [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/75672722798c0960bfe3b0e7f2d92657?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[KAIS]() [ September 30, 2011 at 7:02 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-343)

Hi Pam  
I was confused in the bigining but I found the answer  
go to program files\android\android-sdk\platform-tools (on your computer and the tab is connected through USB)  
then click shift and right click(on the platform-tools folder) to open cmd  
then print adb shell and hit enter you will see this mark $( or somthing similer) now copy the code below  
su  
cd /sdcard  
echo “this takes about 45 seconds”  
if [ ! -f /sdcard/nv_data.bin.orig ]; then  
echo “copying file to /sdcard”  
cp /efs/nv_data.bin /sdcard/nv_data.bin.orig  
fi  
echo -en \\\x00 > out0  
dd if=nv_data.bin.orig of=out1 bs=1 count=1578089  
dd if=nv_data.bin.orig of=out2 bs=1 skip=1578090 count=163  
dd if=nv_data.bin.orig of=out3 bs=1 skip=1578254  
cat out1 out0 out2 out0 out3 > nv_data.bin.unlocked  
rm out0 out1 out2 out3  
rm /efs/nv_data.bin  
cp nv_data.bin.unlocked /efs/nv_data.bin  
rm /efs/nv_data.bin.md5  
reboot  
Wait 45 seconds for the whole process to complete.  
Thats It! your phone will reboot and its carrier unlocked!

hope That’s help  
Regards  
KAIS

  3. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/d120830b08a9fefc78dc2f929e6be055?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[harry johnston]() [ August 20, 2011 at 11:06 am. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-314)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=314#respond)

Daniel,  
I just came across your very informative Blog. I bought a T Mobile Samsung Galxy Tab Wi-fi version last month in the US. It was unlocked but appears to have defaulted back to locked. Would you mind If I emailed you again on this matter as I would like to unlock the SIM and use my Tab.I think you might be able to assit me. Again my email is [harryjay@tpg.com.au](https://web.archive.org/web/20140528155806/mailto:harryjay@tpg.com.au)  
Thank you  
Harry in Sydney Australia

  4. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/75672722798c0960bfe3b0e7f2d92657?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[KAIS]() [ September 30, 2011 at 6:56 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-342)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=342#respond)

Hi Daniel  
I go through the process and it’s worked for me my samsung 7″ tab was locked to Bell-Canada and now it’s UNLOCKED ![:\)](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_smile.gif)  
THANK YOU SO MUCH AND KEEP THE GOOD WORK  
KAIS

  5. [![](https://web.archive.org/web/20140528155806im_/http://0.gravatar.com/avatar/83e3244405ce1e5c9c8d3f96a5c671f0?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Alexandre Almeida]() [ October 9, 2011 at 4:09 am. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-348)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=348#respond)

Excellent Job!!! Now I have Galaxy Tab Unlocked! Thank you so much!!!  
May I translate this tutorial to portuguese? It will help developers from Brazil.

  6. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/b7ef91c42029990203c976618ef516a4?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Sousa]() [ November 17, 2011 at 3:49 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-365)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=365#respond)

Hi… i manage to get to the part od the cmd  
adb sheel  
when i write it says: error device not found  
Can u help me ??? Thanks

  7. [![](https://web.archive.org/web/20140528155806im_/http://0.gravatar.com/avatar/6230e73ab381af22df10156ad5b9bcf4?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[kzu]() [ November 17, 2011 at 9:08 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-366)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=366#respond)

You must have the USB driver for your device, Without that nothing will work.

i.e. <http://developer.android.com/sdk/win-usb.html>

  8. [![](https://web.archive.org/web/20140528155806im_/http://0.gravatar.com/avatar/09c2327a0b497c099e93405df42ae401?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[alex]() [ December 22, 2011 at 1:23 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-377)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=377#respond)

Thank you so much for the post. I was able to get to step 7 but when i got to extract the two p1000…. files its asking me for a password inorder to extract. could anyone please help me with this. thanks in advance.

  9. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/bd2c29dc58b89c9bf86951c5d04a4d6b?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[David]() [ June 11, 2012 at 8:12 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-718)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=718#respond)

SGH-i987 – I have tried twice to update this using your method. Each time it is successful, but it’s stuck on the Galaxy Tab display at first boot up and will not go further. Is there a master reset that might clear this or have I totally bricked it?

     * [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/dc85ee030067fd116526dcf5c4191e11?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Warren]() [ May 20, 2014 at 3:50 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-2458)

I have had teh same problem as David, my Galaxy Tab is Bricked. I get connected, load the pit file, Odin says is was successful, Tab restes but is frozen at boot screen. Reset and load the pda file, it runs successfully but reboots to a blank screen, frozen and bricked

Help. if you can

  10. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/99e887cb861a4ae42f89e17089d1b933?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Tosin Oluwarinde]() [ December 16, 2012 at 5:39 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-1739)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=1739#respond)

Amazing! Thanks a lot Daniel. I got my SGH-i987 AT&T Version rooted, loaded and Sim-unlocked via your step-by-step instruction.

You are the man!

I am grateful!

  11. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/f49f517742c225ed57798cef265de0ba?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[victor]() [ January 4, 2013 at 10:24 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-1750)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=1750#respond)

I have done all according to your explaination and steps followed but now my galaxy tab is just starting well but stoping on sumsung it cant show the app please help me soving this problem

  12. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/f49f517742c225ed57798cef265de0ba?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)](http://html/)

[victor](http://html/) [ January 4, 2013 at 10:29 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-1751)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=1751#respond)

please help me solving my galaxy tab SC-01C docomo I have tried to follow all the step you have mationed but all want well but now it just showing samsung just on starting and it stops from there what can I do to solve this probleme. HTML

  13. [![](https://web.archive.org/web/20140528155806im_/http://0.gravatar.com/avatar/e9b633484aac00b665bc3723386ad51a?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[MK]() [ July 31, 2013 at 3:10 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-2031)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=2031#respond)

Hi,  
I have been searching for long time but turn out was very little and did not get me any were until I found your post and it helped a lot. My question is little side from the discussion. I want to install custom recovery so that I can go in recovery mode and able to install a rom. How can I install a custom recovery (or any other you recommend) without damaging the current Rom.

  14. [![](https://web.archive.org/web/20140528155806im_/http://0.gravatar.com/avatar/edc6765705397063efa2556baaba6f67?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Suliman]() [ August 19, 2013 at 8:54 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-2132)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=2132#respond)

Hello Guys,  
thanks Daniel for your help, I was able to Root my tab,and it works better than before. I just had an issue with the unlocking part, it was not clear enough especially when I tried to install the Andriod SDK, Please help.

thanks

  15. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/fd281c20b901fa6ada88a9659f1c76c1?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Jossie]() [ October 24, 2013 at 12:49 pm. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-2205)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=2205#respond)

Hi, I have been using my galaxy tab for almost one year, just two days ago it just started showing me “NO SERVICE” with an image of sim on the tool bar and a crossed circle too. I was told I need to unlock the sim port. Pls help me out, how do I do dat? Dis is d first time it is happening to the tab.

  16. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/b3ce1d0e757ad1641a6e71f285b16af3?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[FortyTwo]() [ May 1, 2014 at 6:10 am. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-2447)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=2447#respond)

I am stuck at rooting the device because by the time that I get there following the exact procedure above I can no longer enable USB debugging. I’ve tried repeating the steps to enable it, but they don’t seem to work. I am stuck. Any advice?

  17. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/b3ce1d0e757ad1641a6e71f285b16af3?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[FortyTwo]() [ May 1, 2014 at 7:17 am. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-2448)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=2448#respond)

I fixed that problem now. I just had to completely unplug the device and change the USB settings in the wireless & networks menu.

But now I am running into a problem running the command suggested in the adb shell. It says permission denied. A bit stumped what to do at this point again.

  18. [![](https://web.archive.org/web/20140528155806im_/http://1.gravatar.com/avatar/b3ce1d0e757ad1641a6e71f285b16af3?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[FortyTwo]() [ May 1, 2014 at 9:49 am. ](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#comment-2449)

[Reply](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/?replytocom=2449#respond)

Update. Okay, so I figured it all out. I had to do a couple of other things in order to get this to work. First I had to remount the rootfs because by default it was ro.

mount -o rw,remount rootfs /

or

mount -o rw,remount rootfs rootfs /

should work.

Then the original command in the instructions did not work for me. Maybe I am just noob but ‘sucd’ command does not exist. And also don’t forget that you need to mount the phone/device as usb before any of these commands in the adb shell will work. Mostly I used the commands that KAIS provided (thanks). With one modification, there is no cp command built in. So there is where busybox becomes necessary. I don’t know if it’s a path issue or something because I’m simply not that skilled, but that I had use the following modified command in the adb shell:

busybox cp cp /efs/nv_data.bin /sdcard/nv_data.bin.orig

Also I just entered the commands manually one by one instead of running them in a script or copy and paste fashion since I wouldn’t know how to do that anyway. Hope this helps someone.

### What do you think?

A name and an email are required. You may use HTML in your comment.

[Click here to cancel reply.](http://blogs.clariusconsulting.net/kzu/how-to-flash-root-and-sim-unlock-a-galaxy-tab/#respond)

Name

Mail

URL

![other Clarius BLOGS](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/frt_blogs.gif)

hear the experts

[![KZU thumbnail](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/thumbnail_KZU.gif)](http://blogs.clariusconsulting.net/kzu/)[![PGA thumbnail](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/thumbnail_PGA.gif)](http://blogs.clariusconsulting.net/pga/)[![EZE thumbnail](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/thumbnail_EZE.gif)](http://blogs.clariusconsulting.net/eze/)[![VGA thumbnail](https://web.archive.org/web/20140528155806im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/thumbnail_VGA.gif)](http://blogs.clariusconsulting.net/vga/)

**Copyright © 2010 Clarius Consulting** \- Source code published in this blog
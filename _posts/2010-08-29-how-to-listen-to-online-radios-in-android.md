---
layout: post
title: "How to listen to online radios in Android"
date: 2010-08-29 00:00:00 +0000
---


Most online radios stream using ASX and WMA encoding, which doesn’t work in Android phones at all.

I was even going to go for a homebrew “server” using [VLC](<http://www.videolan.org/vlc>) which can transcode. But that would mean I need to keep a machine up all the time, take care of keeping the process up, opening firewall ports, etc. etc.

After a bit of research, I found a pretty acceptable solution for the time being:

  1. Create an account and sign in at <http://www.yourmuze.fm/>. Select your preferred streaming audio quality. 
  2. First, in [Stations](<http://www.yourmuze.fm/stations_list>), you can search for an existing radio if it’s already there. 
  3. The [one I was looking for](<http://www.yourmuze.fm/station/radio-maria-del-rosario>) wasn’t there, so I clicked on “**[add a new station](<http://www.yourmuze.fm/new_station>)** “. Here you’d enter the mms:// or http:// stream address. 
  4. After you create the station, it’s not automatically added to your “My Stations” queue. But it will be the first station in the list now: 

[![image](http://www.clariusconsulting.net/images/blogs/kzu/Howtolistento_EA/image_thumb.png)](<http://www.clariusconsulting.net/images/blogs/kzu/Howtolistento_EA/image.png>)  

  5. Click the “add” link to the right of the station name, in the My Stations column. You’re done with the site. 
  6. In phone, go to <http://m.yourmuze.fm/> and log in. Under My Stations you will find yours.   
Opening it will launch the video player tuned to the radio. This might seem like a minor issue, but it’s not: videos run in full screen and NEED to be in the foreground, otherwise they are stopped. So no background playing radios! Bummer. This is a known issue that they will fix with [an upcoming native app for Android](<http://www.yourmuze.fm/forum-topic/android-app-in-development>). 
  7. To solve that issue, you need to install the [Dolphin HD](<http://lifehacker.com/5535044/dolphin-browser-hd-is-a-great-android-browser-alternative>) browser from the android market (free). It’s a pretty interesting browser on its own. But I’m only interested in launching this one radio I care ![:\)](/img/2010-08-29-1.gif) . 
  8. Go the Dolphin HD browser Settings, and set the User Agent to iPhone. 
     * If you want to launch the radios with one click, browse now to <http://m.yourmuze.fm/>, long-press the station from My Stations section, and select Bookmark link. 
     * Next go to Bookmarks (you can just swipe the screen to the right, very [Metro](<http://www.silverlightshow.net/items/UI-Concepts-of-Windows-Phone-7.aspx>)!), click Edit, and long-press the station bookmark you just created and select Add shortcut to Home.
  9. Next you need an audio player that doesn’t believe it’s streaming video. The only one that worked for me is xiialive lite (free too). You don’t need to do anything in the player. 

Now the radio will be launched from the browser into the audio player automatically, in a format that is understood in Android ![:\)](/img/2010-08-29-1.gif) . 

Enjoy!

/kzu

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=276409)

/kzu

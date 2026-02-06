---
layout: post
title: "Secondary disk performance on laptop (for virtual machine working)"
date: 2006-02-20 00:00:00 +0000
---

## Secondary disk performance on laptop (for virtual machine working)

I was trying to determine the best setup for a secondary disk to use to work with avirtual machine(VM), which is a must in order to have the development experience inside the VM be almost on a pair with developing on the host machine (without the risks of screwing your machine with betas, etc.).

I have the usualHitachi Travelstar 7K60(7200rpm, 60gb), pretty much the only 7200rpm option about a year ago. And lately I bought aSeagate Momentus 5400.2(5400rpm, 120gb) with the idea that even if it’s slower, I may use it to keep backups of VMs, music, etc.

I had some doubts regarding myThinkpad T43pUltraBay performance for the disk. At some point, I felt putting the disk in the UltraBay was slower than using it with the external USB enclosure. So I run some tests with the two disks in USB and UltraBay configuration, using thePerformanceTest 6.0software fromPassMark, which is supposedly pretty good at testing various performance indicators.

Results were surprising:

![Click for bigger image](http://aspnet2.com/kzu/weblog/HD_Performance-small.png)

In a nutshell

- A secondary disk in the UltraBay outperforms USB2 consistently.
- Hitachi Travestar 7k60 is showing its age, and even the “slower” Seagate Momentus 5400rpm outperforms it consistently by a substantial margin.

So disks switched roles now: 5400rpm for VMs, older 7200rpm for music/backups :o)

posted on Monday, February 20, 2006 8:46 AM
						bykzu

/kzu

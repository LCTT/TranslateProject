[#]: subject: "Linux kernel modules we can't live without"
[#]: via: "https://opensource.com/article/21/8/linux-kernel-module"
[#]: author: "Jen Wike Huger https://opensource.com/users/jen-wike"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux kernel modules we can't live without
======
Open source enthusiasts weigh in on the Linux kernel modules they love.
![Linux keys on the keyboard for a desktop computer][1]

The Linux kernel is turning 30 this year! If you're like us, that's a big deal and we are celebrating Linux this week with a couple of special posts.

Today we start with a roundup of responses from around the community answering "What Linux kernel module can you not live without? And, why?" Let's hear what these 10 enthusiasts have to say.

* * *

I guess some kernel developers will run away screaming when they hear my answer. Still, I list here two of the most controversial modules:

  * First is NVIDIA, as I have an NVIDIA graphics card on my work laptop and my personal desktop.
  * The other one probably generates less hatred—the VMNET and VMMON modules from VMware to be able to run VMware Workstation. —[Peter Czanik][2]



* * *

My favorite is the [zram][3] module. It creates a compressed block device in memory, which can then be used as a swap partition. Using a zram-based swap partition is ideal when memory is limited (for example, on virtual machines) and if you are worried about wearing out your SSD or, even worse, your flash-based storage because of frequent I/O operations. —[Stephan Avenwedde][4]

* * *

The most useful kernel module is definitively snd-hda-intel since it supports most integrated sound cards. I listen to music while coding an audio sequencer on the Linux desktop. —[Joël Krähemann][5]

* * *

My laptop would be worthless without the kmod-wl that I generate with the Broadcom file. I sometimes get messages about tainting the kernel, but what good is a laptop without wireless? —[Gregory Pittman][6]

* * *

I can't live without Bluetooth. Without it, my mouse, keyboard, speakers, and headset would be doorstops. —[Gary Smith][7]

* * *

I'm going to go out on a limb and say _all of them_. Seriously, we've gotten to the point where I grab a random piece of hardware, plug it in, and it just works.

  * USB serial adapter just works
  * Video card just works (though maybe not at its best)
  * Network card just works
  * Sound card just works



It's tough not to be utterly impressed with the broad scope of the driver work that all the modules bring to the whole. I remember the bad old days when we used to yell out xrandr magic strings to make projectors work, and now—yeah, it's a genuine rarity when stuff doesn't (mostly) just work.

If I had to nail it down to one, though, it'd be raid6. —[John 'Warthog9' Hawley][8]

* * *

I'm going to go back to the late 1990s for this one. I was a Unix systems administrator (and double duty as IS manager) for a small company. Our tape backup system died, and because of "small company" limited budgets, we didn't have a rush replacement or onsite repair on it. So we had to send it in for repair.

During those two weeks, we didn't have a way to make tape backups. No systems administrator wants to be in that position.

But then I remembered reading the [Floppy Tape How-to][9], and we happened to have a tower PC we'd just replaced that had a floppy tape drive.

So I reinstalled it with Linux, set up the **ftape** kernel driver module, ran a few backup/recovery tests, then ran our most important backups to QIC tapes. For those two weeks, we relied on **ftape** backups of critical data.

So to the unsung hero out there who made floppy tape drives work on 1990s Linux, you are awesome! —[Jim Hall][10]

* * *

Well, that's easy. It's the kvm kernel modules. On a personal front, I cannot imagine doing my day-to-day work without VMs. I'd like to believe that's the case with most of us. The kvm modules also play a big part in making Linux central to the cloud strategy. —[Gaurav Kamathe][11]

* * *

For me, it's dm-crypt, which is used for LUKS. See:

  * <https://www.redhat.com/sysadmin/disk-encryption-luks>
  * <https://manpages.debian.org/unstable/cryptsetup-bin/cryptsetup.8.en.html>



It's fantastic to know others cannot see what's on your disk, for example, if you lose your notebook or it gets stolen. —[Maximilian Kolb][12]

* * *

For cryptography basics, it's hard to beat the crypto module and its C API, which is straightforward.

For day-to-day life, is there anything more valuable than the plug-and-play that Bluetooth provides? —[Marty Kalin][13]

* * *

Share with us in the comments: What Linux kernel module can you not live without?

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-kernel-module

作者：[Jen Wike Huger][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://opensource.com/users/czanik
[3]: https://en.wikipedia.org/wiki/Zram
[4]: https://opensource.com/users/hansic99
[5]: https://opensource.com/users/joel2001k
[6]: https://opensource.com/users/greg-p
[7]: https://opensource.com/users/greptile
[8]: https://opensource.com/users/warthog9
[9]: https://tldp.org/HOWTO/Ftape-HOWTO.html
[10]: https://opensource.com/users/jim-hall
[11]: https://opensource.com/users/gkamathe
[12]: https://opensource.com/users/kolb
[13]: https://opensource.com/users/mkalindepauledu

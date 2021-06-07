[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to choose an affordable Linux laptop for video conferencing)
[#]: via: (https://opensource.com/article/20/8/linux-laptop-video-conferencing)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

How to choose an affordable Linux laptop for video conferencing
======
Open source can give pre-owned computers the necessary boost to make
them useful with today's popular video conferencing tools.
![Two people chatting via a video conference app][1]

As more and more activities move online during the global pandemic, an increasing number of folks are looking for affordable and stable solutions to connect to their doctor, therapist, bank, college, and more. Many of the folks I've been working with are on limited incomes, and they're eager for any technical help they can get.

Whether they're on a proprietary video conferencing solution or using an [open source one like Jitsi Meet][2], everyone needs a platform that's robust enough to support their needs without breaking the budget. One of the leading cloud video conferencing providers [recommends][3] that platforms should have at least an i3 processor or equivalent with a minimum of 4GB RAM. My experience has taught me that an i5 or equivalent and at least 4-8GB RAM is even better.

I also recommend Linux for running meeting solutions. You could go out and purchase a new Linux computer. However, if you're on a limited income, then plunking down $1000 or more for a new system might not be what you had in mind.

A more budget-friendly solution I recently put together for a friend was a 2015 MacBook Air running Elementary OS. The computer had 4GB RAM, an i5 processor, and 240GB NVMe solid-state drive. Elementary OS was a great choice for this computer, as it came with a Broadcom 4360 wireless card, which didn't play nice with other Linux distributions but was detected by Elementary. The FaceTime camera didn't work with any Linux distribution I tried, Elementary included, and no one seems to have a good solution, so I purchased a USB camera and connected it to the laptop. This fellow needed to use Zoom to connect to his church, so I downloaded the [Zoom client][4] for Linux and installed it. The software download supports .rpm, .deb, and [Flatpak][5].

In another case, I purchased a refurbished PC laptop from a prominent vendor. It came with 8GB RAM, i5, webcam, and 256 SSD drive. I'm going to install either Fedora or Pop!_OS on it along with the Zoom client and the usual complement of free software, including LibreOffice, Calibre, ClamAV, Gnu Chess, and other games for my friend to explore.

### Used laptops for Linux

When looking for a used laptop, I usually consider the reputation of the brand. I check for the same or similar models and their compatibility with Linux. Both [Fedora][6] and [Ubuntu][7] maintain lists of acceptable hardware platforms. If possible, I try to get a list of the included hardware. For example, what is the CPU model and speed? Does the unit have Bluetooth built-in? How many USB ports does it have? Does it have audio ports? Does it support Thunderbolt? Does it have built-in WiFi, and what is the chipset of the WiFi adapter? I have had good luck with Intel, Broadcom, and Realtek, though the list varies depending on your particular needs.

There are many sources of good used laptops and desktops, but my favorites are eBay, [Dell Refurbished][8], and [PC Liquidations][9]. I look for units that are three to five years old, that are in good condition, and that have at least an Intel i3 or AMD FX-6300, or better, processor. CPU speed and at least 4 GB RAM are important if you are going to be using your Linux laptop or desktop for video conferencing. Check to make sure the unit you purchase has a power supply. It's handy to have a webcam, but that's not a dealbreaker because you can use a USB camera. I have had good experiences with Logitech web cameras.

### Refurbishing computers

When refurbishing older laptops or desktop computers, you'll often find older system components such as a mechanical hard drive or WiFi card that doesn't support the latest wireless technology. These can usually be remedied with a small amount of effort and a minimal budget. For instance, replacing an old hard drive with a solid-state drive (SSD) will usually provide an immediate performance boost. You can also purchase newer WiFi + Bluetooth cards. Most likely, the form factor on a laptop will be Mini PCI but do your research to be sure. This allows you to choose a brand and chipset that might be better supported by Linux. RAM can also be increased. 4GB is definitely my minimum, but I'd much rather have 8GB. I also like to install the latest BIOS, if it is available from the respective vendor, in order to have the latest fixes and features.

A lot of this advice also applies to desktop systems. You'll generally have more flexibility with these since there are more card slots and other connectors for peripherals. For instance, an older system may not support new technology such as Bluetooth, WiFi, or USB3. Add-in PCI or PCIe cards can be installed to provide this support.

### Choosing a Linux distribution for an old computer

The last piece of the puzzle is choosing a Linux distribution for your rescued computer. There are many distributions out there, and though they do like to highlight their own unique spin on providing a [Linux desktop][10], at the end of the day, they're all Linux. When it comes to installing Linux on an old computer, the best one is the one that works on the computer you have.

The key is to step through the install process (it's not much more complex than installing an office application or a new web browser) and then see how your computer responds when you reboot it. If you get a desktop to come up and you can open and run basic applications, then you're on the right track.

Once you're satisfied that you have a working computer with a desktop and access to the Internet, give your usual video conferencing application a try. If it fails, try a lightweight Linux distribution in hopes that using fewer resources for your OS can solve any video issues.

Also, if your camera is HiDef (high definition or HD), then try setting it to broadcast at a lower resolution. Sometimes this can improve your system's performance because you're sending less data over what's probably an old network card with a limited capacity.

I recommend trying [Elementary OS][11] or [Fedora Linux][12] for recent computers. For very old computers, try [Peppermint OS][13], which is specifically designed for computers without many resources. The great news is there are multiple ways to use open source solutions to turn your old machine into a modern communication platform.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/linux-laptop-video-conferencing

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chat_video_conference_talk_team.png?itok=t2_7fEH0 (Two people chatting via a video conference app)
[2]: https://opensource.com/article/20/5/open-source-video-conferencing
[3]: https://support.zoom.us/hc/en-us/articles/201362023-System-requirements-for-Windows-macOS-and-Linux
[4]: https://zoom.us/download
[5]: https://flathub.org/apps/details/us.zoom.Zoom
[6]: https://docs.fedoraproject.org/en-US/fedora/rawhide/release-notes/welcome/Hardware_Overview/
[7]: https://certification.ubuntu.com/
[8]: https://www.dellrefurbished.com/laptops
[9]: https://www.pcliquidations.com/
[10]: https://opensource.com/article/20/5/linux-desktops
[11]: https://elementary.io/
[12]: http://getfedora.org/
[13]: https://peppermintos.com/

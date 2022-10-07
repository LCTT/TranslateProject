[#]: subject: "Linux Mint 21 Review: Still Fresh and Easiest Distro to Try"
[#]: via: "https://www.debugpoint.com/linux-mint-21-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint 21 Review: Still Fresh and Easiest Distro to Try
======
Here’s the detailed review and benchmark of Linux Mint 21 “Vanessa”.

### Introduction

Linux Mint 21 arrived on July 31, 2022, with two years of updates after its predecessor Linux Mint 20 Ulyana. Two years is a long time in software. A lot has happened since then. Although Linux Mint 21 Vanessa is based on Ubuntu 22.04 at its core, it’s still different.

Mint devs diverged away from the certain decisions of Ubuntu for the benefit of its users. In that sense, Linux Mint still “just works” for everyone, for almost all hardware, to this very day.

In this review article, I will discuss how Linux Mint 21 performed in two bare metal test setups (details below), a benchmark against Ubuntu 22.04 LTS GNOME and some user feedback.

### Linux Mint 21 – Feature Check

Before I go over the review items, a quick recap on the new features of this version compared to the past release.

Linux Mint 21 is based on Ubuntu 22.04 LTS and features the LTS mainline Kernel 5.15. That’s about at the core.

Other than that, there are some unique updates arriving in the desktop, settings and several places. In this release, you get the default support for WebP image format, a changed desktop settings section with more improved groupings and much-needed driverless printing support via Internet Printing Protocol (IPP).

In addition, two important change which is worth highlighting in this release. Although it is based on Ubuntu, Mint never follow what Ubuntu tries to push via “user-centric features”.

So, Linux Mint 21 is completely free of Snap. Firefox is good old vanilla Debian package which you get by default. Flatpak is installed by default, and the controversial Out of memory from Systemd is also disabled.

These are the key differences and improvements compared to the prior release and Ubuntu 22.04. A detailed feature walk-through is available [here][1] if you want to give it a read.

### Bare metal install and review

**Testbed 1 (new hardware)**

* AMD RYZEN 7 (5000 Series), AMD RAEDON Graphics with SSD and 14 GB RAM
* Triple boot with Windows 11, Fedora 35

**Testbed 2 (older hardware)**

* Intel Core i3, NVIDIA CUDA GeForce (350) with SSD and 4GB RAM
* Triple boot with Debian, KDE Neon

### Test Results

Testing for this review is done on the flagship version, “Cinnamon Edition”, which comes with 2.4 GB of ISO size. The ISO size is pretty standard and not much like Ubuntu which is more than 3 GB.

Linux Mint uses the Ubiquity installer, which is stable, and during installation in both the hardware with dual boot/triple boot – all went fine.

GRUB is preserved, and all the operating systems are detected in both systems. I was kind of worried about the Legacy BIOS before installation, but all went well.

Installation time in both the hardware is close to 5 minutes, excluding the partition steps.

After the first login, no surprise I found. Since I have not selected the Wi-Fi connectivity during installation, I had to set it up after the first boot.

Bluetooth, wireless connection to the internet, sound – all work well in both old and new hardware.

The printer is one of the important items I always check for distro review. So, I have an HP Deskjet 2300 series printer which worked out of the box in Linux Mint. I am pretty impressed because the same printer doesn’t work well in Fedora and Ubuntu without installing HPLIP.

So, that’s a win.

Since Linux Mint pre-loads all the necessary software, you do not need to install anything after set up. It’s one of the few Linux distros ready to use after installation.

Since Mint devs think about users and community feedback, this version is free of Snap packages. Flatpak is preinstalled, and Firefox is the native deb package.

In addition, Linux Mint 21 also disables the Out of memory situation, which recently created quite an uproar after the Ubuntu 22.04 Jammy Jellyfish release.

### Summary of the results

So, in summary, all the following works well without any crashes or errors in both my test hardware.

* Printer
* Bluetooth (with earphones and external speaker sound output)
* Wi-Fi connection
* Volume controls
* Wireless Mouse and Keyboard Detection
* Wake up from standby (both normal and force lid close)
* External monitor connection with HDMI (separate scaling/resolution in the different monitors)

Finally, I was surprised that Mint detected my ancient NVIDIA GeForce card, which gives me trouble in almost all the distros today since the driver is deprecated.

Overall, excellent and solid performance in basic connectivity and hardware.

Let’s talk about some performance metrics.

### Performance

With a basic load (a file manager, terminal, and browse, the older hardware consumes 1 GB of memory which is about 25% of available physical memory. And CPU is at 2 % to 3% on average. Most of the resources are consumed by the Cinnamon desktop and Bluetooth agent.

![Linux Mint performance in older hardware][2]

With a little higher load, the modern hardware performs satisfactorily. With Firefox with ten tabs, one terminal window, file manager, LibreOffice and a Flatpak app – it uses around 4GB of memory, and the CPU is identical up to 3%.

![Linux Mint performance in newer hardware][3]

Although the memory usage is a little higher in new hardware, I believe its because of the running applications. The maximum memory is consumed by Firefox in this use case.

### Benchmark against Ubuntu 22.04

I did a benchmark on Geekbench (version 5) of Linux Mint 21 against Ubuntu 22.04 and Fedora 35 KDE. It performed well above that two distributions in the same hardware.

The key points where Mint scores a little less are text rendering and image compression. This is partial, I believe, due to the Muffin of Linux Mint. Muffin may not be close to performant compared to Mutter at this moment. But I hope it soon to be.

A detailed benchmark is available [here][4] (if you want to read it in detail), and a screenshot is below.

![Linux Mint 21 benchmark in Geekbench 5][5]

### Ground report

Features and performance aside, how is this version performing out in the wild?

Unfortunately, the official bug tracker in Linux Mint GitHub is not correctly tagged with the release version. Also, there is no official page listing all the bugs injected/reported after a major release. Too bad for the quality.

Nonetheless, around 66 bugs/issues were [reported][6] between 31-July-2022 (release day) and Sep-8-2022 for Mint and Cinnamon in GitHub.

So, around 1.6 bugs per day.

However, most bugs are related to cosmetic items of Cinnamon desktop, screensaver, Cinnamon themes, animation, etc.

Not many critical bugs to be a showstopper.

The software will always have bugs. Hell, Windows have thousands of bugs in general, even today. But no matter the situation or the error, the overall desktop still works. Your work usually doesn’t get stuck for these cosmetic bugs.

I also checked the official Mint forum, Reddit and Facebook Mint groups – the same issues users reported related to cosmetic items.

### Wrapping up

Linux Mint is for average users, migrated users and for first timers. I believe, Linux Mint developers did a good job by keeping this vision untouched in Linux Mint 21, by carefully bypassing difficult decisions by Ubuntu.

From the Linux adaptation standpoint, it does work, still today. A go-to distribution for all use cases.

Yes, there are minor errors and bugs, but they don’t get in the way. An experienced user always finds a way around it. New users can continue their work in Mint without worrying much about Linux.

I believe I can term this release as “Ubuntu done right”.

That said, you can download the latest version from the [official website][7].

[Next: Connect to Ubuntu 20.04 from Windows 10 [Beginner’s Guide]][8]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/linux-mint-21-review/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/linux-mint-21-features/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/Linux-Mint-performance-in-older-hardware.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/09/Linux-Mint-performance-in-newer-hardware.jpg
[4]: https://browser.geekbench.com/v5/cpu/compare/15728414?baseline=17124930
[5]: https://www.debugpoint.com/wp-content/uploads/2022/09/Linux-Mint-21-benchmark-in-Geekbench-5.jpg
[6]: https://github.com/linuxmint/cinnamon/issues
[7]: https://www.linuxmint.com/download.php
[8]: https://www.debugpoint.com/connect-ubuntu-20-04-windows-10/

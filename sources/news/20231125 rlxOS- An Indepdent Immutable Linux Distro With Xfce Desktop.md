[#]: subject: "rlxOS: An Indepdent Immutable Linux Distro With Xfce Desktop"
[#]: via: "https://news.itsfoss.com/rlxos/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

rlxOS: An Indepdent Immutable Linux Distro With Xfce Desktop
======
An independent, immutable distribution with a nice look and feel.
The market for [immutable Linux distributions][1] has been rising at a very steady pace.

Just this year alone, we have seen the introduction of the likes of [Fedora Onyx][2], [blendOS v3][3], and news of a [Snap-based immutable Ubuntu desktop][4] coming with 24.04 LTS.

With this [first look][5], we will be taking a look at [rlxOS][6], an immutable distro built from scratch.

So, let's dive in.

🚧

The distribution is fairly new and may not be a suitable replacement as a daily driver.

### rlxOS: Overview ⭐

![][7]

rlxOS prides itself in being **built from scratch** as an [independent Linux distribution][8] for having better control over the core and working parts. Being immutable, it follows a [rolling release][9] approach so that users won't need to reinstall it whenever there is a major update.

The **key features** include:

  * **Immutability**
  * **Leverages** [**Ostree**][10]
  * **Focuses on Privacy**
  * **Native Flatpak Support**



If you did not know, an immutable distro lets you make changes without affecting the core of the system. You may call it as changes in layers, so one does not impact other.

To make that happen, rlxOS uses a software updater daemon ([swupd][11]) that keeps two versions of the operating system (before/after changes). You can follow the [documentation][11] to make changes that disappear after a reboot.

The same daemon will also let you have different layers of packages. As per the official website, it is not available in the stable release yet.

Furthermore, you can also easily setup [Distrobox][12] for containers by referring to the [documentation][13].

**Suggested Read** 📖

![][14]

#### Initial Impressions 👨‍💻

I fired up rlxOS on a virtual machine (VM) by using [VirtualBox on Ubuntu][15]. The installer looked quite pleasant to the eyes, with a nice squircle feel to it that **reminded me of the** [**Adwaita**][16] **theming style** from GNOME.

![][17]

I **had to manually partition the drive** using [GParted][18] as I proceeded. First, I created a partition table on the virtual drive with the recommended ' _msdos_ ' partition table.

Then, I allocated two partitions with different sizes, with one being a 39.5 GB partition with the ' _ext4_ ' file system, the other being a 512 MB one with the ' _fat32_ ' file system.

After that, I had to ensure that the 'fat32' partition had the 'boot' and 'esp' flags so that rlxos would install properly.

📋

Set flags by right-clicking on the partition and selecting “Manage Flags”.

![][19]

The **installer also provides useful hints** regarding the partitions, denoting 'Linux' for the larger one, and 'EFI' for the smaller one.

If you are installing it on bare metal alongside Windows, you have to be careful about the partitions, as we have not tested that here.

![][20]

Thereafter, a confirmation screen shows up, displaying **some important last-stage info**. I clicked on 'Apply' to proceed.

![][21]

It then **** took some time to install**.** But, for some reason during that, I was able to click on the 'Next' and 'Back' option (which should have been greyed out I believe).

![][22]

I suggest you let the installation happen without tweaking anything else and wait for the “Success” prompt as shown below.

![][23]

After reboot, a **quick-setup wizard** started, I entered the user details, and password, then rebooted again.

![][24]

I was greeted with **a very neat sign-in screen** that featured a beautiful wallpaper and some options/ info in the header bar like usual.

![][25]

Post sign-in, I was taken into **a very familiar desktop screen** that had **a Windows-like application launcher** , **a taskbar with useful widgets** such as language, notifications, network, power saver mode, and more.

![][26]

Though, I noticed right away that **rlxOS ships with a very limited number of pre-installed applications**. That can be a good thing, depending on who you ask.

But, I must say that the Xfce experience looks good out-of-the-box.

Personally, I feel that they could have added any of the [open-source alternatives to Microsoft Office][27] such as [LibreOffice][28] or [ONLYOFFICE][29] at least, so that the distro would feel like a more complete experience. But, of course, it is a new distribution, no complaints.

Moving on to the settings app, it appears that it matches the system theme well.

![][30]

Rlxos utilizes Xfce as its desktop, one of the most popular and minimal desktop environments out there. The stable version that I tested was running **a customized version** of [Xfce 4.18][31].

![][32]

If you have used Xfce in the past, you will find the one on rlxos very familiar, yet different. I used it for a bit, and I was content with what it had to offer, the multitasking bit was effortless, as **rlxOS has support for workspaces**.

I was easily able to switch between workspaces by scrolling/clicking on the workspaces switcher in the taskbar.

**Suggested Read** 📖

![][14]

Even though this distro has its share of niggles here and there, it is worth a try. Your **experience on bare metal should be better** than on a VM.

You can head to its [GitHub repo][33] if you are interested in the source code, or want to contribute to it.

### 📥 Download rlxOS

At the time of writing, there were **two variants of rlxos** available to download from the [official website][34]. One was **a stable version with monthly updates** , the other was **an experimental version, considered unstable**.

[rlxos][34]

_💬 What are your thoughts on rlxOS? Would you recommend this to anyone?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/rlxos/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/immutable-linux-distros/
[2]: https://news.itsfoss.com/fedora-onyx-official/
[3]: https://news.itsfoss.com/blendos-v3-released/
[4]: https://news.itsfoss.com/ubuntu-all-snap-desktop/
[5]: https://news.itsfoss.com/tag/first-look/
[6]: https://rlxos.dev/
[7]: https://news.itsfoss.com/content/images/2023/11/rlxos_1.jpg
[8]: https://itsfoss.com/independent-linux-distros/
[9]: https://itsfoss.com/rolling-release/
[10]: https://en.wikipedia.org/wiki/OSTree
[11]: https://docs.rlxos.dev/system-management/swupd/
[12]: https://itsfoss.com/distrobox/
[13]: https://docs.rlxos.dev/system-management/distrobox/
[14]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[15]: https://itsfoss.com/install-virtualbox-ubuntu/
[16]: https://en.wikipedia.org/wiki/Adwaita_(design_language)
[17]: https://news.itsfoss.com/content/images/2023/11/rlxos_2.jpg
[18]: https://gparted.org/
[19]: https://news.itsfoss.com/content/images/2023/11/rlxos_3.jpg
[20]: https://news.itsfoss.com/content/images/2023/11/rlxos_4.jpg
[21]: https://news.itsfoss.com/content/images/2023/11/rlxos_5.jpg
[22]: https://news.itsfoss.com/content/images/2023/11/rlxos_6.jpg
[23]: https://news.itsfoss.com/content/images/2023/11/rlxos_7-1.jpg
[24]: https://news.itsfoss.com/content/images/2023/11/rlxos_8.jpg
[25]: https://news.itsfoss.com/content/images/2023/11/rlxos_10.jpg
[26]: https://news.itsfoss.com/content/images/2023/11/rlxos_11.jpg
[27]: https://itsfoss.com/best-free-open-source-alternatives-microsoft-office/#2-onlyoffice
[28]: https://www.libreoffice.org/
[29]: https://www.onlyoffice.com/
[30]: https://news.itsfoss.com/content/images/2023/11/rlxos_11b.jpg
[31]: https://news.itsfoss.com/xfce-4-18-release/
[32]: https://news.itsfoss.com/content/images/2023/11/rlxos_13.jpg
[33]: https://github.com/itsManjeet/rlxos
[34]: https://rlxos.dev/downloads/

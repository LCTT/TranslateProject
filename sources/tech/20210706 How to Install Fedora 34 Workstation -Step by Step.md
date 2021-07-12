[#]: subject: (How to Install Fedora 34 Workstation [Step by Step])
[#]: via: (https://www.debugpoint.com/2021/07/install-fedora-34-workstation/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install Fedora 34 Workstation [Step by Step]
======
In this absolute beginner’s guide, we explain the steps required to
install Fedora 34 workstation edition (GNOME desktop environment).
This page covers the following topics

  * [Fedora 34 Minimum system requirements][1]
  * [Pre-Steps before installation][2]
  * [Download and create LIVE USB][3]
  * [Install Fedora 34][4]



[Fedora][5] is a Linux based distribution which offers desktop and server flavors. It is a free and open-source Linux distribution sponsored by Red Hat and developed and contributed by the community. It works as an upstream distribution for Red Hat Enterprise Linux. Hence, with Fedora you get the latest Linux Kernel, packages with cutting edge features and applications.

Fedora desktop edition offers almost all popular desktop environments. A quick list of desktop environment is below which has official Fedora flavor.

  * KDE Plasma
  * GNOME
  * Xfce
  * LXDE
  * LXQt
  * i3 WM
  * MATE
  * Cinnamon (via repo)



This is why it is very popular, and many users choose Fedora to Ubuntu because you get a perfect system with many packages pre-installed. Mostly experienced users prefer Fedora, but it is absolutely useful for beginner’s as well. If you are an Ubuntu user and want to jump the ship to Fedora, well, you may want to check out our [Ubuntu to Fedora migration guide][6].

The Fedora 34 which we are going to install in this post brings some interesting changes. Fedora 34 brings Linux Kernel 5.11, Zstd compression when btrfs is used, default sound daemon Pipewire, GNOME 40 desktop, KDE Plasma 5.21 and many Wayland related updates. For a detailed coverage, visit our [Fedora 34 topics][7] to learn more.

### Fedora 34 workstation – System requirement

This is the minimum system requirement for installing Fedora in general.

  * 2 GHz dual-core processor
  * 4 GiB RAM (system memory)
  * 20 GB of hard-drive space
  * VGA capable of 1024×768 screen resolution
  * Either a CD/DVD drive or a USB port for the installer media
  * Internet access is not mandatory for installation



### Pre-Step Before Installation

Before you start the installation, make sure of the followings.

  * If you are installing in a physical system, make sure to decide which partition you want to install.
  * If you are planning to dual boot with Windows or any other Linux Systems, then make sure you decide which partition to install.
  * Take a backup of your personal data.
  * Keep a LIVE USB with [Boot Repair][8] handy, in case something goes wrong.



[][9]

SEE ALSO:   How to Upgrade to Fedora 34 from Fedora 33 Workstation (GUI and CLI Method)

### Download and prepare LIVE USB

Download the Workstation edition from the below link. It contains the torrent of the .ISO file and also includes all other [Fedora 34 Spins][10] as well.

[fedora torrents][11]

After the download is complete, create a LIVE USB using any utility such as [Etcher][12]. Plug in the USB in your system, change BIOS settings to boot from it.

### Install Fedora 34 – Steps

1\. The LIVE Fedora installation system boot up to a LIVE desktop, that gives you options to install to a Physical medium.

![Install to Hard Driver Option in LIVE Media][13]

2\. In the next screen, select language and continue. Then click on the Installation destination to select which partition you would like to install.

![Select Language][14]

![Installation Destination Select][15]

3\. In the installation destination screen, select the disk and choose Storage Configuration: Custom. And click Done at the top.

![Select Disk][16]

4\. In the partitioning screen, choose your partition sizes for root, and boot partitions. For example, keep /boot at around 1GB and rest you can assign to /root partition.

5\. For Fedora 34, it is better to use btrfs for root partition for better performance. Do not forget to set the mount point as / in root partition.

![root partition][17]

![boot partition][18]

6\. When you are satisfied with your new file system, click on Done. In the next screen, make sure to verify carefully the summary of changes that is going to happen to your disk. Because this will make changes to your system and can not be reverted. Click Accept changes once you are ready.

![Summary of Changes][19]

7\. Wait for the installation to complete. Once it is finished, click on Finish Installation and reboot the LIVE system.

![Installation complete][20]

So, that’s about it. If all goes well, after reboot, you should be greeted with Fedora 34 workstation edition desktop with GNOME 40.

![Fedora 34 Desktop][21]

I hope this basic guide to install Fedora 34 helps beginner’s or advanced users for their work. If you run into a problem, such as with dual boot, or any other installation error, let me know in the comment box below.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/install-fedora-34-workstation/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: tmp.cwqzC2PPCj#min-requirement
[2]: tmp.cwqzC2PPCj#pre-steps
[3]: tmp.cwqzC2PPCj#download-create-USB
[4]: tmp.cwqzC2PPCj#install-fedora-34
[5]: https://getfedora.org/
[6]: https://www.debugpoint.com/2021/04/migrate-to-fedora-from-ubuntu/
[7]: https://www.debugpoint.com/tag/fedora-34
[8]: https://sourceforge.net/p/boot-repair/home/Home/
[9]: https://www.debugpoint.com/2021/04/upgrade-fedora-34-from-fedora-33/
[10]: https://www.debugpoint.com/2021/04/fedora-34-desktop-spins/
[11]: https://torrent.fedoraproject.org/
[12]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[13]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Install-to-Hard-Driver-Option-in-LIVE-Media.jpeg
[14]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Select-Language.jpeg
[15]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Installation-Destination-Select.jpeg
[16]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Select-Disk.jpeg
[17]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/root-partition-1024x532.jpeg
[18]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/boot-partition.jpeg
[19]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Summary-of-Changes.jpeg
[20]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Installation-complete-1024x526.jpeg
[21]: https://www.debugpoint.com/blog/wp-content/uploads/2021/04/Fedora-34-Desktop--1024x529.jpg

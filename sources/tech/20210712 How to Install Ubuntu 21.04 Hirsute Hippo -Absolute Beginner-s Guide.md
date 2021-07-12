[#]: subject: (How to Install Ubuntu 21.04 Hirsute Hippo [Absolute Beginner’s Guide])
[#]: via: (https://www.debugpoint.com/2021/06/install-ubuntu-21-04-hirsute-hippo/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install Ubuntu 21.04 Hirsute Hippo [Absolute Beginner’s Guide]
======
This quick guide explains the basic steps to install Ubuntu 21.04
Hirsute Hippo desktop edition.Take extra caution as this option can
erase your entire disk.
This guide covers the following topics:

  * [Minimum system requirement for installation][1]
  * [Pre-Steps][2]
  * [Download the .iso file][3]
  * [Install Ubuntu][4]



Ubuntu 21.04 Hirsute Hippo is the first short-term release of 2021 which brings moderate changes and updates. In case you missed it, here’s a quick recap of the new features of Ubuntu 21.04.

  * Linux Kernel 5.11
  * Wayland is now the default (Xorg is optional)
  * Home directory default permission changed to 750, hence it is private
  * Updated stock applications with GNOME 3.38
  * UI refinements, dark theme updates



### Minimum System Requirements for Ubuntu 21.04 Installation (desktop)

  * 2 GHz dual-core processor
  * 4 GiB RAM (system memory)
  * 25 GB of hard-drive space
  * VGA capable of 1024×768 screen resolution
  * Either a CD/DVD drive or a USB port for the installer media
  * Internet access is required, but not mandatory for installation



In case if you are planning to upgrade to Ubuntu 21.04, make sure to check out our [detailed upgrade guide here][5].

### Pre-steps

Before you start the installation, make sure of the followings.

  * If you are installing in a physical system, make sure to decide which partition you want to install.
  * If you are planning for dual-boot with Windows or any other Linux Systems, then make sure you decide which partition to install.
  * Take a backup of your personal data.
  * Keep a LIVE USB with Boot Repair handy, in case something goes wrong.



### Download

Download the Ubuntu 21.04 Hirsute Hippo installer .iso file from the below link. Once downloaded, create a bootable USB via [Etcher][6] or any other medium.

  * [Download Ubuntu 21.04 – Torrent][7]
  * [Download Ubuntu 21.04 – 64 bit desktop .iso][8]



### Install Ubuntu 21.04 Hirsute Hippo

  * Plug-in the USB Stick


  * Enter into the BIOS by pressing F2 or your system hardware-specific keys.
  * For dual boot, make sure you disable secure boot via entering into the BIOS (this is applicable for new UEFI systems)


  * Set the boot device priority to the USB stick. Save and exit from BIOS and restart.
  * Wait for boot from USB.


  * You can either select to try Ubuntu at this stage, then you would be greeted with the LIVE System. Or click on Install Ubuntu to start installing.



![Install Ubuntu 21.04 – Select Mode][9]

  * Choose your Keyboard layout.



![Select Keyboard Layout][10]

Choose what type of installation you would like to do. Recommended options are Normal Installation and select Install Third-Party Software for Graphics and Wi-Fi.

![Other Software][11]

On the next Installation type window, choose Erase Disk if you want to format your disk completely and install Ubuntu.

[][12]

SEE ALSO:   10 Things to do After Installing Ubuntu 21.04 Hirsute Hippo

If you want to install in a specific partition, choose ‘Something Else’. On the next window, choose your partition and select mount point as “/”.

![Installation Type][13]

Create a partition table and then create two partitions. One for the /boot and another is for root (/). For the boot partition, keep around 500 MB of space. And for the root partition, you can specify as per your wish. Recommended root partition size is ~25 GB minimum.

![Install Partition][14]

A typical parition layout for Ubuntu installation is present below.

![Install Partition Final][15]

Click on the Install now which gives you a confirmation message what modification to be done on your physical disk. Press continue.

Once you press continue, physical modification starts on your device. So, if you want to change your mind on partition size and other things, click Go Back.

![Final Summary before install][16]

Give your name and name of your system along with the password.

![Add your name][17]

Wait for the installation to finish.

![Installation is in progress][18]

After successful install, you should see a prompt below mentioning that the installation is successful.

![Installation is complete][19]

Restart your system and enjoy the Ubuntu 21.04 desktop.

* * *

I hope this absolute beginner’s guide helped you to install the Ubuntu 21.04 Hirsute Hippo in a virtual machine, single system, or in a multi-boot environment.

As you now already installed it, don’t forget to set your system up by following our guide “[10 things to do after Installing Ubuntu 21.04][12]“. Also, you might want to check out our [feature coverage of Ubuntu 21.04][20] to find out about the new features in detail.

If you run into problem, don’t forget to let me know using the comment box below.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/06/install-ubuntu-21-04-hirsute-hippo/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: tmp.bOWqWysJ6P#min-sys-requirement
[2]: tmp.bOWqWysJ6P#pre-steps
[3]: tmp.bOWqWysJ6P#download
[4]: tmp.bOWqWysJ6P#install-ubuntu
[5]: https://www.debugpoint.com/2021/04/upgrade-ubuntu-21-04-from-ubuntu-20-10/
[6]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[7]: https://releases.ubuntu.com/21.04/ubuntu-21.04-desktop-amd64.iso.torrent
[8]: https://releases.ubuntu.com/21.04/ubuntu-21.04-desktop-amd64.iso
[9]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Install-Ubuntu-21.04-Select-Mode.jpg
[10]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Select-Keyboard-Layout.jpg
[11]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Other-Software.jpg
[12]: https://www.debugpoint.com/2021/04/10-things-to-do-after-installing-ubuntu-21-04/
[13]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Installation-Type.jpg
[14]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Install-Partition.jpg
[15]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Install-Partition-Final.jpg
[16]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Final-Summary-before-install.jpg
[17]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Add-your-name.jpg
[18]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Installation-is-in-progress.jpg
[19]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Installation-is-complete.jpg
[20]: https://www.debugpoint.com/2021/04/ubuntu-21-04-top-10-features/

[xieborui translating]How to Boot Linux ISO Images Directly From Your Hard Drive
================================================================================
Hi all, today we'll teach you an awesome interesting stuff related with the Operating System Disk Image and Booting. Now, try many OS you like without installing them in your Physical Hard Drive and without burning DVDs or USBs.

We can boot Linux ISO files directly from your hard drive with Linux’s GRUB2 boot loader.  We can boot any Linux Distribution's using this method without creating bootable USBs, Burn DVDs, etc but the changes made will be temporary.

![boot iso files directly from hard drive in grub2](http://blog.linoxide.com/wp-content/uploads/2015/01/boot-iso-files-directly-from-hard-drive-in-grub2.png)

### 1. Get the ISO of the Linux Distributions: ###

Here, we're gonna create Menu of Ubuntu 14.04 LTS "Trusty" and Linux Mint 17.1 LTS "Rebecca" so, we downloaded them from their official site:

Ubuntu from : [http://ubuntu.com/][1] And Linux Mint from: [http://linuxmint.com/][2]

You can download ISO files of required linux distributions from their respective websites. If you have mirror of the iso files hosted near your area or country, it is recommended if you have no sufficient internet download speed.

### 2. Determine the Hard Drive Partition’s Path ###

GRUB uses a different “device name” scheme than Linux does. On a Linux system, /dev/sda0 is the first partition on the first hard disk — **a** means the first hard disk and **0** means its first partition. In GRUB, (hd0,1) is equivalent to /dev/sda0. The **0** means the first hard disk, while **1** means the first partition on it. In other words, in a GRUB device name, the disk numbers start counting at 0 and the partition numbers start counting at 1. For example, (hd3,6) refers to the sixth partition on the fourth hard disk.

You can use the **fdisk -l** command to view this information. On Ubuntu, open a Terminal and run the following command:

    $ sudo fdisk -l

![fdisk-l view the list of the hard disk and its partitions](http://blog.linoxide.com/wp-content/uploads/2015/01/fdisk-l.png)

You’ll see a list of Linux device paths, which you can convert to GRUB device names on your own. For example, below we can see the system partition is /dev/sda1 — so that’s (hd0,1) for GRUB.

### 3. Adding boot menu to Grub2 ###

The easiest way to add a custom boot entry is to edit the /etc/grub.d/40_custom script. This file is designed for user-added custom boot entries. After editing the file, the contents of your /etc/defaults/grub file and the /etc/grub.d/ scripts will be combined to create a /boot/grub/grub.cfg file. You shouldn't edit this file by hand. It’s designed to be automatically generated from settings you specify in other files.

So we’ll need to open the /etc/grub.d/40_custom file for editing with root privileges. On Ubuntu, you can do this by opening a Terminal window and running the following command:

    $ sudo nano /etc/grub.d/40_custom

Unless we’ve added other custom boot entries, we should see a mostly empty file. We'll need to add one or more ISO-booting sections to the file below the commented lines.

    =====
    menuentry “Ubuntu 14.04 ISO” {
    set isofile=”/home/linoxide/Downloads/ubuntu-14.04.1-desktop-amd64.iso”
    loopback loop (hd0,1)$isofile
    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash
    initrd (loop)/casper/initrd.lz
    }
    menuentry "Linux Mint 17.1 Cinnamon ISO" {
    set isofile=”/home/linoxide/Downloads/mint-17.1-desktop-amd64.iso”
    loopback loop (hd0,1)$isofile
    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash
    initrd (loop)/casper/initrd.lz
    }

![Grub2 Menu configuration for adding the ISOs](http://blog.linoxide.com/wp-content/uploads/2015/01/grub-added-iso.png)

**Important Note**: Different Linux distributions require different boot entries with different boot options. The GRUB Live ISO Multiboot project offers a variety of [menu entries for different Linux distributions][3]. You should be able to adapt these example menu entries for the ISO file you want to boot. You can also just perform a web search for the name and release number of the Linux distribution you want to boot along with “boot from ISO in GRUB” to find more information.

### 4. Updating Grub2 ###

To make the custom menu entries active, we'll run "sudo update-grub"

    sudo update-grub

Hurray, we have successfully added our brand new linux distribution's ISO to our GRUB Menu. Now, we'll be able to boot them and enjoy trying them. You can add many distributions and try them all. Note that the changes made in those OS will don't be kept preserved, which means you'll loose changes made in that distros after the restart.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/boot-linux-iso-images-directly-hard-drive/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://ubuntu.com/
[2]:http://linuxmint.com/
[3]:http://git.marmotte.net/git/glim/tree/grub2

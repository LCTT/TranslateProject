How to Boot Linux ISO Images Directly From Your Hard Drive
================================================================================
![](data:image/png;base64,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)

Linux’s GRUB2 boot loader can boot Linux ISO files directly from your hard drive. Boot Linux live CDs or even install Linux on another hard drive partition without burning it to disc or booting from a USB drive.

We performed this process on Ubuntu 14.04 — Ubuntu and Ubuntu-based Linux distributions have good support for this. [Other Linux distributions][1] should work similarly.

### Get a Linux ISO File ###

This trick requires you have a Linux system installed on your hard drive. Your computer must be using [the GRUB2 boot loader][2], which is a standard boot loader on most Linux systems. Sorry, you can’t boot a Linux ISO file directly from a Windows system using the Windows boot loader.

Download the ISO files you want to use and store them on your Linux partition. GRUB2 should support most Linux systems. if you want to use them in a live environment without installing them to your hard drive, be sure to download the “[live CD][3]” versions of each Linux ISO. Many Linux-based bootable utility discs should also work.

### Check the Contents of the ISO File ###

You may need to look inside the ISO file to determine exactly where specific files are. For example, you can do this by opening the ISO file with the Archive Manager/File Roller graphical application that comes with Ubuntu and other GNOME-based desktop environments. In the Nautilus file manager, right-click the ISO file and select Open with Archive Manager.

Locate the kernel file and the initrd image. If you’re using a Ubuntu ISO file, you’ll find these files inside the casper folder — the vmlinuz file is the Linux kernel and the initrd file is the initrd image. You’ll need to know their location inside the ISO file later.

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x350xvmlinuz-and-initrd-file-locations.png.pagespeed.ic.hB1yMlHMr2.png)

### Determine the Hard Drive Partition’s Path ###

GRUB uses a different “device name” scheme than Linux does. On a Linux system, /dev/sda0 is the first partition on the first hard disk — **a** means the first hard disk and **0** means its first partition. In GRUB, (hd0,1) is equivalent to /dev/sda0. The **0** means the first hard disk, while the **1** means the first partition on it. In other words, in a GRUB device name, the disk numbers start counting at 0 and the partition num6ers start counting at 1 — yes, it’s unnecessarily confusing. For example, (hd3,6) refers to the sixth partition on the fourth hard disk.

You can use the **fdisk -l** command to view this information. On Ubuntu, open a Terminal and run the following command:

    sudo fdisk -l

You’ll see a list of Linux device paths, which you can convert to GRUB device names on your own. For example, below we can see the system partition is /dev/sda1 — so that’s (hd0,1) for GRUB.

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x410xfdisk-l-command.png.pagespeed.ic.yW7uP1_G0C.png)

### Create the GRUB2 Boot Entry ###

The easiest way to add a custom boot entry is to edit the /etc/grub.d/40_custom script. This file is designed for user-added custom boot entries. After editing the file, the contents of your /etc/defaults/grub file and the /etc/grub.d/ scripts will be combined to create a /boot/grub/grub.cfg file — you shouldn’t edit this file by hand. It’s designed to be automatically generated from settings you specify in other files.

You’ll need to open the /etc/grub.d/40_custom file for editing with root privileges. On Ubuntu, you can do this by opening a Terminal window and running the following command:

    sudo gedit /etc/grub.d/40_custom

Feel free to open the file in your favorite text editor. For example, you could replace “gedit” with “nano” in the command to open the file in [the Nano text editor][4].

Unless you’ve added other custom boot entries, you should see a mostly empty file. You’ll need to add one or more ISO-booting sections to the file below the [commented][5] lines.

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x300xadd-custom-boot-menu-entries-to-grub.png.pagespeed.ic.uUT-Yls8xf.png)

Here’s how you can boot an Ubuntu or Ubuntu-based distribution from an ISO file. We tested this with Ubuntu 14.04:

    menuentry “Ubuntu 14.04 ISO” {
    set isofile=”/home/name/Downloads/ubuntu-14.04.1-desktop-amd64.iso”
    loopback loop (hd0,1)$isofile
    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash
    initrd (loop)/casper/initrd.lz
    }

Customize the boot entry to contain your desiredmenu entry name, the correct path to the ISO file on your computer, and the device name of the hard disk and partition containing the ISO file. If the vmlinuz and initrd files have different names or paths, be sure to specify the correct path to those files, too.

(If you have a separate /home/ partition, omit the /home bit, like so: **set isofile=”/name/Downloads/${isoname}”**).

**Important Note**: Different Linux distributions require different boot entries with different boot options. The GRUB Live ISO Multiboot project offers a variety of [menu entries for different Linux distributions][6]. You should be able to adapt these example menu entries for the ISO file you want to boot. You can also just perform a web search for the name and release number of the Linux distribution you want to boot along with “boot from ISO in GRUB” to find more information.

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x392xadd-a-linux-iso-file-to-grub-boot-loader.png.pagespeed.ic.2FR0nOtugC.png)

If you want to add more ISO boot options, add additional sections to the file.

Save the file when you’re done. Return to a Terminal window and run the following command:

    sudo update-grub

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x249xgenerate-grub.cfg-on-ubuntu.png.pagespeed.ic.5I70sH4ZRs.png)

The next time you boot your computer, you’ll see the ISO boot entry and you can choose it to boot the ISO file. You may have to hold Shift while booting to see the GRUB menu.

If you see an error message or a black screen when you attempt to boot the ISO file, you misconfigured the boot entry somehow. Even if you got the ISO file path and device name right, the paths to the vmlinuz and intird files on the ISO file may not be correct or the Linux system you’re booting may require different options.

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/196933/how-to-boot-linux-iso-images-directly-from-your-hard-drive/

作者：[Chris Hoffman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.howtogeek.com/author/chrishoffman/
[1]:http://www.howtogeek.com/191207/10-of-the-most-popular-linux-distributions-compared/
[2]:http://www.howtogeek.com/196655/how-to-configure-the-grub2-boot-loaders-settings/
[3]:http://www.howtogeek.com/172810/take-a-secure-desktop-everywhere-everything-you-need-to-know-about-linux-live-cds-and-usb-drives/
[4]:http://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/
[5]:http://www.howtogeek.com/118389/how-to-comment-out-and-uncomment-lines-in-a-configuration-file/
[6]:http://git.marmotte.net/git/glim/tree/grub2
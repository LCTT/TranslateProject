翻译中 by dy2009
How to Replace GRUB with Syslinux on Arch Linux
================================================================================
**The following tutorial will teach existing Arch Linux users how to install replace the GRUB boot loader in their operating systems with Syslinux, which offers a simple, fast, and more modern boot loader.**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Replace-GRUB-with-Syslinux-on-Arch-Linux-415394-2.jpg)

Actually, Syslinux is not a single boot loader, as it’s comprised of multiple boot loaders that are capable of booting from local drives, over the network via PXE, as well as removable media. In addition, it supports both MBR and GPT disks, as well as RAID setups.

Before you jump to the actual installation process, you should know that Syslinux supports the following filesystems: FAT, EXT2, EXT3, EXT4, and Btrfs. You should also know that Syslinux can boot from both UEFI and BIOS machines, and it is not capable (at the moment) of accessing files from partitions other than its own.

Also, keep in mind that replacing GRUB with Syslinux is an optional thing, not something that you should really do because “something else will happen.” Only people who want to try something new, who are bored with the look of the GRUB boot loader should install Syslinux, otherwise keep running GRUB.

### Installing Syslinux on your Arch box ###

Knowing all of the above, we should proceed with the installation of Syslinux, replacing your old GRUB Legacy or GRUB2 boot loader. Open a terminal and execute the following command to install Syslinux

sudo pacman -S syslinux

After installation, you should notice a message that will instruct you how to deploy the Syslinux boot loader on a BIOS or a UEFI system. BIOS users are the luckiest ones, as they will only have to run the syslinux-install_update script created by Matthew Gyurgyik in order to successfully deploy Syslinux on their systems.

### Deploying Syslinux on your Arch box ###

Those of you who have a separate /boot partition should make sure that it is mounted before executing the script above. In the same terminal window, execute the following command:

sudo syslinux-install_update -i -a -m

The script will install the necessary files, mark the partition with the boot flag, and install the MBR boot code.

### Configuring Syslinux ###

This is a very important step and no one should ignore it, because your computer will no longer boot if Syslinux is not configured properly. You have been warned!

Syslinux can now be configured via the /boot/syslinux/syslinux.cfg file. Take a look at [the official Arch Linux page of Syslinux][1] for detailed configuration instructions. When done, reboot your system to see the new boot loader.

Do not hesitate to use our commenting system below in case you encounter any issues with the tutorial.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Replace-GRUB-with-Syslinux-on-Arch-Linux-415394.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://wiki.archlinux.org/index.php/syslinux#Configuration

translating----geekpi

What is Logical Volume Management and How Do You Enable It in Ubuntu?
================================================================================
> Logical Volume Management (LVM) is a disk management option that every major Linux distribution includes. Whether you need to set up storage pools or just need to dynamically create partitions, LVM is probably what you are looking for.

### What is LVM? ###

Logical Volume Manager allows for a layer of abstraction between your operating system and the disks/partitions it uses. In traditional disk management your operating system looks for what disks are available (/dev/sda, /dev/sdb, etc.) and then looks at what partitions are available on those disks (/dev/sda1, /dev/sda2, etc.).

With LVM, disks and partitions can be abstracted to contain multiple disks and partitions into one device. Your operating systems will never know the difference because LVM will only show the OS the volume groups (disks) and logical volumes (partitions) that you have set up.

Because volume groups and logical volumes aren’t physically tied to a hard drive, it makes it easy to dynamically resize and create new disks and partitions. ﻿In addition, LVM can give you features that your file system is not capable of doing. For example, Ext3 does not have support for live snapshots, but if you’re using LVM you have the ability to take a snapshot of your logical volumes without unmounting the disk.

### When Should You Use LVM? ###

The first thing your should consider before setting up LVM is what you want to accomplish with your disks and partitions. Some distributions, like Fedora, install with LVM by default.

If you are using Ubuntu on a laptop with only one internal hard drive and you don’t need extended features like live snapshots, then you may not need LVM. If you need easy expansion or want to combine multiple hard drives into a single pool of storage then LVM may be what you have been looking for.

### Setting up LVM in Ubuntu ###

First thing to know about using LVM is there is no easy way to convert your existing traditional partitions to logical volumes. It is possible to move to a new partition that uses LVM, but that won’t be something that we will cover in this article; instead we are going to take the approach of setting up LVM on a fresh installation of Ubuntu 10.10.

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/ubuntu-10-banner.png)

To install Ubuntu using LVM you need to use the alternate install CD. Download it from the link below and burn a CD or [use unetbootin to create a USB drive][1].

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/download-web.png)

Boot your computer from the alternate install disk and select your options up until the partition disks screen and select guided – use entire disk and set up LVM.

*Note: This will format your entire hard drive so if you are trying to dual boot or have another installation select manual instead.*

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/setup-1.png)

Select the main disk you want to use, typically your largest drive, and then go to the next step.

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/setup-2.png)

You will immediately need to write the changes to disk so make sure you selected the right disk and then write the changes.

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/setup-3.png)

Select the size you want the first logical volume to be and then continue.

![](http://cdn3.howtogeek.com/wp-content/uploads/2011/01/setup-4.png)

Confirm your disk partitions and continue with the installation.

![](http://cdn3.howtogeek.com/wp-content/uploads/2011/01/setup-5.png)

The final step will write the GRUB bootloader to the hard drive. It is important to note that GRUB cannot be on an LVM partition because computer BIOSes cannot directly read from a logical volume. Ubuntu will automatically create a 255 MB ext2 partition for your bootloader.

![](http://cdn3.howtogeek.com/wp-content/uploads/2011/01/setup-6.png)

After the installation is complete, reboot the machine and boot into Ubuntu as normal. There should be no perceivable difference between using LVM or traditional disk management with this type of installation.

![](http://cdn3.howtogeek.com/wp-content/uploads/2011/01/disk-manager.png)

To use LVM to its full potential, stay tuned for our upcoming article on managing your LVM installation.

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/howto/36568/what-is-logical-volume-management-and-how-do-you-enable-it-in-ubuntu/

作者：[How-To Geek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/+howtogeek?prsrc=5
[1]:http://www.howtogeek.com/howto/13379/create-a-bootable-ubuntu-9.10-usb-flash-drive/

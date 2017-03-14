ucasFL translating
How to Install Ubuntu with Separate Root and Home Hard Drives
============================================================


![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-feature-image.jpg "How to Install Ubuntu with Separate Root and Home Hard Drivess") 

When building a Linux installation, there are two options. The first option is to find a super-fast solid state drive. This will ensure very fast boot times and overall speed when accessing data. The second option is to go for a slower but beefier spinning disk hard drive – one with fast RPMs and a large amount of storage. This ensures a massive amount of storage for applications and data.


However, as some Linux users are aware, [solid state drives][10] are nice, but expensive, and spinning disk drives have a lot of storage but tend to be slow. What if I told you that it was possible to have both? A super-fast, modern solid state drive powering the core of your Linux and a large spinning disk drive for all the data.

In this article we’ll go over how to install Ubuntu Linux with separate root and home hard drives – with root folder in the SSD and home folder in the spinning disk hard drive.

### No extra hard drives? Try SD cards!

 ![ubuntu-sd-card](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-sd-card.jpg "ubuntu-sd-card") 

Setting up a multi-drive Linux installation is great and something advanced users should get behind. However, there is another reason for users to do a setup like this – low-storage-capacity laptops. Maybe you have a cheap laptop that didn’t cost much, and Linux was installed on it. It’s not much, but the laptop has an SD card slot.

This guide is for those types of computers as well. Follow this guide, and instead of a second hard drive, maybe go out and buy a fast and speedy SD card for the laptop, and use that as a home folder. This tutorial will work for that use case too!

### Making the USB disk

Start out by heading over to [this website][11] to download the latest version of Ubuntu Linux. Then [download][12] the Etcher USB imaging tool. This is a very easy-to-use tool and supports all major operating systems. You will also need a USB drive of at least 2 GB in size.

 ![ubuntu-browse-for-ubuntu-iso](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-browse-for-ubuntu-iso.jpg "ubuntu-browse-for-ubuntu-iso") 

Install Etcher, then launch it. Make an image by clicking the “Select Image” button. This will prompt the user to browse for the ISO image. Find the Ubuntu ISO file downloaded earlier and select it. From here, insert the USB drive. Etcher should automatically select it. Then, click the “Flash!” button. The Ubuntu live disk creation process will begin.

To boot into Ubuntu, configure the BIOS. This is needed so that the computer will boot the newly-created Ubuntu live USB. To get into the BIOS, reboot with the USB in, and press the correct key (Del, F2, or whatever the key is on your particular machine). Find where the option is to enable booting from USB and enable it.

If your PC does not support booting from USB, burn the Ubuntu image to a DVD.

### Installation

When Ubuntu first loads, the welcome screen appears with two options. Select the “Install Ubuntu” button to proceed. On the next page the Ubiquity installation tool asks the user to select some options. These options aren’t mandatory and can be ignored. However, it is recommended that both boxes be checked, as they save time after the installation, specifically with the installation of MP3 codecs and updating the system.

 ![ubuntu-preparing-to-install](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-preparing-to-install.jpg "ubuntu-preparing-to-install") 

After selecting both boxes in the “Preparing to install Ubuntu” page, it will be time to select the installation type. There are many. However, with this tutorial the option required is the custom one. To get to the custom installation page, select the “something else” box, then click continue.

This reveals Ubuntu’s custom installation partitioning tool. It will show any and all disks that can install Ubuntu. If two hard drives are available, they will appear. If an SD card is plugged in, it will appear.

Select the hard drive that you plan to use for the root file system. If there is already a partition table on it, the editor will show partitions. Delete all of them, using the tool. If the drive isn’t formatted and has no partitions, select the drive with the mouse, then click “new partition table.” Do this for all drives so that they both have partition tables.

 ![ubuntu-create-mount-point](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-create-mount-point.jpg "ubuntu-create-mount-point") 

Now that both drives have partition tables (and partitions deleted), the configuration can begin. Select the free space under drive one, then click the plus sign button to create a new partition. This will bring up the “Create partition window.” Allow the tool to use the entire hard drive, then go to the “Mount Point” drop-down menu. Select `/` as the mount point, then the OK button to confirm the settings.

Do the same with the second drive. This time select `/home` as the mount point. With both drives set up, select the correct drive the boot loader will go to, then click the “install now” button to start the installation process.

 ![ubuntu-multi-drive-layout](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-multi-drive-layout.jpg "ubuntu-multi-drive-layout") 

The installation process from here is the standard installation. Create a username, select the timezone, etc.

**Notes:** Are you installing in UEFI mode? A 512 MB, FAT32 partition will need to be created for boot. Do this before creating any other partitions. Be sure to select “/boot” as the mount point for this partition as well.

If you require Swap, create a partition on the first drive before making the partition used for `/`. This can be done by clicking the “+” (plus) button, entering the desired size, and selecting “swap area” in the drop-down.

### Conclusion

The best thing about Linux is how configurable it is. How many other operating systems let you split up the file system onto separate hard drives? Not many, that’s for sure! I hope that with this guide you’ll realize the true power Ubuntu can offer!

Would you use multiple drives in your Ubuntu installation? Let us know below in the comments.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/install-ubuntu-with-different-root-home-hard-drives/

作者：[Derrik Diener][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/author/derrikdiener/
[2]:https://www.maketecheasier.com/install-ubuntu-with-different-root-home-hard-drives/#respond
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-ubuntu-with-different-root-home-hard-drives%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-ubuntu-with-different-root-home-hard-drives%2F&text=How+to+Install+Ubuntu+with+Separate+Root+and+Home+Hard+Drives
[6]:mailto:?subject=How%20to%20Install%20Ubuntu%20with%20Separate%20Root%20and%20Home%20Hard%20Drives&body=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-ubuntu-with-different-root-home-hard-drives%2F
[7]:https://www.maketecheasier.com/byb-dimmable-eye-care-desk-lamp/
[8]:https://www.maketecheasier.com/download-appx-files-from-windows-store/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:http://www.maketecheasier.com/tag/ssd
[11]:http://ubuntu.com/download
[12]:https://etcher.io/

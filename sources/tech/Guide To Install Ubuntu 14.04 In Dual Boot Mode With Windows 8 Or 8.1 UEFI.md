Guide To Install Ubuntu 14.04 In Dual Boot Mode With Windows 8 Or 8.1 UEFI
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/05/Dual_Boot_Windows8_Ubuntu_1404.jpeg)

Previously I had written about [dual booting Ubuntu Linux with Windows 7][1] and 8 previously, But those tutorials did not cover systems that come with Windows 8 pre-installed. The newer systems that come with Windows 8 or Windows 8.1, have UEFI instead of BIOS. This makes thing a little different from the conventional way of dual booting. In this tutorial, we shall see **how to install Ubuntu Linux in dual boot mode with Windows 8 or Windows 8.1**.

This tutorial is performed on a newly bought Dell Inspiron 7437 that has Core i7 fourth generation processor, 256 GB SSD, 8 GB RAM and built in 1 GB Intel graphics. I’ll cover all the steps you need to do in order to successfully dual boot Linux with Windows 8 UEFI. If you have already done some of these steps, just skip to the next one. If you have a fresh system, even better.

The steps mentioned here are applicable to other Ubuntu based Linux distributions such as Linux Mint, Elementary OS etc. Cutting the chit-chat, let’s see how to dual boot Linux on a UEFI secure boot enabled Windows 8 system.

### Dual boot Ubuntu 14.04 with Windows 8: ###

There are various prerequisites to install Ubuntu on a UEFI system. Let’s see them one by one:

#### Step 1: Make a backup [optional] ####

It is always nice to make a back up, just in case if you mess up with the system. There are numerous articles on the web to show you how to backup your system. You can follow this tutorial [here][2].

#### Step 2: Create a live USB/disk of Ubuntu ####

The next thing you need to do is to create a live USB or disk. I recommend [Universal USB Installer][3] to create a live USB of Linux OS in Windows.

#### Step 3: Make a partition where Ubuntu will be installed ####

Assuming tat you have a fresh system, the first thing we need to do is to make partition to install Linux. The 256 GB in my system was already had several partitions from manufacturer but mainly for backup and other purposes. Main partition was C drive, of around 220 GB, where Windows 8.1 was installed.

If you have just one partition like this, you need to make some free space out of it for Linux. If you have several partitions of considerable size, use any of them except C drive because it may erase the data.

To make a partition in Windows 8, go to Disk Management tool. You can find disk management tool by searching for ‘disk’ in Control Panel.

![](http://itsfoss.com/wp-content/uploads/2014/05/disk_partition.jpeg)

In the Disk Management tool, right click on the drive which you want to partition and select shrink volume. In my case, I shrank the C drive to make some free space:

![](http://itsfoss.com/wp-content/uploads/2014/05/disk_partition_Windows8.jpeg)

You can leave the free space as it is. We shall use it while installing Ubuntu.

#### Step 4: Disable fast startup in Windows [optional] ####

Windows 8 introduced a new feature called “fast startup” for quick boot. While it is not mandatory, it would be better to have it disabled.

Go to **Control Panel > Hardware and Sound > Power Options > System Settings > Choose what the power buttons do** and uncheck the **Turn on fast startup box**.

#### Step 5: Disable secureboot in Windows 8 and 8.1 ####

This is the most important step. The new secure boot feature of Windows 8, originally intended for security feature for rootkit viruses, prevents dual booting of Windows with Linux. To dual boot Windows 8 with Linux, we must disable secure boot in UEFI.

#### Step 6: Installing Ubuntu alongside Windows 8 ####

Once you have disabled secure boot, it’s time to install Ubuntu. I hope you already created the live USB as mentioned in step 2. Plug in the USB and boot the system from it.

To boot from USB, will have to choose boot from USB option from within Windows itself. Either with PC Setting (like for UEFI) or pressing shift key while clicking on Restart.

Once you have booted in the live USB, you will be presented with option to try or install Ubuntu. Click on install. You will be presented with few screen options to choose the language. It will then do some checks on available space, power and internet connection etc. Just click on **Continue**.

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu.jpeg)

The main screen which you should pay attention to is **Installation Type**. Choose **Something else** here:

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_1.jpeg)

Remember we had created some free space beforehand? We shall use the free space to create Root, Swap and Home. Select the free space and click on the + sign.

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_2.jpeg)

It will provide you with option to create Linux partition. We are creating the Root partition. Any thing between 10-20 GB is more than sufficient for it. Choose the size, select Ext 4 as file type and / (means root) as the mount point.

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_3.png)

Clicking on OK in previous step will bring you to the partition screen. Next we will create swap. Like previously, click on the + sign again. This time use the file type as Swap area. Suggestible swap size is double of RAM.

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_4.png)

In similar fashion, create a Home partition. Allocate it maximum space (in fact allocate it rest of the free space) because this is where you’ll save music, pictures and downloaded files.

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_5.png)

Once you are ready with Root, Swap and Home, click on **Install Now**:

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_6.jpeg)

Well, you have almost won the battle. You can smell victory now. Next you will be asked to set username password etc. Basically, you just need to click next now.

Once the installation is completed, restart the computer, you should be welcomed by a purple grub screen. Enjoy Ubuntu along with Windows 8 in dual boot mode.

I hope this guide helped you to dual boot Ubuntu with Windows 8 UEFI. Though this article is written for Ubuntu, it should be heloful for other Linux OS as well. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/install-ubuntu-dual-boot-mode-windows/
[2]:http://www.makeuseof.com/tag/6-safest-ways-to-backup-restore-your-files-in-windows-7-8/
[3]:http://www.pendrivelinux.com/universal-usb-installer-easy-as-1-2-3/

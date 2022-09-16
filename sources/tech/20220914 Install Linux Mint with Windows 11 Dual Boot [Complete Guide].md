[#]: subject: "Install Linux Mint with Windows 11 Dual Boot [Complete Guide]"
[#]: via: "https://www.debugpoint.com/linux-mint-install-windows/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install Linux Mint with Windows 11 Dual Boot [Complete Guide]
======
A comprehensive guide to installing Linux Mint alongside Windows 11 (or Windows 10) and making a dual-boot system.

If you are a new Linux user trying to install Linux Mint without removing the OEM-installed Windows, follow this guide. After you complete the steps described below, you should have a dual boot system where you can learn and do your work in a Linux system without booting Windows.

### 1. What do you need before you start?

Boot into your Windows system and Download the Linux Mint ISO file from the official website. The ISO files are the installation image of Linux Mint, which we will use for this guide.

* In the official website (Figure 1), download the ISO for Cinnamon desktop edition (which is ideal for everyone).

* [Download link][1]

![Figure 1: Download Linux Mint from the official website][2]

* After downloading, plugin a USB stick into your system. Then write the above downloaded .ISO file to that USB drive using Rufus or [Etcher][3].

### 2. Prepare a partition to install Linux Mint

Ideally, Windows Laptops come with C and D drives in general. The C drive is where Windows is installed. For a new Laptop, the D drive is usually empty (of any subsequent drives such as E, etc.). Now, you have two options to choose from. Number 1 is to **shrink the C driv**e to make space for additional Linux installation. And Number 2 is to **use the additional drives/partitions** such as D or E.

Choose what you want to do.

* If you choose to use D or E drives for Linux installation, make sure to disable BitLocker before everything else which comes with the modern OEM-installed Windows laptop.  * Open Windows PowerShell from the start menu and type the following command (Figure 2) to disable the BitLocker. Change the drive letter according to your target driver (here, I have used drive E).

```
manage-bde -off E
```

![Figure 2: Disable BitLocker in Windows Drives to install Linux][4]

* Now, if you choose to Shrink the C drive (or any other drive), open the “Disk Management” from start menu. It would show your entire disk layout.   * Right-click and select “Shrink Volume” on the drive (Figure 3) you want to shrink to make way for Linux Mint.  * In the next window, give the size of your Partition in MB under “Enter the amount of space to shrink in MB” (Figure 4). Obviously, it should be less or equal to the value mentioned under “Size of available space”. So, for a 100 GB partition, give 100*1024=102400 MB.   * Once done, click on Shrink.

![Example of Shrink Volume option in Disk Partition][5]

![Figure 4: Enter the size of your Linux Partition][6]

* Now, you should see an “Unallocated Space”, as shown below (Figure 5). Right-click on it and choose “New Simple Volume“.   * This wizard will prepare and format the partition with a file system. Note: You can do it in Windows itself or during Linux Mint installation. The Linux Mint installer also provides you with the option to create a file system table and ready the partition. I would recommend you to do it here.  * In the next series of screens (Figure 6,7, and 8), give the size of your partition in MB, assign a drive letter (such as D, E, F), and file system as fat32.  * And finally, you should see your partition is ready for Linux Mint installation. You should choose this during Mint install in the following steps.   * As a precaution, note down the partition size (which you just created as an example in Figure 9) to quickly identify it in the installer.

![Figure 5: Unallocated space is created][7]

![Figure 6: New Simple Volume Wizard -page1][8]

![Figure 7: New Simple Volume Wizard -page2][9]

![Figure 8: New Simple Volume Wizard -page3][10]

![Figure 9: Final partition for installing Linux][11]

### 3. Disable Secure Boot in BIOS

* Plug in the USB drive and restart your system.  * When it starts booting,  press the applicable function Key repeatedly to enter into BIOS. The key may be different for your laptop models. Here’s a reference of major Laptop brands.  * And you should disable secure BIOS and make sure to set the boot device priority to the USB stick.  * Then press F10 to save and exit.

| Laptop OEM | Function key to enter BIOS | 
| :- | :- |
| Acer | F2 or DEL | 
| ASUS | F2 for all PCs, F2 or DEL for motherboards | 
| Dell | F2 or F12 | 
| HP | ESC or F10 | 
| Lenovo | F2 or Fn + F2 | 
| Lenovo (Desktops) | F1 | 
| Lenovo (ThinkPads) | Enter + F1. | 
| MSI | DEL for motherboards and PCs | 
| Microsoft Surface Tablets | Press and hold the volume up button. | 
| Origin PC | F2 | 
| Samsung | F2 | 
| Sony | F1, F2, or F3 | 
| Toshiba | F2 |

### 4. Install Linux Mint

If all goes well, you should see a menu to install Linux Mint. Choose the option “Start Linux Mint…..”.

![Figure 10: Linux Mint GRUB Menu to kick-off installation][12]

* After a moment, you should see the Linux Mint Live desktop. In the desktop, you should see an icon to install Linux Mint to launch the installation.
* In the next set of screens, choose your Language, Keyboard Layout, choose to install multimedia codecs and hit the continue button.
* On the Installation Type window, select the Something Else option.
* In the next window (Figure 11), carefully select the following:  * Under the device, select the partition you just created; You can identify it by the size I mentioned to note down earlier.  * Then click on Change, and on the edit partition window, select Ext4 as the file system, select the format the partition option and Mount point as /.  * Click OK. Then Choose the boot loader for your system; ideally, it should be the first entry in the drop-down list.  * Review the changes carefully. Because once you hit Install Now, your disk will be formatted, and there is no going back. Once you are comfortable, click on Install Now.

![Figure 11: Choose the target partition to install Linux Mint with Windows 11][13]

In the following screens, select your location, enter your name and create a user id and password for login to the system. The installation should start (Figure 12).

Once the installation is complete (Figure 13), remove the USB stick and restart your system.

![Figure 12: Installation is in progress][14]

![Figure 13: Installation is complete][15]

If all goes well, you should see the GRUB with Windows 11 and Linux Mint after the successful installation as a dual-boot system.

Now you can proceed to use [Linux Mint][16] and experience the fast and excellent Linux distro.

### Wrapping Up

In this tutorial, I have shown you how to create a simple dual boot system with Linux Mint in commercially available Laptops or desktops with OEM-installed Windows. The steps include partitioning, creating a bootable USB, formatting and installation.

Although the above instructions are for Linux Mint 21 Vanessa; however, it should work fine with all other awesome [Linux Distributions][17] today.

If you followed this guide, do let me know how your installation went in the comment box below.

And if you are successful, welcome to the freedom!

[Next: How to Install Java 17 in Ubuntu 22.04, 22.10, Linux Mint 21][18]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/linux-mint-install-windows/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.linuxmint.com/download.php
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/Download-Linux-Mint-from-the-official-website.jpg
[3]: https://www.debugpoint.com/etcher-bootable-usb-linux/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/09/Disable-BitLocker-in-Windows-Drives-to-install-Linux.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/09/Example-of-Shrink-Volume-option-in-Disk-Partition-1024x453.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/09/Enter-the-size-of-your-Linux-Partition.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/09/Unallocated-space-is-created.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/09/New-Simple-Volume-Wizard-page1.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/09/New-Simple-Volume-Wizard-page2.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/09/New-Simple-Volume-Wizard-page3.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/09/Final-partition-for-installing-Linux.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/09/Linux-Mint-GRUB-Menu-to-kick-off-installation.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/09/Choose-the-target-partition-to-install-Linux-Mint-with-Windows-11.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/09/Installation-is-in-progress.jpg
[15]: https://www.debugpoint.com/wp-content/uploads/2022/09/Installation-is-complete.jpg
[16]: https://www.debugpoint.com/linux-mint
[17]: https://www.debugpoint.com/category/distributions
[18]: https://www.debugpoint.com/install-java-17-ubuntu-mint/

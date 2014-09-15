alim0x translating

How To Uninstall Ubuntu Linux From Windows 8 Dual Boot
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Guide_Uninstall_Ubuntu_Windows_dual_Boot.jpeg)

I have covered [how to install Ubuntu in dual boot with Windows 8][1]注：此篇文章原文做过，原文文件名为：Guide To Install Ubuntu 14.04 In Dual Boot Mode With Windows 8 Or 8.1 UEFI.md，如果翻译发布了，可以修改此链接。 several times in the past. But what about **uninstalling Ubuntu from Windows dual boot**? Tutorial which we are going to follow here applies on any Linux OS be it Ubuntu, Linux Mint, Elementary OS or any other Linux distribution.

If you think [installing Ubuntu with Windows 8 in dual boot][2] was a tough task and it will be very easy to remove Ubuntu from Windows dual boot, you are not completely wrong. Uninstalling Linux from Windows dual boot is a piece of cake if you have a Windows installation disk.

This tutorial teaches you how to remove Linux completely from Windows 8 or Windows 8.1 dual boot with a **Windows 8/8.1 installation disk**.

### Uninstall Ubuntu safely from Windows 8 dual boot mode ###

It doesn’t matter if you have Windows 8 installation disk and Windows 8.1 installed on your system. It will work all the same. I cannot say the same of Windows 7 though. If you have your Windows disk with you, let’s start the process to remove Ubuntu Linux from Windows dual boot.

Deleting Linux from dual boot is done in two parts. First is to delete the partition(s) on which Linux was installed. Second part is to fix Windows boot loader as just deleting the Linux partition will result in [Grub rescue error][3].

#### Part 1: Deleting Linux partition in Windows ####

**Step 1:**

Log in to Windows. Press **Windows+R** and run diskmgmt.msc command in it. It will open the Windows disk management tool.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Disk_Mgmt.jpg)

**Step 2:**

Since you had installed Linux, it will be easy for you to recognize the Linux partition by its size. Another hint to recognize the Linux partition is to look at the partitions which doesn’t have a file system and drive number. Windows partition are labeled with a drive number such as C, D, E etc and are usually in NTFS or FAT file system.

As you can see, I have three Linux partitions here as I had created root, swap and home separately while installing Ubuntu.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_From_WIndows_Dual_Boot.jpg)

**Step 3:**

Select the Linux partition(s), right click on it and opt for **Delete Volume** option.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_From_WIndows_Dual_Boot_1.jpg)

It will throw you a warning, just select Yes here.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_From_WIndows_Dual_Boot_2.jpg)

**Step 4:**

The deleted partition(s) will be available as a chunk of free space. You can either extend the existing volume or create a new Windows partition out of it. I would suggest to create a new drive (or volume or partition, whatever you call it) as a new drive would be easier in case you decide to dual boot Linux with Windows again.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_From_WIndows_Dual_Boot_3.jpg)

#### Part 2: Fixing Windows boot loader ####

Once you have deleted the Linux partition, it’s time to fix the Windows boot loader. Pictures here are might not be that clear as it is easier to [take screenshot of login screen in Ubuntu][4] than in Windows. I took them with phone camera.

**Step 1:**

**Put the Windows 8 installation disk and restart** your computer. Press F10 or F12 at the boot time to go into BIOS/UEFI and choose to **boot from removable disk**.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_1.jpg)

**Step 2:**

Choose to repair your computer:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_3.jpg)

**Step 3:**

Go for Troubleshoot option here:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_2.jpg)

**Step 4:**

In troubleshoot page, choose for Advanced options:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_4.jpg)

**Step 5:**

Look for command prompt option in here:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_6.jpg)

**Step 6:**

In the command line, type the following command to fix the Windows boot loader:

    bootrec.exe /fixmbr

Normally, it works instantly. You don’t even have to wait for it.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_5.jpg)

**Step 7:**

Once it’s done, restart your computer and this time boot normally from hard disk. You should be able to boot in to Windows. In case you still see Grub rescue error, try the steps below.

**Step 8: If trick in step 6 did not work**

If the command in step 6 did not work, try the automatic repair option in advanced troubleshoot option.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_8.jpg)

It will take some time to find the issue and then repair it.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_7.jpg)

Now if you reboot, you should go in Windows normally and you should not see any Grub rescue error thingy.

I hope this guide helped you to **completely remove Ubuntu from Windows 8 dual boot**. Feel free to ask any questions or put up a suggestion.

--------------------------------------------------------------------------------

via: http://itsfoss.com/uninstall-ubuntu-linux-windows-dual-boot/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[2]:http://itsfoss.com/install-ubuntu-dual-boot-mode-windows/
[3]:http://itsfoss.com/solve-error-partition-grub-rescue-ubuntu-linux/
[4]:http://itsfoss.com/screenshot-login-screen-ubuntu-linux/

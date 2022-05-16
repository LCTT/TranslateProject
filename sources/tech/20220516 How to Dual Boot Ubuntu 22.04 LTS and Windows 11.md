[#]: subject: "How to Dual Boot Ubuntu 22.04 LTS and Windows 11"
[#]: via: "https://www.linuxtechi.com/dual-boot-ubuntu-22-04-and-windows-11/"
[#]: author: "James Kiarie https://www.linuxtechi.com/author/james/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Dual Boot Ubuntu 22.04 LTS and Windows 11
======
Hey guys, in this guide we will demonstrate how to configure a dual-boot setup of Ubuntu 22.04 LTS (Jammy Jellyfish) alongside Windows 11.

For this to work, you need to have Windows 11 already installed on your PC.  You will then need to create a separate partition on your hard drive on which Ubuntu 22.04 will be installed. We will go over all this, so don’t worry.

##### Prerequisites 

Before setting sail with the dual-boot setup, here is what you need.

* A bootable USB drive of Ubuntu 22.04 You can download Ubuntu 22.04 ISO image by heading over to the [Ubuntu 22.04 download page][1]. With the ISO image in place, grab a 16GB USB drive and use  Rufus application to make it bootable.

* A fast and stable internet connection

### Step 1) Create a Free Partition on Your Hard Drive 

As mentioned in the introduction, we first and foremost need to create a separate partition on the hard drive on which we are going to install Ubuntu 22.04.

So, open the disk management utility by pressing Windows Key + R

In the dialogue box, type diskmgmt.msc and hit ENTER.

![][2]

The disk management console displays the current disk partitions as you can see below. We are going to create a partition for installing Ubuntu by Shrinking ‘Volume E’. This might be different in your setup, but just follow along and you will get the drift.

![][3]

So, right-click on the volume that you want to shrink and select ‘Shrink’.

![][4]

A pop-up dialogue box will appear as shown below. Specify the amount of space to shrink in MB and click ‘Shrink’.

This is the space that is designated for the Ubuntu 22.04 installation.

![][5]

After shrinking the space, it will appear as ‘Unallocated’ or ‘Free Space’ as shown.

![][6]

With the free space in place, now plug the bootable USB medium into your PC and reboot your system. Also, be sure to access the BIOS setup and modify the boot priority to have the USB drive as the first priority. Save the BIOS changes and proceed to boot.

### Step 2) Begin the installation

On the first screen, you will get the GRUB menu displayed as shown. Select the first option ‘Try or Install Ubuntu’ and press ENTER.

![][7]

Ubuntu 22.04 will start loading as shown below. This takes a minute at most.

![][8]

Thereafter, the installation wizard will pop open providing you with two options: ‘Try Ubuntu’ and ‘Install Ubuntu’.  Since our mission is to install Ubuntu, select the latter.

![][9]

Next, select your preferred Keyboard layout and click ‘Continue’.

![][10]

In the ‘Updates and Other Software’ step, select ‘Normal Installation’ in order to install the GUI version of Ubuntu and check the rest of the options to allow download of updates and installation of third-party software for graphics, WiFi hardware and other utilities.

Then click ‘Continue’.

![][11]

The next step provides two options for installation. The first option -’Erase disk and install Ubuntu’ – completely wipes out your drive and installs Ubuntu’. But since this is a dual boot setup, this option will be disastrous to your existing Windows installation.

Therefore, select ‘Something else’ and click ‘Continue’.

![][12]

The partition table will be displayed with all the existing disk partitions. So far, we only have the NTFS partitions and the free space we shrunk earlier.

For Ubuntu 22.04, we will create the following partitions:

* /boot        –         1 GB
* /home        –        10 GB
* /            –        12 GB
* Swap         –         2 GB
* EFI          –       300 MB

To get started with the partitions, click on the [ + ] sign below the ‘Free Space’ partition.

![][13]

Fill in the /boot partition details as shown then click ‘OK’.

![][14]

Next up, specify the /home partition and click ‘OK’.

![][15]

Next, define the / ( root ) partition and click ‘OK’.

![][16]

To define swap space, set the size and select ‘Swap area’ for the ‘Use as:’ option.

![][17]

Finally, create an EFI system partition if you are using UEFI boot mode. We will assign 300 MB to the EFI partition.

![][18]

Below is a summary of the partitions in our partition table.

![][19]

To continue with the installation, click ‘Install Now’. On the pop-up shown below, click ‘Continue’ to save the changes to the disk.

![][20]

Next, the installation wizard will auto-detect your location. Simply click ‘Continue’.

![][21]

Next, create a login user by specifying the name, computer’s name and password. Then click ‘Continue’.

![][22]

At this point, the installation wizard will copy all the Ubuntu files and packages to the manually created hard drive partitions and install the required software packages.

This process takes quite a while, so be patient. In our case, it took roughly 30 minutes.

![][23]

Once the installation is completed, click on ‘Restart Now’ to reboot the system.

![][24]

At this point, remove your bootable USB drive and press ‘ENTER’

![][25]

When the system restarts, you will find all options for both Ubuntu and Windows 11.

Select ‘Ubuntu’ to boot into your new Ubuntu 22.04 installation. To boot into Windows 11, select the entry labeled ‘Windows Recovery Environment.

![][26]

And there you have it. We have demonstrated how to dual-boot Windows 11 with Ubuntu 22.04.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/dual-boot-ubuntu-22-04-and-windows-11/

作者：[James Kiarie][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lkxed
[1]: https://releases.ubuntu.com/22.04/
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/05/diskmgmt-msc-command-windows11.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Disk-Management-Console-Windows11.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Shrink-Volume-Windows11.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Shrink-Volume-Size-Windows11.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Free-Space-Disk-Management-Console-Windows11.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Install-Ubuntu-Linux.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Ubuntu-22-04-Loading-Screen.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Install-Ubuntu-Linux.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Keyboard-Layout-Ubuntu-22-04.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Normal-Installation-Option-During-Ubuntu-22-04-Installation.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Something-else-ubuntu-installation.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Free-Space-for-Ubuntu-22-04-Installation.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Boot-Partition-Ubuntu-22-04-LTS.png
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Home-Partition-For-Ubuntu-22-04.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Root-Partition-For-Ubuntu-22-04.png
[17]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Swap-Area-Ubuntu-22-04.png
[18]: https://www.linuxtechi.com/wp-content/uploads/2022/05/EFI-System-Partition-Ubuntu-22-04.png
[19]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Install-Now-Ubuntu-22-04.png
[20]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Write-Changes-Disk-Ubuntu-22-04.png
[21]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Location-for-Ubuntu-22-04-Installation.png
[22]: https://www.linuxtechi.com/wp-content/uploads/2022/05/UserName-Hostname-Ubuntu-22-04-lts-Installation.png
[23]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Installation-Progress-Ubuntu-22-04.png
[24]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Restart-After-Ubuntu-22-04-LTS-Installation.png
[25]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Remove-Installation-Media-after-Ubuntu-22-04-Installation.png
[26]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Dual-Boot-Grub-Bootloader-Screen-Ubuntu-22-04.png

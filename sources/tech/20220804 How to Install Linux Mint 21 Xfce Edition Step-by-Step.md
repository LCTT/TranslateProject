[#]: subject: "How to Install Linux Mint 21 Xfce Edition Step-by-Step"
[#]: via: "https://www.linuxtechi.com/how-to-install-linux-mint-21-xfce-edition/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Linux Mint 21 Xfce Edition Step-by-Step
======
Are you looking for an easy guide for Linux Mint 21 Installation?

The step-by-step guide on this page will show you how to install Linux Mint 21 Xfce Edition along with screenshots.

The much-awaited Linux Mint 21 operating system has been released, this is a LTS release (Long Term Support) and will get support and updates until 2027. Vanessa is the code name for Linux Mint 21, it is based on Ubuntu 22.04 and comes with three different desktop environments like Cinnamon, Mate and Xfce.

##### Linux Mint 21 Features & Updates

* New Linux Kernel 5.15
* Introduction of Blueman for connecting Bluetooth devices
* Improved Thumbnails
* Artwork Improvements
* Sticky notes support duplicate notes
* Timeshift is maintained as XApp.

##### System Requirements for Linux Mint 21

* 2 GB RAM or more
* 20 GB free hard disk space or more
* 64-bit Dual core processor or more
* Bootable Media (USB Stick)
* Internet Connectivity (Optional)

Without any further delay, let’s jump into Linux Mint 21 Xfce Edition installation steps.

### Step 1) Download Linux Mint 21 Xfce Edition ISO file

Use the following official web portal to download ISO file.

* [Download Linux Mint 21 Xfce Edition][1]

Once ISO file is downloaded, make a bootable USB stick using the ISO file. On Linux desktop use following to create bootable USB,

* [How to Create Bootable USB Drive on Ubuntu / Linux Mint][2]

On windows system, use Rufus software to make bootable USB using ISO file.

### Step 2) Boot System using Bootable USB Stick

Reboot the system on which you want to install Linux Mint 21, change the boot medium from hard disk to USB from it’s bios settings.

When the system boots up with bootable USB stick, we will get following beneath screen.

![Choose-Option-Start-LinuxMint21-Xfce][3]

Select the first option ‘Start Linux Mint 21 Xfce 64-bit’ and press enter then we will be presented the following screen,

![Double-click-on-Install-LinuxMint][4]

Double Click on ‘Install Linux Mint’

### Step 3) Choose Language for Installation

Choose your preferred language and click Continue

![Language-Selection-for-LinuxMint21-Installation][5]

### Step 4) Select Keyboard Layout

Select the keyboard layout as per your setup and then click on Continue

![Select-Keyboard-Layout-LinuxMint21-Installation][6]

### Step 5) Install Multimedia Codecs

This step is optional if you want to install multimedia codecs and system is connected to internet then click on the checkbox, else you can skip it.

![Install-Multimedia-codecs-LinuxMint21-Installation][7]

Click on Continue to proceed further

### Step 6) Choose Installation Type

On this step, you are required to choose the installation type, basically there are two types,

* Erase disk and Install Linux Mint: In this type, installer will erase all the data on disk and will create partitions automatically for you.
* Something else: Using this, we can create manual partitions as per our need.

![Something-Else-Installation-type-Linux-Mint21][8]

In this guide, we will go with something else option and will create following partitions on 40 GB hard disk.

* /boot      : 2 GB (xfs file system)
* /              : 10 GB (xfs file system)
* /home     : 25 GB (xfs file system)
* Swap       : 2 GB

Before start creating partitions, first create a partition table,

![New-Partition-Table-Linux-Mint21-Installation][9]

First click on ‘New Partition Table’ and then click Continue

Now start creating first partition as /boot, select the free space and then click on ‘+’ symbol.

![Boot-Partition-During-Linux-Mint21-Installation][10]

Click on OK to finish /boot partition creation.

In the same way, create next two partitions / and /home of 10G and 25G respectively.

![mSlash-Partition-During-LinuxMint21-Installation][11]

![Home-Partition-During-LinuxMint21-Installation][12]

Create Swap partition of size 2G

![Swap-Partition-LinuxMint21-Installation][13]

Click on Ok,

Note : When you are using UEFI mode then you must create following two additional partitions:

* EFI System Partition: 100 – 550 MB
* Reserved BIOS Boot Area: 1 MB (This is used to store bootloader code)

![EFI-System-Partition-Linux-Mint21-Installation][14]

![Reserved-Bios-Boot-Area-Linux-Mint21-Installation][15]

Click on OK.

Once you are done with manual partitions then click on ‘Install Now’

![Click-On-Install-Now-Option-Linux-Mint21-Installation][16]

Click Continue to write changes to disk and to proceed further with installation.

![Write-changes-to-Disk-Linux-Mint21-Installation][17]

### Step 7) Choose Your Preferred Timezone

As per geographical location of your system choose the location and click continue

![Geographical-Location-Linux-Mint21-Installation][18]

### Step 8) Enter Local User Details

In this step, you are requested to enter local user details along with hostname of your system. So, fill in the details as per requirements,

![Enter-Local-User-Details-LinuxMint21-Installation][19]

Click Continue to begin the actual installation.

### Step 8) Linux Mint 21 Installation Started

As we can see that Linux Mint 21 installation is started and is in progress,

![Linux-Mint21-Installation-Progress][20]

Once the installation is completed then installer will instruct you to reboot the system.

![Restart-Post-Linux-Mint21-Installation][21]

Click on “Restart Now”

Note : During the reboot don’t forget to change boot medium from USB to hard disk via bios settings.

### Step 9) Login Screen and Desktop Environment

When the system rebooted post installation then we will get following login screen. Use the same user credentials that you have created during the installation.

![Linux-Mint21-Login-Screen-Post-Installation][22]

After entering the credentials, following desktop environment screen will appear,

![Desktop-screen-Linux-Mint21][23]

Open the terminal and run neofetch command to verify the installation.

![Neofetch-Command-Verify-Linux-Mint21-Installation][24]

Great, above output confirms that we have successfully installed Linux Mint 21 Xfce Edition.

That’s all from this guide, kindly post your queries and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-install-linux-mint-21-xfce-edition/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://linuxmint.com/download.php
[2]: https://www.linuxtechi.com/create-bootable-usb-disk-dvd-ubuntu-linux-mint/
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Choose-Option-Start-LinuxMint21-Xfce.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Double-click-on-Install-LinuxMint.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Language-Selection-for-LinuxMint21-Installation.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Select-Keyboard-Layout-LinuxMint21-Installation.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Install-Multimedia-codecs-LinuxMint21-Installation.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Something-Else-Installation-type-Linux-Mint21.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/08/New-Partition-Table-Linux-Mint21-Installation.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Boot-Partition-During-Linux-Mint21-Installation.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Slash-Partition-During-LinuxMint21-Installation.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Home-Partition-During-LinuxMint21-Installation.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Swap-Partition-LinuxMint21-Installation.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/08/EFI-System-Partition-Linux-Mint21-Installation.png
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Reserved-Bios-Boot-Area-Linux-Mint21-Installation.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Click-On-Install-Now-Option-Linux-Mint21-Installation.png
[17]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Write-changes-to-Disk-Linux-Mint21-Installation.png
[18]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Geographical-Location-Linux-Mint21-Installation.png
[19]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Enter-Local-User-Details-LinuxMint21-Installation.png
[20]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Linux-Mint21-Installation-Progress.png
[21]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Restart-Post-Linux-Mint21-Installation.png
[22]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Linux-Mint21-Login-Screen-Post-Installation.png
[23]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Desktop-screen-Linux-Mint21.png
[24]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Neofetch-Command-Verify-Linux-Mint21-Installation.png

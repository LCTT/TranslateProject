[#]: subject: "How to Install Rocky Linux 9 Step by Step with Screenshots"
[#]: via: "https://www.linuxtechi.com/how-to-install-rocky-linux-9-step-by-step/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Rocky Linux 9 Step by Step with Screenshots
======
In this guide, we will cover how to install Rocky Linux 9 step by step with screenshots.

Rocky Enterprise Software Foundation has released its latest operating system ‘Rocky Linux 9’. Rocky Linux is free and open-source operating system for workstation and servers. It is considered as drop-in replacement for CentOS Linux.

‘Blue Onyx’ is the Code name for Rocky Linux 9, it is the clone of RHEL 9. The main difference between Rocky Linux and RHEL is that it has its own open-source build system called ‘Peridot’.

##### New Updates and Features of Rocky Linux 9

* Gnome 40 is the default Desktop Environment.
* Support for Direct Access (DAX) operations on XFS file system
* Updated runtime and compilers like GCC 11.2.1, LLVM (13.0.1), Rust (1.58.1), and Go (1.17.1).
* Updated development tool chain like Python 3.9, Node.js 16, Ruby 3.0.3, Perl 5.32 & PHP 8.0
* By Default, root user authentication disabled over ssh.
* Updated OpenSSL 3.0 and improved cockpit web console.
* Community support till May 31st, 2032.

##### Prerequisites

* 2 GB RAM or more
* 2 CPU Core (1.1 GHz Processor or higher)
* 20 GB hard disk space
* Boot Media (USD or DVD)
* Internet Connectivity (Optional)

Without any delay, let’s jump into Rocky Linux 9 installation steps,

### 1) Download Rocky Linux 9 ISO File

Use the following official URL to download ISO file,

* [Rocky Linux 9 ISO][1]

Once you have downloaded the iso file, make a bootable media (USB/DVD) using the downloaded iso.

In Windows, you can use ‘Rufus’ software to make bootable USB drive using ISO file. In Linux, refer the following

* [How to Create Bootable USB Drive on Ubuntu / Linux Mint][2]

### 2) Boot System with Bootable Media

Head to the system on which you are planning to install Rocky Linux 9, reboot it and change the boot medium from hard disk to USB from its bios settings.

Once the system boots up with bootable media then we will get the following screen,

![Select-Install-Rocky-Linux-9-option][3]

Choose the first option, ‘Install Rocky Linux 9.0’ and hit enter.

### 3) Choose Preferred Language

Select your preferred language for the installation and then click on Continue,

![Preferred-Language-for-RockyLinux9-Installation][4]

### 4) Installation Summary

In this step, we will get the following initial installation summary. To begin the installation, first we must complete marked items like ‘Installation Destination’ and ‘User settings’.

Apart from the marked items, we can also change the existing items, just click on them and change it as per your requirement.

![Initial-Installation-Summary-Rocky-Linux9][5]

##### Configure Installation Destination

In this item, we will specify the partition scheme for Rocky Linux. Click on ‘Installation Destination’.

Here we can choose either automatic or custom option for storage configuration or partition scheme.

In automatic option, partitions will be created automatically by installer on the disk whereas custom option allows us to create manual partitions on disk.

![Choose-custom-Storage-Configuration-Rocky-Linux9][6]

In this guide, I am going with ‘Custom’ option, Click on ‘Done’

![Standard-Partition-Scheme-RockyLinux9][7]

On the 40 GB disk, we will create following partitions,

* /boot          :  2GB   (xfs file system)
* /                 : 10 GB  (xfs file system)
* /home         : 25 GB (xfs file system)
* Swap           : 2 GB

To start creating partitions, choose ‘Standard Partition’ scheme and then click on + symbol.

Create first partition as /boot of size 2 GB,

![Boot-Partition-RockyLinux9-Installation][8]

Click on ‘Add mount point’

Similarly create next two partitions / and /home of size 10 GB and 25 GB respectively.

![Slash-Partition-Rocky-Linux9-installation][9]

![Home-Partition-Rocky-Linux9-Installation][10]

Now create last partition as swap of size 2GB,

![Swap-Partition-RockyLinux9-Installation][11]

Once you are done with manual partitioning, click on Done to finish this item.

![Finish-Manual-Partitioning-RockyLinux9-Installation][12]

Choose ‘Accept Changes‘ to write changes to the disk. It will also take back to installation summary screen.

![Accept-Changes-to-Write-on-Disk-RockyLinux9][13]

##### Configure User Settings

Under User Settings, Click on ‘Root Password’.

![Set-Root-Password-RockyLinux9-Instalation][14]

Set the root password and then click on Done,

From ‘User Settings’ again , click on ‘User Creation’, Specify the local user details like username and password.

![Local-User-Create-During-RockyLinux9-Installation][15]

Click on ‘Done’, it will take back to installation summary.

Now, we are ready to initiate the installation, click on ‘Begin Installation’.

![Begin-Installation-Option-RockyLinux9][16]

### 5) Installation Started

In this step, installation got started and is in progress,

![RockyLinux9-Installation-Progress][17]

Once the installation is completed, installer will instruct to reboot the system.

![Reboot-System-after-RockyLinux9-Installation][18]

Click on ‘Reboot System’.

Note: Don’t forget to change the boot medium from USB to hard disk from bios settings.

### 6) Login Screen and Desktop Environment Post Installation

When the system boots up after the successful installation, we will get following login screen,

![RockyLinux9-Loginscreen-Post-Installation][19]

Use the same user’s credentials that we have created during the installation, press enter to login.

![Desktop-Env-RockyLinux9][20]

Open the terminal, run following commands one after the another,

```
$ sudo dnf install epel-release -y
$ sudo dnf install neofetch -y
```

Now, to verify the system details, run neofetch command,

```
$ neofetch
```

![neofetch-rockylinux9-post-installation][21]

That’s all from this guide, I hope you found it useful. Kindly do post your queries and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-install-rocky-linux-9-step-by-step/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://rockylinux.org/download
[2]: https://www.linuxtechi.com/create-bootable-usb-disk-dvd-ubuntu-linux-mint/
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Select-Install-Rocky-Linux-9-option.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Preferred-Language-for-RockyLinux9-Installation.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Initial-Installation-Summary-Rocky-Linux9.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Choose-custom-Storage-Configuration-Rocky-Linux9.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Standard-Partition-Scheme-RockyLinux9.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Boot-Partition-RockyLinux9-Installation.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Slash-Partition-Rocky-Linux9-installation.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Home-Partition-Rocky-Linux9-Installation.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Swap-Partition-RockyLinux9-Installation.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Finish-Manual-Partitioning-RockyLinux9-Installation.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Accept-Changes-to-Write-on-Disk-RockyLinux9.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Set-Root-Password-RockyLinux9-Instalation.png
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Local-User-Create-During-RockyLinux9-Installation.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Begin-Installation-Option-RockyLinux9.png
[17]: https://www.linuxtechi.com/wp-content/uploads/2022/07/RockyLinux9-Installation-Progress.png
[18]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Reboot-System-after-RockyLinux9-Installation.png
[19]: https://www.linuxtechi.com/wp-content/uploads/2022/07/RockyLinux9-Loginscreen-Post-Installation.png
[20]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Desktop-Env-RockyLinux9.png
[21]: https://www.linuxtechi.com/wp-content/uploads/2022/07/neofetch-rockylinux9-post-installation.png

[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (CentOS 8 Installation Guide with Screenshots)
[#]: via: (https://www.linuxtechi.com/centos-8-installation-guide-screenshots/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

CentOS 8 Installation Guide with Screenshots
======

After **RHEL 8** release, **CentOS** community has released its most awaited Linux distribution as **CentOS 8**. It is released into two forms:

  * **CentOS stream** – It is designed for the developers where they will get the updates quite frequently.
  * **CentOS** – It is RHEL 8 like stable OS where sysadmin can install and configure the servers and applications.



In this article, we will demonstrate how to install CentOS 8 Server step by step with screenshots.

###  New features in CentOS 8 :**

**

  * DNF is the default package manager though yum can also be used.
  * Network configuration will be controlled by Network Manager (nmcli &amp; nmtui) as network scripts are removed.
  * Podman utility to manage containers
  * Introduction of two new packages repositories: BaseOS and AppStream
  * Cockpit available as default server management tool
  * Wayland is the default display server
  * Iptables are replaced by nftables
  * Linux Kernel 4.18
  * PHP 7.2, Python 3.6, Ansible 2.8, VIM 8.0 and Squid 4



### Minimum System Requirements CentOS 8:

  * 2 GB RAM
  * 2 GHz or Higher Processor
  * 20 GB Hard Disk
  * 64-bit x86 System



### CentOS 8 Installation Steps with Screenshots

### Step:1) Download CentOS 8 ISO File

Download CentOS 8 ISO file from its official site,

<https://www.centos.org/download/>

### Step:2) Create CentOS 8 bootable media (USB / DVD)

Once you have downloaded CentOS 8 iso file, burn it either into USB stick or in DVD to make it bootable.

Reboot the system on which you want to install CentOS 8, change the boot medium either as USB or DVD from bios settings.

### Step:3) Choose “Install CentOS  Linux 8.0” option

When the system boots up with CentOS 8 bootable media, then we will get the following screen, choose “**Install CentOS Linux 8.0**” and hit enter,

[![Choose-Install-CentOS8][1]][2]

### Step:4) Select your preferred language

Choose the language that suits to your CentOS 8 installation and then click on Continue,

[![Select-Language-CentOS8-Installation][1]][3]

### Step:5) Preparing CentOS 8 Installation

In this step we will configure the followings:

  * Keyboard Layout
  * Date / Time
  * Installation Source
  * Software Selection
  * Installation Destination
  * Kdump



[![Installation-Summary-CentOS8][1]][4]

As we can see in above window, installer has automatically pick ‘**Keyboard**’ layout, ‘**Time &amp; Date**’, ‘**Installation Source**’ and ‘**Software Selection’.**

If you want to change any of these settings, then click on their respective icon, let’s assume we want to change Time &amp; Date of system, so click on ‘**Time &amp; Date**’ and choose the time zone that suits to your installation and then click on **Done**

[![TimeZone-CentOS8-Installation][1]][5]

Choose your preferred option from “**Software Selection**“, in case you want to install server with GUI then choose “**Server with GUI**” option and if you want to do minimal installation then choose “**Minimal Install**“.

[![Software-Selection-CentOS8-Installation][1]][6]

In this tutorial we will go with “**Server with GUI**” option, click on Done

**Kdump** is enabled by default, if wish to disable it then click on its icon and disable it but it is strongly recommended one should enable kdump.

If you wish to configure networking during the installation, then click on “**Network &amp; Host Name**”

[![Networking-During-CentOS8-Installation][1]][7]

In case your system is connected to modem where DHCP is running then it will automatically pick the ip whenever we enable the interface and if  you wish to configure the static ip then click on ‘**Configure**‘ and specify IP details there and apart from this we have also set host name as “**linuxtechi.com**“.

Once you are done with network changes, click on Done,

Now finally configure ‘**Installation Destination**‘, in this step we will specify on which disk we will install CentOS 8 and what would be its partition scheme.

[![Installation-Destination-Custom-CentOS8][1]][8]

Click on Done

As we can see I have 40 GB disk space for CentOS 8 installation, here we have two options to create partition scheme, if you want installer to create automatic partition on 40 GB disk space then choose “**Automatic**” from **Storage Configuration** and if you want to create partitions manually then choose “**Custom**” option.

In this tutorial I will create custom partitions by choosing “Custom” option. I will create following LVM based partitions,

  * /boot         – 2 GB (ext4 file system)
  * /                 – 12 GB (xfs file system)
  * /home       – 20 GB (xfs file system)
  * /tmp          – 5 GB (xfs file system)
  * Swap          – 1 GB (xfs file system)



First create /boot as standard partition of size 2 GB, steps are shown below,

[![boot-partition-CentOS8-Installation][1]][9]

Click on “**Add mount point**”

Create second partition as / of size 12 GB on LVM, click on ‘+’ symbol and specify mount point and size and then click on “Add mount point”

[![slash-root-partition-centos8-installation][1]][10]

In next screen change Partition Type from standard to LVM for / partition and click on update settings

[![Change-Partition-Type-CentOS8][1]][11]

As we can see above, installer has automatically created a volume group, if want to change the name of that volume group then click on “**Modify**” option from “**Volume Group**” Tab

Similarly create next partitions as /home and /tmp of size 20 GB and 5 GB respectively and also change their partition type from standard to **LVM**,

[![home-partition-CentOS8-Installation][1]][12]

[![tmp-partition-centos8-installation][1]][13]

Finally create swap partition,

[![Swap-Partition-CentOS8-Installation][1]][14]

Click on “Add mount point”

Once you are done with all partition creations then click on Done,

[![Choose-Done-after-manual-partition-centos8][1]][15]

In the next window, click on “**Accept changes**“, it will write the changes to disk,

[![Accept-changes-CentOS8-Installation][1]][16]

### Step:6) Choose “Begin Installation”

Once we Accept the changes in above window then we will move back to installation summary screen, there click on “**Begin Installation**” to start the installation

[![Begin-Installation-CentOS8][1]][17]

Below screen confirms that installation has been started,

[![Installation-progress-centos8][1]][18]

To set root password, click on “**Root Password**” option and then specify the password string and Click on “**User creation**” option to create a local user

[![Root-Password-CentOS8-Installation][1]][19]

Local User details,

[![Local-User-Details-CentOS8][1]][20]

Installation is progress and once it is completed, installer will prompt us to reboot the system

[![CentOS8-Installation-Progress][1]][21]

### Step:7) Installation Completed and reboot system

Once the installation is completed, reboot your system, Click on Reboot

[![Installation-Completed-CentOS8][1]][22]

**Note:** After the reboot, don’t forget to remove the installation media and set the boot medium as disk from bios.

### Step:8) Boot newly installed CentOS 8 and Accept License

From the grub menu, select the first option to boot CentOS 8,

[![Grub-Boot-CentOS8][1]][23]

Accept CentOS 8 License and then click on Done,

[![Accept-License-CentOS8-Installation][1]][24]

In the next screen, click on “**Finish Configuration**”

[![Finish-Configuration-CentOS8-Installation][1]][25]

### Step:9) Login Screen after finishing the configuration

We will get the following login screen after accepting CentOS 8 license and finishing the configuration

[![Login-screen-CentOS8][1]][26]

Use the same credentials of the user that you created during the installation. Follow the screen instructions and then finally we will get the following screen,

[![CentOS8-Ready-Use-Screen][1]][27]

Click on “**Start Using CentOS Linux**”

[![Desktop-Screen-CentOS8][1]][28]

That’s all from this tutorial, this confirms we have successfully installed CentOS 8. Please do share your valuable feedback and comments.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/centos-8-installation-guide-screenshots/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Install-CentOS8.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Select-Language-CentOS8-Installation.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Installation-Summary-CentOS8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/TimeZone-CentOS8-Installation.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Software-Selection-CentOS8-Installation.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Networking-During-CentOS8-Installation.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Installation-Destination-Custom-CentOS8.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/09/boot-partition-CentOS8-Installation.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/09/slash-root-partition-centos8-installation.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Change-Partition-Type-CentOS8.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/09/home-partition-CentOS8-Installation.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/09/tmp-partition-centos8-installation.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Swap-Partition-CentOS8-Installation.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Done-after-manual-partition-centos8.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Accept-changes-CentOS8-Installation.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Begin-Installation-CentOS8.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Installation-progress-centos8.jpg
[19]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Root-Password-CentOS8-Installation.jpg
[20]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Local-User-Details-CentOS8.jpg
[21]: https://www.linuxtechi.com/wp-content/uploads/2019/09/CentOS8-Installation-Progress.jpg
[22]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Installation-Completed-CentOS8.jpg
[23]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Grub-Boot-CentOS8.jpg
[24]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Accept-License-CentOS8-Installation.jpg
[25]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Finish-Configuration-CentOS8-Installation.jpg
[26]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Login-screen-CentOS8.jpg
[27]: https://www.linuxtechi.com/wp-content/uploads/2019/09/CentOS8-Ready-Use-Screen.jpg
[28]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Desktop-Screen-CentOS8.jpg

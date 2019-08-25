[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Red Hat Enterprise Linux (RHEL) 8 Installation Steps with Screenshots)
[#]: via: (https://www.linuxtechi.com/rhel-8-installation-steps-screenshots/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

Red Hat Enterprise Linux (RHEL) 8 Installation Steps with Screenshots
======

Red Hat has released its most awaited OS **RHEL 8** on 7th May 2019. RHEL 8 is based on **Fedora 28** distribution and Linux **kernel version 4.18**. One of the important key features in RHEL 8 is that it has introduced “ **Application Streams** ” which allows developers tools, frameworks and languages to be updated frequently without impacting the core resources of base OS. In other words, application streams will help to segregate the users space packages from OS Kernel Space.

Apart from this, there are many new features which are noticed in RHEL 8 like:

  * XFS File system supports copy-on-write of file extents
  * Introduction of Stratis filesystem, Buildah, Podman, and Skopeo
  * Yum utility is based on DNF
  * Chrony replace NTP.
  * Cockpit is the default Web Console tool for Server management.
  * OpenSSL 1.1.1 & TLS 1.3 support
  * PHP 7.2
  * iptables replaced by nftables



### Minimum System Requirements for RHEL 8:

  * 4 GB RAM
  * 20 GB unallocated disk space
  * 64-bit x86 or ARM System



**Note:** RHEL 8 supports the following architectures:

  * AMD or Intel x86 64-bit
  * 64-bit ARM
  * IBM Power Systems, Little Endian & IBM Z



In this article we will demonstrate how to install RHEL 8 step by step with screenshots.

### RHEL 8 Installation Steps with Screenshots

### Step:1) Download RHEL 8.0 ISO file

Download RHEL 8 iso file from its official web site,

<https://access.redhat.com/downloads/>

I am assuming you have the active subscription if not then register yourself for evaluation and then download ISO file

### Step:2) Create Installation bootable media (USB or DVD)

Once you have downloaded RHEL 8 ISO file, make it bootable by burning it either into a USB drive or DVD. Reboot the target system where you want to install RHEL 8 and then go to its bios settings and set the boot medium as USB or DVD,

### Step:3) Choose “Install Red Hat Enterprise Linux 8.0” option

When the system boots up with installation media (USB or DVD), we will get the following screen, choose “ **Install Red Hat Enterprise Linux 8.0** ” and hit enter,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Choose-Install-RHEL8.jpg>

### Step:4) Choose your preferred language for RHEL 8 installation

In this step, you need to choose a language that you want to use for RHEL 8 installation, so make a selection that suits to your setup.

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Language-RHEL8-Installation.jpg>

Click on Continue

### Step:5) Preparing RHEL 8 Installation

In this step we will decide the installation destination for RHEL 8, apart from this we can configure the followings:

  * Time Zone
  * Kdump (enabled/disabled)
  * Software Selection (Packages)
  * Networking and Hostname
  * Security Policies & System purpose



<https://www.linuxtechi.com/wp-content/uploads/2019/05/Installation-summary-rhel8.jpg>

By default, installer will automatically pick time zone and will enable the **kdump** , if wish to change the time zone then click on “ **Time & Date**” option and set your preferred time zone and then click on Done.

<https://www.linuxtechi.com/wp-content/uploads/2019/05/timezone-rhel8-installation.jpg>

To configure IP address and Hostname click on “ **Network & Hostname**” option from installation summary screen,

If your system is connected to any switch or modem, then it will try to get IP from DHCP server otherwise we can configure IP manually.

Mention the hostname that you want to set and then click on “ **Apply”**. Once you are done with IP address and hostname configuration click on “Done”

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Network-Hostname-RHEL8-Installation.jpg>

To define the installation disk and partition scheme for RHEL 8, click on “ **Installation Destination** ” option,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Choose-Installation-Disk-RHEL8-Installation.jpg>

Click on Done

As we can see I have around 60 GB free disk space on sda drive, I will be creating following customize lvm based partitions on this disk,

  * /boot = 2GB (xfs file system)
  * / = 20 GB (xfs file system)
  * /var = 10 GB (xfs file system)
  * /home = 15 GB (xfs file system)
  * /tmp = 5 GB (xfs file system)
  * Swap = 2 GB (xfs file system)



**Note:** If you don’t want to create manual partitions then select “ **Automatic** ” option from Storage Configuration Tab

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Create-New-Partition-RHEL8-Installation.jpg>

Let’s create our first partition as /boot of size 2 GB, Select LVM as mount point partitioning scheme and then click on + “plus” symbol,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/boot-partition-rhel8-installation.jpg>

Click on “ **Add mount point** ”

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Boot-partition-details-rhel8-installation.jpg>

To create next partition as / of size 20 GB, click on + symbol and specify the details as shown below,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/slash-partition-rhel8-installation.jpg>

Click on “Add mount point”

<https://www.linuxtechi.com/wp-content/uploads/2019/05/slash-root-partition-details-rhel8-installation.jpg>

As we can see installer has created the Volume group as “ **rhel_rhel8** “, if you want to change this name then click on Modify option and specify the desired name and then click on Save

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Change-VolumeGroup-RHEL8-Installation.jpg>

Now onward all partitions will be part of Volume Group “ **VolGrp** ”

Similarly create next three partitions **/home** , **/var** and **/tmp** of size 15GB, 10 GB and 5 GB respectively

**/home partition:**

<https://www.linuxtechi.com/wp-content/uploads/2019/05/home-partition-rhel8-installation.jpg>

**/var partition:**

<https://www.linuxtechi.com/wp-content/uploads/2019/05/var-partition-rhel8-installation.jpg>

**/tmp partition:**

<https://www.linuxtechi.com/wp-content/uploads/2019/05/tmp-partition-rhel8-installation.jpg>

Now finally create last partition as swap of size of 2 GB,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Swap-Partition-RHEL8-Installation.jpg>

Click on “Add mount point”

Once you are done with partition creations, click on Done on Next screen, example is shown below

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Choose-Done-after-partition-creation-rhel8-installation.jpg>

In the next window, choose “ **Accept Changes** ”

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Accept-Changes-RHEL8-Installation.jpg>

### Step:6) Select Software Packages and Choose Security Policy and System purpose

After accepting the changes in above step, we will be redirected to installation summary window.

By default, installer will select “ **Server with GUI”** as software packages and if you want to change it then click on “ **Software Selection** ” option and choose your preferred “ **Basic Environment** ”

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Software-Selection-RHEL8-Installation.jpg>

Click on Done

If you want to set the security policies during the installation, the choose the required profile from Security polices option else you can leave as it is.

From “ **System Purpose** ” option specify the Role, Red Hat Service Level Agreement and Usage. Though You can leave this option as it is.

<https://www.linuxtechi.com/wp-content/uploads/2019/05/System-role-agreement-usage-rhel8-installation.jpg>

Click on Done to proceed further.

### Step:7) Choose “Begin Installation” option to start installation

From the Installation summary window click on “Begin Installation” option to start the installation,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Begin-Installation-RHEL8-Installation.jpg>

As we can see below RHEL 8 Installation is started & is in progress

<https://www.linuxtechi.com/wp-content/uploads/2019/05/RHEL8-Installation-Progress.jpg>

Set the root password,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Root-Password-RHEL8.jpg>

Specify the local user details like its Full Name, user name and its password,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/LocalUser-Details-RHEL8-Installation.jpg>

Once the installation is completed, installer will prompt us to reboot the system,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/RHEL8-Installation-Completed-Message.jpg>

Click on “Reboot” to restart your system and don’t forget to change boot medium from bios settings so that system boots up with hard disk.

### Step:8) Initial Setup after installation

When the system is rebooted first time after the successful installation then we will get below window there we need to accept the license (EULA),

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Accept-EULA-RHEL8-Installation.jpg>

Click on Done,

In the next Screen click on “ **Finish Configuration** ”

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Finish-Configuration-RHEL8-Installation.jpg>

### Step:8) Login Screen of RHEL 8 Server after Installation

As we have installed RHEL 8 Server with GUI, so we will get below login screen, use the same user name and password that we created during the installation

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Login-Screen-RHEL8.jpg>

After the login we will get couple of Welcome Screen and follow the screen instructions and then finally we will get the following screen,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Ready-to-Use-RHEL8.jpg>

Click on “Start Using Red Hat Enterprise Linux”

<https://www.linuxtechi.com/wp-content/uploads/2019/05/GNOME-Desktop-RHEL8-Server.jpg>

This confirms that we have successfully installed RHEL 8, that’s all from this article. We will be writing articles on RHEL 8 in the coming future till then please do share your feedback and comments on this article.

Read Also :** [How to Setup Local Yum/DNF Repository on RHEL 8 Server Using DVD or ISO File][1]**

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/rhel-8-installation-steps-screenshots/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/setup-local-yum-dnf-repository-rhel-8/

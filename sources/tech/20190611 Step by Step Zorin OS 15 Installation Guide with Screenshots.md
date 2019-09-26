[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Step by Step Zorin OS 15 Installation Guide with Screenshots)
[#]: via: (https://www.linuxtechi.com/zorin-os-15-installation-guide-screenshots/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

Step by Step Zorin OS 15 Installation Guide with Screenshots
======

Good News for all the Zorin users out there! Zorin has launched its latest version (Zorin OS 15) of its Ubuntu based Linux distro. This version is based on Ubuntu 18.04.2, since its launch in July 2009, it is estimated that this popular distribution has reached more than 17 million downloads. Zorin is renowned for creating a distribution for beginner level users and the all new Zorin OS 15 comes packed with a lot of goodies that surely will make Zorin OS lovers happy. Let’s see some of the major enhancements made in the latest version.

### New Features of Zorin OS 15

Zorin OS has always amazed users with different set of features when every version is released Zorin OS 15 is no exception as it comes with a lot of new features as outlined below:

**Enhanced User Experience**

The moment you look at the Zorin OS 15, you will ask whether it is a Linux distro because it looks more like a Windows OS. According to Zorin, it wanted Windows users to get ported to Linux in a more user-friendly manner. And it features a Windows like Start menu, quick app launchers, a traditional task bar section, system tray etc.

**Zorin Connect**

Another major highlight of Zorin OS 15 is the ability to integrate your Android Smartphones seamlessly with your desktop using the Zorin Connect application. With your phone connected, you can share music, videos and other files between your phone and desktop. You can even use your phone as a mouse to control the desktop. You can also easily control the media playback in your desktop from your phone itself. Quickly reply to all your messages and notifications sent to your phone from your desktop.

**New GTK Theme**

Zorin OS 15 ships with an all new GTK Theme that has been exclusively built for this distro and the theme is available in 6 different colors along with the hugely popular dark theme. Another highlight is that the OS automatically detects the time of the day and changes the desktop theme accordingly. Say for example, during sunset it switches to a dark theme whereas in the morning it switches to bright theme automatically.

**Other New Features:**

Zorin OS 15 comes packed with a lot of new features including:

  * Compatible with Thunderbolt 3.0 devices
  * Supports color emojis
  * Comes with an upgraded Linux Kernel 4.18
  * Customized settings available for application menu and task bar
  * System font changed to Inter
  * Supports renaming bulk files



### Minimum system requirements for Zorin OS 15 (Core):

  * Dual Core 64-bit (1GHZ)
  * 2 GB RAM
  * 10 GB free disk space
  * Internet Connection Optional
  * Display (800×600)



### Step by Step Guide to Install Zorin OS 15 (Core)

Before you start installing Zorin OS 15, ensure you have a copy of the Zorin OS 15 downloaded in your system. If not download then refer official website of [Zorin OS 15][1]. Remember this Linux distribution is available in 4 versions including:

  * Ultimate (Paid Version)
  * Core (Free Version)
  * Lite (Free Version)
  * Education (Free Version)



Note: In this article I will demonstrate Zorin OS 15 Core Installation Steps

### Step 1) Create Zorin OS 15 Bootable USB Disk

Once you have downloaded Zorin OS 15, copy the ISO into an USB disk and create a bootable disk. Change our system settings to boot using an USB disk and restart your system. Once you restart your system, you will see the screen as shown below. Click “ **Install or Try Zorin OS** ”

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Install-Zorin-OS15-option.jpg>

### Step 2) Choose Install Zorin OS

In the next screen, you will be shown option to whether install Zorin OS 15 or to try Zorin OS. Click “ **Install Zorin OS** ” to continue the installation process.

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Install-Zorin-OS-15-on-System.jpg>

### Step 3) Choose Keyboard Layout

Next step is to choose your keyboard layout. By default, English (US) is selected and if you want to choose a different language, then choose it and click “ **Continue** ”

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Choose-Keyboard-Layout-Zorinos-15.jpg>

### Step 4) Download Updates and Other Software

In the next screen, you will be asked whether you need to download updates while you are installing Zorin OS and install other 3rd party applications. In case your system is connected to internet then you can select both of these options, but by doing so your installation time increases considerably, or if you don’t want to install updates and third party software during the installation then untick both these options and click “Continue”

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Install-Updates-third-party-softwares-Zorin-OS15-Installation.jpg>

### Step 5) Choose Zorin OS 15 Installation Method

If you are new to Linux and want fresh installation and don’t want to customize partitions, then better choose option “ **Erase disk and install Zorin OS** ”

If you want to create customize partitions for Zorin OS then choose “ **Something else** “, In this tutorial I will demonstrate how to create customize partition scheme for Zorin OS 15 installation,

So, choose “ **Something else** ” option and then click on Continue

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Choose-Something-else-option-Zorin-OS15-Installation.jpg>

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Disk-for-Zorin-OS15-Installation.jpg>

As we can see we have around 42 GB disk available for Zorin OS, We will be creating following partitions,

  * /boot = 2 GB (ext4 file system)
  * /home = 20 GB (ext4 file system)
  * / = 10 GB (ext4 file system)
  * /var = 7 GB (ext4 file system)
  * Swap = 2 GB (ext4 file system)



To start creating partitions, first click on “ **New Partition Table** ” and it will show it is going to create empty partition table, click on continue

<https://www.linuxtechi.com/wp-content/uploads/2019/06/create-empty-partition-zorin-os15-installation.jpg>

In the next screen we will see that we have now 42 GB free space on disk (/dev/sda), so let’s create our first partition as /boot,

Select the free space, then click on + symbol and then specify the partition size as 2048 MB, file system type as ext4 and mount point as /boot,

<https://www.linuxtechi.com/wp-content/uploads/2019/06/boot-partiton-during-zorin-os15-installation.jpg>

Click on OK

Now create our next partition /home of size 20 GB (20480 MB),

<https://www.linuxtechi.com/wp-content/uploads/2019/06/home-partition-zorin-os15-installation.jpg>

Similarly create our next two partition / and /var of size 10 and 7 GB respectively,

<https://www.linuxtechi.com/wp-content/uploads/2019/06/slash-partition-zorin-os15-installation.jpg>

<https://www.linuxtechi.com/wp-content/uploads/2019/06/var-partition-zorin-os15-installation.jpg>

Let’s create our last partition as swap of size 2 GB

<https://www.linuxtechi.com/wp-content/uploads/2019/06/swap-partition-Zorin-OS15-Installation.jpg>

Click on OK

Choose “ **Install Now** ” option in next window,

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Install-now-option-zorin-os15.jpg>

In next window, choose “Continue” to write changes to disk and to proceed with installation

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Write-Changes-to-disk-zorin-os15.jpg>

### Step 6) Choose Your Preferred Location

In the next screen, you will be asked to choose your location and click “Continue”

<https://www.linuxtechi.com/wp-content/uploads/2019/06/TimeZone-Zorin-OS15-Installation.jpg>

### Step 7) Provide User Credentials

In the next screen, you’ll be asked to enter the user credentials including your name, computer name,

Username and password. Once you are done, click “Continue” to proceed with the installation process.

<https://www.linuxtechi.com/wp-content/uploads/2019/06/User-Credentails-During-Zorin-OS15-Installation.jpg>

### Step 8) Installing Zorin OS 15

Once you click continue, you can see that the Zorin OS 15 starts installing and it may take some time to complete the installation process.

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Installation-Progress-Zorin-OS15.jpg>

### Step 9) Restart your system after Successful Installation

Once the installation process is completed, it will ask to restart your computer. Hit “ **Restart Now** ”

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Zorin-OS15-Installation-Completed.jpg>

### Step 10) Login to Zorin OS 15

Once the system restarts, you will be asked to login into the system using the login credentials provided earlier.

Note: Don’t forget to change the boot medium from bios so that system boots up with disk.

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Login-Screen-Zorin-OS15.jpg>

### Step 11) Zorin OS 15 Welcome Screen

Once your login is successful, you can see the Zorin OS 15 welcome screen. Now you can start exploring all the incredible features of Zorin OS 15.

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Desktop-Screen-Zorin-OS15.jpg>

That’s all from this tutorial, please do share feedback and comments.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/zorin-os-15-installation-guide-screenshots/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://zorinos.com/download/

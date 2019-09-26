[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Installation Guide of Manjaro 18.1 (KDE Edition) with Screenshots)
[#]: via: (https://www.linuxtechi.com/install-manjaro-18-1-kde-edition-screenshots/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

Installation Guide of Manjaro 18.1 (KDE Edition) with Screenshots
======

Within a year of releasing **Manjaro 18.0** (**Illyria**), the team has come out with their next big release with **Manjaro 18.1**, codenamed “**Juhraya**“. The team also have come up with an official announcement saying that Juhraya comes packed with a lot of improvements and bug fixes.

### New Features in Manjaro 18.1

Some of the new features and enhancements in Manjaro 18.1 are listed below:

  * Option to choose between LibreOffice or Free Office
  * New Matcha theme for Xfce edition
  * Redesigned messaging system in KDE edition
  * Support for Snap and FlatPak packages using “bhau” tool



### Minimum System Requirements for Manjaro 18.1

  * 1 GB RAM
  * One GHz Processor
  * Around 30 GB Hard disk space
  * Internet Connection
  * Bootable Media (USB/DVD)



### Step by Step Guide to Install Manjaro 18.1 (KDE Edition)

To start installing Manjaro 18.1 (KDE Edition) in your system, please follow the steps outline below:

### Step 1) Download Manjaro 18.1 ISO

Before installing, you need to download the latest copy of Manjaro 18.1 from its official download page located **[here][1]**. Since we are seeing about the KDE version, we chose to install the KDE version. But the installation process is the same for all desktop environments including Xfce, KDE and Gnome editions.

### Step 2) Create a USB Bootable Disk

Once you have successfully downloaded the ISO file from Manjaro downloads page, it is time to create an USB disk. Copy the downloaded ISO file in a USB disk and create a bootable disk. Make sure to change your boot settings to boot using a USB and restart your system

### Step 3) Manjaro Live Installation Environment

When the system restarts, it will automatically detect the USB drive and starts booting into the Manjaro Live Installation Screen.

[![Boot-Manjaro-18-1-kde-installation][2]][3]

Next use the arrow keys to choose “**Boot: Manjaro x86_64 kde**” and hit enter to launch the Manjaro Installer.

### Step 4) Choose Launch Installer

Next the Manjaro installer will be launched and If you are connected to the internet, Manjaro will automatically detect your location and time zone. Click “**Launch Installer**” start installing Manjaro 18.1 KDE edition in your system.

[![Choose-Launch-Installaer-Manjaro18-1-kde][2]][4]

### Step 5) Choose Your Language

Next the installer will take you to choose your preferred language.

[![Choose-Language-Manjaro18-1-Kde-Installation][2]][5]

Select your desired language and click “Next”

### Step 6) Choose Your time zone and region

In the next screen, select your desired time zone and region and click “Next” to continue

[![Select-Location-During-Manjaro18-1-KDE-Installation][2]][6]

### Step 7) Choose Keyboard layout

In the next screen, select your preferred keyboard layout and click “Next” to continue.

[![Select-Keyboard-Layout-Manjaro18-1-kde-installation][2]][7]

### Step 8) Choose Partition Type

This is a very critical step in the installation process. It will allow you to choose between:

  * Erase Disk
  * Manual Partitioning
  * Install Alongside
  * Replace a Partition



If you are installing Manjaro 18.1 in a VM (Virtual Machine), then you won’t be able to see the last 2 options.

If you are new to Manjaro Linux then I would suggest you should go with first option (**Erase Disk**), it will automatically create required partitions for you. If you want to create custom partitions then choose the second option “**Manual Partitioning**“, as its name suggests it will allow us to create our own custom partitions.

In this tutorial I will be creating custom partitions by selecting “Manual Partitioning” option,

[![Manual-Partition-Manjaro18-1-KDE][2]][8]

Choose the second option and click “Next” to continue.

As we can see i have 40 GB hard disk, so I will create following partitions on it,

  * /boot       –  2GB (ext4 file system)
  * /               –  10 GB (ext4 file system)
  * /home     –  22 GB (ext4 file system)
  * /opt         –  4 GB (ext4 file system)
  * Swap       –  2 GB



When we click on Next in above window, we will get the following screen, choose to create a ‘**new partition table**‘,

[![Create-Partition-Table-Manjaro18-1-Installation][2]][9]

Click on Ok,

Now choose the free space and then click on ‘**create**‘ to setup the first partition as /boot of size 2 GB,

[![boot-partition-manjaro-18-1-installation][2]][10]

Click on OK to proceed with further, in the next window choose again free space and then click on create  to setup second partition as / of size 10 GB,

[![slash-root-partition-manjaro18-1-installation][2]][11]

Similarly create next partition as /home of size 22 GB,

[![home-partition-manjaro18-1-installation][2]][12]

As of now we have created three partitions as primary, now create next partition as extended,

[![Extended-Partition-Manjaro18-1-installation][2]][13]

Click on OK to proceed further,

Create /opt and Swap partition of size 5 GB and 2 GB respectively as logical partitions

[![opt-partition-manjaro-18-1-installation][2]][14]

[![swap-partition-manjaro18-1-installation][2]][15]

Once are done with all the partitions creation, click on Next

[![choose-next-after-partition-creation][2]][16]

### Step 9) Provide User Information

In the next screen, you need to provide the user information including your name, username, password, computer name etc.

[![User-creation-details-manjaro18-1-installation][2]][17]

Click “Next” to continue with the installation after providing all the information.

In the next screen you will be prompted to choose the office suite, so make a choice that suits to your installation,

[![Office-Suite-Selection-Manjaro18-1][2]][18]

Click on Next to proceed further,

### Step 10) Summary Information

Before the actual installation is done, the installer will show you all the details you’ve chosen including the language, time zone, keyboard layout and partitioning information etc. Click “**Install**” to proceed with the installation process.

[![Summary-manjaro18-1-installation][2]][19]

### Step 11) Install Manjaro 18.1 KDE Edition

Now the actual installation process begins and once it gets completed, restart the system to login to Manjaro 18.1 KDE edition ,

[![Manjaro18-1-Installation-Progress][2]][20]

[![Restart-Manjaro-18-1-after-installation][2]][21]

### Step:12) Login after successful installation

After the restart we will get the following login screen, use the user’s credentials that we created during the installation

[![Login-screen-after-manjaro-18-1-installation][2]][22]

Click on Login,

[![KDE-Desktop-Screen-Manjaro-18-1][2]][23]

That’s it! You’ve successfully installed Manjaro 18.1 KDE edition in your system and explore all the exciting features. Please post your feedback and suggestions in the comments section below.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-manjaro-18-1-kde-edition-screenshots/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://manjaro.org/download/official/kde/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Boot-Manjaro-18-1-kde-installation.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Launch-Installaer-Manjaro18-1-kde.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Language-Manjaro18-1-Kde-Installation.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Select-Location-During-Manjaro18-1-KDE-Installation.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Select-Keyboard-Layout-Manjaro18-1-kde-installation.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Manual-Partition-Manjaro18-1-KDE.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Create-Partition-Table-Manjaro18-1-Installation.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/09/boot-partition-manjaro-18-1-installation.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/09/slash-root-partition-manjaro18-1-installation.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/09/home-partition-manjaro18-1-installation.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Extended-Partition-Manjaro18-1-installation.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/09/opt-partition-manjaro-18-1-installation.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/09/swap-partition-manjaro18-1-installation.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/09/choose-next-after-partition-creation.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/09/User-creation-details-manjaro18-1-installation.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Office-Suite-Selection-Manjaro18-1.jpg
[19]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Summary-manjaro18-1-installation.jpg
[20]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Manjaro18-1-Installation-Progress.jpg
[21]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Restart-Manjaro-18-1-after-installation.jpg
[22]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Login-screen-after-manjaro-18-1-installation.jpg
[23]: https://www.linuxtechi.com/wp-content/uploads/2019/09/KDE-Desktop-Screen-Manjaro-18-1.jpg

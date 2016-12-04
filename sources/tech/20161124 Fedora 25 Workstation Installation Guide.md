#rusking translating 

Fedora 25 Workstation Installation Guide
============================================================

In this tutorial, we will walk through the steps to install Fedora 25 workstation edition on your machine. This guide contains screen shots taken from every step in the whole installation process, therefore, carefully follow it.

#### What’s New in Fedora 25 Workstation?

As expected, this latest version of Fedora comes with multiple bug fixes and changes to the basic components, additionally, it brings new and enhanced software as listed below:

1.  GNOME 3.22 which enables multiple file renaming, redesigned keyboard settings tool and plus several user interface enhancements.
2.  Replaces X11 system with Wayland for modern graphics hardware.
3.  Decoding support for the MP3 media format.
4.  Docker 1.12
5.  Node.js 6.9.1
6.  Support for Rust system programming language.
7.  Numerous versions of Python programming language, that is 2.6, 2.7, 3.3, 3.4 and 3.5.
8.  GNOME Shell extensions are also no longer checked for compatibility with the current version of the Shell and many more.

Note: If you already using previous version of Fedora 24, you may consider following much more easier steps to [upgrade Fedora 24 to Fedora 25][3] to avoid a fresh installation process.

### Installation of Fedora 25 Workstation Edition

Start by downloading the ISO image from the links below, for the purpose of this tutorial, we will use the 64-bit edition.

1.  [Download Fedora 25 Workstation 64-bit Edition][1]
2.  [Download Fedora 25 Workstation 32-bit Edition][2]

After downloading Fedora 25, the first is to create a bootbale media, that is either a DVD or USB drive using the install Linux from USB Device using [Unetbootin and dd Command][4] or any other method of your choice.

1. After creating bootable media, plug-in and boot into the bootable media (DVD/USB drive), you should be able to see the Fedora Workstation Live 25 start screen below.

Select “Start Fedora-Workstation-Live 25” option and hit the Enter button.

[
 ![Fedora 25 Boot Menu](http://www.tecmint.com/wp-content/uploads/2016/11/Start-Fedora-25.png) 
][5]

Fedora 25 Boot Menu

2. Next, you will be at the login interface below, click on “Live System User” to login as a Live user.

[
 ![Fedora 25 Live User Login](http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Live-User-Login.png) 
][6]

Fedora 25 Live User Login

3. After logging in, the welcome interface below will appear after a few seconds on the desktop, if you wish to try Fedora before installing it, click on “Try Fedora” otherwise, click on “Install to Hard Disk” to proceed with the fresh installation process.

[
 ![Fedora 25 Welcome Screen](http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Welcome-Screen.png) 
][7]

Fedora 25 Welcome Screen

4. In the screen below, select the installation language you want to use and click on “Continue” to advance to the installation summary screen.

[
 ![Select Installation Language Type](http://www.tecmint.com/wp-content/uploads/2016/11/Select-Installation-Language-Type.png) 
][8]

Select Installation Language Type

5. The following is a screen shot showing the installation summary screen with default localization and system settings. You need to customize the localization and system settings as per your location and preferences.

Start with the Keyboard settings. Click on “KEYBOARD” to move into the keyboard layout customization screen.

[
 ![Fedora 25 Installation Summary](http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Installation-Summary.png) 
][9]

Fedora 25 Installation Summary

6. From the interface below, add the keyboard layout you want to use according to the origin of your machine using the `+` sign. After adding it, click on “Done” to get back to the installation summary screen.

[
 ![Set Keyboard Layout](http://www.tecmint.com/wp-content/uploads/2016/11/Set-Keyboard-Layout.png) 
][10]

Set Keyboard Layout

7. Next off, click on “TIME & DATE” to adjust your system time and date. Type the region and city to set the timezone or simply select them from the map.

Note that you can also enable or disable network time from the top right corner. After setting your system time and date, click on “Done” to move back to the installation summary screen.

[
 ![Set System Timezone](http://www.tecmint.com/wp-content/uploads/2016/11/Set-System-Timezone.png) 
][11]

Set System Timezone

8. Back at the installation summary screen, click on “NETWORK & HOSTNAME” to set your system network settings and hostname.

Once you have set the hostname, click on the Apply button to check if the hostname is valid, if that is the case, click on “Done”.

[
 ![Set Hostname for Fedora 25](http://www.tecmint.com/wp-content/uploads/2016/11/Set-Hostname-Fedora-25.png) 
][12]

Set Hostname for Fedora 25

9. At this point, you need to now create the installation space for your system files, at the installation summary screen, click on “INSTALLATION DESTINATION”.

Choose “I will configure partitioning” under Other Storage Options to perform manual partitioning and click Done to move forward to the manual partitioning interface.

[
 ![Select Installation Destination Drive](http://www.tecmint.com/wp-content/uploads/2016/11/Select-Installation-Destination-Drive.png) 
][13]

Select Installation Destination Drive

10. Below is the manual partitioning interface, select “Standard Partition” as the new partitioning scheme for the installation.

[
 ![Manual Partitioning Selection](http://www.tecmint.com/wp-content/uploads/2016/11/Manual-Partitioning-Selection.png) 
][14]

Manual Partitioning Selection

11. Now create a `/root` partition by clicking on the `+` sign to add a new mount point.

```
Mount Point: /root
Desired Capacity: set appropriate size( eg 100 GB)
```

After that, click Add mount point to add the just created partition/mount point.

[
 ![Create New Root Partition](http://www.tecmint.com/wp-content/uploads/2016/11/Create-New-Root-Partition.png) 
][15]

Create New Root Partition

The interface below shows the settings of the `/root` partition mount point.

[
 ![Root Partition Settings](http://www.tecmint.com/wp-content/uploads/2016/11/Root-Partition-Settings.png) 
][16]

Root Partition Settings

12. Next, create a swap partition by clicking on the `+` sign to add a another mount point, that is the swap area.

Swap area is a virtual space on your hard disk that temporarily stores data which is not currently being worked on by the CPU from the system RAM.

```
Mount Point: swap
Desired Capacity: set appropriate size( eg 4 GB)
```

To add the swap area, click Add mount point.

[
 ![Create Swap Partition](http://www.tecmint.com/wp-content/uploads/2016/11/Create-Swap-Partition.png) 
][17]

Create Swap Partition

[
 ![Swap Partition Settings](http://www.tecmint.com/wp-content/uploads/2016/11/Swap-Partition-Settings.png) 
][18]

Swap Partition Settings

13. Once you have created the `root` partition and `swap` area, click on Done to view the possible changes to be made to your hard disk. Click Accept Changes to permit execution of the various changes.

[
 ![Accept Partition Changes](http://www.tecmint.com/wp-content/uploads/2016/11/Accept-Partition-Changes.png) 
][19]

Accept Partition Changes

14. Your final installation summary should look similar to this with custom settings. To begin the actual installation of system files, click on “Begin Installation”.

[
 ![Final Installation Summary](http://www.tecmint.com/wp-content/uploads/2016/11/Final-Installation-Summary.png) 
][20]

Final Installation Summary

15. After the installation of system files starts, you can create a regular system user and add a password for the root user from the interface below.

[
 ![User Configuration Settings](http://www.tecmint.com/wp-content/uploads/2016/11/User-Configuration-Settings.png) 
][21]

User Configuration Settings

16. Therefore, click on ROOT PASSWORD to set the root user’s password. As before, click Doneafterwards to move back to the user configuration interface.

[
 ![Set Root Account Password](http://www.tecmint.com/wp-content/uploads/2016/11/Set-Root-Account-Password.png) 
][22]

Set Root Account Password

17\. Subsequently click on USER CREATION at the user configuration interface to create a regular system user. You can as well make the regular user a system administrator by marking the option “Make the user administrator”.

One more time, click Done to continue..

[
 ![Create System User Account](http://www.tecmint.com/wp-content/uploads/2016/11/Create-System-User-Account.png) 
][23]

Create System User Account

18. The installation process will continue for a while, sit back and relax. When it is complete, click on Quitto reboot the system and eject the bootable media you used. Finally, log in into your new Fedora 25 workstation.

[
 ![Fedora 25 Login Screen](http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Login-Screen.png) 
][24]

Fedora 25 Login Screen

[
 ![Fedora 25 Workstation Desktop](http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Workstation-Desktop.png) 
][25]

Fedora 25 Workstation Desktop

That’s all! To ask any question or make comments concerning this guide, use the feedback form below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/fedora-25-installation-guide/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:https://download.fedoraproject.org/pub/fedora/linux/releases/25/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-25-1.3.iso
[2]:https://download.fedoraproject.org/pub/fedora/linux/releases/25/Workstation/i386/iso/Fedora-Workstation-Live-i386-25-1.3.iso
[3]:http://www.tecmint.com/upgrade-fedora-24-to-fedora-25-workstation-server/
[4]:http://www.tecmint.com/install-linux-from-usb-device/
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/Start-Fedora-25.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Live-User-Login.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Welcome-Screen.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/11/Select-Installation-Language-Type.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Installation-Summary.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/11/Set-Keyboard-Layout.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/11/Set-System-Timezone.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/11/Set-Hostname-Fedora-25.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/11/Select-Installation-Destination-Drive.png
[14]:http://www.tecmint.com/wp-content/uploads/2016/11/Manual-Partitioning-Selection.png
[15]:http://www.tecmint.com/wp-content/uploads/2016/11/Create-New-Root-Partition.png
[16]:http://www.tecmint.com/wp-content/uploads/2016/11/Root-Partition-Settings.png
[17]:http://www.tecmint.com/wp-content/uploads/2016/11/Create-Swap-Partition.png
[18]:http://www.tecmint.com/wp-content/uploads/2016/11/Swap-Partition-Settings.png
[19]:http://www.tecmint.com/wp-content/uploads/2016/11/Accept-Partition-Changes.png
[20]:http://www.tecmint.com/wp-content/uploads/2016/11/Final-Installation-Summary.png
[21]:http://www.tecmint.com/wp-content/uploads/2016/11/User-Configuration-Settings.png
[22]:http://www.tecmint.com/wp-content/uploads/2016/11/Set-Root-Account-Password.png
[23]:http://www.tecmint.com/wp-content/uploads/2016/11/Create-System-User-Account.png
[24]:http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Login-Screen.png
[25]:http://www.tecmint.com/wp-content/uploads/2016/11/Fedora-25-Workstation-Desktop.png

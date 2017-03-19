Installation of Devuan Linux (Fork of Debian)
============================================================


Devuan Linux, the most recent fork of Debian, is a version of Debian that is designed to be completely free of systemd.

Devuan was announced towards the end of 2014 and has been actively developed over that time. The most recently release is the beta2 release of codenamed: Jessie (Yes the same name as the current stable version of Debian).

The final release for the current stable release is said to be ready in early 2017\. To read more about the project please visit the community’s home page: [https://devuan.org/][1].

This article will walk through the installation of Devuan’s current release. Most of the packages available in Debian are available in Devuan allowing for a fairly seamless transition for Debian users to Devuan should they prefer the freedom to choose their initialization system.

#### System Requirements

Devuan, like Debian. Is very light on system requirements. The biggest determining factor is the desktop environment the user wishes to use. This guide will assume that the user would like a ‘flashier’ desktop environment and will suggest the following minimums:

1.  At least 15GB of disk space; strongly encouraged to have more
2.  At least 2GB of ram; more is encouraged
3.  USB or CD/DVD boot support
4.  Internet connection; installer will download files from the Internet

### Devuan Linux Installation

As with all of the author’s guides, this guide will be assuming that a USB drive is available to use as the installation media. Take note that the USB drive should be as close to 4/8GB as possible and ALL DATA WILL BE REMOVED!

The author has had issues with larger USB drives but some may still work. Regardless, following the next few steps WILL RESULT IN DATA LOSS ON THE USB DRIVE.

Please be sure to backup all data before proceeding. This bootable Kali Linux USB drive is going to be created from another Linux machine.

1. First obtain the latest release of Devuan installation ISO from [https://devuan.org/][2] or you can obtain from a Linux station, type the following commands:

```
$ cd ~/Downloads
$ wget -c https://files.devuan.org/devuan_jessie_beta/devuan_jessie_1.0.0-beta2_amd64_CD.iso
```

2. The commands above will download the installer ISO file to the user’s ‘Downloads’ folder. The next process is to write the ISO to a USB drive to boot the installer.

To accomplish this we can use the `'dd'` tool within Linux. First, the disk name needs to be located with [lsblk command][3] though.

```
$ lsblk
```
[
 ![Find Device Name in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/Find-Device-Name-in-Linux.png) 
][4]

Find Device Name in Linux

With the name of the USB drive determined as `/dev/sdc`, the Devuan ISO can be written to the drive with the `dd` tool.

```
$ sudo dd if=~/Downloads/devuan_jessie_1.0.0-beta2_amd64_CD.iso of=/dev/sdc
```

Important: The above command requires root privileges so utilize ‘sudo’ or login as the root user to run the command. Also this command will REMOVE EVERYTHING on the USB drive. Be sure to backup needed data.

3. Once the ISO is copied over to the USB drive, plug the USB drive into the respective computer that Devuan should be installed upon and proceed to boot to the USB drive.

Upon successful booting to the USB drive, the user will be presented with the following screen and should proceed with the ‘Install’ or ‘Graphical Install’ options.

This guide will be using the ‘Graphical Install’ method.

[
 ![Devuan Graphic Installation](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Graphic-Installation.png) 
][5]

Devuan Graphic Installation

4. Allow the installer to boot to the localization menus. Once here the user will be prompted with a string of windows asking about the user’s keyboard layout and language. Simply select the desired options to continue.

[
 ![Devuan Language Selection](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Language-Selection.png) 
][6]

Devuan Language Selection

[
 ![Devuan Location Selection](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Location-Selection.png) 
][7]

Devuan Location Selection

[
 ![Devuan Keyboard Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Keyboard-Configuration.png) 
][8]

Devuan Keyboard Configuration

5. The next step is to provide the installer with the hostname and domain name that this machine will be a member.

The hostname should be something unique but the domain can be left blank if the computer won’t be part of a domain.

[
 ![Set Devuan Linux Hostname](http://www.tecmint.com/wp-content/uploads/2017/03/Set-Devuan-Linux-Hostname.png) 
][9]

Set Devuan Linux Hostname

[
 ![Set Devuan Linux Domain Name](http://www.tecmint.com/wp-content/uploads/2017/03/Set-Devuan-Linux-Domain-Name.png) 
][10]

Set Devuan Linux Domain Name

6. Once the hostname and domain name information have been provided the installer will want the user to provide a ‘root’ user password.

Take note to remember this password as it will be required to do administrative tasks on this Devuan machine! Devuan doesn’t install the sudo package by default so the admin user will be ‘root’ when this installation finishes.

[
 ![Setup Devuan Linux Root User](http://www.tecmint.com/wp-content/uploads/2017/03/Setup-Devuan-Linux-Root-User.png) 
][11]

Setup Devuan Linux Root User

7. The next series of questions will be for the creation of a non-root user. It is always a good to avoid using your system as the root user whenever possible. The installer will prompt for the creation of a non-root user at this point.

[
 ![Setup Devuan Linux User Account](http://www.tecmint.com/wp-content/uploads/2017/03/Setup-Devuan-Linux-User-Account.png) 
][12]

Setup Devuan Linux User Account

8. Once the root user password and user creation prompts have completed, the installer will request that the clock be [set up with NTP][13].

Again a connection to the internet will be required in order for this to work for most systems!

[
 ![Devuan Linux Timezone Setup](http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Clock-on-Devuan-Linux.png) 
][14]

Devuan Linux Timezone Setup

9. The next step will be the act of partitioning the system. For most user’s ‘Guided – use entire disk’ is typically sufficient. However, if advanced partitioning is desired, this would be the time to set them up.

[
 ![Devuan Linux Partitioning](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Partitioning.png) 
][15]

Devuan Linux Partitioning

Be sure to confirm the partition changes after clicking continue above in order to write the partitions to the disk!

10. Once the partitioning is completed, the installer will begin to install the base files for Devuan. This process will take a few minutes but will stop when the system is ready to configure a network mirror (software repository). Most users will want to click ‘yes’ when prompted to use a network mirror.

[
 ![Devuan Linux Configure Package Manager](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Configure-Package-Manager.png) 
][16]

Devuan Linux Configure Package Manager

Clicking `yes` here will present the user with a list of network mirrors by country. It is typically best to pick the mirror that is geographically closest to the machines location.

[
 ![Devuan Linux Mirror Selection](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Mirror-Selection.png) 
][17]

Devuan Linux Mirror Selection

[
 ![Devuan Linux Mirrors](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Mirrors.png) 
][18]

Devuan Linux Mirrors

11. The next screen is the traditional Debian ‘popularity contest’ all this does is track what packages are downloaded for statistics on package usage.

This can be enabled or disabled to the administrator’s preference during the installation process.

[
 ![Configure Devuan Linux Popularity Contest](http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Devuan-Linux-Popularity-Contest.png) 
][19]

Configure Devuan Linux Popularity Contest

12. After a brief scan of the repositories and a couple of package updates, the installer will present the user with a list of software packages that can be installed to provide a Desktop Environment, SSH access, and other system tools.

While Devuan has some of the major Desktop Environments listed, it should be noted that not all of them are ready for use in Devuan yet. The author has had good luck with Xfce, LXDE, and Mate in Devuan (Future articles will walk the user through how to install Enlightenment from source in Devuan as well).

If interested in installing a different Desktop Environment, un-check the ‘Devuan Desktop Environment’ check box.

[
 ![Devuan Linux Software Selection](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Software-Selection.png) 
][20]

Devuan Linux Software Selection

Depending on the number of items selected in the above installer screen, there may be a couple of minutes of downloads and installations taking place.

When all the software installation is completed, the installer will prompt the user for the location to install ‘grub’. This is typically done on ‘/dev/sda’ as well.

[
 ![Devuan Linux Grub Install](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Grub-Install.png) 
][21]

Devuan Linux Grub Install

[
 ![Devuan Linux Grub Install Disk](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Grub-Install-Disk.png) 
][22]

Devuan Linux Grub Install Disk

13. After GRUB successfully installs to the boot drive, the installer will alert the user that the installation is complete and to reboot the system.

[
 ![Devuan Linux Installation Completes](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Installation-Completes.png) 
][23]

Devuan Linux Installation Completes

14. Assuming that the installation was indeed successful, the system should either boot into the chosen Desktop Environment or if no Desktop Environment was selected, the machine will boot to a text based console.

[
 ![Devuan Linux Console](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Console.png) 
][24]

Devuan Linux Console

This concludes the installation of the latest version of Devuan Linux. The next article in this short series will cover the [installation of the Enlightenment Desktop Environment][25] from source code on a Devuan system. Please let Tecmint know if you have any issues or questions and thanks for reading!

--------------------------------------------------------------------------------

作者简介：

He is an Instructor of Computer Technology with Ball State University where he currently teaches all of the departments Linux courses and co-teaches Cisco networking courses. He is an avid Debian user as well as many of the derivatives of Debian such as Mint, Ubuntu, and Kali. Rob holds a Masters in Information and Communication Sciences as well as several industry certifications from Cisco, EC-Council, and Linux Foundation.

-----------------------------

via: http://www.tecmint.com/installation-of-devuan-linux/

作者：[Rob Turner ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/robturner/
[1]:https://devuan.org/
[2]:https://devuan.org/
[3]:http://www.tecmint.com/find-usb-device-name-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-Device-Name-in-Linux.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Graphic-Installation.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Language-Selection.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Location-Selection.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Keyboard-Configuration.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Set-Devuan-Linux-Hostname.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Set-Devuan-Linux-Domain-Name.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Setup-Devuan-Linux-Root-User.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Setup-Devuan-Linux-User-Account.png
[13]:http://www.tecmint.com/install-and-configure-ntp-server-client-in-debian/
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Clock-on-Devuan-Linux.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Partitioning.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Configure-Package-Manager.png
[17]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Mirror-Selection.png
[18]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Mirrors.png
[19]:http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Devuan-Linux-Popularity-Contest.png
[20]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Software-Selection.png
[21]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Grub-Install.png
[22]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Grub-Install-Disk.png
[23]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Installation-Completes.png
[24]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Console.png
[25]:http://www.tecmint.com/install-enlightenment-on-devuan-linux/
[26]:http://www.tecmint.com/author/robturner/
[27]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[28]:http://www.tecmint.com/free-linux-shell-scripting-books/

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cylon – The Arch Linux Maintenance Program For Newbies)
[#]: via: (https://www.ostechnix.com/cylon-arch-linux-maintenance-program/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Cylon – The Arch Linux Maintenance Program For Newbies
======

![Cylon is an Arch Linux Maintenance Program][1]

Recently switched to Arch Linux as your daily driver? Great! I’ve got a good news for you. Meet **Cylon** , a maintenance program for Arch Linux and derivatives. It is a menu-driven **Bash** script which provides updates, maintenance, backups and system checks for Arch Linux and its derivatives such as Manjaro Linux etc. Cylon is mainly a CLI program, and also has a basic dialog GUI. In this guide, we will see how to install and use Cylon in Arch Linux.

### Cylon – The Arch Linux Maintenance Program

##### Install Cylon

Cylon is available in the [**AUR**][2]. You can install it using any AUR helpers, for example [**Yay**][3].

```
$ yay -S cylon
```

##### Usage

Please note that Cylon _**will not install all tools**_ by default. Some functions require various dependencies packages to be installed. There are three dependencies and the rest are optional dependencies. The optional dependencies are left to user discretion. When you perform a function, it will display the missing packages if there are any. All missing packages will be shown as **n/a** (not available) in menus. You need to install the missing packages by yourself before using such functions.

To launch Cylon, type _**cylon**_ in the Terminal:

```
$ cylon
```

Sample output from my Arch linux system:

![][4]

Default interface of Cylon, the Arch Linux maintenance program

You can also launch Cylon from the Menu. It usually found under **Applications > System Tools**.

As you see in the above screenshot, there are **14** menu entries in Cylon main menu to perform different functions. To go to each entry, type the respective number. Also, as you see in the screenshot, there is **n/a** besides the 2 and 3 menu entries which means **auracle** and [**Trizen**][5] are not installed. You need to install them first before performing those functions.

Let us see what each menu entry does.

**1\. Pacman**

Under [**Pacman**][6] section, you can do various package management operations such as install, update, upgrade, verify, remove packages, display package information, view Arch Linux news feed and many. Just type a number to perform the respective action.

![][7]

You can go back to main menu by typing the number **21**.

**2. auracle
**

The **auracle** is an AUR helper program that can be used to perform various AUR actions such as install, update, download, search, remove AUR packages in your Arch linux box.

**3\. trizen**

It is same as above section.

**4\. System Update**

As the name says, this section is dedicated to perform Arch Linux update. Here you can update both the official and AUR packages. Cylon gives you the following four options in this section.

  1. Update Arch Main Repos only,
  2. Update AUR only,
  3. Update All repos,
  4. No Update and exit.



![][8]

**5\. System Maintenance**

In this section, you can do the following maintenance tasks.

  1. Failed Systemd Services and status,
  2. Check Journalctl log for Errors,
  3. Check Journalctl for fstrim SSD trim,
  4. Analyze system boot-up performance,
  5. Check for Broken Symlinks,
  6. Find files where no group or User corresponds to file’s numeric ID,
  7. lostfiles,
  8. Diskspace usage,
  9. Find 200 of the biggest files,
  10. Find inodes usage,
  11. Old configuration files scan,
  12. Print sensors information,
  13. Clean journal files,
  14. Delete core dumps /var/lib/systemd/coredump/,
  15. Delete files,
  16. bleachbit n/a,
  17. rmlint n/a,
  18. List All Open Files,
  19. DMI table decoder,
  20. Return.



The non-installed packages will be shown with letters n/a besides that applications. You need to install them first before choosing that particular action.

** **Recommended Download** – [**Free Video: “Penetration Testing Methodologies Training Course (a $99 value!) FREE”**][9]

**6\. System backup**

This section provides backup utilities such as **rsync** to backup your Arch Linux system. Also, there is a custom backup options which allows you to manually backup files/folders to a user-specified location.

![][10]

**7\. System Security**

Cylon provides various security tools including the following:

  1. ccrypt – Encrypt/decrypt files,
  2. clamav – Antivirus,
  3. rkhunter – RootKit hunter scan,
  4. lynis – System audit tool,
  5. Password generator,
  6. List the password aging info of a user,
  7. Audit SUID/SGID Files.



Remember you need to install them yourself in order to use them. Cylon will not help you to install the missing packages.

**8\. Network Maintenance**

This section is for network related functions. Here, you can:

  1. See wifi link quality continuously on screen,
  2. Use speedtest-cli -testing internet bandwidth,
  3. Check if website up with netcat and ping,
  4. Display all interfaces which are currently available,
  5. Display kernal routing table,
  6. Check the status of UFW, Uncomplicated Firewall,
  7. Network Time Synchronization status check,
  8. traceroute print route packets trace to network host,
  9. tracepath traces path to a network host,
  10. View all open ports



**9\. xterm terminal**

Here, you can launch xterm terminal at output folder path in new window.

**10\. View/Edit config file**

View and edit the configuration files if necessary.

**11\. System information**

This is most useful feature of Cylon utlity. This section provides your Arch Linux system’s information such as,

  * Uptime,
  * Kernel details,
  * OS architecture,
  * Username,
  * Default Shell,
  * Screen resolution,
  * CPU,
  * RAM (used/total),
  * Editor variable,
  * Location of pacman cache folder,
  * Hold packages,
  * Number of orphan packages,
  * Total number of installed packages,
  * Number of all explicitly installed packages,
  * All foreign installed packages,
  * All foreign explicitly installed packages,
  * All packages installed as dependencies,
  * Top 5 largest packages,
  * 5 newest updated packages,
  * Packages Installed size by repositories.



![][11]

**12\. Cylon information**

It will display the information about Cylon program. It also performs the dependencies installation check and display the list of installed non-installed dependencies.

![][12]

**13\. Weather**

It displays the 3 day weather forecast by **wttr.in** utility.

* * *

**Related Read:**

  * **[How To Check Weather Details From Command Line In Linux][13]**



* * *

**14\. Exit**

Type **14** to exit Cylon.

For more details, type **cylon -h** in the Terminal to print cylon information.

* * *

**Recommended read:**

  * [**Cylon-deb : The Debian Linux Maintenance Program**][14]



* * *

Cylon script offers a lot of tools and features to maintain your Arch Linux system. If you’re new to Arch Linux, give it a try and see if it helps.

**Resource:**

  * [**Cylon GitHub page**][15]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cylon-arch-linux-maintenance-program/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2017/06/Cylon-The-Arch-Linux-Maintenance-Program-720x340.png
[2]: https://aur.archlinux.org/packages/cylon/
[3]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: http://www.ostechnix.com/wp-content/uploads/2017/06/cylon-interface.png
[5]: https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[6]: https://www.ostechnix.com/getting-started-pacman/
[7]: http://www.ostechnix.com/wp-content/uploads/2017/06/Cylon-pacman.png
[8]: http://www.ostechnix.com/wp-content/uploads/2017/06/Cylon-system-update.png
[9]: https://ostechnix.tradepub.com/free/w_cybf03/prgm.cgi
[10]: http://www.ostechnix.com/wp-content/uploads/2017/06/Cylon-system-backup.png
[11]: http://www.ostechnix.com/wp-content/uploads/2017/06/Cylon-system-information.png
[12]: http://www.ostechnix.com/wp-content/uploads/2017/06/Cylon-information.png
[13]: https://www.ostechnix.com/check-weather-details-command-line-linux/
[14]: https://www.ostechnix.com/cylon-deb-debian-linux-maintenance-program/
[15]: https://github.com/gavinlyonsrepo/cylon

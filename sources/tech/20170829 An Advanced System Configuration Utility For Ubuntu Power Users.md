An Advanced System Configuration Utility For Ubuntu Power Users
======

![](https://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-4-1-720x340.png)

**Ubunsys** is a Qt-based advanced system utility for Ubuntu and its derivatives. Most of the configuration can be easily done from the command-line by the advanced users. Just in case, you don’t want to use CLI all the time, you can use Ubunsys utility to configure your Ubuntu desktop system or its derivatives such as Linux Mint, Elementary OS etc. Ubunsys can be used to modify system configuration, install, remove, update packages and old kernels, enable/disable sudo access, install mainline kernel, update software repositories, clean up junk files, upgrade your Ubuntu to latest version, and so on. All of the aforementioned actions can be done with simple mouse clicks. You don’t need to depend on CLI mode anymore. Here is the list of things you can do with Ubunsys:

  * Install, update, and remove packages.
  * Update and upgrade software repositories.
  * Install mainline Kernel.
  * Remove old and unused Kernels.
  * Full system update.
  * Complete System upgrade to next available version.
  * Upgrade to latest development version.
  * Clean up junk files from your system.
  * Enable and/or disable sudo access without password.
  * Make Sudo Passwords visible when you type them in the Terminal.
  * Enable and/or disable hibernation.
  * Enable and/or disable firewall.
  * Open, backup and import sources.list.d and sudoers files.
  * Show/unshow hidden startup items.
  * Enable and/or disable Login sounds.
  * Configure dual boot.
  * Enable/disable Lock screen.
  * Smart system update.
  * Update and/or run all scripts at once using Scripts Manager.
  * Exec normal user installation script from git.
  * Check system integrity and missing GPG keys.
  * Repair network.
  * Fix broken packages.
  * And more yet to come.



**Important note:** Ubunsys is not for Ubuntu beginners. It is dangerous and not a stable version yet. It might break your system. If you’re a new to Ubuntu, don’t use it. If you are very curious to use this application, go through each option carefully and proceed at your own risk. Do not forget to backup your important data before using this application.

### Ubunsys – An Advanced System Configuration Utility For Ubuntu Power Users

#### Install Ubunsys

Ubunusys developer has made a PPA to make the installation process much easier. Ubunsys will currently work on Ubuntu 16.04 LTS, Ubuntu 17.04 64bit editions.

Run the following commands one by one to add Ubunsys PPA and install it.
```
sudo add-apt-repository ppa:adgellida/ubunsys

sudo apt-get update

sudo apt-get install ubunsys

```

If the PPA doesn’t work, head over to the [**releases page**][1], download and install the Ubunsys package depending upon the architecture you use.

#### Usage

Once installed, launch Ubunsys from Menu. This is how Ubunsys main interface looks like.

![][3]

As you can see, Ubunusys has four main sections namely **Packages** , **Tweaks** , **System** , and **Repair**. There are one or more sub-sections available for each main tab to do different operations.

**Packages**

This section allows you to install, remove, update packages.

![][4]

**Tweaks**

In this section, we can do various various system tweaks such as,

  * Open, backup, import sources.list and sudoers file;
  * Configure dual boot;
  * Enable/disable login sound, firewall, lock screen, hibernation, sudo access without password. You can also enable or disable for sudo access without password to specific users.
  * Can make the passwords visible while typing them in Terminal (Disable Asterisks).



![][5]

**System**

This section further categorized into three sub-categories, each for distinct user type.

The **Normal user** tab allows us to,

  * Update, upgrade packages and software repos.
  * Clean system.
  * Exec normal user installation script.



The **Advanced user** section allows us to,

  * Clean Old/Unused Kernels.
  * Install mainline Kernel.
  * do smart packages update.
  * Upgrade system.



The **Developer** section allows us to upgrade the Ubuntu system to latest development version.

![][6]

**Repair**

This is the fourth and last section of Ubunsys. As the name says, this section allows us to do repair our system, network, missing GPG keys, and fix broken packages.

![][7]

As you can see, Ubunsys helps you to do any system configuration, maintenance and software management tasks with few mouse clicks. You don’t need to depend on Terminal anymore. Ubunsys can help you to accomplish any advanced tasks. Again, I warn you, It’s not for beginners and it is not stable yet. So, you can expect bugs and crashes when using it. Use it with care after studying options and impact.

Cheers!

**Resource:**



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ubunsys-advanced-system-configuration-utility-ubuntu-power-users/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/adgellida/ubunsys/releases
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-2.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-5.png
[6]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-9.png
[7]:http://www.ostechnix.com/wp-content/uploads/2017/08/Ubunsys-11.png

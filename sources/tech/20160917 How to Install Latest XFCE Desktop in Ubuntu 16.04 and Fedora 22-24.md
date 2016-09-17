How to Install Latest XFCE Desktop in Ubuntu 16.04 and Fedora 22-24
====

Xfce is a modern, open source and lightweight desktop environment for Linux systems. It also works well on many other Unix-like systems such as Mac OS X, Solaris, *BSD plus several others. It is fast and also user friendly with a simple and elegant user interface.

Installing a desktop environment on servers can sometimes prove helpful, as certain applications may require a desktop interface for efficient and reliable administration and one of the remarkable properties of Xfce is its low system resources utilization such as low RAM consumption, thereby making it a recommended desktop environment for servers if need be.

### XFCE Desktop Features

Additionally, some of its noteworthy components and features are listed below:

- Xfwm windows manager
- Thunar file manager
- User session manger to deal with logins, power management and beyond
- Desktop manager for setting background image, desktop icons and many more
- An application manager
- It’s highly pluggable as well plus several other minor features

The latest stable release of this desktop is Xfce 4.12, all its features and changes from previous versions are listed here.

#### Install Xfce Desktop on Ubuntu 16.04

Linux distributions such as Xubuntu, Manjaro, OpenSUSE, Fedora Xfce Spin, Zenwalk and many others provide their own Xfce desktop packages, however, you can install the latest version as follows.

```
$ sudo apt update
$ sudo apt install xfce4 
```

Wait for the installation process to complete, then logout out of your current session or you can possibly restart your system as well. At the login interface, choose Xfce desktop and login as in the screen shot below:

![](http://www.tecmint.com/wp-content/uploads/2016/09/Select-Xfce-Desktop-at-Login.png)

![](http://www.tecmint.com/wp-content/uploads/2016/09/XFCE-Desktop.png)

#### Install Xfce Desktop in Fedora 22-24

If you have an existing Fedora distribution and wanted to install xfce desktop, you can use yum or dnf to install it as shown.

```
-------------------- On Fedora 22 --------------------
# yum install @xfce
-------------------- On Fedora 23-24 --------------------
# dnf install @xfce-desktop-environment
```

After installing Xfce, you can choose the xfce login from the Session menu or reboot the system.

![](http://www.tecmint.com/wp-content/uploads/2016/09/Select-Xfce-Desktop-at-Fedora-Login.png)

![](http://www.tecmint.com/wp-content/uploads/2016/09/Install-Xfce-Desktop-in-Fedora.png)

If you don’t want Xfce desktop on your system anymore, use the command below to uninstall it:

```
-------------------- On Ubuntu 16.04 -------------------- 
$ sudo apt purge xfce4
$ sudo apt autoremove
-------------------- On Fedora 22 -------------------- 
# yum remove @xfce
-------------------- On Fedora 23-24 --------------------
# dnf remove @xfce-desktop-environment
```

In this simple how-to guide, we walked through the steps for installation of latest version of Xfce desktop, which I believe were easy to follow. If all went well, you can enjoy using xfce, as one of the [best desktop environments for Linux systems][1].

However, to get back to us, you can use the feedback section below and remember to always stay connected to Tecmint.

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/best-linux-desktop-environments/

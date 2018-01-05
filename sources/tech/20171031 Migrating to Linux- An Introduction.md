Migrating to Linux: An Introduction
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/migrating-to-linux.jpg?itok=sjcGK0SY)
Computer systems running Linux are everywhere. Linux runs our Internet services, from Google search to Facebook, and more. Linux also runs in a lot of devices, including our smartphones, televisions, and even cars. Of course, Linux can also run on your desktop system. If you are new to Linux, or you would just like to try something different on your desktop computer, this series of guides will briefly cover the basics and help you in migrating to Linux from another system.

Switching to a different operating system can be a challenge because every operating system provides a different way of doing things. What is second nature on one system can take frustrating time on another as we need to look up how to do things online or in books.

### Vive la difference

To getting started with Linux, one thing you'll likely notice is that Linux is packaged differently. In other operating systems, many things are bundled together and are just a part of the package. In Linux, however, each component is called out separately. For example, under Windows, the graphical interface is just a part of Windows. With Linux, you can choose from multiple graphical environments, like GNOME, KDE Plasma, Cinnamon, and MATE, to name a few.

At a high level, a Linux installation includes the following things:

  1. The kernel

  2. System programs and files residing on disk

  3. A graphical environment

  4. A package manager

  5. Applications




### The Kernel

The core of the operating system is called the kernel. The kernel is the engine under the hood. It allows multiple applications to run simultaneously, and it coordinates their access to common services and devices so everything runs smoothly.

### System programs and files

System programs reside on disk in a standard hierarchy of files and directories. These system programs and files include services (called daemons) that run in the background, utilities for various operations, configuration files, and log files.

Instead of running inside the kernel, these system programs are applications that perform tasks for basic system operation -- for example, set the date and time and connect on the network so you can get on the Internet.

Included here is the init program - the very first application that runs. This program is responsible to starting all the background services (like a web server), starting networking, and starting the graphical environment. This init program will launch other system programs as needed.

Other system programs provide facilities for simple tasks like adding users and groups, changing your password, and configuring disks.

### Graphical Environment

The graphical environment is really just more system programs and files. The graphical environment provides the usual windows with menus, a mouse pointer, dialog boxes, status and indicators and more.

Note that you aren't stuck with the graphical environment that was originally installed. You can change it out for others, if you like. Each graphical environment will have different features. Some look more like Apple OS X, some look more like Windows, and others are unique and don't try to mimic other graphical interfaces.

### Package Manager

The package manager used to be difficult for people to grasp coming from a different system, but nowadays there is a similar system that people are very familiar with -- the App Store. The packaging system is really an app store for Linux. Instead of installing this application from that web site, and the other application from a different site, you can use the package manager to select which applications you want. The package manager then installs the applications from a central repository of pre-built open source applications.

### Applications

Linux comes with many pre-installed applications. And you can get more from the package manager. Many of the applications are quite good, which others need work. Sometimes the same application will have different versions that run in Windows or Mac OS or Linux.

For example, you can use Firefox browser and Thunderbird (for email). You can use LibreOffice as an alternative to Microsoft Office and run games through Valve's Steam program. You can even run some native Windows applications on Linux using WINE.

### Installing Linux

Your first step is typically to install a Linux distribution. You may have heard of Red Hat, Ubuntu, Fedora, Arch Linux, and SUSE, to name a few. These are different distributions of Linux.

Without a Linux distribution, you would have to install each component separately. Many components are developed and provided by different groups of people, so to install each component separately would be a long, tedious task. Luckily, the people who build distros do this work for you. They grab all the components, build them, make sure they work together, and then package them up under a single installation.

Various distributions may make different choices and use different components, but it's still Linux. Applications written to work in one distribution frequently run on other distributions just fine.

If you are a Linux beginner and want to try out Linux, I recommend[ installing Ubuntu][1]. There are other distros you can look into as well: Linux Mint, Fedora, Debian, Zorin OS, elementary OS, and many more. In future articles, we will cover additional facets of a Linux system and provide more information on how to get started using Linux.

Learn more about Linux through the free ["Introduction to Linux" ][2]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2017/10/migrating-linux-introduction

作者：[John Bonesio][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://www.ubuntu.com/download/desktop
[2]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

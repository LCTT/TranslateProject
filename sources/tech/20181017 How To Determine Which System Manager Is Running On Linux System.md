How To Determine Which System Manager Is Running On Linux System
======
We all are heard about this word many times but only few of us know what is this exactly. We will show you how to identify the system manager.

I will try my best to let you know about this. Most of us know about System V and systemd system manager. System V (Sysv) is an old and traditional init system and system manager for old systems.

Systemd is a new init system and system manager which was adapted by most of the major distribution.

There are three major init systems are available in Linux which are very famous and still in use. Most of the Linux distribution falls under in one of the below init system.

### What is init System Manager?

In Linux/Unix based operating systems, init (short for initialization) is the first process that started during the system boot up by the kernel.

It’s holding a process id (PID) of 1. It will be running in the background continuously until the system is shut down.

Init looks at the `/etc/inittab` file to decide the Linux run level then it starts all other processes & applications in the background as per the run level.

BIOS, MBR, GRUB and Kernel processes were kicked up before hitting init process as part of Linux booting process.

Below are the available run levels for Linux (There are seven runlevels exist, from zero to six).

  * **`0:`** halt
  * **`1:`** Single user mode
  * **`2:`** Multiuser, without NFS
  * **`3:`** Full multiuser mode
  * **`4:`** Unused
  * **`5:`** X11 (GUI – Graphical User Interface)
  * **`:`** reboot



Below three init systems are widely used in Linux.

  * **`System V (Sys V):`** System V (Sys V) is one of the first and traditional init system for Unix like operating system.
  * **`Upstart:`** Upstart is an event-based replacement for the /sbin/init daemon.
  * **`systemd:`** Systemd is a new init system and system manager which was implemented/adapted into all the major Linux distributions over the traditional SysV init systems.



### What is System V (Sys V)?

System V (Sys V) is one of the first and traditional init system for Unix like operating system. init is the first process that started during the system boot up by the kernel and it’s a parent process for everything.

Most of the Linux distributions started using traditional init system called System V (Sys V) first. Over the years, several replacement init systems were released to address design limitations in the standard versions such as launchd, the Service Management Facility, systemd and Upstart.

But systemd has been adopted by several major Linux distributions over the traditional SysV init systems.

### How to identify the System V (Sys V) system manager on Linux

Run the following commands to identify that your system is running with System V (Sys V) system manager.

### Method-1: Using ps command

ps – report a snapshot of the current processes. ps displays information about a selection of the active processes.
This output doesn’t give the exact results either System V (SysV) or upstart so, i would suggest you to go with other method to confirm this.

```
# ps -p1 | grep "init\|upstart\|systemd"
 1 ? 00:00:00 init
```

### Method-2: Using rpm command

RPM stands for `Red Hat Package Manager` is a powerful, command line [Package Management][1] utility for Red Hat based system such as (RHEL, CentOS, Fedora, openSUSE & Mageia) distributions. The utility allow you to install, upgrade, remove, query & verify the software on your Linux system/server. RPM files comes with `.rpm` extension.
RPM package built with required libraries and dependency which will not conflicts other packages were installed on your system.

```
# rpm -qf /sbin/init
SysVinit-2.86-17.el5
```

### What is Upstart?

Upstart is an event-based replacement for the /sbin/init daemon which handles starting of tasks and services during boot, stopping them during shutdown and supervising them while the system is running.

It was originally developed for the Ubuntu distribution, but is intended to be suitable for deployment in all Linux distributions as a replacement for the venerable System-V init.

It was used in Ubuntu from 9.10 to Ubuntu 14.10 & RHEL 6 based systems after that they are replaced with systemd.

### How to identify the Upstart system manager on Linux

Run the following commands to identify that your system is running with Upstart system manager.

### Method-1: Using ps command

ps – report a snapshot of the current processes. ps displays information about a selection of the active processes.
This output doesn’t give the exact results either System V (SysV) or upstart so, i would suggest you to go with other method to confirm this.

```
# ps -p1 | grep "init\|upstart\|systemd"
 1 ? 00:00:00 init
```

### Method-2: Using rpm command

RPM stands for `Red Hat Package Manager` is a powerful, command line Package Management utility for Red Hat based system such as (RHEL, CentOS, Fedora, openSUSE & Mageia) distributions. The [RPM Command][2] allow you to install, upgrade, remove, query & verify the software on your Linux system/server. RPM files comes with `.rpm` extension.
RPM package built with required libraries and dependency which will not conflicts other packages were installed on your system.

```
# rpm -qf /sbin/init
upstart-0.6.5-16.el6.x86_64
```

### Method-3: Using /sbin/init file

The `/sbin/init` program will load or switch the root file system from memory to the hard disk.
This is the main part of the boot process. The runlevel at the start of this process is “N” (none). The /sbin/init program initializes the system following the description in the /etc/inittab configuration file.

```
# /sbin/init --version
init (upstart 0.6.5)
Copyright (C) 2010 Canonical Ltd.

This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

### What is systemd?

Systemd is a new init system and system manager which was implemented/adapted into all the major Linux distributions over the traditional SysV init systems.

systemd is compatible with SysV and LSB init scripts. It can work as a drop-in replacement for sysvinit system. systemd is the first process get started by kernel and holding PID 1.

It’s a parant process for everything and Fedora 15 is the first distribution which was adapted systemd instead of upstart. [systemctl][3] is command line utility and primary tool to manage the systemd daemons/services such as (start, restart, stop, enable, disable, reload & status).

systemd uses .service files Instead of bash scripts (SysVinit uses). systemd sorts all daemons into their own Linux cgroups and you can see the system hierarchy by exploring `/cgroup/systemd` file.

### How to identify the systemd system manager on Linux

Run the following commands to identify that your system is running with systemd system manager.

### Method-1: Using ps command

ps – report a snapshot of the current processes. ps displays information about a selection of the active processes.

```
# ps -p1 | grep "init\|upstart\|systemd"
 1 ? 00:18:09 systemd
```

### Method-2: Using rpm command

RPM stands for `Red Hat Package Manager` is a powerful, command line Package Management utility for Red Hat based system such as (RHEL, CentOS, Fedora, openSUSE & Mageia) distributions. The utility allow you to install, upgrade, remove, query & verify the software on your Linux system/server. RPM files comes with `.rpm` extension.
RPM package built with required libraries and dependency which will not conflicts other packages were installed on your system.

```
# rpm -qf /sbin/init
systemd-219-30.el7_3.9.x86_64
```

### Method-3: Using /sbin/init file

The `/sbin/init` program will load or switch the root file system from memory to the hard disk.
This is the main part of the boot process. The runlevel at the start of this process is “N” (none). The /sbin/init program initializes the system following the description in the /etc/inittab configuration file.

```
# file /sbin/init
/sbin/init: symbolic link to `../lib/systemd/systemd'
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-determine-which-init-system-manager-is-running-on-linux-system/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/package-management/
[2]: https://www.2daygeek.com/rpm-command-examples/
[3]: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/

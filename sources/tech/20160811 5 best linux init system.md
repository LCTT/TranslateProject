hkurj translating  
I Best Modern Linux ‘init’ Systems (1992-2015)
============================================

In Linux and other Unix-like operating systems, the init (initialization) process is the first process executed by the kernel at boot time. It has a process ID (PID) of 1, it is executed in the background until the system is shut down.

The init process starts all other processes, that is daemons, services and other background processes, therefore, it is the mother of all other processes on the system. A process can start many other child processes on the system, but in the event that a parent process dies, init becomes the parent of the orphan process.

![](http://www.tecmint.com/wp-content/uploads/2016/08/Linux-init-Systems.png)

Over the years, many init systems have emerged in major Linux distributions and in this guide, we shall take a look at some of the best init systems you can work with on the Linux operating system.

### 1. System V Init

System V (SysV) is a mature and popular init scheme on Unix-like operating systems, it is the parent of all processes on a Unix/Linux system. SysV is the first commercial Unix operating system designed.

Almost all Linux distributions first used SysV init scheme except Gentoo which has a custom init and Slackware using BSD-style init scheme.

As years have passed by, due to some imperfections, several SysV init replacements have been developed in quests to create more efficient and perfect init systems for Linux.

Although these alternatives seek to improve SysV and probably offer new features, they are still compatible with original SysV init scripts.

### 2. SystemD

SystemD is a relatively new init scheme on the Linux platform. Introduced in Fedora 15, its is an assortment of tools for easy system management. The main purpose is to initialize, manage and keep track of all system processes in the boot process and while the system is running.

Systemd init is comprehensively distinct from other traditional Unix init systems, in the way it practically approaches system and services management. It is also compatible with SysV and LBS init scripts.

It has some of the following eminent features:

- Clean, straightforward and efficient design
- Concurrent and parallel processing at bootup
- Better APIv
- Enables removal of optional processes
- Supports event logging using journald
- Supports job scheduling using systemd calender timers
- Storage of logs in binary files
- Preservation of systemd state for future reference
- Better integration with GNOME plus many more

Read the Systemd init Overview: <https://fedoraproject.org/wiki/Systemd>

### 3. Upstart

Upstart is an event-based init system developed by makers of Ubuntu as a replacement for SysV init system. It starts different system tasks and processes, inspects them while the system is running and stops them during system shut down.

It is a hybrid init system which uses both SysV startup scripts and also Systemd scripts, some of the notable features of Upstart init system include:

- Originally developed for Ubuntu Linux but can run on all other distributions
- Event-based starting and stopping of tasks and services
- Events are generated during starting and stopping of tasks and services
- Events can be sent by other system processes
- Communication with init process through D-Bus
- Users can start and stop their own processes
- Re-spawning of services that die abruptly and many more

Visit Homepage: <http://upstart.ubuntu.com/index.html>

### 4. OpenRC

OpenRC is a dependency-based init scheme for Unix-like operating systems, it is compatible with SysV init. As much as it brings some improvements to Sys V, you must keep in mind that OpenRC is not an absolute replacement for /sbin/init file.

It offers some illustrious features and these include:

- It can run on other many Linux distributions including Gentoo and also on BSD
- Supports hardware initiated init scripts
- Supports a single configuration file
- No per-service configurations supported
- Runs as a daemon
- Parallel services startup and many more

Visit Homepage: <https://wiki.gentoo.org/wiki/OpenRC>

### 5. runit

runit is also a cross-platform init system that can run on GNU/Linux, Solaris, *BSD and Mac OS X and it is an alternative for SysV init, that offers service supervision.

It comes with some benefits and remarkable components not found in SysV init and possibly other init systems in Linux and these include:

Service supervision, where each service is associated with a service directory
Clean process state, it guarantees each process a clean state
It has a reliable logging facility
Fast system boot up and shutdown
It is also portable
Packaging friendly
Small code size and many more
Visit Homepage: <http://smarden.org/runit/>

As I had earlier on mentioned, the init system starts and manages all other processes on a Linux system. Additionally, SysV is the primary init scheme on Linux operating systems, but due to some performance weaknesses, system programmers have developed several replacements for it.

And here, we looked at a few of those replacements, but there could be other init systems that you think are worth mentioning in this list. You can let us know of them via the comment section below.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/best-linux-init-systems/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/

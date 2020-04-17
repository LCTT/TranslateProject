[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learning to love systemd)
[#]: via: (https://opensource.com/article/20/4/systemd)
[#]: author: (David Both https://opensource.com/users/dboth)

Learning to love systemd
======
systemd is the mother of all processes, responsible for bringing the
Linux host up to a state where productive work can be done.
![Penguin driving a car with a yellow background][1]

systemd—yes, all lower-case, even at the beginning of a sentence—is the modern replacement for init and SystemV init scripts. It is also much more.

Like most sysadmins, when I think of the init program and SystemV, I think of Linux startup and shutdown and not really much else, like managing services once they are up and running. Like init, systemd is the mother of all processes, and it is responsible for bringing the Linux host up to a state in which productive work can be done. Some of the functions assumed by systemd, which is far more extensive than the old init program, are to manage many aspects of a running Linux host, including mounting filesystems, managing hardware, handling timers, and starting and managing the system services that are required to have a productive Linux host.

This series of articles, which is based in part on excerpts from my three-volume Linux training course, [_Using and administering Linux: zero to sysadmin_][2], explores systemd's functions both at startup and beginning after startup finishes.

### Linux boot

The complete process that takes a Linux host from an off state to a running state is complex, but it is open and knowable. Before getting into the details, I'll give a quick overview from when the host hardware is turned on until the system is ready for a user to log in. Most of the time, "the boot process" is discussed as a single entity, but that is not accurate. There are, in fact, three major parts to the full boot and startup process:

  * **Hardware boot:** Initializes the system hardware
  * **Linux boot:** Loads the Linux kernel and then systemd
  * **Linux startup:** Where systemd prepares the host for productive work



The Linux startup sequence begins after the kernel has loaded either init or systemd, depending upon whether the distribution uses the old or new startup, respectively. The init and systemd programs start and manage all the other processes and are both known as the "mother of all processes" on their respective systems.

It is important to separate the hardware boot from the Linux boot from the Linux startup and to explicitly define the demarcation points between them. Understanding these differences and what part each plays in getting a Linux system to a state where it can be productive makes it possible to manage these processes and better determine where a problem is occurring during what most people refer to as "boot."

The startup process follows the three-step boot process and brings the Linux computer up to an operational state in which it is usable for productive work. The startup process begins when the kernel transfers control of the host to systemd.

### systemd controversy

systemd can evoke a wide range of reactions from sysadmins and others responsible for keeping Linux systems up and running. The fact that systemd is taking over so many tasks in many Linux systems has engendered pushback and discord among certain groups of developers and sysadmins.

SystemV and systemd are two different methods of performing the Linux startup sequence. SystemV start scripts and the init program are the old methods, and systemd using targets is the new method. Although most modern Linux distributions use the newer systemd for startup, shutdown, and process management, there are still some that do not. One reason is that some distribution maintainers and some sysadmins prefer the older SystemV method over the newer systemd.

I think both have advantages.

#### Why I prefer SystemV

I prefer SystemV because it is more open. Startup is accomplished using Bash scripts. After the kernel starts the init program, which is a compiled binary, init launches the **rc.sysinit** script, which performs many system initialization tasks. After **rc.sysinit** completes, init launches the **/etc/rc.d/rc** script, which in turn starts the various services defined by the SystemV start scripts in the **/etc/rc.d/rcX.d**, where "X" is the number of the runlevel being started.

Except for the init program itself, all these programs are open and easily knowable scripts. It is possible to read through these scripts and learn exactly what is taking place during the entire startup process, but I don't think many sysadmins actually do that. Each start script is numbered so that it starts its intended service in a specific sequence. Services are started serially, and only one service starts at a time.

systemd, developed by Red Hat's Lennart Poettering and Kay Sievers, is a complex system of large, compiled binary executables that are not understandable without access to the source code. It is open source, so "access to the source code" isn't hard, just less convenient. systemd appears to represent a significant refutation of multiple tenets of the Linux philosophy. As a binary, systemd is not directly open for the sysadmin to view or make easy changes. systemd tries to do everything, such as managing running services, while providing significantly more status information than SystemV. It also manages hardware, processes, and groups of processes, filesystem mounts, and much more. systemd is present in almost every aspect of the modern Linux host, making it the one-stop tool for system management. All of this is a clear violation of the tenets that programs should be small and that each program should do one thing and do it well.

#### Why I prefer systemd

I prefer systemd as my startup mechanism because it starts as many services as possible in parallel, depending upon the current stage in the startup process. This speeds the overall startup and gets the host system to a login screen faster than SystemV.

systemd manages almost every aspect of a running Linux system. It can manage running services while providing significantly more status information than SystemV. It also manages hardware, processes and groups of processes, filesystem mounts, and much more. systemd is present in almost every aspect of the modern Linux operating system, making it the one-stop tool for system management. (Does this sound familiar?)

The systemd tools are compiled binaries, but the tool suite is open because all the configuration files are ASCII text files. Startup configuration can be modified through various GUI and command-line tools, as well as adding or modifying various configuration files to suit the needs of the specific local computing environment.

#### The real issue

Did you think I could not like both startup systems? I do, and I can work with either one.

In my opinion, the real issue and the root cause of most of the controversy between SystemV and systemd is that there is [no choice][3] on the sysadmin level. The choice of whether to use SystemV or systemd has already been made by the developers, maintainers, and packagers of the various distributions—but with good reason. Scooping out and replacing an init system, by its extreme, invasive nature, has a lot of consequences that would be hard to tackle outside the distribution design process.

Despite the fact that this choice is made for me, my Linux hosts boot up and work, which is what I usually care the most about. As an end user and even as a sysadmin, my primary concern is whether I can get my work done, work such as writing my books and this article, installing updates, and writing scripts to automate everything. So long as I can do my work, I don't really care about the start sequence used on my distro.

I do care when there is a problem during startup or service management. Regardless of which startup system is used on a host, I know enough to follow the sequence of events to find the failure and fix it.

#### Replacing SystemV

There have been previous attempts at replacing SystemV with something a bit more modern. For about two releases, Fedora used a thing called Upstart to replace the aging SystemV, but it did not replace init and provided no changes that I noticed. Because Upstart provided no significant changes to the issues surrounding SystemV, efforts in this direction were quickly dropped in favor of systemd.

Despite the fact that most Linux developers agree that replacing the old SystemV startup is a good idea, many developers and sysadmins dislike systemd for that. Rather than rehash all the so-called issues that people have—or had—with systemd, I will refer you to two good, if somewhat old, articles that should cover most everything. Linus Torvalds, the creator of the Linux kernel, seems disinterested. In a 2014 ZDNet article, _[Linus Torvalds and others on Linux's systemd][4]_, Linus is clear about his feelings.

> "I don't actually have any particularly strong opinions on systemd itself. I've had issues with some of the core developers that I think are much too cavalier about bugs and compatibility, and I think some of the design details are insane (I dislike the binary logs, for example), but those are details, not big issues."

In case you don't know much about Linus, I can tell you that if he does not like something, he is very outspoken, explicit, and quite clear about that dislike. He has become more socially acceptable in his manner of addressing his dislike about things.

In 2013, Poettering wrote a long blog post in which he debunks the [myths about systemd][5] while providing insight into some of the reasons for creating it. This is a very good read, and I highly recommend it.

### systemd tasks

Depending upon the options used during the compile process (which are not considered in this series), systemd can have as many as 69 binary executables that perform the following tasks, among others:

  * The systemd program runs as PID 1 and provides system startup of as many services in parallel as possible, which, as a side effect, speeds overall startup times. It also manages the shutdown sequence.
  * The systemctl program provides a user interface for service management.
  * Support for SystemV and LSB start scripts is offered for backward compatibility.
  * Service management and reporting provide more service status data than SystemV.
  * It includes tools for basic system configuration, such as hostname, date, locale, lists of logged-in users, running containers and virtual machines, system accounts, runtime directories and settings, daemons to manage simple network configuration, network time synchronization, log forwarding, and name resolution.
  * It offers socket management.
  * systemd timers provide advanced cron-like capabilities to include running a script at times relative to system boot, systemd startup, the last time the timer was started, and more.
  * It provides a tool to analyze dates and times used in timer specifications.
  * Mounting and unmounting of filesystems with hierarchical awareness allows safer cascading of mounted filesystems.
  * It enables the positive creation and management of temporary files, including deletion.
  * An interface to D-Bus provides the ability to run scripts when devices are plugged in or removed. This allows all devices, whether pluggable or not, to be treated as plug-and-play, which considerably simplifies device handling.
  * Its tool to analyze the startup sequence can be used to locate the services that take the most time.
  * It includes journals for storing system log messages and tools for managing the journals.



### Architecture

Those tasks and more are supported by a number of daemons, control programs, and configuration files. Figure 1 shows many of the components that belong to systemd. This is a simplified diagram designed to provide a high-level overview, so it does not include all of the individual programs or files. Nor does it provide any insight into data flow, which is so complex that it would be a useless exercise in the context of this series of articles.

![systemd architecture][6]

A full exposition of systemd would take a book on its own. You do not need to understand the details of how the systemd components in Figure 1 fit together; it's enough to know about the programs and components that enable managing various Linux services and deal with log files and journals. But it's clear that systemd is not the monolithic monstrosity it is purported to be by some of its critics.

### systemd as PID 1

systemd is PID 1. Some of its functions, which are far more extensive than the old SystemV3 init program, are to manage many aspects of a running Linux host, including mounting filesystems and starting and managing system services required to have a productive Linux host. Any of systemd's tasks that are not related to the startup sequence are outside the scope of this article (but some will be explored later in this series).

First, systemd mounts the filesystems defined by **/etc/fstab**, including any swap files or partitions. At this point, it can access the configuration files located in **/etc**, including its own. It uses its configuration link, **/etc/systemd/system/default.target**, to determine which state or target it should boot the host into. The **default.target** file is a symbolic link to the true target file. For a desktop workstation, this is typically going to be the **graphical.target**, which is equivalent to runlevel 5 in SystemV. For a server, the default is more likely to be the **multi-user.target**, which is like runlevel 3 in SystemV. The **emergency.target** is similar to single-user mode. Targets and services are systemd units.

The table below (Figure 2) compares the systemd targets with the old SystemV startup runlevels. systemd provides the systemd target aliases for backward compatibility. The target aliases allow scripts—and many sysadmins—to use SystemV commands like **init 3** to change runlevels. Of course, the SystemV commands are forwarded to systemd for interpretation and execution.

**systemd targets** | **SystemV runlevel** | **target aliases** | **Description**
---|---|---|---
default.target |  |  | This target is always aliased with a symbolic link to either **multi-user.target** or **graphical.target**. systemd always uses the **default.target** to start the system. The **default.target** should never be aliased to **halt.target**, **poweroff.target**, or **reboot.target**.
graphical.target | 5 | runlevel5.target | **Multi-user.target** with a GUI
| 4 | runlevel4.target | Unused. Runlevel 4 was identical to runlevel 3 in the SystemV world. This target could be created and customized to start local services without changing the default **multi-user.target**.
multi-user.target | 3 | runlevel3.target | All services running, but command-line interface (CLI) only
| 2 | runlevel2.target | Multi-user, without NFS, but all other non-GUI services running
rescue.target | 1 | runlevel1.target | A basic system, including mounting the filesystems with only the most basic services running and a rescue shell on the main console
emergency.target | S |  | Single-user mode—no services are running; filesystems are not mounted. This is the most basic level of operation with only an emergency shell running on the main console for the user to interact with the system.
halt.target |  |  | Halts the system without powering it down
reboot.target | 6 | runlevel6.target | Reboot
poweroff.target | 0 | runlevel0.target | Halts the system and turns the power off

Each target has a set of dependencies described in its configuration file. systemd starts the required dependencies, which are the services required to run the Linux host at a specific level of functionality. When all the dependencies listed in the target configuration files are loaded and running, the system is running at that target level. In Figure 2, the targets with the most functionality are at the top of the table, with functionality declining towards the bottom of the table.

systemd also looks at the legacy SystemV init directories to see if any startup files exist there. If so, systemd uses them as configuration files to start the services described by the files. The deprecated network service is a good example of one that still uses SystemV startup files in Fedora.

Figure 3 (below) is copied directly from the bootup man page. It shows a map of the general sequence of events during systemd startup and the basic ordering requirements to ensure a successful startup.


```
                                         cryptsetup-pre.target
                                                   |
 (various low-level                                v
     API VFS mounts:                 (various cryptsetup devices...)
  mqueue, configfs,                                |    |
  debugfs, ...)                                    v    |
  |                                  cryptsetup.target  |
  |  (various swap                                 |    |    remote-fs-pre.target
  |   devices...)                                  |    |     |        |
  |    |                                           |    |     |        v
  |    v                       local-fs-pre.target |    |     |  (network file systems)
  |  swap.target                       |           |    v     v                 |
  |    |                               v           |  remote-cryptsetup.target  |
  |    |  (various low-level  (various mounts and  |             |              |
  |    |   services: udevd,    fsck services...)   |             |    remote-fs.target
  |    |   tmpfiles, random            |           |             |             /
  |    |   seed, sysctl, ...)          v           |             |            /
  |    |      |                 local-fs.target    |             |           /
  |    |      |                        |           |             |          /
  \\____|______|_______________   ______|___________/             |         /
                              \ /                                |        /
                               v                                 |       /
                        sysinit.target                           |      /
                               |                                 |     /
        ______________________/|\\_____________________           |    /
       /              |        |      |               \          |   /
       |              |        |      |               |          |  /
       v              v        |      v               |          | /
  (various       (various      |  (various            |          |/
   timers...)      paths...)   |   sockets...)        |          |
       |              |        |      |               |          |
       v              v        |      v               |          |
 timers.target  paths.target   |  sockets.target      |          |
       |              |        |      |               v          |
       v              \\_______ | _____/         rescue.service   |
                              \|/                     |          |
                               v                      v          |
                           basic.target         rescue.target    |
                               |                                 |
                       ________v____________________             |
                      /              |              \            |
                      |              |              |            |
                      v              v              v            |
                  display-    (various system   (various system  |
              manager.service     services        services)      |
                      |         required for        |            |
                      |        graphical UIs)       v            v
                      |              |            multi-user.target
 emergency.service    |              |              |
         |            \\_____________ | _____________/
         v                          \|/
 emergency.target                    v
                              graphical.target
```

The **sysinit.target** and **basic.target** targets can be considered checkpoints in the startup process. Although one of systemd's design goals is to start system services in parallel, certain services and functional targets must be started before other services and targets can start. These checkpoints cannot be passed until all of the services and targets required by that checkpoint are fulfilled.

The **sysinit.target** is reached when all of the units it depends on are completed. All of those units, mounting filesystems, setting up swap files, starting udev, setting the random generator seed, initiating low-level services, and setting up cryptographic services (if one or more filesystems are encrypted), must be completed but, within the **sysinit.target**, those tasks can be performed in parallel.

The **sysinit.target** starts up all of the low-level services and units required for the system to be marginally functional and that are required to enable moving onto the **basic.target**.

After the **sysinit.target** is fulfilled, systemd then starts all the units required to fulfill the next target. The basic target provides some additional functionality by starting units that are required for all of the next targets. These include setting up things like paths to various executable directories, communication sockets, and timers.

Finally, the user-level targets, **multi-user.target** or **graphical.target**, can be initialized. The **multi-user.target** must be reached before the graphical target dependencies can be met. The underlined targets in Figure 3 are the usual startup targets. When one of these targets is reached, startup has completed. If the **multi-user.target** is the default, then you should see a text-mode login on the console. If **graphical.target** is the default, then you should see a graphical login; the specific GUI login screen you see depends on your default display manager.

The bootup man page also describes and provides maps of the boot into the initial RAM disk and the systemd shutdown process.

systemd also provides a tool that lists dependencies of a complete startup or for a specified unit. A unit is a controllable systemd resource entity that can range from a specific service, such as httpd or sshd, to timers, mounts, sockets, and more. Try the following command and scroll through the results.


```
`systemctl list-dependencies graphical.target`
```

Notice that this fully expands the top-level target units list required to bring the system up to the graphical target run mode. Use the **\--all** option to expand all of the other units as well.


```
`systemctl list-dependencies --all graphical.target`
```

You can search for strings such as "target," "slice," and "socket" using the search tools of the **less** command.

So now, try the following.


```
`systemctl list-dependencies multi-user.target`
```

and


```
`systemctl list-dependencies rescue.target`
```

and


```
`systemctl list-dependencies local-fs.target`
```

and


```
`systemctl list-dependencies dbus.service`
```

This tool helps me visualize the specifics of the startup dependencies for the host I am working on. Go ahead and spend some time exploring the startup tree for one or more of your Linux hosts. But be careful because the systemctl man page contains this note:

> _"Note that this command only lists units currently loaded into memory by the service manager. In particular, this command is not suitable to get a comprehensive list at all reverse dependencies on a specific unit, as it won't list the dependencies declared by units currently not loaded."_

### Final thoughts

Even before getting very deep into systemd, it's obvious that it is both powerful and complex. It is also apparent that systemd is not a single, huge, monolithic, and unknowable binary file. Rather, it is composed of a number of smaller components and subcommands that are designed to perform specific tasks.

The next article in this series will explore systemd startup in more detail, as well as systemd configuration files, changing the default target, and how to create a simple service unit.

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup.

  * The Fedora Project has a good, practical [guide][7] [to systemd][7]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][8] that cross-references the old SystemV commands to comparable systemd ones.
  * For detailed technical information about systemd and the reasons for creating it, check out [Freedesktop.org][9]'s [description of systemd][10].
  * [Linux.com][11]'s "More systemd fun" offers more advanced systemd [information and tips][12].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

  * [Rethinking PID 1][13]
  * [systemd for Administrators, Part I][14]
  * [systemd for Administrators, Part II][15]
  * [systemd for Administrators, Part III][16]
  * [systemd for Administrators, Part IV][17]
  * [systemd for Administrators, Part V][18]
  * [systemd for Administrators, Part VI][19]
  * [systemd for Administrators, Part VII][20]
  * [systemd for Administrators, Part VIII][21]
  * [systemd for Administrators, Part IX][22]
  * [systemd for Administrators, Part X][23]
  * [systemd for Administrators, Part XI][24]



Alison Chiaken, a Linux kernel and systems programmer at Mentor Graphics, offers a preview of her...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/systemd

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: http://www.both.org/?page_id=1183
[3]: http://www.osnews.com/story/28026/Editorial_Thoughts_on_Systemd_and_the_Freedom_to_Choose
[4]: https://www.zdnet.com/article/linus-torvalds-and-others-on-linuxs-systemd/
[5]: http://0pointer.de/blog/projects/the-biggest-myths.html
[6]: https://opensource.com/sites/default/files/uploads/systemd-architecture.png (systemd architecture)
[7]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[8]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[9]: http://Freedesktop.org
[10]: http://www.freedesktop.org/wiki/Software/systemd
[11]: http://Linux.com
[12]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[13]: http://0pointer.de/blog/projects/systemd.html
[14]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[16]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[17]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[18]: http://0pointer.de/blog/projects/three-levels-of-off.html
[19]: http://0pointer.de/blog/projects/changing-roots
[20]: http://0pointer.de/blog/projects/blame-game.html
[21]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[22]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[23]: http://0pointer.de/blog/projects/instances.html
[24]: http://0pointer.de/blog/projects/inetd.html

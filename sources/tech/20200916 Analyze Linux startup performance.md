[#]: collector: (lujun9972)
[#]: translator: (jiamn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Analyze Linux startup performance)
[#]: via: (https://opensource.com/article/20/9/systemd-startup-configuration)
[#]: author: (David Both https://opensource.com/users/dboth)

Analyze Linux startup performance
======
Use systemd-analyze to get insights and solve problems with Linux
startup performance.
![Magnifying glass on code][1]

Part of the system administrator's job is to analyze the performance of systems and to find and resolve problems that cause poor performance and long startup times. Sysadmins also need to check other aspects of systemd configuration and usage.

The systemd init system provides the `systemd-analyze` tool that can help uncover performance problems and other important systemd information. In a previous article, [_Analyzing systemd calendar and timespans_][2], I used `systemd-analyze` to analyze timestamps and timespans in systemd timers, but this tool has many other uses, some of which I will explore in this article.

### Startup overview

The Linux startup sequence is a good place to begin exploring because many `systemd-analyze` tool functions are targeted at startup. But first, it is important to understand the difference between boot and startup. The boot sequence starts with the BIOS power-on self test (POST) and ends when the kernel is finished loading and takes control of the host system, which is the beginning of startup and the point when the systemd journal begins.

In the second article in this series, [_Understanding systemd at startup on Linux_][3], I discuss startup in a bit more detail with respect to what happens and in what sequence. In this article, I want to examine the startup sequence to look at the amount of time it takes to go through startup and which tasks take the most time.

The results I'll show below are from my primary workstation, which is much more interesting than a virtual machine's results. This workstation consists of an ASUS TUF X299 Mark 2 motherboard, an Intel i9-7960X CPU with 16 cores and 32 CPUs (threads), and 64GB of RAM. Some of the commands below can be run by a non-root user, but I will use root in this article to prevent having to switch between users.

There are several options for examining the startup sequence. The simplest form of the `systemd-analyze` command displays an overview of the amount of time spent in each of the main sections of startup, the kernel startup, loading and running `initrd` (i.e., initial ramdisk, a temporary system image that is used to initialize some hardware and mount the `/` [root] filesystem), and userspace (where all the programs and daemons required to bring the host up to a usable state are loaded). If no subcommand is passed to the command, `systemd-analyze time` is implied:


```
[root@david ~]$ systemd-analyze
Startup finished in 53.921s (firmware) + 2.643s (loader) + 2.236s (kernel) + 4.348s (initrd) + 10.082s (userspace) = 1min 13.233s
graphical.target reached after 10.071s in userspace
[root@david ~]#
```

The most notable data in this output is the amount of time spent in firmware (BIOS): almost 54 seconds. This is an extraordinary amount of time, and none of my other physical systems take anywhere near as long to get through BIOS.

My System76 Oryx Pro laptop spends only 8.506 seconds in BIOS, and all of my home-built systems take a bit less than 10 seconds. After some online searches, I found that this motherboard is known for its inordinately long BIOS boot time. My motherboard never "just boots." It always hangs, and I need to do a power off/on cycle, and then BIOS starts with an error, and I need to press F1 to enter BIOS configuration, from where I can select the boot drive and finish the boot. This is where the extra time comes from.

Not all hosts show firmware data. My unscientific experiments lead me to believe that this data is shown only for Intel generation 9 processors or above. But that could be incorrect.

This overview of the boot startup process is interesting and provides good (though limited) information, but there is much more information available about startup, as I'll describe below.

### Assigning blame

You can use `systemd-analyze blame` to discover which systemd units take the most time to initialize. The results are displayed in order by the amount of time they take to initialize, from most to least:


```
[root@david ~]$ systemd-analyze blame                                                                        
       5.417s NetworkManager-wait-online.service                                                      
       3.423s dracut-initqueue.service                                                                
       2.715s systemd-udev-settle.service                                                              
       2.519s fstrim.service                                                                          
       1.275s udisks2.service                                                                          
       1.271s smartd.service                                                                          
        996ms upower.service                                                                          
        637ms lvm2-monitor.service                                                                    
        533ms lvm2-pvscan@8:17.service                                                                
        520ms dmraid-activation.service                                                                
        460ms vboxdrv.service                                                                          
        396ms initrd-switch-root.service
&lt;SNIP – removed lots of entries with increasingly small times&gt;
```

Because many of these services start in parallel, the numbers may add up to significantly more than the total given by `systemd-analyze time` for everything after the BIOS. All of these are small numbers, so I cannot find any significant savings here.

The data from this command can provide indications about which services you might consider to improve boot times. Services that are not used can be disabled. There does not appear to be any single service that is taking an excessively long time during this startup sequence. You may see different results for each boot and startup.

### Critical chains

Like the critical path in project management, a _critical chain_ shows the time-critical chain of events that take place during startup. These are the systemd units you want to look at if startup is slow, as they are the ones that would cause delays. This tool does not display all the units that start, only those in this critical chain of events:


```
[root@david ~]# systemd-analyze critical-chain
The time when unit became active or started is printed after the "@" character.
The time the unit took to start is printed after the "+" character.

graphical.target @10.071s
└─lxdm.service @10.071s
  └─plymouth-quit.service @10.047s +22ms
    └─systemd-user-sessions.service @10.031s +7ms
      └─remote-fs.target @10.026s
        └─remote-fs-pre.target @10.025s
          └─nfs-client.target @4.636s
            └─gssproxy.service @4.607s +28ms
              └─network.target @4.604s
                └─NetworkManager.service @4.383s +219ms
                  └─dbus-broker.service @4.434s +136ms
                    └─dbus.socket @4.369s
                      └─sysinit.target @4.354s
                        └─systemd-update-utmp.service @4.345s +9ms
                          └─auditd.service @4.301s +42ms
                            └─systemd-tmpfiles-setup.service @4.254s +42ms
                              └─import-state.service @4.233s +19ms
                                └─local-fs.target @4.229s
                                  └─Virtual.mount @4.019s +209ms
                                    └─systemd-fsck@dev-mapper-vg_david2\x2dVirtual.service @3.742s +274ms
                                      └─local-fs-pre.target @3.726s
                                        └─lvm2-monitor.service @356ms +637ms
                                          └─dm-event.socket @319ms
                                            └─-.mount
                                              └─system.slice
                                                └─-.slice
[root@david ~]#
```

The numbers preceded with `@` show the absolute number of seconds since startup began when the unit becomes active. The numbers preceded by `+` show the amount of time it takes for the unit to start.

### System state

Sometimes you need to determine the system's current state. The `systemd-analyze dump` command dumps a _massive_ amount of data about the current system state. It starts with a list of the primary boot timestamps, a list of each systemd unit, and a complete description of the state of each:


```
[root@david ~]# systemd-analyze dump
Timestamp firmware: 1min 7.983523s
Timestamp loader: 3.872325s
Timestamp kernel: Wed 2020-08-26 12:33:35 EDT
Timestamp initrd: Wed 2020-08-26 12:33:38 EDT
Timestamp userspace: Wed 2020-08-26 12:33:42 EDT
Timestamp finish: Wed 2020-08-26 16:33:56 EDT
Timestamp security-start: Wed 2020-08-26 12:33:42 EDT
Timestamp security-finish: Wed 2020-08-26 12:33:42 EDT
Timestamp generators-start: Wed 2020-08-26 16:33:42 EDT
Timestamp generators-finish: Wed 2020-08-26 16:33:43 EDT
Timestamp units-load-start: Wed 2020-08-26 16:33:43 EDT
Timestamp units-load-finish: Wed 2020-08-26 16:33:43 EDT
Timestamp initrd-security-start: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-security-finish: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-generators-start: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-generators-finish: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-units-load-start: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-units-load-finish: Wed 2020-08-26 12:33:38 EDT
-&gt; Unit system.slice:
        Description: System Slice
        Instance: n/a
        Unit Load State: loaded
        Unit Active State: active
        State Change Timestamp: Wed 2020-08-26 12:33:38 EDT
        Inactive Exit Timestamp: Wed 2020-08-26 12:33:38 EDT
        Active Enter Timestamp: Wed 2020-08-26 12:33:38 EDT
        Active Exit Timestamp: n/a
        Inactive Enter Timestamp: n/a
        May GC: no
&lt;SNIP – Deleted a bazillion lines of output&gt;
```

On my main workstation, this command generated a stream of 49,680 lines and about 1.66MB. This command is very fast, so you don't need to wait for the results.

I do like the wealth of detail provided for the various connected devices, such as storage. Each systemd unit has a section with details such as modes for various runtimes, cache, and log directories, the command line used to start the unit, the process ID (PID), the start timestamp, as well as memory and file limits.

The man page for `systemd-analyze` shows the `systemd-analyze --user dump` option, which is intended to display information about the internal state of the user manager. This fails for me, and internet searches indicate that there may be a problem with it. In systemd, `--user` instances are used to manage and control the resources for the hierarchy of processes belonging to each user. The processes for each user are part of a control group, which I'll cover in a future article.

### Analytic graphs

Most pointy-haired-bosses (PHBs) and many good managers find pretty graphs easier to read and understand than the text-based system performance data I usually prefer. Sometimes, though, even I like a good graph, and `systemd-analyze` provides the capability to display boot/startup data in an [SVG][4] vector graphics chart.

The following command generates a vector graphics file that displays the events that take place during boot and startup. It only takes a few seconds to generate this file:


```
`[root@david ~]# systemd-analyze plot > /tmp/bootup.svg`
```

This command creates an SVG, which is a text file that defines a series of graphic vectors that applications, including Image Viewer, Ristretto, Okular, Eye of Mate, LibreOffice Draw, and others, use to generate a graph. These applications process SVG files to create an image.

I used LibreOffice Draw to render a graph. The graph is huge, and you need to zoom in considerably to make out any detail. Here is a small portion of it:

![The bootup.svg file displayed in LibreOffice Draw.][5]

(David Both, [CC BY-SA 4.0][6])

The bootup sequence is to the left of the zero (0) on the timeline in the graph, and the startup sequence is to the right of zero. This small portion shows the kernel, `initrd`, and the processes `initrd` started.

This graph shows at a glance what started when, how long it took to start up, and the major dependencies. The critical path is highlighted in red.

Another command that generates graphical output is `systemd-analyze plot`. It generates textual dependency graph descriptions in [DOT][7] format. The resulting data stream is then piped through the `dot` utility, which is part of a family of programs that can be used to generate vector graphic files from various types of data. These SVG files can also be processed by the tools listed above.

First, generate the file. This took almost nine minutes on my primary workstation:


```
[root@david ~]# time systemd-analyze dot | dot -Tsvg &gt; /tmp/test.svg
   Color legend: black     = Requires
                 dark blue = Requisite
                 dark grey = Wants
                 red       = Conflicts
                 green     = After

real    8m37.544s
user    8m35.375s
sys     0m0.070s
[root@david ~]#
```

I won't reproduce the output here because the resulting graph is pretty much spaghetti. But you should try it and view the result to see what I mean.

### Conditionals

One of the more interesting, yet somewhat generic, capabilities I discovered while reading the `systemd-analyze(1)` man page is the `condition` subcommand. (Yes—I do read the man pages, and it is amazing what I have learned this way!) This `condition` subcommand can be used to test the conditions and asserts that can be used in systemd unit files.

It can also be used in scripts to evaluate one or more conditions—it returns a zero (0) if all are met or a one (1) if any condition is not met. In either case, it also spews text about its findings.

The example below, from the man page, is a bit complex. It tests for a kernel version between 4.0 and 5.1, that the host is running on AC power, that the system architecture is anything but ARM, and that the directory `/etc/os-release` exists. I added the `echo $?` statement to print the return code.


```
[root@david ~]# systemd-analyze condition 'ConditionKernelVersion = ! &lt;4.0' \
                    'ConditionKernelVersion = &gt;=5.1' \
                    'ConditionACPower=|false' \
                    'ConditionArchitecture=|!arm' \
                    'AssertPathExists=/etc/os-release' ; \
echo $?
test.service: AssertPathExists=/etc/os-release succeeded.
Asserts succeeded.
test.service: ConditionArchitecture=|!arm succeeded.
test.service: ConditionACPower=|false failed.
test.service: ConditionKernelVersion=&gt;=5.1 succeeded.
test.service: ConditionKernelVersion=!&lt;4.0 succeeded.
Conditions succeeded.
0
[root@david ~]#
```

The list of conditions and asserts starts around line 600 on the `systemd.unit(5)` man page.

### Listing configuration files

The `systemd-analyze` tool provides a way to send the contents of various configuration files to `STDOUT`, as shown here. The base directory is `/etc/`:


```
[root@david ~]# systemd-analyze cat-config systemd/system/display-manager.service
# /etc/systemd/system/display-manager.service
[Unit]
Description=LXDM (Lightweight X11 Display Manager)
#Documentation=man:lxdm(8)
Conflicts=[getty@tty1.service][8]
After=systemd-user-sessions.service [getty@tty1.service][8] plymouth-quit.service livesys-late.service
#Conflicts=plymouth-quit.service

[Service]
ExecStart=/usr/sbin/lxdm
Restart=always
IgnoreSIGPIPE=no
#BusName=org.freedesktop.lxdm

[Install]
Alias=display-manager.service
[root@david ~]#
```

This is a lot of typing to do nothing more than a standard `cat` command does. I find the next command a tiny bit helpful. It can search out files with the specified pattern within the standard systemd locations:


```
[root@david ~]# systemctl cat backup*
# /etc/systemd/system/backup.timer
# This timer unit runs the local backup program
# (C) David Both
# Licensed under GPL V2
#

[Unit]
Description=Perform system backups
Requires=backup.service

[Timer]
Unit=backup.service
OnCalendar=*-*-* 00:15:30

[Install]
WantedBy=timers.target

# /etc/systemd/system/backup.service
# This service unit runs the rsbu backup program
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=Backup services using rsbu
Wants=backup.timer

[Service]
Type=oneshot
Environment="HOME=/root"
ExecStart=/usr/local/bin/rsbu -bvd1
ExecStart=/usr/local/bin/rsbu -buvd2

[Install]
WantedBy=multi-user.target

[root@david ~]#
```

Both of these commands preface the contents of each file with a comment line containing the file's full path and name.

### Unit file verification

After creating a new unit file, it can be helpful to verify that its syntax is correct. This is what the `verify` subcommand does. It can list directives that are spelled incorrectly and call out missing service units:


```
`[root@david ~]# systemd-analyze verify /etc/systemd/system/backup.service`
```

Adhering to the Unix/Linux philosophy that "silence is golden," a lack of output messages means that there are no errors in the scanned file.

### Security

The `security` subcommand checks the security level of specified services. It only works on service units and not on other types of unit files:


```
[root@david ~]# systemd-analyze security display-manager
  NAME                                                        DESCRIPTION                                                     &gt;
✗ PrivateNetwork=                                             Service has access to the host's network                        &gt;
✗ User=/DynamicUser=                                          Service runs as root user                                       &gt;
✗ CapabilityBoundingSet=~CAP_SET(UID|GID|PCAP)                Service may change UID/GID identities/capabilities              &gt;
✗ CapabilityBoundingSet=~CAP_SYS_ADMIN                        Service has administrator privileges                            &gt;
✗ CapabilityBoundingSet=~CAP_SYS_PTRACE                       Service has ptrace() debugging abilities                        &gt;
✗ RestrictAddressFamilies=~AF_(INET|INET6)                    Service may allocate Internet sockets                           &gt;
✗ RestrictNamespaces=~CLONE_NEWUSER                           Service may create user namespaces                              &gt;
✗ RestrictAddressFamilies=~…                                  Service may allocate exotic sockets                             &gt;
✗ CapabilityBoundingSet=~CAP_(CHOWN|FSETID|SETFCAP)           Service may change file ownership/access mode/capabilities unres&gt;
✗ CapabilityBoundingSet=~CAP_(DAC_*|FOWNER|IPC_OWNER)         Service may override UNIX file/IPC permission checks            &gt;
✗ CapabilityBoundingSet=~CAP_NET_ADMIN                        Service has network configuration privileges                    &gt;
✗ CapabilityBoundingSet=~CAP_SYS_MODULE                       Service may load kernel modules
&lt;SNIP&gt;
✗ CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG                   Service may issue vhangup()                                     &gt;
✗ CapabilityBoundingSet=~CAP_WAKE_ALARM                       Service may program timers that wake up the system              &gt;
✗ RestrictAddressFamilies=~AF_UNIX                            Service may allocate local sockets                              &gt;

→ Overall exposure level for backup.service: 9.6 UNSAFE 😨
lines 34-81/81 (END)
```

Yes, the emoji is part of the output. But, of course, many services need pretty much complete access to everything in order to do their work. I ran this program against several services, including my own backup service; the results may differ, but the bottom line seems to be mostly the same.

This tool would be very useful for checking and fixing userspace service units in security-critical environments. I don't think it has much to offer for most of us.

### Final thoughts

This powerful tool offers some interesting and amazingly useful options. Much of what this article explores is about using `systemd-analyze` to provide insights into Linux's startup performance using systemd. It can also analyze other aspects of systemd.

Some of these tools are of limited use, and a couple should be forgotten completely. But most can be used to good effect when resolving problems with startup and other systemd functions.

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup. This list has grown since I started this series of articles to reflect the research I have done.

  * The [systemd.unit(5) manual page][9] contains a nice list of unit file sections and their configuration options along with concise descriptions of each.
  * The Fedora Project has a good, practical [guide to systemd][10]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][11] that cross-references the old SystemV commands to comparable systemd ones.
  * Red Hat documentation contains a good description of the [Unit file structure][12] as well as other important information.  
  * For detailed technical information about systemd and the reasons for creating it, check out Freedesktop.org's [description of systemd][13].
  * [Linux.com][14]'s "More systemd fun" offers more advanced systemd [information and tips][15].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

  * [Rethinking PID 1][16]
  * [systemd for Administrators, Part I][17]
  * [systemd for Administrators, Part II][18]
  * [systemd for Administrators, Part III][19]
  * [systemd for Administrators, Part IV][20]
  * [systemd for Administrators, Part V][21]
  * [systemd for Administrators, Part VI][22]
  * [systemd for Administrators, Part VII][23]
  * [systemd for Administrators, Part VIII][24]
  * [systemd for Administrators, Part IX][25]
  * [systemd for Administrators, Part X][26]
  * [systemd for Administrators, Part XI][27]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/systemd-startup-configuration

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://opensource.com/article/20/7/systemd-calendar-timespans
[3]: https://opensource.com/article/20/5/systemd-startup?utm_campaign=intrel
[4]: https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
[5]: https://opensource.com/sites/default/files/uploads/bootup.svg-graph.png (The bootup.svg file displayed in LibreOffice Draw.)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://en.wikipedia.org/wiki/DOT_(graph_description_language)
[8]: mailto:getty@tty1.service
[9]: https://man7.org/linux/man-pages/man5/systemd.unit.5.html
[10]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[11]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[12]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-services-with-systemd_configuring-basic-system-settings#Managing_Services_with_systemd-Unit_File_Structure
[13]: https://www.freedesktop.org/wiki/Software/systemd/
[14]: http://Linux.com
[15]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[16]: http://0pointer.de/blog/projects/systemd.html
[17]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[18]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[19]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[20]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[21]: http://0pointer.de/blog/projects/three-levels-of-off.html
[22]: http://0pointer.de/blog/projects/changing-roots
[23]: http://0pointer.de/blog/projects/blame-game.html
[24]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[25]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[26]: http://0pointer.de/blog/projects/instances.html
[27]: http://0pointer.de/blog/projects/inetd.html

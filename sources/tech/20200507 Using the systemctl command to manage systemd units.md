[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using the systemctl command to manage systemd units)
[#]: via: (https://opensource.com/article/20/5/systemd-units)
[#]: author: (David Both https://opensource.com/users/dboth)

Using the systemctl command to manage systemd units
======
Units are the basis of everything in systemd.
![woman on laptop sitting at the window][1]

In the first two articles in this series, I explored the Linux systemd startup sequence. In the [first article][2], I looked at systemd's functions and architecture and the controversy around its role as a replacement for the old SystemV init program and startup scripts. And in the [second article][3], I examined two important systemd tools, systemctl and journalctl, and explained how to switch from one target to another and to change the default target.

In this third article, I'll look at systemd units in more detail and how to use the systemctl command to explore and manage units. I'll also explain how to stop and disable units and how to create a new systemd mount unit to mount a new filesystem and enable it to initiate during startup.

### Preparation

All of the experiments in this article should be done as the root user (unless otherwise specified). Some of the commands that simply list various systemd units can be performed by non-root users, but the commands that make changes cannot. Make sure to do all of these experiments only on non-production hosts or virtual machines (VMs).

One of these experiments requires the sysstat package, so install it before you move on. For Fedora and other Red Hat-based distributions you can install sysstat with:


```
`dnf -y install sysstat`
```

The sysstat RPM installs several statistical tools that can be used for problem determination. One is [System Activity Report][4] (SAR), which records many system performance data points at regular intervals (every 10 minutes by default). Rather than run as a daemon in the background, the sysstat package installs two systemd timers. One timer runs every 10 minutes to collect data, and the other runs once a day to aggregate the daily data. In this article, I will look briefly at these timers but wait to explain how to create a timer in a future article.

### systemd suite

The fact is, systemd is more than just one program. It is a large suite of programs all designed to work together to manage nearly every aspect of a running Linux system. A full exposition of systemd would take a book on its own. Most of us do not need to understand all of the details about how all of systemd's components fit together, so I will focus on the programs and components that enable you to manage various Linux services and deal with log files and journals.

### Practical structure

The structure of systemd—outside of its executable files—is contained in its many configuration files. Although these files have different names and identifier extensions, they are all called "unit" files. Units are the basis of everything systemd.

Unit files are ASCII plain-text files that are accessible to and can be created or modified by a sysadmin. There are a number of unit file types, and each has its own man page. Figure 1 lists some of these unit file types by their filename extensions and a short description of each.

systemd unit | Description
---|---
.automount | The **.automount** units are used to implement on-demand (i.e., plug and play) and mounting of filesystem units in parallel during startup.
.device | The **.device** unit files define hardware and virtual devices that are exposed to the sysadmin in the **/dev/directory**. Not all devices have unit files; typically, block devices such as hard drives, network devices, and some others have unit files.
.mount | The **.mount** unit defines a mount point on the Linux filesystem directory structure.
.scope | The **.scope** unit defines and manages a set of system processes. This unit is not configured using unit files, rather it is created programmatically. Per the **systemd.scope** man page, “The main purpose of scope units is grouping worker processes of a system service for organization and for managing resources.”
.service | The **.service** unit files define processes that are managed by systemd. These include services such as crond cups (Common Unix Printing System), iptables, multiple logical volume management (LVM) services, NetworkManager, and more.
.slice | The **.slice** unit defines a “slice,” which is a conceptual division of system resources that are related to a group of processes. You can think of all system resources as a pie and this subset of resources as a “slice” out of that pie.
.socket | The **.socket** units define interprocess communication sockets, such as network sockets.
.swap | The **.swap** units define swap devices or files.
.target | The **.target** units define groups of unit files that define startup synchronization points, runlevels, and services. Target units define the services and other units that must be active in order to start successfully.
.timer | The **.timer** unit defines timers that can initiate program execution at specified times.

### systemctl

I looked at systemd's startup functions in the [second article][3], and here I'll explore its service management functions a bit further. systemd provides the **systemctl** command that is used to start and stop services, configure them to launch (or not) at system startup, and monitor the current status of running services.

In a terminal session as the root user, ensure that root's home directory ( **~** ) is the [PWD][5]. To begin looking at units in various ways, list all of the loaded and active systemd units. systemctl automatically pipes its [stdout][6] data stream through the **less** pager, so you don't have to:


```
[root@testvm1 ~]# systemctl
UNIT                                       LOAD   ACTIVE SUB       DESCRIPTION              
proc-sys-fs-binfmt_misc.automount          loaded active running   Arbitrary Executable File&gt;
sys-devices-pci0000:00-0000:00:01.1-ata7-host6-target6:0:0-6:0:0:0-block-sr0.device loaded a&gt;
sys-devices-pci0000:00-0000:00:03.0-net-enp0s3.device loaded active plugged   82540EM Gigabi&gt;
sys-devices-pci0000:00-0000:00:05.0-sound-card0.device loaded active plugged   82801AA AC'97&gt;
sys-devices-pci0000:00-0000:00:08.0-net-enp0s8.device loaded active plugged   82540EM Gigabi&gt;
sys-devices-pci0000:00-0000:00:0d.0-ata1-host0-target0:0:0-0:0:0:0-block-sda-sda1.device loa&gt;
sys-devices-pci0000:00-0000:00:0d.0-ata1-host0-target0:0:0-0:0:0:0-block-sda-sda2.device loa&gt;
&lt;snip – removed lots of lines of data from here&gt;

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

206 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.
```

As you scroll through the data in your terminal session, look for some specific things. The first section lists devices such as hard drives, sound cards, network interface cards, and TTY devices. Another section shows the filesystem mount points. Other sections include various services and a list of all loaded and active targets.

The sysstat timers at the bottom of the output are used to collect and generate daily system activity summaries for SAR. SAR is a very useful problem-solving tool. (You can learn more about it in Chapter 13 of my book [_Using and Administering Linux: Volume 1, Zero to SysAdmin: Getting Started_][7].)

Near the very bottom, three lines describe the meanings of the statuses (loaded, active, and sub). Press **q** to exit the pager.

Use the following command (as suggested in the last line of the output above) to see all the units that are installed, whether or not they are loaded. I won't reproduce the output here, because you can scroll through it on your own. The systemctl program has an excellent tab-completion facility that makes it easy to enter complex commands without needing to memorize all the options:


```
`[root@testvm1 ~]# systemctl list-unit-files`
```

You can see that some units are disabled. Table 1 in the man page for systemctl lists and provides short descriptions of the entries you might see in this listing. Use the **-t** (type) option to view just the timer units:


```
[root@testvm1 ~]# systemctl list-unit-files -t timer
UNIT FILE                    STATE  
[chrony-dnssrv@.timer][8]         disabled
dnf-makecache.timer          enabled
fstrim.timer                 disabled
logrotate.timer              disabled
logwatch.timer               disabled
[mdadm-last-resort@.timer][9]     static  
mlocate-updatedb.timer       enabled
sysstat-collect.timer        enabled
sysstat-summary.timer        enabled
systemd-tmpfiles-clean.timer static  
unbound-anchor.timer         enabled
```

You could do the same thing with this alternative, which provides considerably more detail:


```
[root@testvm1 ~]# systemctl list-timers
Thu 2020-04-16 09:06:20 EDT  3min 59s left n/a                          n/a           systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
Thu 2020-04-16 10:02:01 EDT  59min left    Thu 2020-04-16 09:01:32 EDT  49s ago       dnf-makecache.timer          dnf-makecache.service
Thu 2020-04-16 13:00:00 EDT  3h 57min left n/a                          n/a           sysstat-collect.timer        sysstat-collect.service
Fri 2020-04-17 00:00:00 EDT  14h left      Thu 2020-04-16 12:51:37 EDT  3h 49min left mlocate-updatedb.timer       mlocate-updatedb.service
Fri 2020-04-17 00:00:00 EDT  14h left      Thu 2020-04-16 12:51:37 EDT  3h 49min left unbound-anchor.timer         unbound-anchor.service
Fri 2020-04-17 00:07:00 EDT  15h left      n/a                          n/a           sysstat-summary.timer        sysstat-summary.service

6 timers listed.
Pass --all to see loaded but inactive timers, too.
[root@testvm1 ~]#
```

Although there is no option to do systemctl list-mounts, you can list the mount point unit files:


```
[root@testvm1 ~]# systemctl list-unit-files -t mount
UNIT FILE                     STATE    
-.mount                       generated
boot.mount                    generated
dev-hugepages.mount           static  
dev-mqueue.mount              static  
home.mount                    generated
proc-fs-nfsd.mount            static  
proc-sys-fs-binfmt_misc.mount disabled
run-vmblock\x2dfuse.mount     disabled
sys-fs-fuse-connections.mount static  
sys-kernel-config.mount       static  
sys-kernel-debug.mount        static  
tmp.mount                     generated
usr.mount                     generated
var-lib-nfs-rpc_pipefs.mount  static  
var.mount                     generated

15 unit files listed.
[root@testvm1 ~]#
```

The STATE column in this data stream is interesting and requires a bit of explanation. The "generated" states indicate that the mount unit was generated on the fly during startup using the information in **/etc/fstab**. The program that generates these mount units is **/lib/systemd/system-generators/systemd-fstab-generator,** along with other tools that generate a number of other unit types. The "static" mount units are for filesystems like **/proc** and **/sys**, and the files for these are located in the **/usr/lib/systemd/system** directory.

Now, look at the service units. This command will show all services installed on the host, whether or not they are active:


```
`[root@testvm1 ~]# systemctl --all -t service`
```

The bottom of this listing of service units displays 166 as the total number of loaded units on my host. Your number will probably differ.

Unit files do not have a filename extension (such as **.unit**) to help identify them, so you can generalize that most configuration files that belong to systemd are unit files of one type or another. The few remaining files are mostly **.conf** files located in **/etc/systemd**.

Unit files are stored in the **/usr/lib/systemd** directory and its subdirectories, while the **/etc/systemd/** directory and its subdirectories contain symbolic links to the unit files necessary to the local configuration of this host.

To explore this, make **/etc/systemd** the PWD and list its contents. Then make **/etc/systemd/system** the PWD and list its contents, and list the contents of at least a couple of the current PWD's subdirectories.

Take a look at the **default.target** file, which determines which runlevel target the system will boot to. In the second article in this series, I explained how to change the default target from the GUI (**graphical.target**) to the command-line only (**multi-user.target**) target. The **default.target** file on my test VM is simply a symlink to **/usr/lib/systemd/system/graphical.target**.

Take a few minutes to examine the contents of the **/etc/systemd/system/default.target** file:


```
[root@testvm1 system]# cat default.target
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Graphical Interface
Documentation=man:systemd.special(7)
Requires=multi-user.target
Wants=display-manager.service
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target display-manager.service
AllowIsolate=yes
```

Note that this requires the **multi-user.target**; the **graphical.target** cannot start if the **multi-user.target** is not already up and running. It also says it "wants" the **display-manager.service** unit. A "want" does not need to be fulfilled in order for the unit to start successfully. If the "want" cannot be fulfilled, it will be ignored by systemd, and the rest of the target will start regardless.

The subdirectories in **/etc/systemd/system** are lists of wants for various targets. Take a few minutes to explore the files and their contents in the **/etc/systemd/system/graphical.target.wants** directory.

The **systemd.unit** man page contains a lot of good information about unit files, their structure, the sections they can be divided into, and the options that can be used. It also lists many of the unit types, all of which have their own man pages. If you want to interpret a unit file, this would be a good place to start.

### Service units

A Fedora installation usually installs and enables services that particular hosts do not need for normal operation. Conversely, sometimes it doesn't include services that need to be installed, enabled, and started. Services that are not needed for the Linux host to function as desired, but which are installed and possibly running, represent a security risk and should—at minimum—be stopped and disabled and—at best—should be uninstalled.

The systemctl command is used to manage systemd units, including services, targets, mounts, and more. Take a closer look at the list of services to identify services that will never be used:


```
[root@testvm1 ~]# systemctl --all -t service
UNIT                           LOAD      ACTIVE SUB        DESCRIPTION                            
&lt;snip&gt;
chronyd.service                loaded    active running    NTP client/server                      
crond.service                  loaded    active running    Command Scheduler                      
cups.service                   loaded    active running    CUPS Scheduler                          
dbus-daemon.service            loaded    active running    D-Bus System Message Bus                
&lt;snip&gt;
● ip6tables.service           not-found inactive dead     ip6tables.service                  
● ipset.service               not-found inactive dead     ipset.service                      
● iptables.service            not-found inactive dead     iptables.service                    
&lt;snip&gt;
firewalld.service              loaded    active   running  firewalld - dynamic firewall daemon
&lt;snip&gt;
● ntpd.service                not-found inactive dead     ntpd.service                        
● ntpdate.service             not-found inactive dead     ntpdate.service                    
pcscd.service                  loaded    active   running  PC/SC Smart Card Daemon
```

I have pruned out most of the output from the command to save space. The services that show "loaded active running" are obvious. The "not-found" services are ones that systemd is aware of but are not installed on the Linux host. If you want to run those services, you must install the packages that contain them.

Note the **pcscd.service** unit. This is the PC/SC smart-card daemon. Its function is to communicate with smart-card readers. Many Linux hosts—including VMs—have no need for this reader nor the service that is loaded and taking up memory and CPU resources. You can stop this service and disable it, so it will not restart on the next boot. First, check its status:


```
[root@testvm1 ~]# systemctl status pcscd.service
● pcscd.service - PC/SC Smart Card Daemon
   Loaded: loaded (/usr/lib/systemd/system/pcscd.service; indirect; vendor preset: disabled)
   Active: active (running) since Fri 2019-05-10 11:28:42 EDT; 3 days ago
     Docs: man:pcscd(8)
 Main PID: 24706 (pcscd)
    Tasks: 6 (limit: 4694)
   Memory: 1.6M
   CGroup: /system.slice/pcscd.service
           └─24706 /usr/sbin/pcscd --foreground --auto-exit

May 10 11:28:42 testvm1 systemd[1]: Started PC/SC Smart Card Daemon.
```

This data illustrates the additional information systemd provides versus SystemV, which only reports whether or not the service is running. Note that specifying the **.service** unit type is optional. Now stop and disable the service, then re-check its status:


```
[root@testvm1 ~]# systemctl stop pcscd ; systemctl disable pcscd
Warning: Stopping pcscd.service, but it can still be activated by:
  pcscd.socket
Removed /etc/systemd/system/sockets.target.wants/pcscd.socket.
[root@testvm1 ~]# systemctl status pcscd
● pcscd.service - PC/SC Smart Card Daemon
   Loaded: loaded (/usr/lib/systemd/system/pcscd.service; indirect; vendor preset: disabled)
   Active: failed (Result: exit-code) since Mon 2019-05-13 15:23:15 EDT; 48s ago
     Docs: man:pcscd(8)
 Main PID: 24706 (code=exited, status=1/FAILURE)

May 10 11:28:42 testvm1 systemd[1]: Started PC/SC Smart Card Daemon.
May 13 15:23:15 testvm1 systemd[1]: Stopping PC/SC Smart Card Daemon...
May 13 15:23:15 testvm1 systemd[1]: pcscd.service: Main process exited, code=exited, status=1/FAIL&gt;
May 13 15:23:15 testvm1 systemd[1]: pcscd.service: Failed with result 'exit-code'.
May 13 15:23:15 testvm1 systemd[1]: Stopped PC/SC Smart Card Daemon.
```

The short log entry display for most services prevents having to search through various log files to locate this type of information. Check the status of the system runlevel targets—specifying the "target" unit type is required:


```
[root@testvm1 ~]# systemctl status multi-user.target
● multi-user.target - Multi-User System
   Loaded: loaded (/usr/lib/systemd/system/multi-user.target; static; vendor preset: disabled)
   Active: active since Thu 2019-05-09 13:27:22 EDT; 4 days ago
     Docs: man:systemd.special(7)

May 09 13:27:22 testvm1 systemd[1]: Reached target Multi-User System.
[root@testvm1 ~]# systemctl status graphical.target
● graphical.target - Graphical Interface
   Loaded: loaded (/usr/lib/systemd/system/graphical.target; indirect; vendor preset: disabled)
   Active: active since Thu 2019-05-09 13:27:22 EDT; 4 days ago
     Docs: man:systemd.special(7)

May 09 13:27:22 testvm1 systemd[1]: Reached target Graphical Interface.
[root@testvm1 ~]# systemctl status default.target
● graphical.target - Graphical Interface
   Loaded: loaded (/usr/lib/systemd/system/graphical.target; indirect; vendor preset: disabled)
   Active: active since Thu 2019-05-09 13:27:22 EDT; 4 days ago
     Docs: man:systemd.special(7)

May 09 13:27:22 testvm1 systemd[1]: Reached target Graphical Interface.
```

The default target is the graphical target. The status of any unit can be checked in this way.

### Mounts the old way

A mount unit defines all of the parameters required to mount a filesystem on a designated mount point. systemd can manage mount units with more flexibility than those using the **/etc/fstab** filesystem configuration file. Despite this, systemd still uses the **/etc/fstab** file for filesystem configuration and mounting purposes. systemd uses the **systemd-fstab-generator** tool to create transient mount units from the data in the **fstab** file.

I will create a new filesystem and a systemd mount unit to mount it. If you have some available disk space on your test system, you can do it along with me.

_Note that the volume group and logical volume names may be different on your test system. Be sure to use the names that are pertinent to your system._

You will need to create a partition or logical volume, then make an EXT4 filesystem on it. Add a label to the filesystem, **TestFS**, and create a directory for a mount point **/TestFS**.

To try this on your own, first, verify that you have free space on the volume group. Here is what that looks like on my VM where I have some space available on the volume group to create a new logical volume:


```
[root@testvm1 ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda             8:0    0  120G  0 disk
├─sda1          8:1    0    4G  0 part /boot
└─sda2          8:2    0  116G  0 part
  ├─VG01-root 253:0    0    5G  0 lvm  /
  ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
  ├─VG01-usr  253:2    0   30G  0 lvm  /usr
  ├─VG01-home 253:3    0   20G  0 lvm  /home
  ├─VG01-var  253:4    0   20G  0 lvm  /var
  └─VG01-tmp  253:5    0   10G  0 lvm  /tmp
sr0            11:0    1 1024M  0 rom  
[root@testvm1 ~]# vgs
  VG   #PV #LV #SN Attr   VSize    VFree  
  VG01   1   6   0 wz--n- &lt;116.00g &lt;23.00g
```

Then create a new volume on **VG01** named **TestFS**. It does not need to be large; 1GB is fine. Then create a filesystem, add the filesystem label, and create the mount point:


```
[root@testvm1 ~]# lvcreate -L 1G -n TestFS VG01
  Logical volume "TestFS" created.
[root@testvm1 ~]# mkfs -t ext4 /dev/mapper/VG01-TestFS
mke2fs 1.45.3 (14-Jul-2019)
Creating filesystem with 262144 4k blocks and 65536 inodes
Filesystem UUID: 8718fba9-419f-4915-ab2d-8edf811b5d23
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done

[root@testvm1 ~]# e2label /dev/mapper/VG01-TestFS TestFS
[root@testvm1 ~]# mkdir /TestFS
```

Now, mount the new filesystem:


```
[root@testvm1 ~]# mount /TestFS/
mount: /TestFS/: can't find in /etc/fstab.
```

This will not work because you do not have an entry in **/etc/fstab**. You can mount the new filesystem even without the entry in **/etc/fstab** using both the device name (as it appears in **/dev**) and the mount point. Mounting in this manner is simpler than it used to be—it used to require the filesystem type as an argument. The mount command is now smart enough to detect the filesystem type and mount it accordingly.

Try it again:


```
[root@testvm1 ~]# mount /dev/mapper/VG01-TestFS /TestFS/
[root@testvm1 ~]# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0  120G  0 disk
├─sda1            8:1    0    4G  0 part /boot
└─sda2            8:2    0  116G  0 part
  ├─VG01-root   253:0    0    5G  0 lvm  /
  ├─VG01-swap   253:1    0    8G  0 lvm  [SWAP]
  ├─VG01-usr    253:2    0   30G  0 lvm  /usr
  ├─VG01-home   253:3    0   20G  0 lvm  /home
  ├─VG01-var    253:4    0   20G  0 lvm  /var
  ├─VG01-tmp    253:5    0   10G  0 lvm  /tmp
  └─VG01-TestFS 253:6    0    1G  0 lvm  /TestFS
sr0              11:0    1 1024M  0 rom  
[root@testvm1 ~]#
```

Now the new filesystem is mounted in the proper location. List the mount unit files:


```
`[root@testvm1 ~]# systemctl list-unit-files -t mount`
```

This command does not show a file for the **/TestFS** filesystem because no file exists for it. The command **systemctl status TestFS.mount** does not display any information about the new filesystem either. You can try it using wildcards with the **systemctl status** command:


```
[root@testvm1 ~]# systemctl status *mount
● usr.mount - /usr
   Loaded: loaded (/etc/fstab; generated)
   Active: active (mounted)
    Where: /usr
     What: /dev/mapper/VG01-usr
     Docs: man:fstab(5)
           man:systemd-fstab-generator(8)

&lt;SNIP&gt;
● TestFS.mount - /TestFS
   Loaded: loaded (/proc/self/mountinfo)
   Active: active (mounted) since Fri 2020-04-17 16:02:26 EDT; 1min 18s ago
    Where: /TestFS
     What: /dev/mapper/VG01-TestFS

● run-user-0.mount - /run/user/0
   Loaded: loaded (/proc/self/mountinfo)
   Active: active (mounted) since Thu 2020-04-16 08:52:29 EDT; 1 day 5h ago
    Where: /run/user/0
     What: tmpfs

● var.mount - /var
   Loaded: loaded (/etc/fstab; generated)
   Active: active (mounted) since Thu 2020-04-16 12:51:34 EDT; 1 day 1h ago
    Where: /var
     What: /dev/mapper/VG01-var
     Docs: man:fstab(5)
           man:systemd-fstab-generator(8)
    Tasks: 0 (limit: 19166)
   Memory: 212.0K
      CPU: 5ms
   CGroup: /system.slice/var.mount
```

This command provides some very interesting information about your system's mounts, and your new filesystem shows up. The **/var** and **/usr** filesystems are identified as being generated from **/etc/fstab**, while your new filesystem simply shows that it is loaded and provides the location of the info file in the **/proc/self/mountinfo** file.

Next, automate this mount. First, do it the old-fashioned way by adding an entry in **/etc/fstab**. Later, I'll show you how to do it the new way, which will teach you about creating units and integrating them into the startup sequence.

Unmount **/TestFS** and add the following line to the **/etc/fstab** file:


```
`/dev/mapper/VG01-TestFS  /TestFS       ext4    defaults        1 2`
```

Now, mount the filesystem with the simpler **mount** command and list the mount units again:


```
[root@testvm1 ~]# mount /TestFS
[root@testvm1 ~]# systemctl status *mount
&lt;SNIP&gt;
● TestFS.mount - /TestFS
   Loaded: loaded (/proc/self/mountinfo)
   Active: active (mounted) since Fri 2020-04-17 16:26:44 EDT; 1min 14s ago
    Where: /TestFS
     What: /dev/mapper/VG01-TestFS
&lt;SNIP&gt;
```

This did not change the information for this mount because the filesystem was manually mounted. Reboot and run the command again, and this time specify **TestFS.mount** rather than using the wildcard. The results for this mount are now consistent with it being mounted at startup:


```
[root@testvm1 ~]# systemctl status TestFS.mount
● TestFS.mount - /TestFS
   Loaded: loaded (/etc/fstab; generated)
   Active: active (mounted) since Fri 2020-04-17 16:30:21 EDT; 1min 38s ago
    Where: /TestFS
     What: /dev/mapper/VG01-TestFS
     Docs: man:fstab(5)
           man:systemd-fstab-generator(8)
    Tasks: 0 (limit: 19166)
   Memory: 72.0K
      CPU: 6ms
   CGroup: /system.slice/TestFS.mount

Apr 17 16:30:21 testvm1 systemd[1]: Mounting /TestFS...
Apr 17 16:30:21 testvm1 systemd[1]: Mounted /TestFS.
```

### Creating a mount unit

Mount units may be configured either with the traditional **/etc/fstab** file or with systemd units. Fedora uses the **fstab** file as it is created during the installation. However, systemd uses the **systemd-fstab-generator** program to translate the **fstab** file into systemd units for each entry in the **fstab** file. Now that you know you can use systemd **.mount** unit files for filesystem mounting, try it out by creating a mount unit for this filesystem.

First, unmount **/TestFS**. Edit the **/etc/fstab** file and delete or comment out the **TestFS** line. Now, create a new file with the name **TestFS.mount** in the **/etc/systemd/system** directory. Edit it to contain the configuration data below. The unit file name and the name of the mount point _must_ be identical, or the mount will fail:


```
# This mount unit is for the TestFS filesystem
# By David Both
# Licensed under GPL V2
# This file should be located in the /etc/systemd/system directory

[Unit]
Description=TestFS Mount

[Mount]
What=/dev/mapper/VG01-TestFS
Where=/TestFS
Type=ext4
Options=defaults

[Install]
WantedBy=multi-user.target
```

The **Description** line in the **[Unit]** section is for us humans, and it provides the name that's shown when you list mount units with **systemctl -t mount**. The data in the **[Mount]** section of this file contains essentially the same data that would be found in the **fstab** file.

Now enable the mount unit:


```
[root@testvm1 etc]# systemctl enable TestFS.mount
Created symlink /etc/systemd/system/multi-user.target.wants/TestFS.mount → /etc/systemd/system/TestFS.mount.
```

This creates the symlink in the **/etc/systemd/system** directory, which will cause this mount unit to be mounted on all subsequent boots. The filesystem has not yet been mounted, so you must "start" it:


```
`[root@testvm1 ~]# systemctl start TestFS.mount`
```

Verify that the filesystem has been mounted:


```
[root@testvm1 ~]# systemctl status TestFS.mount
● TestFS.mount - TestFS Mount
   Loaded: loaded (/etc/systemd/system/TestFS.mount; enabled; vendor preset: disabled)
   Active: active (mounted) since Sat 2020-04-18 09:59:53 EDT; 14s ago
    Where: /TestFS
     What: /dev/mapper/VG01-TestFS
    Tasks: 0 (limit: 19166)
   Memory: 76.0K
      CPU: 3ms
   CGroup: /system.slice/TestFS.mount

Apr 18 09:59:53 testvm1 systemd[1]: Mounting TestFS Mount...
Apr 18 09:59:53 testvm1 systemd[1]: Mounted TestFS Mount.
```

This experiment has been specifically about creating a unit file for a mount, but it can be applied to other types of unit files as well. The details will be different, but the concepts are the same. Yes, I know it is still easier to add a line to the **/etc/fstab** file than it is to create a mount unit. But this is a good example of how to create a unit file because systemd does not have generators for every type of unit.

### In summary

This article looked at systemd units in more detail and how to use the systemctl command to explore and manage units. It also showed how to stop and disable units and create a new systemd mount unit to mount a new filesystem and enable it to initiate during startup.

In the next article in this series, I will take you through a recent problem I had during startup and show you how I circumvented it using systemd.

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup.

  * The Fedora Project has a good, practical [guide][10] [to systemd][10]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][11] that cross-references the old SystemV commands to comparable systemd ones.
  * For detailed technical information about systemd and the reasons for creating it, check out [Freedesktop.org][12]'s [description of systemd][13].
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

via: https://opensource.com/article/20/5/systemd-units

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/article/20/4/systemd
[3]: https://opensource.com/article/20/4/systemd-startup
[4]: https://en.wikipedia.org/wiki/Sar_%28Unix%29
[5]: https://en.wikipedia.org/wiki/Pwd
[6]: https://en.wikipedia.org/wiki/Standard_streams#Standard_output_(stdout)
[7]: http://www.both.org/?page_id=1183
[8]: mailto:chrony-dnssrv@.timer
[9]: mailto:mdadm-last-resort@.timer
[10]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[11]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[12]: http://Freedesktop.org
[13]: http://www.freedesktop.org/wiki/Software/systemd
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

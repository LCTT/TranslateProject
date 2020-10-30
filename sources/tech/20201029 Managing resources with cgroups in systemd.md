[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing resources with cgroups in systemd)
[#]: via: (https://opensource.com/article/20/10/cgroups)
[#]: author: (David Both https://opensource.com/users/dboth)

Managing resources with cgroups in systemd
======
Cgroups manage resources per application rather than by the individual
processes that make up an application.
![Business woman on laptop sitting in front of window][1]

There is little more frustrating to me as a sysadmin than unexpectedly running out of a computing resource. On more than one occasion, I have filled all available disk space in a partition, run out of RAM, and not had enough CPU time to perform my tasks in a reasonable amount of time. Resource management is one of the most important tasks that sysadmins do.

The point of resource management is to ensure that all processes have relatively equal access to the system resources they need. Resource management also involves ensuring that RAM, hard drive space, and CPU capacity are added when necessary or rationed when that is not possible. In addition, users who hog system resources, whether intentionally or accidentally, should be prevented from doing so.

There are tools that enable sysadmins to monitor and manage various system resources. For example, [top][2] and similar tools allow you to monitor the use of memory, I/O, storage (disk, SSD, etc.), network, swap space, CPU usage, and more. These tools, particularly those that are CPU-centric, are mostly based on the paradigm that the running process is the unit of control. At best, they provide a way to adjust the nice number–and through that, the priority—or to kill a running process. (For information about nice numbers, see [_Monitoring Linux and Windows hosts with Glances_][3].)

Other tools based on traditional resource management in a SystemV environment are managed by the `/etc/security/limits.conf` file and the local configuration files located in the `/etc/security/limits.d` directory. Resources can be limited in a fairly crude but useful manner by user or group. Resources that can be managed include various aspects of RAM, total CPU time per day, total amount of data, priority, nice number, number of concurrent logins, number of processes, maximum file size, and more.

### Using cgroups for process management

One major difference between [systemd and SystemV][4] is how they handle processes. SystemV treats each process as an entity unto itself. systemd collects related processes into control groups, called [cgroups][5] (short for control groups), and manages system resources for the cgroup as a whole. This means resources can be managed per application rather than by the individual processes that make up an application.

The control units for cgroups are called slice units. Slices are a conceptualization that allows systemd to order processes in a tree format for ease of management.

### Viewing cgroups

I'll start with some commands that allow you to view various types of information about cgroups. The `systemctl status <service>` command displays slice information about a specified service, including its slice. This example shows the `at` daemon:


```
[root@testvm1 ~]# systemctl status atd.service
● atd.service - Deferred execution scheduler
     Loaded: loaded (/usr/lib/systemd/system/atd.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2020-09-23 12:18:24 EDT; 1 day 3h ago
       Docs: man:atd(8)
   Main PID: 1010 (atd)
      Tasks: 1 (limit: 14760)
     Memory: 440.0K
        CPU: 5ms
     CGroup: /system.slice/atd.service
             └─1010 /usr/sbin/atd -f

Sep 23 12:18:24 testvm1.both.org systemd[1]: Started Deferred execution scheduler.
[root@testvm1 ~]#
```

This is an excellent example of one reason that I find systemd more usable than SystemV and the old init program. There is so much more information here than SystemV could provide. The cgroup entry includes the hierarchical structure where the `system.slice` is systemd (PID 1), and the `atd.service` is one level below and part of the `system.slice`. The second line of the cgroup entry also shows the process ID (PID) and the command used to start the daemon.

The `systemctl` command shows multiple cgroup entries. The `--all` option shows all slices, including those that are not currently active:


```
[root@testvm1 ~]# systemctl -t slice --all
  UNIT                             LOAD   ACTIVE   SUB    DESCRIPTION                    
  -.slice                          loaded active   active Root Slice                      
  system-getty.slice               loaded active   active system-getty.slice              
  system-lvm2\x2dpvscan.slice      loaded active   active system-lvm2\x2dpvscan.slice    
  system-modprobe.slice            loaded active   active system-modprobe.slice          
  system-sshd\x2dkeygen.slice      loaded active   active system-sshd\x2dkeygen.slice    
  system-systemd\x2dcoredump.slice loaded inactive dead   system-systemd\x2dcoredump.slice
  system-systemd\x2dfsck.slice     loaded active   active system-systemd\x2dfsck.slice    
  system.slice                     loaded active   active System Slice                    
  user-0.slice                     loaded active   active User Slice of UID 0            
  user-1000.slice                  loaded active   active User Slice of UID 1000          
  user.slice                       loaded active   active User and Session Slice          

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

11 loaded units listed.
To show all installed unit files use 'systemctl list-unit-files'.
[root@testvm1 ~]#
```

The first thing to notice about this data is that it shows user slices for UIDs 0 (root) and 1000, which is my user login. This shows only the slices and not the services that are part of each slice. This data shows that a slice is created for each user at the time they log in. This can provide a way to manage all of a user's tasks as a single cgroup entity.

### Explore the cgroup hierarchy

All is well and good so far, but cgroups are hierarchical, and all of the service units run as members of one of the cgroups. Viewing that hierarchy is easy and uses one old command and one new one that is part of systemd.

The `ps` command can be used to map the processes and their locations in the cgroup hierarchy. Note that it is necessary to specify the desired data columns when using the `ps` command. I significantly reduced the volume of output from this command below, but I tried to leave enough so you can get a feel for what you might find on your systems:


```
[root@testvm1 ~]# ps xawf -eo pid,user,cgroup,args
    PID USER     CGROUP                      COMMAND
      2 root     -                           [kthreadd]
      3 root     -                            \\_ [rcu_gp]
      4 root     -                            \\_ [rcu_par_gp]
      6 root     -                            \\_ [kworker/0:0H-kblockd]
      9 root     -                            \\_ [mm_percpu_wq]
     10 root     -                            \\_ [ksoftirqd/0]
     11 root     -                            \\_ [rcu_sched]
     12 root     -                            \\_ [migration/0]
     13 root     -                            \\_ [cpuhp/0]
     14 root     -                            \\_ [cpuhp/1]
&lt;SNIP&gt;
 625406 root     -                            \\_ [kworker/3:0-ata_sff]
 625409 root     -                            \\_ [kworker/u8:0-events_unbound]
      1 root     0::/init.scope              /usr/lib/systemd/systemd --switched-root --system --deserialize 30
    588 root     0::/system.slice/systemd-jo /usr/lib/systemd/systemd-journald
    599 root     0::/system.slice/systemd-ud /usr/lib/systemd/systemd-udevd
    741 root     0::/system.slice/auditd.ser /sbin/auditd
    743 root     0::/system.slice/auditd.ser  \\_ /usr/sbin/sedispatch
    764 root     0::/system.slice/ModemManag /usr/sbin/ModemManager
    765 root     0::/system.slice/NetworkMan /usr/sbin/NetworkManager --no-daemon
    767 root     0::/system.slice/irqbalance /usr/sbin/irqbalance --foreground
    779 root     0::/system.slice/mcelog.ser /usr/sbin/mcelog --ignorenodev --daemon --foreground
    781 root     0::/system.slice/rngd.servi /sbin/rngd -f
    782 root     0::/system.slice/rsyslog.se /usr/sbin/rsyslogd -n
&lt;SNIP&gt;
    893 root     0::/system.slice/sshd.servi sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
   1130 root     0::/user.slice/user-0.slice  \\_ sshd: root [priv]
   1147 root     0::/user.slice/user-0.slice  |   \\_ sshd: root@pts/0
   1148 root     0::/user.slice/user-0.slice  |       \\_ -bash
   1321 root     0::/user.slice/user-0.slice  |           \\_ screen
   1322 root     0::/user.slice/user-0.slice  |               \\_ SCREEN
   1323 root     0::/user.slice/user-0.slice  |                   \\_ /bin/bash
 498801 root     0::/user.slice/user-0.slice  |                   |   \\_ man systemd.resource-control
 498813 root     0::/user.slice/user-0.slice  |                   |       \\_ less
   1351 root     0::/user.slice/user-0.slice  |                   \\_ /bin/bash
 123293 root     0::/user.slice/user-0.slice  |                   |   \\_ man systemd.slice
 123305 root     0::/user.slice/user-0.slice  |                   |       \\_ less
   1380 root     0::/user.slice/user-0.slice  |                   \\_ /bin/bash
 625412 root     0::/user.slice/user-0.slice  |                   |   \\_ ps xawf -eo pid,user,cgroup,args
 625413 root     0::/user.slice/user-0.slice  |                   |   \\_ less
 246795 root     0::/user.slice/user-0.slice  |                   \\_ /bin/bash
 625338 root     0::/user.slice/user-0.slice  |                       \\_ /usr/bin/mc -P /var/tmp/mc-root/mc.pwd.246795
 625340 root     0::/user.slice/user-0.slice  |                           \\_ bash -rcfile .bashrc
   1218 root     0::/user.slice/user-1000.sl  \\_ sshd: dboth [priv]
   1233 dboth    0::/user.slice/user-1000.sl      \\_ sshd: dboth@pts/1
   1235 dboth    0::/user.slice/user-1000.sl          \\_ -bash
&lt;SNIP&gt;
   1010 root     0::/system.slice/atd.servic /usr/sbin/atd -f
   1011 root     0::/system.slice/crond.serv /usr/sbin/crond -n
   1098 root     0::/system.slice/lxdm.servi /usr/sbin/lxdm-binary
   1106 root     0::/system.slice/lxdm.servi  \\_ /usr/libexec/Xorg -background none :0 vt01 -nolisten tcp -novtswitch -auth /var/run/lxdm/lxdm-:0.auth
 370621 root     0::/user.slice/user-1000.sl  \\_ /usr/libexec/lxdm-session
 370631 dboth    0::/user.slice/user-1000.sl      \\_ xfce4-session
 370841 dboth    0::/user.slice/user-1000.sl          \\_ /usr/bin/ssh-agent /bin/sh -c exec -l bash -c "/usr/bin/startxfce4"
 370911 dboth    0::/user.slice/user-1000.sl          \\_ xfwm4 --display :0.0 --sm-client-id 2dead44ab-0b4d-4101-bca4-e6771f4a8ac2
 370930 dboth    0::/user.slice/user-1000.sl          \\_ xfce4-panel --display :0.0 --sm-client-id 2ce38b8ef-86fd-4189-ace5-deec1d0e0952
 370942 dboth    0::/user.slice/user-1000.sl          |   \\_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libsystray.so 6 23068680 systr
ay Notification Area Area where notification icons appear
 370943 dboth    0::/user.slice/user-1000.sl          |   \\_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libpulseaudio-plugin.so 8 2306
8681 pulseaudio PulseAudio Plugin Adjust the audio volume of the PulseAudio sound system
 370944 dboth    0::/user.slice/user-1000.sl          |   \\_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libxfce4powermanager.so 9 2306
8682 power-manager-plugin Power Manager Plugin Display the battery levels of your devices and control the brightness of your display
 370945 dboth    0::/user.slice/user-1000.sl          |   \\_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libnotification-plugin.so 10 2
3068683 notification-plugin Notification Plugin Notification plugin for the Xfce panel
 370948 dboth    0::/user.slice/user-1000.sl          |   \\_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libactions.so 14 23068684 acti
ons Action Buttons Log out, lock or other system actions
 370934 dboth    0::/user.slice/user-1000.sl          \\_ Thunar --sm-client-id 2cfc809d8-4e1d-497a-a5c5-6e4fa509c3fb --daemon
 370939 dboth    0::/user.slice/user-1000.sl          \\_ xfdesktop --display :0.0 --sm-client-id 299be0608-4dca-4055-b4d6-55ec6e73a324
 370962 dboth    0::/user.slice/user-1000.sl          \\_ nm-applet
&lt;SNIP&gt;
```

You can view the entire hierarchy with the `systemd-cgls` command, which is a bit simpler because it does not require any complex options.

I have shortened this tree view considerably. as well, but I left enough to give you some idea of the amount of data as well as the types of entries you should see when you do this on your system. I did this on one of my virtual machines, and it is about 200 lines long; the amount of data from my primary workstation is about 250 lines:


```
[root@testvm1 ~]# systemd-cgls
Control group /:
-.slice
├─user.slice
│ ├─user-0.slice
│ │ ├─session-1.scope
│ │ │ ├─  1130 sshd: root [priv]
│ │ │ ├─  1147 sshd: root@pts/0
│ │ │ ├─  1148 -bash
│ │ │ ├─  1321 screen
│ │ │ ├─  1322 SCREEN
│ │ │ ├─  1323 /bin/bash
│ │ │ ├─  1351 /bin/bash
│ │ │ ├─  1380 /bin/bash
│ │ │ ├─123293 man systemd.slice
│ │ │ ├─123305 less
│ │ │ ├─246795 /bin/bash
│ │ │ ├─371371 man systemd-cgls
│ │ │ ├─371383 less
│ │ │ ├─371469 systemd-cgls
│ │ │ └─371470 less
│ │ └─[user@0.service][6] …
│ │   ├─dbus-broker.service
│ │   │ ├─1170 /usr/bin/dbus-broker-launch --scope user
│ │   │ └─1171 dbus-broker --log 4 --controller 12 --machine-id 3bccd1140fca488187f8a1439c832f07 --max-bytes 100000000000000 --max-fds 25000000000000 --max-&gt;
│ │   ├─gvfs-daemon.service
│ │   │ └─1173 /usr/libexec/gvfsd
│ │   └─init.scope
│ │     ├─1137 /usr/lib/systemd/systemd --user
│ │     └─1138 (sd-pam)
│ └─user-1000.slice
│   ├─[user@1000.service][7] …
│   │ ├─dbus\x2d:1.2\x2dorg.xfce.Xfconf.slice
│   │ │ └─dbus-:[1.2-org.xfce.Xfconf@0.service][8]
│   │ │   └─370748 /usr/lib64/xfce4/xfconf/xfconfd
│   │ ├─dbus\x2d:1.2\x2dca.desrt.dconf.slice
│   │ │ └─dbus-:[1.2-ca.desrt.dconf@0.service][9]
│   │ │   └─371262 /usr/libexec/dconf-service
│   │ ├─dbus-broker.service
│   │ │ ├─1260 /usr/bin/dbus-broker-launch --scope user
│   │ │ └─1261 dbus-broker --log 4 --controller 11 --machine-id
&lt;SNIP&gt;
│   │ └─gvfs-mtp-volume-monitor.service
│   │   └─370987 /usr/libexec/gvfs-mtp-volume-monitor
│   ├─session-3.scope
│   │ ├─1218 sshd: dboth [priv]
│   │ ├─1233 sshd: dboth@pts/1
│   │ └─1235 -bash
│   └─session-7.scope
│     ├─370621 /usr/libexec/lxdm-session
│     ├─370631 xfce4-session
│     ├─370805 /usr/bin/VBoxClient --clipboard
│     ├─370806 /usr/bin/VBoxClient --clipboard
│     ├─370817 /usr/bin/VBoxClient --seamless
│     ├─370818 /usr/bin/VBoxClient --seamless
│     ├─370824 /usr/bin/VBoxClient --draganddrop
│     ├─370825 /usr/bin/VBoxClient --draganddrop
│     ├─370841 /usr/bin/ssh-agent /bin/sh -c exec -l bash -c "/usr/bin/startxfce4"
│     ├─370910 /bin/gpg-agent --sh --daemon --write-env-file /home/dboth/.cache/gpg-agent-info
│     ├─370911 xfwm4 --display :0.0 --sm-client-id 2dead44ab-0b4d-4101-bca4-e6771f4a8ac2
│     ├─370923 xfsettingsd --display :0.0 --sm-client-id 261b4a437-3029-461c-9551-68c2c42f4fef
│     ├─370930 xfce4-panel --display :0.0 --sm-client-id 2ce38b8ef-86fd-4189-ace5-deec1d0e0952
│     ├─370934 Thunar --sm-client-id 2cfc809d8-4e1d-497a-a5c5-6e4fa509c3fb --daemon
│     ├─370939 xfdesktop --display :0.0 --sm-client-id 299be0608-4dca-4055-b4d6-55ec6e73a324
&lt;SNIP&gt;
└─system.slice
  ├─rngd.service
  │ └─1650 /sbin/rngd -f
  ├─irqbalance.service
  │ └─1631 /usr/sbin/irqbalance --foreground
  ├─fprintd.service
  │ └─303383 /usr/libexec/fprintd
  ├─systemd-udevd.service
  │ └─956 /usr/lib/systemd/systemd-udevd
&lt;SNIP&gt;
  ├─systemd-journald.service
  │ └─588 /usr/lib/systemd/systemd-journald
  ├─atd.service
  │ └─1010 /usr/sbin/atd -f
  ├─system-dbus\x2d:1.10\x2dorg.freedesktop.problems.slice
  │ └─dbus-:[1.10-org.freedesktop.problems@0.service][10]
  │   └─371197 /usr/sbin/abrt-dbus -t133
  ├─sshd.service
  │ └─893 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
  ├─vboxservice.service
  │ └─802 /usr/sbin/VBoxService -f
  ├─crond.service
  │ └─1011 /usr/sbin/crond -n
  ├─NetworkManager.service
  │ └─765 /usr/sbin/NetworkManager --no-daemon
  ├─switcheroo-control.service
  │ └─787 /usr/libexec/switcheroo-control
 &lt;SNIP&gt;
```

This tree view shows all of the user and system slices and the services and programs running in each cgroup. Notice the units called "scopes," which group related programs into a management unit, within the `user-1000.slice` in the listing above. The `user-1000.slice/session-7.scope` cgroup contains the GUI desktop program hierarchy, starting with the LXDM display manager session and all of its subtasks, including things like the Bash shell and the Thunar GUI file manager.

Scope units are not defined in configuration files but are generated programmatically as the result of starting groups of related programs. Scope units do not create or start the processes running as part of that cgroup. All processes within the scope are equal, and there is no internal hierarchy. The life of a scope begins when the first process is created and ends when the last process is destroyed.

Open several windows on your desktop, such as terminal emulators, LibreOffice, or whatever you want, then switch to an available virtual console and start something like `top` or [Midnight Commander][11]. Run the `systemd-cgls` command on your host, and take note of the overall hierarchy and the scope units.

The `systemd-cgls` command provides a more complete representation of the cgroup hierarchy (and details of the units that make it up) than any other command I have found. I prefer its cleaner representation of the tree than what the `ps` command provides.

### With a little help from my friends

After covering these basics, I had planned to go into more detail about cgroups and how to use them, but I discovered a series of four excellent articles by Red Hat's [Steve Ovens][12] on Opensource.com's sister site [Enable Sysadmin][13]. Rather then basically rewriting Steve's articles, I decided it would be much better to take advantage of his cgroup expertise by linking to them:

  1. [A Linux sysadmin's introduction to cgroups][14]
  2. [How to manage cgroups with CPUShares][15]
  3. [Managing cgroups the hard way—manually][16]
  4. [Managing cgroups with systemd][17]



Enjoy and learn from them, as I did.

### Other resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup. This list has grown since I started this series of articles to reflect the research I have done.

  * The Fedora Project has a good, practical [guide][18] [to systemd][18]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][19] that cross-references the old SystemV commands to comparable systemd ones.
  * The [systemd.unit(5) manual page][20] contains a nice list of unit file sections and their configuration options along with concise descriptions of each.
  * Red Hat documentation contains a good description of the [Unit file structure][21] as well as other important information.
  * For detailed technical information about systemd and the reasons for creating it, check out Freedesktop.org's [description of systemd][22]. This page is one of the best I have found because it contains many links to other important and accurate documentation.
  * Linux.com's "More systemd fun" offers more advanced systemd [information and tips][23].
  * See the man page for [systemd.resource-control(5)][24].
  * In [_The Linux kernel user's and administrator's guide_][25], see the [Control Group v2][26] entry.



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

  * [Rethinking PID 1][27]
  * [systemd for Administrators, Part I][28]
  * [systemd for Administrators, Part II][29]
  * [systemd for Administrators, Part III][30]
  * [systemd for Administrators, Part IV][31]
  * [systemd for Administrators, Part V][32]
  * [systemd for Administrators, Part VI][33]
  * [systemd for Administrators, Part VII][34]
  * [systemd for Administrators, Part VIII][35]
  * [systemd for Administrators, Part IX][36]
  * [systemd for Administrators, Part X][37]
  * [systemd for Administrators, Part XI][38]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/cgroups

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://en.wikipedia.org/wiki/Top_(software)
[3]: https://opensource.com/article/19/11/monitoring-linux-glances
[4]: https://opensource.com/article/20/4/systemd
[5]: https://en.wikipedia.org/wiki/Cgroups
[6]: mailto:user@0.service
[7]: mailto:user@1000.service
[8]: mailto:1.2-org.xfce.Xfconf@0.service
[9]: mailto:1.2-ca.desrt.dconf@0.service
[10]: mailto:1.10-org.freedesktop.problems@0.service
[11]: https://midnight-commander.org/
[12]: https://www.redhat.com/sysadmin/users/steve-ovens
[13]: https://www.redhat.com/sysadmin/
[14]: https://www.redhat.com/sysadmin/cgroups-part-one
[15]: https://www.redhat.com/sysadmin/cgroups-part-two
[16]: https://www.redhat.com/sysadmin/cgroups-part-three
[17]: https://www.redhat.com/sysadmin/cgroups-part-four
[18]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[19]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[20]: https://man7.org/linux/man-pages/man5/systemd.unit.5.html
[21]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-services-with-systemd_configuring-basic-system-settings#Managing_Services_with_systemd-Unit_File_Structure
[22]: https://www.freedesktop.org/wiki/Software/systemd/
[23]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[24]: https://man7.org/linux/man-pages/man5/systemd.resource-control.5.html
[25]: https://www.kernel.org/doc/html/latest/admin-guide/index.html
[26]: https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html
[27]: http://0pointer.de/blog/projects/systemd.html
[28]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[29]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[30]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[31]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[32]: http://0pointer.de/blog/projects/three-levels-of-off.html
[33]: http://0pointer.de/blog/projects/changing-roots
[34]: http://0pointer.de/blog/projects/blame-game.html
[35]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[36]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[37]: http://0pointer.de/blog/projects/instances.html
[38]: http://0pointer.de/blog/projects/inetd.html

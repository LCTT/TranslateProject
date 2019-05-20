[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (xsos – A Tool To Read SOSReport In Linux)
[#]: via: (https://www.2daygeek.com/xsos-a-tool-to-read-sosreport-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

xsos – A Tool To Read SOSReport In Linux
======

We all are already know about **[sosreport][1]**. It’s used to collect system information that can be used for diagnostic.

Redhat support advise us to provide a sosreport when we raise a case with them to analyze the current system status.

It’s collecting all kind of reports that can help user to identify the root causes of issue.

We can easily extract and read the sosreport but it’s very difficult to read. Since it has created a separate file for everything.

If you are looking for performance bottleneck tool then i would recommend you to check the **[oswbb (OSWatcher) utility][2]**.

So, what is the best way to read all together with syntax highlighting in Linux.

Yes, it can be achieved via xsos tool.

### What Is sosreport?

The sosreport command is a tool that collects bunch of configuration details, system information and diagnostic information from running system (especially RHEL & OEL system).

It helps technical support engineer to analyze the system in many aspect.

This reports contains bunch of information about the system such as boot information, filesystem, memory, hostname, installed rpms, system IP, networking details, OS version, installed kernel, loaded kernel modules, list of open files, list of PCI devices, mount point and it’s details, running process information, process tree output, system routing, all the configuration files which is located in /etc folder, and all the log files which is located in /var folder.

This will take a while to generate a report and it’s depends on your system installation and configuration.

Once completed, sosreport will generate a compressed archive file under /tmp directory.

### What Is xsos?

[xsos][3] is a tool that help user to easily read sosreport on Linux systems. In other hand, we can say sosreport examiner.

It instantly summarize system info from a sosreport or a running system.

xsos will attempt to make it easy, parsing and calculating and formatting data from dozens of files (and commands) to give you a detailed overview about a system.

You can instantly summarize your system information by running the following command.

```
# curl -Lo ./xsos bit.ly/xsos-direct; chmod +x ./xsos; ./xsos -ya
```

[![][4]![][4]][5]

### How To Install xsos In Linux?

We can easily install xsos using the following two methods.

If you are looking for latest bleeding-edge version. Use the following steps.

```
# curl -Lo /usr/local/bin/xsos bit.ly/xsos-direct

# chmod +x /usr/local/bin/xsos
```

This is the recommended method to install xsos. It will install xsos from rpm file.

```
# yum install http://people.redhat.com/rsawhill/rpms/latest-rsawaroha-release.rpm

# yum install xsos
```

### How To Use xsos In Linux?

Once xsos is installed by one of the above methods. Simply run the xsos command without any options, which show you the basic information about your system.

```
# xsos

OS
  Hostname: CentOS7.2daygeek.com
  Distro:   [redhat-release] CentOS Linux release 7.6.1810 (Core)
            [centos-release] CentOS Linux release 7.6.1810 (Core)
            [os-release] CentOS Linux 7 (Core) 7 (Core)
  RHN:      (missing)
  RHSM:     (missing)
  YUM:      2 enabled plugins: fastestmirror, langpacks
  Runlevel: N 5  (default graphical)
  SELinux:  enforcing  (default enforcing)
  Arch:     mach=x86_64  cpu=x86_64  platform=x86_64
  Kernel:
    Booted kernel:  3.10.0-957.el7.x86_64
    GRUB default:   3.10.0-957.el7.x86_64
    Build version:
      Linux version 3.10.0-957.el7.x86_64 ([email protected]) (gcc version 4.8.5 20150623 (Red
      Hat 4.8.5-36) (GCC) ) #1 SMP Thu Nov 8 23:39:32 UTC 2018
    Booted kernel cmdline:
      root=/dev/mapper/centos-root ro crashkernel=auto rd.lvm.lv=centos/root rd.lvm.lv=centos/swap rhgb quiet
      LANG=en_US.UTF-8
    GRUB default kernel cmdline:
      root=/dev/mapper/centos-root ro crashkernel=auto rd.lvm.lv=centos/root rd.lvm.lv=centos/swap rhgb quiet
      LANG=en_US.UTF-8
    Taint-check: 0  (kernel untainted)
    - - - - - - - - - - - - - - - - - - -
  Sys time:  Sun May 12 10:05:21 CDT 2019
  Boot time: Sun May 12 09:50:20 CDT 2019  (epoch: 1557672620)
  Time Zone: America/Chicago
  Uptime:    15 min,  1 user
  LoadAvg:   [1 CPU] 0.00 (0%), 0.04 (4%), 0.09 (9%)
  /proc/stat:
    procs_running: 2   procs_blocked: 0    processes [Since boot]: 6423
    cpu [Utilization since boot]:
      us 1%, ni 0%, sys 1%, idle 99%, iowait 0%, irq 0%, sftirq 0%, steal 0%
```

### How To Use xsos Command To View Generated sosreport Output In Linux?

We need the sosreport to read further using xsos command. To do so, navigate the following URL to install and generate sosreport on Linux.

Yes, i have already generated a sosreport and file is below.

```
# ls -lls -lh /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa.tar.xz
9.8M -rw-------. 1 root root 9.8M May 12 10:13 /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa.tar.xz
```

Run the following command to untar it.

```
# tar xf sosreport-CentOS7-01-1005-2019-05-12-pomeqsa.tar.xz
```

To view all the info, run xsos with `-a, --all` switch.

```
# xsos --all /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
```

To view the bios info, run xsos with `-b, --bios` switch.

```
# xsos --bios /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
DMIDECODE
  BIOS:
    Vend: innotek GmbH
    Vers: VirtualBox
    Date: 12/01/2006
    BIOS Rev:
    FW Rev:
  System:
    Mfr:  innotek GmbH
    Prod: VirtualBox
    Vers: 1.2
    Ser:  0
    UUID: 002f47b8-2af2-48f5-be1d-67b67e03514c
  CPU:
    0 of 0 CPU sockets populated, 0 cores/0 threads per CPU
    0 total cores, 0 total threads
    Mfr:
    Fam:
    Freq:
    Vers:
  Memory:
    Total: 0 MiB (0 GiB)
    DIMMs: 0 of 0 populated
    MaxCapacity: 0 MiB (0 GiB / 0.00 TiB)
```

To view the system basic info such as hostname, distro, SELinux, kernel info, uptime, etc, run xsos with `-o, --os` switch.

```
# xsos --os /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
OS
  Hostname: CentOS7.2daygeek.com
  Distro:   [redhat-release] CentOS Linux release 7.6.1810 (Core)
            [centos-release] CentOS Linux release 7.6.1810 (Core)
            [os-release] CentOS Linux 7 (Core) 7 (Core)
  RHN:      (missing)
  RHSM:     (missing)
  YUM:      2 enabled plugins: fastestmirror, langpacks
  SELinux:  enforcing  (default enforcing)
  Arch:     mach=x86_64  cpu=x86_64  platform=x86_64
  Kernel:
    Booted kernel:  3.10.0-957.el7.x86_64
    GRUB default:   3.10.0-957.el7.x86_64
    Build version:
      Linux version 3.10.0-957.el7.x86_64 ([email protected]) (gcc version 4.8.5 20150623 (Red
      Hat 4.8.5-36) (GCC) ) #1 SMP Thu Nov 8 23:39:32 UTC 2018
    Booted kernel cmdline:
      root=/dev/mapper/centos-root ro crashkernel=auto rd.lvm.lv=centos/root rd.lvm.lv=centos/swap rhgb quiet
      LANG=en_US.UTF-8
    GRUB default kernel cmdline:
      root=/dev/mapper/centos-root ro crashkernel=auto rd.lvm.lv=centos/root rd.lvm.lv=centos/swap rhgb quiet
      LANG=en_US.UTF-8
    Taint-check: 536870912  (see https://access.redhat.com/solutions/40594)
      29  TECH_PREVIEW: Technology Preview code is loaded
    - - - - - - - - - - - - - - - - - - -
  Sys time:  Sun May 12 10:12:22 CDT 2019
  Boot time: Sun May 12 09:50:20 CDT 2019  (epoch: 1557672620)
  Time Zone: America/Chicago
  Uptime:    22 min,  1 user
  LoadAvg:   [1 CPU] 1.19 (119%), 0.27 (27%), 0.14 (14%)
  /proc/stat:
    procs_running: 8   procs_blocked: 2    processes [Since boot]: 9005
    cpu [Utilization since boot]:
      us 1%, ni 0%, sys 1%, idle 99%, iowait 0%, irq 0%, sftirq 0%, steal 0%
```

To view the kdump configuration, run xsos with `-k, --kdump` switch.

```
# xsos --kdump /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
KDUMP CONFIG
  kexec-tools rpm version:
    kexec-tools-2.0.15-21.el7.x86_64
  Service enablement:
    UNIT           STATE
    kdump.service  enabled
  kdump initrd/initramfs:
    13585734 Feb 19 05:51 initramfs-3.10.0-957.el7.x86_64kdump.img
  Memory reservation config:
    /proc/cmdline { crashkernel=auto }
    GRUB default  { crashkernel=auto }
  Actual memory reservation per /proc/iomem:
      2a000000-340fffff : Crash kernel
  kdump.conf:
    path /var/crash
    core_collector makedumpfile -l --message-level 1 -d 31
  kdump.conf "path" available space:
    System MemTotal (uncompressed core size) { 1.80 GiB }
    Available free space on target path's fs { 22.68 GiB }  (fs=/)
  Panic sysctls:
    kernel.sysrq [bitmask] =  "16"  (see proc man page)
    kernel.panic [secs] =  0  (no autoreboot on panic)
    kernel.hung_task_panic =  0
    kernel.panic_on_oops =  1
    kernel.panic_on_io_nmi =  0
    kernel.panic_on_unrecovered_nmi =  0
    kernel.panic_on_stackoverflow =  0
    kernel.softlockup_panic =  0
    kernel.unknown_nmi_panic =  0
    kernel.nmi_watchdog =  1
    vm.panic_on_oom [0-2] =  0  (no panic)
```

To view the information about CPU, run xsos with `-c, --cpu` switch.

```
# xsos --cpu /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
CPU
  1 logical processors
  1 Intel Core i7-6700HQ CPU @ 2.60GHz (flags: aes,constant_tsc,ht,lm,nx,pae,rdrand)
```

To view about memory utilization, run xsos with `-m, --mem` switch.

```
# xsos --mem /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
MEMORY
  Stats graphed as percent of MemTotal:
    MemUsed    ▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊.....................  58.8%
    Buffers    ..................................................   0.6%
    Cached     ▊▊▊▊▊▊▊▊▊▊▊▊▊▊▊...................................  29.9%
    HugePages  ..................................................   0.0%
    Dirty      ..................................................   0.7%
  RAM:
    1.8 GiB total ram
    1.1 GiB (59%) used
    0.5 GiB (28%) used excluding Buffers/Cached
    0.01 GiB (1%) dirty
  HugePages:
    No ram pre-allocated to HugePages
  LowMem/Slab/PageTables/Shmem:
    0.09 GiB (5%) of total ram used for Slab
    0.02 GiB (1%) of total ram used for PageTables
    0.01 GiB (1%) of total ram used for Shmem
  Swap:
    0 GiB (0%) used of 2 GiB total
```

To view the added disks information, run xsos with `-d, --disks` switch.

```
# xsos --disks /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
STORAGE
  Whole Disks from /proc/partitions:
    2 disks, totaling 40 GiB (0.04 TiB)
    - - - - - - - - - - - - - - - - - - - - -
    Disk    Size in GiB
    ----    -----------
    sda     30
    sdb     10
```

To view the network interface configuration, run xsos with `-e, --ethtool` switch.

```
# xsos --ethtool /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
ETHTOOL
  Interface Status:
    enp0s10     0000:00:0a.0  link=up 1000Mb/s full (autoneg=Y)  rx ring 256/4096  drv e1000 v7.3.21-k8-NAPI / fw UNKNOWN
    enp0s9      0000:00:09.0  link=up 1000Mb/s full (autoneg=Y)  rx ring 256/4096  drv e1000 v7.3.21-k8-NAPI / fw UNKNOWN
    virbr0      N/A           link=DOWN                          rx ring UNKNOWN   drv bridge v2.3 / fw N/A
    virbr0-nic  tap           link=DOWN                          rx ring UNKNOWN   drv tun v1.6 / fw UNKNOWN
```

To view the information about IP address, run xsos with `-i, --ip` switch.

```
# xsos --ip /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
IP4
  Interface   Master IF  MAC Address        MTU     State  IPv4 Address
  =========   =========  =================  ======  =====  ==================
  lo          -          -                  65536   up     127.0.0.1/8
  enp0s9      -          08:00:27:0b:bc:e9  1500    up     192.168.1.8/24
  enp0s10     -          08:00:27:b2:08:91  1500    up     192.168.1.9/24
  virbr0      -          52:54:00:ae:01:94  1500    up     192.168.122.1/24
  virbr0-nic  virbr0     52:54:00:ae:01:94  1500    DOWN   -

IP6
  Interface   Master IF  MAC Address        MTU     State  IPv6 Address                                 Scope
  =========   =========  =================  ======  =====  ===========================================  =====
  lo          -          -                  65536   up     ::1/128                                      host
  enp0s9      -          08:00:27:0b:bc:e9  1500    up     fe80::945b:8333:f4bc:9723/64                 link
  enp0s10     -          08:00:27:b2:08:91  1500    up     fe80::7ed4:1fab:23c3:3790/64                 link
  virbr0      -          52:54:00:ae:01:94  1500    up     -                                            -
  virbr0-nic  virbr0     52:54:00:ae:01:94  1500    DOWN   -                                            -
```

To view the running processes via ps, run xsos with `-p, --ps` switch.

```
# xsos --ps /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
PS CHECK
  Total number of threads/processes:
    501 / 171
  Top users of CPU & MEM:
    USER     %CPU   %MEM   RSS
    root     20.6%  14.1%  0.30 GiB
    gdm      0.3%   16.8%  0.33 GiB
    postfix  0.0%   0.6%   0.01 GiB
    polkitd  0.0%   0.6%   0.01 GiB
    daygeek  0.0%   0.2%   0.00 GiB
    colord   0.0%   0.4%   0.01 GiB
  Uninteruptible sleep threads/processes (0/0):
    [None]
  Defunct zombie threads/processes (0/0):
    [None]
  Top CPU-using processes:
    USER      PID   %CPU  %MEM  VSZ-MiB  RSS-MiB  TTY    STAT  START  TIME  COMMAND
    root      6542  15.6  4.2   875      78       pts/0  Sl+   10:11  0:07  /usr/bin/python /sbin/sosreport
    root      7582  3.0   0.1   10       2        pts/0  S     10:12  0:00  /bin/bash /usr/sbin/dracut --print-cmdline
    root      7969  0.7   0.1   95       4        ?      Ss    10:12  0:00  /usr/sbin/certmonger -S -p
    root      7889  0.4   0.2   24       4        ?      Ss    10:12  0:00  /usr/lib/systemd/systemd-hostnamed
    gdm       3866  0.3   7.1   2856     131      ?      Sl    09:50  0:04  /usr/bin/gnome-shell
    root      8553  0.2   0.1   47       3        ?      S     10:12  0:00  /usr/lib/systemd/systemd-udevd
    root      6971  0.2   0.4   342      9        ?      Sl    10:12  0:00  /usr/sbin/abrt-dbus -t133
    root      3200  0.2   0.9   982      18       ?      Ssl   09:50  0:02  /usr/sbin/libvirtd
    root      2855  0.1   0.1   88       3        ?      Ss    09:50  0:01  /sbin/rngd -f
    rtkit     2826  0.0   0.0   194      2        ?      SNsl  09:50  0:00  /usr/libexec/rtkit-daemon
  Top MEM-using processes:
    USER      PID   %CPU  %MEM  VSZ-MiB  RSS-MiB  TTY    STAT  START  TIME  COMMAND
    gdm       3866  0.3   7.1   2856     131      ?      Sl    09:50  0:04  /usr/bin/gnome-shell
    root      6542  15.6  4.2   875      78       pts/0  Sl+   10:11  0:07  /usr/bin/python /sbin/sosreport
    root      3264  0.0   1.2   271      23       tty1   Ssl+  09:50  0:00  /usr/bin/X :0 -background
    root      3200  0.2   0.9   982      18       ?      Ssl   09:50  0:02  /usr/sbin/libvirtd
    root      3189  0.0   0.9   560      17       ?      Ssl   09:50  0:00  /usr/bin/python2 -Es /usr/sbin/tuned
    gdm       4072  0.0   0.9   988      17       ?      Sl    09:50  0:00  /usr/libexec/gsd-media-keys
    gdm       4076  0.0   0.8   625      16       ?      Sl    09:50  0:00  /usr/libexec/gsd-power
    gdm       4056  0.0   0.8   697      16       ?      Sl    09:50  0:00  /usr/libexec/gsd-color
    root      2853  0.0   0.7   622      14       ?      Ssl   09:50  0:00  /usr/sbin/NetworkManager --no-daemon
    gdm       4110  0.0   0.7   544      14       ?      Sl    09:50  0:00  /usr/libexec/gsd-wacom
  Top thread-spawning processes:
    #   USER      PID   %CPU  %MEM  VSZ-MiB  RSS-MiB  TTY    STAT  START  TIME  COMMAND
    17  root      3200  0.2   0.9   982      18       ?      -     09:50  0:02  /usr/sbin/libvirtd
    12  root      6542  16.1  4.5   876      83       pts/0  -     10:11  0:07  /usr/bin/python /sbin/sosreport
    10  gdm       3866  0.3   7.1   2856     131      ?      -     09:50  0:04  /usr/bin/gnome-shell
    7   polkitd   2864  0.0   0.6   602      13       ?      -     09:50  0:01  /usr/lib/polkit-1/polkitd --no-debug
    6   root      2865  0.0   0.0   203      1        ?      -     09:50  0:00  /usr/sbin/gssproxy -D
    5   root      3189  0.0   0.9   560      17       ?      -     09:50  0:00  /usr/bin/python2 -Es /usr/sbin/tuned
    5   root      2823  0.0   0.3   443      6        ?      -     09:50  0:00  /usr/libexec/udisks2/udisksd
    5   gdm       4102  0.0   0.2   461      5        ?      -     09:50  0:00  /usr/libexec/gsd-smartcard
    4   root      3215  0.0   0.2   470      4        ?      -     09:50  0:00  /usr/sbin/gdm
    4   gdm       4106  0.0   0.2   444      5        ?      -     09:50  0:00  /usr/libexec/gsd-sound
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/xsos-a-tool-to-read-sosreport-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-create-collect-sosreport-in-linux/
[2]: https://www.2daygeek.com/oswbb-how-to-install-and-configure-oswatcher-black-box-for-system-diagnostics/
[3]: https://github.com/ryran/xsos
[4]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]: https://www.2daygeek.com/wp-content/uploads/2019/05/xsos-a-tool-to-read-sosreport-in-linux-1.jpg

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10889-1.html)
[#]: subject: (xsos – A Tool To Read SOSReport In Linux)
[#]: via: (https://www.2daygeek.com/xsos-a-tool-to-read-sosreport-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

xsos：一个在 Linux 上阅读 SOSReport 的工具
======

![](https://img.linux.net.cn/data/attachment/album/201905/23/133305accwpsvhk1epsisc.jpg)

我们都已经知道 [SOSReport][1]。它用来收集可用于诊断的系统信息。Redhat 的支持服务建议我们在提交案例时提供 SOSReport 来分析当前的系统状态。

它会收集全部类型的报告，以帮助用户找出问题的根本原因。我们可以轻松地提取和阅读 SOSReport，但它很难阅读。因为它的每个部分都是一个单独的文件。

那么，在 Linux 中使用语法高亮显示阅读所有这些内容的最佳方法是什么。是的，这可以通过 `xsos` 工具做到。

### sosreport

`sosreport` 命令是一个从运行中的系统（尤其是 RHEL 和 OEL 系统）收集大量配置细节、系统信息和诊断信息的工具。它可以帮助技术支持工程师在很多方面分析系统。

此报告包含有关系统的大量信息，例如引导信息、文件系统、内存、主机名、已安装的 RPM、系统 IP、网络详细信息、操作系统版本、已安装的内核、已加载的内核模块、打开的文件列表、PCI 设备列表、挂载点及其细节、运行中的进程信息、进程树输出、系统路由、位于 `/etc` 文件夹中的所有配置文件，以及位于 `/var` 文件夹中的所有日志文件。

这将需要一段时间来生成报告，这取决于你的系统安装和配置。

完成后，`sosreport` 将在 `/tmp` 目录下生成一个压缩的归档文件。

### xsos

[xsos][3] 是一个帮助用户轻松读取 Linux 系统上的 `sosreport` 的工具。另一方面，我们可以说它是 `sosreport` 考官。

它可以立即从 `sosreport` 或正在运行的系统中汇总系统信息。

`xsos` 将尝试简化、解析、计算并格式化来自数十个文件（和命令）的数据，以便为你提供有关系统的详细概述。

你可以通过运行以下命令立即汇总系统信息。

```
# curl -Lo ./xsos bit.ly/xsos-direct; chmod +x ./xsos; ./xsos -ya
```

![][5]

### 如何在 Linux 上安装 xsos

我们可以使用以下两种方法轻松安装 `xsos`。

如果你正在寻找最新的前沿版本。使用以下步骤：

```
# curl -Lo /usr/local/bin/xsos bit.ly/xsos-direct
# chmod +x /usr/local/bin/xsos
```

下面是安装 `xsos` 的推荐方法。它将从 rpm 文件安装 `xsos`。

```
# yum install http://people.redhat.com/rsawhill/rpms/latest-rsawaroha-release.rpm
# yum install xsos
```

### 如何在 Linux 上使用 xsos

一旦通过上述方法之一安装了 xsos。只需运行 `xsos` 命令，不带任何选项，它们会显示有关系统的基本信息。

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

### 如何使用 xsos 命令在 Linux 中查看生成的 SOSReport 输出？

我们需要份 SOSReport 以使用 `xsos` 命令进一步阅读。

是的，我已经生成了一个 SOSReport，文件如下。

```
# ls -lls -lh /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa.tar.xz
9.8M -rw-------. 1 root root 9.8M May 12 10:13 /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa.tar.xz
```

运行如下命令解开它。

```
# tar xf sosreport-CentOS7-01-1005-2019-05-12-pomeqsa.tar.xz
```

要查看全部信息，带上 `-a` 或 `--all` 开关运行 `xsos`：

```
# xsos --all /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
```

要查看 BIOS 信息，带上 `-b` 或 `--bios` 开关运行 `xsos`。

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

要查看系统基本信息，如主机名、发行版、SELinux、内核信息、正常运行时间等，请使用 `-o` 或 `--os` 开关运行 `xsos`。

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

要查看 kdump 配置，请使用 `-k` 或 `--kdump` 开关运行 `xsos`。

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

要查看有关 CPU 的信息，请使用 `-c` 或 `--cpu` 开关运行 `xsos`。

```
# xsos --cpu /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
CPU
  1 logical processors
  1 Intel Core i7-6700HQ CPU @ 2.60GHz (flags: aes,constant_tsc,ht,lm,nx,pae,rdrand)
```

要查看内存利用情况，请使用 `-m` 或 `--mem` 开关运行 `xsos`。

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

要查看添加的磁盘信息，请使用 `-d` 和 `-disks` 开关运行 `xsos`。

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

要查看网络接口配置，请使用 `-e` 或 `--ethtool` 开关运行 `xsos`。

```
# xsos --ethtool /var/tmp/sosreport-CentOS7-01-1005-2019-05-12-pomeqsa
ETHTOOL
  Interface Status:
    enp0s10     0000:00:0a.0  link=up 1000Mb/s full (autoneg=Y)  rx ring 256/4096  drv e1000 v7.3.21-k8-NAPI / fw UNKNOWN
    enp0s9      0000:00:09.0  link=up 1000Mb/s full (autoneg=Y)  rx ring 256/4096  drv e1000 v7.3.21-k8-NAPI / fw UNKNOWN
    virbr0      N/A           link=DOWN                          rx ring UNKNOWN   drv bridge v2.3 / fw N/A
    virbr0-nic  tap           link=DOWN                          rx ring UNKNOWN   drv tun v1.6 / fw UNKNOWN
```

要查看有关 IP 地址的信息，请使用 `-i` 或 `--ip` 开关运行 `xsos`。

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

要通过 `ps` 查看正在运行的进程，请使用 `-p` 或 `--ps` 开关运行 `xsos`。

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
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-create-collect-sosreport-in-linux/
[2]: https://www.2daygeek.com/oswbb-how-to-install-and-configure-oswatcher-black-box-for-system-diagnostics/
[3]: https://github.com/ryran/xsos
[4]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]: https://www.2daygeek.com/wp-content/uploads/2019/05/xsos-a-tool-to-read-sosreport-in-linux-1.jpg

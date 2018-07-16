Linux系统中‘dmesg’命令处理故障和收集系统信息的7种用法
==========================================================

‘dmesg’命令显示linux内核的环形缓冲区信息，我们可以从中获得诸如系统架构、cpu、挂载的硬件，RAM等多个运行级别的大量的系统信息。当计算机启动时，系统内核（操作系统的核心部分）将会被加载到内存中。在加载的过程中会显示很多的信息，在这些信息中我们可以看到内核检测硬件设备。

![dmesg Command Examples](http://www.tecmint.com/wp-content/uploads/2014/07/dmesg-Command-Examples.png)

dmesg 命令的使用范例

‘dmesg’命令设备故障的诊断是非常重要的。在‘dmesg’命令的帮助下进行硬件的连接或断开连接操作时，我们可以看到硬件的检测或者断开连接的信息。‘dmesg’命令在多数基于**Linux**和**Unix**的操作系统中都可以使用。
 
下面我们展示一些最负盛名的‘dmesg’命令工具以及其实际使用举例。‘dmesg’命令的使用语法如下。

    # dmesg [options...]

### 1. 列出加载到内核中的所有驱动 ###

我们可以使用如‘**more**’。 ‘**tail**’, ‘**less** ’或者‘**grep**’文字处理工具来处理‘dmesg’命令的输出。由于dmesg日志的输出不适合在一页中完全显示，因此我们使用管道（pipe）将其输出送到more或者less命令单页显示。

    [root@tecmint.com ~]# dmesg | more
    [root@tecmint.com ~]# dmesg | less

### 输出 ###

    [    0.000000] Initializing cgroup subsys cpuset
    [    0.000000] Initializing cgroup subsys cpu
    [    0.000000] Initializing cgroup subsys cpuacct
    [    0.000000] Linux version 3.11.0-13-generic (buildd@aatxe) (gcc version 4.8.1 (Ubuntu/Linaro 4.8.1-10ubuntu8) ) #20-Ubuntu SMP Wed Oct 23 17:26:33 UTC 2013 
    (Ubuntu 3.11.0-13.20-generic 3.11.6)
    [    0.000000] KERNEL supported cpus:
    [    0.000000]   Intel GenuineIntel
    [    0.000000]   AMD AuthenticAMD
    [    0.000000]   NSC Geode by NSC
    [    0.000000]   Cyrix CyrixInstead
    [    0.000000]   Centaur CentaurHauls
    [    0.000000]   Transmeta GenuineTMx86
    [    0.000000]   Transmeta TransmetaCPU
    [    0.000000]   UMC UMC UMC UMC
    [    0.000000] e820: BIOS-provided physical RAM map:
    [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
    [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
    [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007dc08bff] usable
    [    0.000000] BIOS-e820: [mem 0x000000007dc08c00-0x000000007dc5cbff] ACPI NVS
    [    0.000000] BIOS-e820: [mem 0x000000007dc5cc00-0x000000007dc5ebff] ACPI data
    [    0.000000] BIOS-e820: [mem 0x000000007dc5ec00-0x000000007fffffff] reserved
    [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
    [    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fed003ff] reserved
    [    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed9ffff] reserved
    [    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reserved
    [    0.000000] BIOS-e820: [mem 0x00000000ffb00000-0x00000000ffffffff] reserved
    [    0.000000] NX (Execute Disable) protection: active
    .....

###2. 列出所有被检测到的硬件 ###

要显示所有被内核检测到的硬盘设备，你可以使用‘**grep**’命令搜索‘**sda**’关键词，如下： 

    [root@tecmint.com ~]# dmesg | grep sda
    
    [    1.280971] sd 2:0:0:0: [sda] 488281250 512-byte logical blocks: (250 GB/232 GiB)
    [    1.281014] sd 2:0:0:0: [sda] Write Protect is off
    [    1.281016] sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
    [    1.281039] sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
    [    1.359585]  sda: sda1 sda2 < sda5 sda6 sda7 sda8 >
    [    1.360052] sd 2:0:0:0: [sda] Attached SCSI disk
    [    2.347887] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
    [   22.928440] Adding 3905532k swap on /dev/sda6.  Priority:-1 extents:1 across:3905532k FS
    [   23.950543] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
    [   24.134016] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: (null)
    [   24.330762] EXT4-fs (sda7): mounted filesystem with ordered data mode. Opts: (null)
    [   24.561015] EXT4-fs (sda8): mounted filesystem with ordered data mode. Opts: (null)

**注解** ‘sda’表示第一块 SATA硬盘，‘sdb’表示第二块SATA硬盘。若想查看IDE硬盘搜索‘hda’或‘hdb’关键词。

### 3. 只输出dmesg命令的前20行日志 ###

在‘dmesg’命令后跟随‘head’命令来显示开始几行，‘dmesg | head -20′命令将显示开始的前20行。

    [root@tecmint.com ~]# dmesg | head  -20
    
    [    0.000000] Initializing cgroup subsys cpuset
    [    0.000000] Initializing cgroup subsys cpu
    [    0.000000] Initializing cgroup subsys cpuacct
    [    0.000000] Linux version 3.11.0-13-generic (buildd@aatxe) (gcc version 4.8.1 (Ubuntu/Linaro 4.8.1-10ubuntu8) ) #20-Ubuntu SMP Wed Oct 23 17:26:33 UTC 2013 (Ubuntu 3.11.0-13.20-generic 3.11.6)
    [    0.000000] KERNEL supported cpus:
    [    0.000000]   Intel GenuineIntel
    [    0.000000]   AMD AuthenticAMD
    [    0.000000]   NSC Geode by NSC
    [    0.000000]   Cyrix CyrixInstead
    [    0.000000]   Centaur CentaurHauls
    [    0.000000]   Transmeta GenuineTMx86
    [    0.000000]   Transmeta TransmetaCPU
    [    0.000000]   UMC UMC UMC UMC
    [    0.000000] e820: BIOS-provided physical RAM map:
    [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
    [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
    [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007dc08bff] usable
    [    0.000000] BIOS-e820: [mem 0x000000007dc08c00-0x000000007dc5cbff] ACPI NVS
    [    0.000000] BIOS-e820: [mem 0x000000007dc5cc00-0x000000007dc5ebff] ACPI data
    [    0.000000] BIOS-e820: [mem 0x000000007dc5ec00-0x000000007fffffff] reserved

###4. 只输出dmesg命令最后20行日志 ###

在‘dmesg’命令后跟随‘tail’命令（‘ dmesg | tail -20’）来输出‘dmesg’命令的最后20行日志，当你插入可移动设备时它是非常有用的。

    [root@tecmint.com ~]# dmesg | tail -20
    
    parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
    ppdev: user-space parallel port driver
    EXT4-fs (sda1): mounted filesystem with ordered data mode
    Adding 2097144k swap on /dev/sda2.  Priority:-1 extents:1 across:2097144k
    readahead-disable-service: delaying service auditd
    ip_tables: (C) 2000-2006 Netfilter Core Team
    nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
    NET: Registered protocol family 10
    lo: Disabled Privacy Extensions
    e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
    Slow work thread pool: Starting up
    Slow work thread pool: Ready
    FS-Cache: Loaded
    CacheFiles: Loaded
    CacheFiles: Security denies permission to nominate security context: error -95
    eth0: no IPv6 routers present
    type=1305 audit(1398268784.593:18630): audit_enabled=0 old=1 auid=4294967295 ses=4294967295 res=1
    readahead-collector: starting delayed service auditd
    readahead-collector: sorting
    readahead-collector: finished

### 5. 搜索包含特定字符串的被检测到的硬件 ###

由于‘dmesg’命令的输出实在太长了，在其中搜索某个特定的字符串是非常困难的。因此，有必要过滤出一些包含‘**usb**’ ‘**dma**’ ‘**tty**’ ‘**memory**’等字符串的日志行。[grep 命令][1] 的‘**-i**’选项表示忽略大小写。

    [root@tecmint.com log]# dmesg | grep -i usb
    [root@tecmint.com log]# dmesg | grep -i dma
    [root@tecmint.com log]# dmesg | grep -i tty
    [root@tecmint.com log]# dmesg | grep -i memory

###输出###
  
    [    0.000000] Scanning 1 areas for low memory corruption
    [    0.000000] initial memory mapped: [mem 0x00000000-0x01ffffff]
    [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
    [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
    [    0.000000] init_memory_mapping: [mem 0x37800000-0x379fffff]
    [    0.000000] init_memory_mapping: [mem 0x34000000-0x377fffff]
    [    0.000000] init_memory_mapping: [mem 0x00100000-0x33ffffff]
    [    0.000000] init_memory_mapping: [mem 0x37a00000-0x37bfdfff]
    [    0.000000] Early memory node ranges
    [    0.000000] PM: Registered nosave memory: [mem 0x0009f000-0x000effff]
    [    0.000000] PM: Registered nosave memory: [mem 0x000f0000-0x000fffff]
    [    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
    [    0.000000] Memory: 2003288K/2059928K available (6352K kernel code, 607K rwdata, 2640K rodata, 880K init, 908K bss, 56640K reserved, 1146920K highmem)
    [    0.000000] virtual kernel memory layout:
    [    0.004291] Initializing cgroup subsys memory
    [    0.004609] Freeing SMP alternatives memory: 28K (c1a3e000 - c1a45000)
    [    0.899622] Freeing initrd memory: 23616K (f51d0000 - f68e0000)
    [    0.899813] Scanning for low memory corruption every 60 seconds
    [    0.946323] agpgart-intel 0000:00:00.0: detected 32768K stolen memory
    [    1.360318] Freeing unused kernel memory: 880K (c1962000 - c1a3e000)
    [    1.429066] [drm] Memory usable by graphics device = 2048M

### 6. 清空dmesg缓冲区日志 ###

我们可以使用如下命令来清空dmesg的日志。该命令会清空dmesg环形缓冲区中的日志。但是你依然可以查看存储在‘**/var/log/dmesg**’文件中的日志。你连接任何的设备都会产生dmesg日志输出。

    [root@tecmint.com log]# dmesg -c

### 7. 实时监控dmesg日志输出 ###

在某些发行版中可以使用命令‘tail -f /var/log/dmesg’来实时监控dmesg的日志输出。

    [root@tecmint.com log]# watch "dmesg | tail -20"

**结论**：dmesg命令在系统dmesg记录实时更改或产生的情况下是非常有用的。你可以使用man dmesg来获取更多关于dmesg的信息。

----------

![](http://1.gravatar.com/avatar/36c7c25164c3455f2f711b01e395de0d?s=80&d=blank&r=G)

Narad Shrestha

- [Twitter profile][t]
- [Facebook profile][f]
- [Google+ profile][g]

他在IT领域拥有超过10年的丰富经验，其中包括各种Linux发行版，开源软件和网络工作。 Narad始终坚持与他人分享IT知识和自如地运用新技术。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/dmesg-commands/

译者：[cvsher](https://github.com/cvsher) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/12-practical-examples-of-linux-grep-command/
[t]:http://twitter.com/@nrdshrestha
[f]:http://facebook.com/narad.shrestha.9
[g]:http://plus.google.com/104542109955805873615?rel=author


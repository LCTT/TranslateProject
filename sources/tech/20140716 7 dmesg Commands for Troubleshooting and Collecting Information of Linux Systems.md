Translating by cvsher

7 ‘dmesg’ Commands for Troubleshooting and Collecting Information of Linux Systems
================================================================================
The ‘dmesg‘ command displays the messages from the kernel ring buffer. A system passes multiple runlevel from where we can get lot of information like system architecture, cpu, attached device, RAM etc. When computer boots up, a kernel (core of an operating system) is loaded into memory. During that period number of messages are being displayed where we can see hardware devices detected by kernel.

![dmesg Command Examples](http://www.tecmint.com/wp-content/uploads/2014/07/dmesg-Command-Examples.png)
dmesg Command Examples

The messages are very important in terms of diagnosing purpose in case of device failure. When we connect or disconnect hardware device on the system, with the help of dmesg command we come to know detected or disconnected information on the fly. The dmesg command is available on most **Linux and Unix** based Operating System.

Let’s throw some light on most famous tool called ‘dmesg’ command with their practical examples as discussed below. The exact syntax of dmesg as follows.

    # dmseg [options...]

### 1. List all loaded Drivers in Kernel ###

We can use text-manipulation tools i.e. ‘**more**‘, ‘**tail**‘, ‘**less**‘ or ‘**grep**‘ with dmesg command. As output of dmesg log won’t fit on a single page, using dmesg with pipe more or less command will display logs in a single page.

    [root@tecmint.com ~]# dmesg | more
    [root@tecmint.com ~]# dmesg | less

#### Sample Output ####

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

### 2. List all Detected Devices ###

To discover which hard disks has been detected by kernel, you can search for the keyword “**sda**” along with “**grep**” like shown below.

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

**NOTE**: The ‘sda’ first SATA hard drive, ‘sdb’ is the second SATA hard drive and so on. Search with ‘hda’ or ‘hdb’ in the case of IDE hard drive.

### 3. Print Only First 20 Lines of Output ###

The ‘head’ along with dmesg will show starting lines i.e. ‘dmesg | head -20′ will print only 20 lines from the starting point.

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

### 4. Print Only Last 20 Lines of Output ###

The ‘tail’ along with dmesg command will print only 20 last lines, this is useful in case we insert removable device.

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

### 5. Search Detected Device or Particular String ###

It’s difficult to search particular string due to length of dmesg output. So, filter the lines with are having string like ‘**usb**‘ ‘**dma**‘ ‘**tty**‘ and ‘**memory**‘ etc. The ‘**-i**’ option instruct to [grep command][1] to ignore the case (upper or lower case letters).

    [root@tecmint.com log]# dmesg | grep -i usb
    [root@tecmint.com log]# dmesg | grep -i dma
    [root@tecmint.com log]# dmesg | grep -i tty
    [root@tecmint.com log]# dmesg | grep -i memory

#### Sample Output ####

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

### 6. Clear dmesg Buffer Logs ###

Yes, we can clear dmesg logs if required with below command. It will clear dmesg ring buffer message logs till you executed the command below. Still you can view logs stored in ‘**/var/log/dmesg**‘ files. If you connect any device will generate dmesg output.

    [root@tecmint.com log]# dmesg -c

### 7. Monitoring dmesg in Real Time ###

Some distro allows command ‘tail -f /var/log/dmesg’ as well for real time dmesg monitoring.

    [root@tecmint.com log]# watch "dmesg | tail -20"

**Conclusion**: The dmesg command is useful as dmesg records all the system changes done or occur in real time. As always you can man dmesg to get more information.

----------

![](http://1.gravatar.com/avatar/36c7c25164c3455f2f711b01e395de0d?s=80&d=blank&r=G)

Narad Shrestha

- [Twitter profile][t]
- [Facebook profile][f]
- [Google+ profile][g]

He has over 10 years of rich IT experience which includes various Linux Distros, FOSS and Networking. Narad always believes sharing IT knowledge with others and adopts new technology with ease.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/dmesg-commands/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/12-practical-examples-of-linux-grep-command/
[t]:http://twitter.com/@nrdshrestha
[f]:http://facebook.com/narad.shrestha.9
[g]:http://plus.google.com/104542109955805873615?rel=author

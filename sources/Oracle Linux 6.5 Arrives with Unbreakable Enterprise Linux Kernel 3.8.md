Oracle Linux 6.5 Arrives with Unbreakable Enterprise Linux Kernel 3.8
================================================================================
**Oracle has announced a few days ago that its Oracle Linux operating system has reached version 6.5, bringing lots of new features, updated packages and several improvements over previus releases.**

![](http://i1-news.softpedia-static.com/images/news2/Oracle-Linux-6-5-Arrives-with-Unbreakable-Enterprise-Linux-Kernel-3-8-406093-2.jpg)

First of all, we should mention that Oracle Linux 6.5 is now powered by three separate kernels, the unbreakable enterprise kernel version 2.6.39-400.211.1.el6uek only for the x86 (32-bit) platform, the unbreakable enterprise kernel version 3.8.13-16.2.1.el6uek for both 64-bit and 32-bit architectures, and the Red Hat compatible kernel 2.6.32-431.el6 for x86 and x86_64.

Unbreakable Enterprise Kernel Release 3 (UEK R3) introduces major improvements over UEK R2, including integrated DTrace support, device mapper support, Btrfs quota groups, Btrfs send and receive subcommands, support for replacing devices without unmounting in Btrfs, EXT4 quotas, TCP controlled delay management, TCP connection repair, STCP and TCP early retransmit, TCP fast open, and TCP small queue algorithm.

The loop driver has been update to provide the same I/O functionality as the dm-nfs project, simply by extending the AIO interface to perform direct I/O. Moreover, the secure computing mode feature has been added, and the OpenFabrics Enterprise Distribution (OFED) 2.0 stack supports the following protocols: SRP (SCSI RDMA Protocol), iSER (iSCSI Extensions), RDS (Reliable Datagram Sockets), SDP (Sockets Direct Protocol), EoIB (Ethernet over InfiniBand), IPoIB (IP encapsulation over InfiniBand), and eIPoIB (Ethernet tunneling over InfiniBand).

The OFED (OpenFabrics Enterprise Distribution) 2.0 stack also supports the following RDS features: AS (Async Send), APM (Automatic Path Migration), QoS (Quality of Service), SRQ (Shared Request Queue), AB (Active Bonding), and NF (Netfilter).

Last but not least, paravirtualization support has been enabled for Oracle Linux guests on Windows Server 2008 R2 Hyper-V or Windows Server 2008 Hyper-V.

**Download Oracle Linux 6.5 right now:**

- [Oracle Enterprise Linux 6.5 (ISO) i386][1][iso] [3 GB]
- [Oracle Enterprise Linux 6.5 (ISO) amd64][2][iso] [3.60 GB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Oracle-Linux-6-5-Arrives-with-Unbreakable-Enterprise-Linux-Kernel-3-8-406093.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mirrors.dotsrc.org/oracle-linux/OL6/U5/i386/OracleLinux-R6-U5-Server-i386-dvd.iso
[2]:http://mirrors.dotsrc.org/oracle-linux/OL6/U5/x86_64/OracleLinux-R6-U5-Server-x86_64-dvd.iso
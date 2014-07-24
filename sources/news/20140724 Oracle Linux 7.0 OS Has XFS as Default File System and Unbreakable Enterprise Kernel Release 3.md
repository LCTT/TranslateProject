Oracle Linux 7.0 OS Has XFS as Default File System and Unbreakable Enterprise Kernel Release 3
================================================================================
![The new Oracle Linux 7.0 is out](http://i1-news.softpedia-static.com/images/news2/Oracle-Linux-7-0-OS-Has-XFS-as-Default-File-System-and-Unbreakable-Enterprise-Kernel-Release-3-451894-2.jpg)

**The Oracle Linux 7.0 operating system has been released by Oracle and brings numerous new features and changes, like Unbreakable Enterprise Kernel Release 3 and a new default file system.**

The Oracle developers have gone through a couple of Release Candidates for this new build of the distribution and now the final version has arrived. As expected, it's packed with a ton of modifications, which include the new XFS as the default operating system, Btrfs as an alternative, Linux Containers (LXC), DTrace, Ksplice, Xen enhancements, and the Unbreakable Enterprise Kernel Release 3.

As opposed to the more popular EXT4 file system, XFS has one major advantage. It allows users to have 500 TB for the file system size, which is ten times more than what you would get with EXT4. The only drawback is that it only allows for 16 TB maximum file size.

The distribution features two supported kernels. One is the Red Hat Compatible Kernel (RHCK), based on mainline Linux version 3.10, and the second one is their own version, which is called the Unbreakable Enterprise Kernel Release 3 (UEK R3), and starting with 3.8.13 it's based on the mainline Linux version 3.8. You might remember that Linux Kernel 3.8.x has already reached end of life, but it looks like Oracle is maintaining its own branch.

“Available for download from Oracle Software Delivery Cloud, Oracle Linux 7 is free to download and distribute. All bug fixes and security errata are published to Oracle's public yum servers, allowing customers to install the same code across all their deployments, with or without a subscription, and creating a simple migration path from free to paid. No reinstalls are required.”

“This release builds on Oracle's approach to providing support for emerging technologies, such as OpenStack, while delivering the latest Linux innovations, tools, and features customers and partners need to deliver enterprise-grade solutions for the modern data center,” reads the official announcement.

According to the changelog, Ksplice has been implemented for zero-downtime kernel security updates and bug fixes, systemd has been implemented as the new system manager, Grub2 is now the default boot loader with support for additional firmware types (like UEFI), and an improved Anaconda installer, a few new Apache Web Server features, GPT support, and numerous security features and improvements have been added.

More details about the latest Oracle Linux distro can be found in the official [announcement][1]. 

#### Download Oracle Linux 7.0 right now: ####

- [Oracle Enterprise Linux 6.5 (ISO) 64-bit][2][iso] [3 GB]
- [Oracle Enterprise Linux 6.5 (ISO) 32-bit][3][iso] [3.60 GB]
- [Oracle Enterprise Linux 7.0 (ISO) 64-bit][4][iso] [4.50 GB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Oracle-Linux-7-0-OS-Has-XFS-as-Default-File-System-and-Unbreakable-Enterprise-Kernel-Release-3-451894.shtml

原文作者：[Silviu Stahie][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/silviu-stahie
[1]:http://www.oracle.com/us/corporate/press/2245947
[2]:http://mirrors.dotsrc.org/oracle-linux/OL6/U5/i386/OracleLinux-R6-U5-Server-i386-dvd.iso
[3]:http://mirrors.dotsrc.org/oracle-linux/OL6/U5/x86_64/OracleLinux-R6-U5-Server-x86_64-dvd.iso
[4]:https://edelivery.oracle.com/linux/
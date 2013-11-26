23 The Linux Kernel: Configuring the Kernel Part 19
================================================================================
![](http://www.linux.org/attachments/slide-jpg.626/)

Aloha and welcome to the next article of the Linux kernel series! We are getting closer to the end of the configuration process. In this article, we will discuss firmware drivers and then the filesystem drivers.

The first driver in this category is for finding the boot-disk (BIOS Enhanced Disk Drive calls determine boot disk). Sometimes, Linux does not know which drive is the bootable drive. This driver allows the kernel to ask the BIOS. Linux then stores the information on sysfs. Linux needs to know this for setting up bootloaders.

Even if BIOS EDD services are compiled in the kernel, this option can set such services to be inactive by default (Sets default behavior for EDD detection to off ). EDD stands for Enhanced Disk Drive.

When using kexec to load a different kernel, performance can be increased by having the firmware provide a memory map (Add firmware-provided memory map to sysfs).

The "Dell Systems Management Base Driver" gives the Linux kernel better control of the Dell hardware via the sysfs interface.

The hardware's information can be accessed by the software via /sys/class/dmi/id/ with this driver enabled (Export DMI identification via sysfs to userspace). DMI stands for Desktop Management Interface. The DMI manages the components of the hardware and can access the hardware's data. The structure of the data in the BIOS and hardware is regulated by the System Management BIOS (SMBIOS) specification.

The raw data tables from the DMI can be accessed with this driver (DMI table support in sysfs).

To boot from an iSCSI driver, enable this driver (iSCSI Boot Firmware Table Attributes).

The last firmware driver is a set of "Google Firmware Drivers". These are drivers for Google-specific hardware. Do not enable this driver unless you work for Google and need to use Linux on such hardware or if you are making a Linux kernel for a computer you stole from Google.

Next, we can configure the file system support of the kernel.

The "Second extended fs support" driver provides the EXT2 filesystem. [http://www.linux.org/threads/ext-file-system.4365/][1]

![](http://www.linux.org/attachments/kernel_19-png.627/)

The "Ext2 extended attributes" offers the ability to use extra metadata not natively supported by the filesystem.

The "Ext2 POSIX Access Control Lists" driver adds additional permission schemes not native to EXT2.

The "Ext2 Security Labels" enhances the security provided by SElinux.

Enabling "Ext2 execute in place support" allows executables to be executed in the current location without being executed using the paged cache.

The EXT3 filesystem is offered by this driver (Ext3 journaling file system support). [http://www.linux.org/threads/ext-file-system.4365/][2]

The "Default to 'data=ordered' in ext3" driver sets the data ordering mode to "Ordered". This deals with the way the journaling and writing work. Data ordering is explained in this article - [http://www.linux.org/threads/journal-file-system.4136/][3]

The "Ext3 extended attributes" offers the ability to use extra metadata not natively supported by the filesystem. Again, the following EXT3 drivers/features are the same as for EXT2 - "Ext3 POSIX Access Control Lists" and "Ext3 Security Labels". Also, the same is true for the following EXT4 drivers/features - "Ext4 POSIX Access Control Lists", "Ext4 Security Labels", and "EXT4 debugging support".

Journal Block Device debugging is supported by EXT3 (JBD debugging support) and EXT4 (JBD2 debugging support).

The next driver offers the Reiser filesystem (Reiserfs support). [http://www.linux.org/threads/reiser-file-system-reiser3-and-reiser4.4403/][4]

Debugging exists for the Reiser filesystem (Enable reiserfs debug mode).

The kernel can store ReiserFS statistics in /proc/fs/reiserfs (Stats in /proc/fs/reiserfs).

The following Reiser drivers/features are the same as the ones for EXT2/3/4 - "ReiserFS extended attributes", "ReiserFS POSIX Access Control Lists", and "ReiserFS Security Labels".

JFS is also supported by the Linux kernel and includes various features - "JFS filesystem support", "JFS POSIX Access Control Lists", "JFS Security Labels", "JFS debugging", and "JFS statistics". [http://www.linux.org/threads/journaled-file-system-jfs.4404/][5]

Again, XFS is supported with drivers/features that can be enabled - "XFS filesystem support", "XFS Quota support", "XFS POSIX ACL support", "XFS Realtime subvolume support", and "XFS Debugging support". [http://www.linux.org/threads/xfs-file-system.4364/][6]

The Global FileSystem 2 is supported by the Linux kernel (GFS2 file system support). This filesystem is used to share storage in a cluster.

The "GFS2 DLM locking" driver offers a distributed lock manager (DLM) for GFS2.

The Oracle Cluster FileSystem 2 is supported by the Linux kernel (OCFS2 file system support). This filesystem is used to share storage in a cluster.

The "O2CB Kernelspace Clustering" driver offers various services for the OCFS2 filesystem.

The "OCFS2 Userspace Clustering" driver allows the cluster stack to execute in userspace.

The "OCFS2 statistics" driver allows the user to get statistics concerning the filesystem.

Like with most of the Linux kernel, the OCFS2 offers logging (OCFS2 logging support). This may be used to watch for errors or for debugging purposes.

The "OCFS2 expensive checks" driver offers storage consistency checks at the cost of performance. Some Linux users recommend only enabling this feature for debugging purposes.

The kernel also contains the new B-Tree FileSystem; this driver offers the disk formatter (Btrfs filesystem Unstable disk format). BTRFS is still in development and is planned to one day become as popular or more popular than EXT4. [http://www.linux.org/threads/b-tree-file-system-btrfs.4430/][7]

The "Btrfs POSIX Access Control Lists" driver adds additional permission schemes not native to BTRFS.

Next, there is a BTRFS check tool (Btrfs with integrity check tool compiled in (DANGEROUS)). Since, BTRFS is a newly developing filesystem, most of the software associated with it are unstable.

The NIL-FileSystem is also supported by Linux (NILFS2 file system support). [http://www.linux.org/threads/new-implementation-of-a-log-structured-file-system-nilfs.4547/][8]

To support the flock() system call used by some filesystems, enable this driver (Enable POSIX file locking API). Disabling this driver will reduce the kernel size by about eleven kilobytes. The driver provides file-locking. File-locking is the process of allowing one process to read a file at a time. This is commonly used with network filesystems like NFS.

The "Dnotify support" driver is a legacy filesystem notification system that informs the userspace of events on the file system. One use of this and the successor notifications software is to monitor the filesystem for applications. Certain applications tell this daemon what events to watch. Otherwise, each userspace application would need to complete this task themselves.

Remember, Dnotify is a legacy system, so what is the new notification system? It is Inotify which is provided by this driver (Inotify support for userspace).

An alternative notification system is fanotify (Filesystem wide access notification). Fanotify is the same as Inotify, but fanotify relays more information to the userspace than Inotify.

Fanotify can check permissions with this driver enabled (fanotify permissions checking).

For systems that need to divide the storage space by user will want "Quota support". [http://www.linux.org/threads/atomic-disk-quotas.4277/][9]

The following driver allows disk quota warnings and messages to be reported through netlink (Report quota messages through netlink interface). Netlink is a socket interface on the userspace that communicates with the kernel.

Quota messages can also be sent to a console (Print quota warnings to console (OBSOLETE)).

This driver allows the quota system to perform extra sanity checks (Additional quota sanity checks). In computer technology, a sanity check is the process of checking for errors that may be due to poor programming. The files and output are inspected to ensure the data is what it should be and not structured in some odd fashion.

Some old system use the old quota system but want to retain the old quota system when upgrading to a newer kernel. This is easily solved by enabling this driver (Old quota format support). Many readers may be wondering why someone would want to keep the old quota system instead of upgrading. Well, imagine being the manager of the IT department of a very large corporation that has many servers running very important tasks. Would you want to create and configure a new (and possibly large) quota system when you can continue using the one that works well? Generally, with computers, follow the principle - If it is not broken or will not cause security issues, do not fix it.

The newer quota system supports 32-bit UIDs and GIDs with this driver (Quota format vfsv0 and vfsv1 support).

To automatically mount remote storage units, enable this driver (Kernel automounter version 4 support).

FUSE filesystems are supported by this driver (FUSE (Filesystem in Userspace) support). Filesystem in Userspace (FUSE) allows any user to create their own filesystem and utilize it in userspace.

A special extension for FUSE can be used to utilize character devices in userspace (Character device in Userspace support).

In the next article, we will discuss caches, optical disc filesystems, FAT32 on Linux, and other interesting filesystem topics. Mahalo! 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-19.4929/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linux.org/threads/ext-file-system.4365/
[2]:http://www.linux.org/threads/ext-file-system.4365/
[3]:http://www.linux.org/threads/journal-file-system.4136/
[4]:http://www.linux.org/threads/reiser-file-system-reiser3-and-reiser4.4403/
[5]:http://www.linux.org/threads/journaled-file-system-jfs.4404/
[6]:http://www.linux.org/threads/xfs-file-system.4364/
[7]:http://www.linux.org/threads/b-tree-file-system-btrfs.4430/
[8]:http://www.linux.org/threads/new-implementation-of-a-log-structured-file-system-nilfs.4547/
[9]:http://www.linux.org/threads/atomic-disk-quotas.4277/
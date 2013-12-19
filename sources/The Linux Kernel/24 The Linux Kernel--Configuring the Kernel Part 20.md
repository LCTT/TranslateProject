24 The Linux Kernel: Configuring the Kernel Part 20
================================================================================
![](http://www.linux.org/attachments/slide-jpg.663/)

Aloha and welcome to the next Linux kernel article! In this article, we will continue configuring filesystem support.

First, we can enable "General filesystem local caching manager" which allows the kernel to store filesystem cache. This can enhance performance at the cost of storage space.

The caching system can be monitored with statistical information used for debugging purposes (Gather statistical information on local caching). Generally, this feature should only be enabled if you plan to debug the caching system.

![](http://www.linux.org/attachments/kernel_20-png.664/)

This next feature is a lot like the above, but this feature stores latency information (Gather latency information on local caching). Again, this is a debugging feature.

The "Debug FS-Cache" driver offers many other debugging abilities for the cache system.

The next cache debugging tool keeps a global list (any process can access the list) of filesystem cache objects (Maintain global object list for debugging purposes).

To enhance the speed of network filesystems, enable this next driver (Filesystem caching on files). This feature allows a whole local filesystem to be used as cache for remote filesystem and storage units. The Linux kernel will manage this partition.

Two different debugging drivers exist for this local cache system for remote filesystems (Debug CacheFiles) and (Gather latency information on CacheFiles).

The most common optical disc filesystem is ISO-9660 which is ISO standard 9660, hence the name (ISO 9660 CDROM file system support). This driver is needed to read/write the major of optical discs.

When reading an optical disc with files using long Unicode filenames or writing such files, this driver is required (Microsoft Joliet CDROM extensions). This is an extension to the ISO-9660 filesystem.

The "Transparent decompression extension" allows data to be written to a disc in a compressed form and read off the disc and decompressed transparently. This will allow more data to be placed on the disc.

"UDF file system support" allows the kernel to read/write rewritable-optical-discs that are using the UDF filesystem. UDF is designed to manage incremental writes. UDF allows the rewritable optical disc to be used more like flash drives. The system can write and update the optical disc's data more quickly than regular writing on ISO-9660 filesystems. However, this is not faster than using flash drives.

As many of you know, Windows is a very popular system, so many storage units are using the FAT filesystem of NTFS. Thankfully, Linux supports such filesystems. The "MSDOS fs support" driver is a general driver for MS-DOS filesystems. This will increase the kernel size significantly, but since the FAT filesystems are very common, this size increase is usually worth the cost. [http://www.linux.org/threads/file-allocation-table-fat.4472/][1]

To support the FAT filesystems, enable this driver (VFAT (Windows-95) fs support). At the time this article was written, this driver does not support FAT64 (commonly called exFAT).

![](http://www.linux.org/attachments/kernel_20_2-png.665/)

The size of the codepage can be set here (Default codepage for FAT).

After that, the default character set is configured for the FAT filesystems (Default iocharset for FAT).

The NTFS file system is offered with this driver (NTFS file system support). The driver provides read-only abilities. To write to NTFS, enable this driver (NTFS write support).

The Linux kernel offers debugging tools for the NTFS filesystem (NTFS debugging support).

To have a proc folder in the root, this feature must be enabled (/proc file system support). Some other similar drivers that rely on this one include (/proc/kcore support), (/proc/vmcore support), and (Sysctl support (/proc/sys)). The proc system (short for “process”) uses the proc-filesystem sometimes called procfs. This filesystem is in the hardware's memory and is created when Linux boots up. So, when viewing files in proc, the user is browsing the memory as if it were like other storage units. Proc acts as an interface between userspace and the kernelspace. Proc is in the kernelspace.

The "Enable /proc page monitoring" driver offers some proc files that monitor the memory utilization of processes.

The "sysfs file system support" driver creates the /sys/ folder. The sysfs filesystem is in memory and provides an interface to the kernel objects.

The tmp directory is needed by many applications and Linux itself, so it is strongly recommended that this driver be enabled (Tmpfs virtual memory file system support (former shm fs)). The tmp filesystem maybe stored on the hard-drive or in memory and is used only to store temporary files.

The "Tmpfs POSIX Access Control Lists" driver offers extra permission features for the files in the tmpfs virtual filesystem.

The "Tmpfs extended attributes" driver provides more attributes to tmpfs files than what they would normally have without he driver.

The "HugeTLB file system support" driver provides the hugetlbfs filesystem, which is ramfs based. This virtual filesystem contains HugeTLB pages.


The configfs filesystem is a kernel object manager in the form of a filesystem (Userspace-driven configuration filesystem). It is highly recommended that this driver be enabled. ConfigFS is a lot like sysfs. However, ConfigFS is used to create and delete kernel object while sysfs is used to view and modify kernel objects.

Next, we can move back to "real" filesystems. That is, the filesystems users themselves use to store their personal files. Next, the kernel can be given the ability to read ADFS filesystems (ADFS file system support).

The ability to write to ADFS filesystems is provided by a separate and unstable driver (ADFS write support (DANGEROUS)). ADFS stands for Advanced Disc Filing System.

Linux also supports the Amiga Fast FileSystem (Amiga FFS file system support). [http://www.linux.org/threads/amiga-fast-file-system-affs.4429/][2]

The "eCrypt filesystem layer support" driver offers a POSIX-compliant cryptographic filesystem layer. This eCrypt can be placed on every and any filesystem no matter what partition table the filesystem resides on. [http://www.linux.org/threads/intro-to-encryption.4376/][3]

The eCrypt layer can have a device file if this driver is enabled (Enable notifications for userspace key wrap/unwrap). The device path is /dev/ecryptfs.

Linux also supports HFS and HFS+ (Apple Macintosh file system support) and (Apple Extended HFS file system support). [http://www.linux.org/threads/hierarchical-file-system-hfs.4480/][4] and [http://www.linux.org/threads/hierarchical-file-system-plus-hfs.4493/][5]

The BeFS filesystem can be used by Linux as a read-only filesystem (BeOS file system (BeFS) support (read only)). Generally, it is easier to program the reading abilities for a filesystem than the writing features.

Special debugging features exist for BeFS (Debug BeFS).

EFS is another filesystem that Linux can only read, not write (EFS file system support (read only)). [http://www.linux.org/threads/extent-file-system-efs.4447/][5]

Some flash drives may use the JFFS2 filesystem (Journalling Flash File System v2 (JFFS2) support). Next, the debugging level can be set (JFFS2 debugging verbosity). [http://www.linux.org/threads/journaling-flash-file-system-version-2-jffs2.4495/][6]

To use JFFS2 on NAND and NOR flash drives, this driver is needed (JFFS2 write-buffering support).

This next driver offers better error protection (Verify JFFS2 write-buffer reads).

JFFS filesystems can be mounted faster with "JFFS2 summary support" enabled. This driver stores information about the filesystem.

Like the other extended/extra attributes drivers for some filesystems, JFFS2 has such a driver (JFFS2 XATTR support).

The JFFS2 filesystem supports various transparent compression systems. This allows files to be smaller on JFFS2 filesystems and be read without the user needing to perform any special actions. (Advanced compression options for JFFS2), (JFFS2 ZLIB compression support), (JFFS2 LZO compression support), (JFFS2 RTIME compression support), and (JFFS2 RUBIN compression support). The default compression format can be defined in the following option (JFFS2 default compression mode).

A successor for JFFS2 exists and is supported by the kernel (UBIFS file system support). The Unsorted Block Image File System (UBIFS) also competes with LogFS.

The Linux kernel also supports LogFS (LogFS file system).

ROM-based embedded systems need support for CramFS (Compressed ROM file system support (cramfs)).

Alternately, embedded systems could use SquashFS which is a read-only compression filesystem (SquashFS 4.0 - Squashed file system support). The Linux kernel also offers extended attributes for SquashFS (Squashfs XATTR support).

There are three different compression formats supported by SquashFS - (Include support for ZLIB compressed file systems), (Include support for LZO compressed file systems), and (Include support for XZ compressed file systems). The block size for SquashFS can be set to four kilobytes (Use 4K device block size?). Also, the cache size can be set (Additional option for memory-constrained systems).

The Linux kernel supports FreeVxFS (FreeVxFS file system support (VERITAS VxFS(TM) compatible)), Minix (Minix file system support), MPEG filesystem (SonicBlue Optimized MPEG File System support), HPFS (OS/2 HPFS file system support), QNX4 (QNX4 file system support (read only)), QNX6 (QNX6 file system support (read only)), and the ROM filesystem (ROM file system support). [http://www.linux.org/threads/qnx-file-systems.4577/][8] and [http://www.linux.org/threads/minix-mini-unix-file-system.4545/][9]

"RomFS backing stores (Block device-backed ROM file system support)" offers a list of various ROMfs extra features and abilities.

The "Persistent store support" driver provides support for the pstore filesystem which allows access to platform level persistent storage.

The pstore filesystem can store kernel logs/messages (Log kernel console messages).

When a kernel panic takes place (equivalent to the "Blue-Screen-of-Death" on Windows), the "Log panic/oops to a RAM buffer" driver will store a log in the RAM.

This next single driver offers support for the Xenix, Coherent, Version 7, and System V filesystems (System V/Xenix/V7/Coherent file system support).

The Linux kernel also supports UFS (UFS file system support (read only)), (UFS file system write support (DANGEROUS)), and (UFS debugging).

exofs is also supported by the kernel (exofs: OSD based file system support).

The Flash-Friendly FileSystem is a special filesystem for flash drives (F2FS filesystem support (EXPERIMENTAL)), (F2FS Status Information ), (F2FS extended attributes), and (F2FS Access Control Lists). [http://www.linux.org/threads/flash-friendly-file-system-f2fs.4477/][10]

In the next article, we will configure network filesystems. Mahalo! 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-20.4957/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linux.org/threads/file-allocation-table-fat.4472/
[2]:http://www.linux.org/threads/amiga-fast-file-system-affs.4429/
[3]:http://www.linux.org/threads/intro-to-encryption.4376/
[4]:http://www.linux.org/threads/hierarchical-file-system-hfs.4480/
[5]:http://www.linux.org/threads/hierarchical-file-system-plus-hfs.4493/
[6]:http://www.linux.org/threads/extent-file-system-efs.4447/
[7]:http://www.linux.org/threads/journaling-flash-file-system-version-2-jffs2.4495/
[8]:http://www.linux.org/threads/qnx-file-systems.4577/
[9]:http://www.linux.org/threads/minix-mini-unix-file-system.4545/
[10]:http://www.linux.org/threads/flash-friendly-file-system-f2fs.4477/
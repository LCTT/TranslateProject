ucasFL translating

An introduction to Linux filesystems
============================================================ 

![Introduction to Linux filesystems](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A "Introduction to Linux filesystems")
Image credits : Original photo by Rikki Endsley. [CC BY-SA 4.0][9]

This article is intended to be a very high-level discussion of Linux filesystem concepts. It is not intended to be a low-level description of how a particular filesystem type, such as EXT4, works, nor is it intended to be a tutorial of filesystem commands.

More Linux resources

*   [What is Linux?][1]

*   [What are Linux containers?][2]

*   [Download Now: Linux commands cheat sheet][3]

*   [Advanced Linux commands cheat sheet][4]

*   [Our latest Linux articles][5]

Every general-purpose computer needs to store data of various types on a hard disk drive (HDD) or some equivalent, such as a USB memory stick. There are a couple reasons for this. First, RAM loses its contents when the computer is switched off. There are non-volatile types of RAM that can maintain the data stored there after power is removed (such as flash RAM that is used in USB memory sticks and solid state drives), but flash RAM is much more expensive than standard, volatile RAM like DDR3 and other, similar types.

The second reason that data needs to be stored on hard drives is that even standard RAM is still more expensive than disk space. Both RAM and disk costs have been dropping rapidly, but RAM still leads the way in terms of cost per byte. A quick calculation of the cost per byte, based on costs for 16GB of RAM vs. a 2TB hard drive, shows that the RAM is about 71 times more expensive per unit than the hard drive. A typical cost for RAM is around $0.0000000043743750 per byte today.

For a quick historical note to put present RAM costs in perspective, in the very early days of computing, one type of memory was based on dots on a CRT screen. This was very expensive at about $1.00  _per bit_ !

### Definitions

You may hear people talk about filesystems in a number of different and confusing ways. The word itself can have multiple meanings, and you may have to discern the correct meaning from the context of a discussion or document.

I will attempt to define the various meanings of the word "filesystem" based on how I have observed it being used in different circumstances. Note that while attempting to conform to standard "official" meanings, my intent is to define the term based on its various usages. These meanings will be explored in greater detail in the following sections of this article.

1.  The entire Linux directory structure starting at the top (/) root directory.

2.  A specific type of data storage format, such as EXT3, EXT4, BTRFS, XFS, and so on. Linux supports almost 100 types of filesystems, including some very old ones as well as some of the newest. Each of these filesystem types uses its own metadata structures to define how the data is stored and accessed.

3.  A partition or logical volume formatted with a specific type of filesystem that can be mounted on a specified mount point on a Linux filesystem.

### Basic filesystem functions

Disk storage is a necessity that brings with it some interesting and inescapable details. Obviously, a filesystem is designed to provide space for non-volatile storage of data; that is its ultimate function. However, there are many other important functions that flow from that requirement.

All filesystems need to provide a namespace—that is, a naming and organizational methodology. This defines how a file can be named, specifically the length of a filename and the subset of characters that can be used for filenames out of the total set of characters available. It also defines the logical structure of the data on a disk, such as the use of directories for organizing files instead of just lumping them all together in a single, huge conglomeration of files.

Once the namespace has been defined, a metadata structure is necessary to provide the logical foundation for that namespace. This includes the data structures required to support a hierarchical directory structure; structures to determine which blocks of space on the disk are used and which are available; structures that allow for maintaining the names of the files and directories; information about the files such as their size and times they were created, modified or last accessed; and the location or locations of the data belonging to the file on the disk. Other metadata is used to store high-level information about the subdivisions of the disk, such as logical volumes and partitions. This higher-level metadata and the structures it represents contain the information describing the filesystem stored on the drive or partition, but is separate from and independent of the filesystem metadata.

Filesystems also require an Application Programming Interface (API) that provides access to system function calls which manipulate filesystem objects like files and directories. APIs provide for tasks such as creating, moving, and deleting files. It also provides algorithms that determine things like where a file is placed on a filesystem. Such algorithms may account for objectives such as speed or minimizing disk fragmentation.

Modern filesystems also provide a security model, which is a scheme for defining access rights to files and directories. The Linux filesystem security model helps to ensure that users only have access to their own files and not those of others or the operating system itself.

The final building block is the software required to implement all of these functions. Linux uses a two-part software implementation as a way to improve both system and programmer efficiency.

<center>
![](https://opensource.com/sites/default/files/filesystem_diagram.png)

Figure 1: The Linux two-part filesystem software implementation.</center>

The first part of this two-part implementation is the Linux virtual filesystem. This virtual filesystem provides a single set of commands for the kernel, and developers, to access all types of filesystems. The virtual filesystem software calls the specific device driver required to interface to the various types of filesystems. The filesystem-specific device drivers are the second part of the implementation. The device driver interprets the standard set of filesystem commands to ones specific to the type of filesystem on the partition or logical volume.

### Directory structure

As a usually very organized Virgo, I like things stored in smaller, organized groups rather than in one big bucket. The use of directories helps me to be able to store and then locate the files I want when I am looking for them. Directories are also known as folders because they can be thought of as folders in which files are kept in a sort of physical desktop analogy.

In Linux and many other operating systems, directories can be structured in a tree-like hierarchy. The Linux directory structure is well defined and documented in the [Linux Filesystem Hierarchy Standard][10] (FHS). Referencing those directories when accessing them is accomplished by using the sequentially deeper directory names connected by forward slashes (/) such as /var/log and /var/spool/mail. These are called paths.

The following table provides a very brief list of the standard, well-known, and defined top-level Linux directories and their purposes.

| Directory | Description |
| --- | --- |
| / (root filesystem) | The root filesystem is the top-level directory of the filesystem. It must contain all of the files required to boot the Linux system before other filesystems are mounted. It must include all of the required executables and libraries required to boot the remaining filesystems. After the system is booted, all other filesystems are mounted on standard, well-defined mount points as subdirectories of the root filesystem. |
| /bin | The /bin directory contains user executable files. |
| /boot | Contains the static bootloader and kernel executable and configuration files required to boot a Linux computer. |
| /dev | This directory contains the device files for every hardware device attached to the system. These are not device drivers, rather they are files that represent each device on the computer and facilitate access to those devices. |
| /etc | Contains the local system configuration files for the host computer. |
| /home | Home directory storage for user files. Each user has a subdirectory in /home. |
| /lib | Contains shared library files that are required to boot the system. |
| /media | A place to mount external removable media devices such as USB thumb drives that may be connected to the host. |
| /mnt | A temporary mountpoint for regular filesystems (as in not removable media) that can be used while the administrator is repairing or working on a filesystem. |
| /opt | Optional files such as vendor supplied application programs should be located here. |
| /root | This is not the root (/) filesystem. It is the home directory for the root user. |
| /sbin | System binary files. These are executables used for system administration. |
| /tmp | Temporary directory. Used by the operating system and many programs to store temporary files. Users may also store files here temporarily. Note that files stored here may be deleted at any time without prior notice. |
| /usr | These are shareable, read-only files, including executable binaries and libraries, man files, and other types of documentation. |
| /var | Variable data files are stored here. This can include things like log files, MySQL, and other database files, web server data files, email inboxes, and much more. |

<center>Table 1: The top level of the Linux filesystem hierarchy.</center>

The directories and their subdirectories shown in Table 1, along with their subdirectories, that have a teal background are considered an integral part of the root filesystem. That is, they cannot be created as a separate filesystem and mounted at startup time. This is because they (specifically, their contents) must be present at boot time in order for the system to boot properly.

The /media and /mnt directories are part of the root filesystem, but they should never contain any data. Rather, they are simply temporary mount points.

The remaining directories, those that have no background color in Table 1 do not need to be present during the boot sequence, but will be mounted later, during the startup sequence that prepares the host to perform useful work.

Be sure to refer to the official [Linux Filesystem Hierarchy Standard][11] (FHS) web page for details about each of these directories and their many subdirectories. Wikipedia also has a good description of the [FHS][12]. This standard should be followed as closely as possible to ensure operational and functional consistency. Regardless of the filesystem types used on a host, this hierarchical directory structure is the same.

### Linux unified directory structure

In some non-Linux PC operating systems, if there are multiple physical hard drives or multiple partitions, each disk or partition is assigned a drive letter. It is necessary to know on which hard drive a file or program is located, such as C: or D:. Then you issue the drive letter as a command, **D:**, for example, to change to the D: drive, and then you use the **cd** command to change to the correct directory to locate the desired file. Each hard drive has its own separate and complete directory tree.

The Linux filesystem unifies all physical hard drives and partitions into a single directory structure. It all starts at the top–the root (/) directory. All other directories and their subdirectories are located under the single Linux root directory. This means that there is only one single directory tree in which to search for files and programs.

This can work only because a filesystem, such as /home, /tmp, /var, /opt, or /usr can be created on separate physical hard drives, a different partition, or a different logical volume from the / (root) filesystem and then be mounted on a mountpoint (directory) as part of the root filesystem tree. Even removable drives such as a USB thumb drive or an external USB or ESATA hard drive will be mounted onto the root filesystem and become an integral part of that directory tree.

One good reason to do this is apparent during an upgrade from one version of a Linux distribution to another, or changing from one distribution to another. In general, and aside from any upgrade utilities like dnf-upgrade in Fedora, it is wise to occasionally reformat the hard drive(s) containing the operating system during an upgrade to positively remove any cruft that has accumulated over time. If /home is part of the root filesystem it will be reformatted as well and would then have to be restored from a backup. By having /home as a separate filesystem, it will be known to the installation program as a separate filesystem and formatting of it can be skipped. This can also apply to /var where database, email inboxes, website, and other variable user and system data are stored.

There are other reasons for maintaining certain parts of the Linux directory tree as separate filesystems. For example, a long time ago, when I was not yet aware of the potential issues surrounding having all of the required Linux directories as part of the / (root) filesystem, I managed to fill up my home directory with a large number of very big files. Since neither the /home directory nor the /tmp directory were separate filesystems but simply subdirectories of the root filesystem, the entire root filesystem filled up. There was no room left for the operating system to create temporary files or to expand existing data files. At first, the application programs started complaining that there was no room to save files, and then the OS itself started to act very strangely. Booting to single-user mode and clearing out the offending files in my home directory allowed me to get going again. I then reinstalled Linux using a pretty standard multi-filesystem setup and was able to prevent complete system crashes from occurring again.

I once had a situation where a Linux host continued to run, but prevented the user from logging in using the GUI desktop. I was able to log in using the command line interface (CLI) locally using one of the [virtual consoles][13], and remotely using SSH. The problem was that the /tmp filesystem had filled up and some temporary files required by the GUI desktop could not be created at login time. Because the CLI login did not require files to be created in /tmp, the lack of space there did not prevent me from logging in using the CLI. In this case, the /tmp directory was a separate filesystem and there was plenty of space available in the volume group the /tmp logical volume was a part of. I simply [expanded the /tmp logical volume][14] to a size that accommodated my fresh understanding of the amount of temporary file space needed on that host and the problem was solved. Note that this solution did not require a reboot, and as soon as the /tmp filesystem was enlarged the user was able to login to the desktop.

Another situation occurred while I was working as a lab administrator at one large technology company. One of our developers had installed an application in the wrong location (/var). The application was crashing because the /var filesystem was full and the log files, which are stored in /var/log on that filesystem, could not be appended with new messages due to the lack of space. However, the system remained up and running because the critical / (root) and /tmp filesystems did not fill up. Removing the offending application and reinstalling it in the /opt filesystem resolved that problem.

### Filesystem types

Linux supports reading around 100 partition types; it can create and write to only a few of these. But it is possible—and very common—to mount filesystems of different types on the same root filesystem. In this context we are talking about filesystems in terms of the structures and metadata required to store and manage the user data on a partition of a hard drive or a logical volume. The complete list of filesystem partition types recognized by the Linux **fdisk**command is provided here, so that you can get a feel for the high degree of compatibility that Linux has with very many types of systems.

```
0 Empty 24 NEC DOS 81 Minix / old Lin bf Solaris 1 FAT12 27 Hidden NTFS Win 82 Linux swap / So c1 DRDOS/sec (FAT- 2 XENIX root 39 Plan 9 83 Linux c4 DRDOS/sec (FAT- 3 XENIX usr 3c PartitionMagic 84 OS/2 hidden or c6 DRDOS/sec (FAT- 4 FAT16 <32M 40 Venix 80286 85 Linux extended c7 Syrinx 5 Extended 41 PPC PReP Boot 86 NTFS volume set da Non-FS data 6 FAT16 42 SFS 87 NTFS volume set db CP/M / CTOS / . 7 HPFS/NTFS/exFAT 4d QNX4.x 88 Linux plaintext de Dell Utility 8 AIX 4e QNX4.x 2nd part 8e Linux LVM df BootIt 9 AIX bootable 4f QNX4.x 3rd part 93 Amoeba e1 DOS access a OS/2 Boot Manag 50 OnTrack DM 94 Amoeba BBT e3 DOS R/O b W95 FAT32 51 OnTrack DM6 Aux 9f BSD/OS e4 SpeedStor c W95 FAT32 (LBA) 52 CP/M a0 IBM Thinkpad hi ea Rufus alignment e W95 FAT16 (LBA) 53 OnTrack DM6 Aux a5 FreeBSD eb BeOS fs f W95 Ext'd (LBA) 54 OnTrackDM6 a6 OpenBSD ee GPT 10 OPUS 55 EZ-Drive a7 NeXTSTEP ef EFI (FAT-12/16/ 11 Hidden FAT12 56 Golden Bow a8 Darwin UFS f0 Linux/PA-RISC b 12 Compaq diagnost 5c Priam Edisk a9 NetBSD f1 SpeedStor 14 Hidden FAT16 <3 61 SpeedStor ab Darwin boot f4 SpeedStor 16 Hidden FAT16 63 GNU HURD or Sys af HFS / HFS+ f2 DOS secondary 17 Hidden HPFS/NTF 64 Novell Netware b7 BSDI fs fb VMware VMFS 18 AST SmartSleep 65 Novell Netware b8 BSDI swap fc VMware VMKCORE 1b Hidden W95 FAT3 70 DiskSecure Mult bb Boot Wizard hid fd Linux raid auto 1c Hidden W95 FAT3 75 PC/IX bc Acronis FAT32 L fe LANstep 1e Hidden W95 FAT1 80 Old Minix be Solaris boot ff BBT
```

The main purpose in supporting the ability to read so many partition types is to allow for compatibility and at least some interoperability with other computer systems' filesystems. The choices available when creating a new filesystem with Fedora are shown in the following list.

*   btrfs

*   **cramfs**

*   **ext2**

*   **ext3**

*   **ext4**

*   fat

*   gfs2

*   hfsplus

*   minix

*   **msdos**

*   ntfs

*   reiserfs

*   **vfat**

*   xfs

Other distributions support creating different filesystem types. For example, CentOS 6 supports creating only those filesystems highlighted in bold in the above list.

### Mounting

The term "to mount" a filesystem in Linux refers back to the early days of computing when a tape or removable disk pack would need to be physically mounted on an appropriate drive device. After being physically placed on the drive, the filesystem on the disk pack would be logically mounted by the operating system to make the contents available for access by the OS, application programs and users.

A mount point is simply a directory, like any other, that is created as part of the root filesystem. So, for example, the home filesystem is mounted on the directory /home. Filesystems can be mounted at mount points on other non-root filesystems but this is less common.

The Linux root filesystem is mounted on the root directory (/) very early in the boot sequence. Other filesystems are mounted later, by the Linux startup programs, either **rc** under SystemV or by **systemd** in newer Linux releases. Mounting of filesystems during the startup process is managed by the /etc/fstab configuration file. An easy way to remember that is that fstab stands for "file system table," and it is a list of filesystems that are to be mounted, their designated mount points, and any options that might be needed for specific filesystems.

Filesystems are mounted on an existing directory/mount point using the **mount**command. In general, any directory that is used as a mount point should be empty and not have any other files contained in it. Linux will not prevent users from mounting one filesystem over one that is already there or on a directory that contains files. If you mount a filesystem on an existing directory or filesystem, the original contents will be hidden and only the content of the newly mounted filesystem will be visible.

### Conclusion

I hope that some of the possible confusion surrounding the term filesystem has been cleared up by this article. It took a long time and a very helpful mentor for me to truly understand and appreciate the complexity, elegance, and functionality of the Linux filesystem in all of its meanings.

If you have questions, please add them to the comments below and I will try to answer them.

### Next month

Another important concept is that for Linux, everything is a file. This concept has some interesting and important practical applications for users and system admins. The reason I mention this is that you might want to read my "[Everything is a file][15]" article before the article I am planning for next month on the /dev directory.

-----------------

作者简介：

David Both - David Both is a Linux and Open Source advocate who resides in Raleigh, North Carolina. He has been in the IT industry for over forty years and taught OS/2 for IBM where he worked for over 20 years. While at IBM, he wrote the first training course for the original IBM PC in 1981\. He has taught RHCE classes for Red Hat and has worked at MCI Worldcom, Cisco, and the State of North Carolina. He has been working with Linux and Open Source Software for almost 20 years. David has written articles for[More about me][7]

*   [Learn how you can contribute][22]

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/10/introduction-linux-filesystems

作者：[David Both][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/life/16/10/introduction-linux-filesystems?rate=Qyf2jgkdgrj5_zfDwadBT8KsHZ2Gp5Be2_tF7R-s02Y
[7]:https://opensource.com/users/dboth
[8]:https://opensource.com/user/14106/feed
[9]:https://creativecommons.org/licenses/by-sa/4.0/
[10]:http://www.pathname.com/fhs/
[11]:http://www.pathname.com/fhs/
[12]:https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
[13]:https://en.wikipedia.org/wiki/Virtual_console
[14]:https://opensource.com/business/16/9/linux-users-guide-lvm
[15]:https://opensource.com/life/15/9/everything-is-a-file
[16]:https://opensource.com/users/dboth
[17]:https://opensource.com/users/dboth
[18]:https://opensource.com/users/dboth
[19]:https://opensource.com/life/16/10/introduction-linux-filesystems#comments
[20]:https://opensource.com/tags/linux
[21]:https://opensource.com/tags/sysadmin
[22]:https://opensource.com/participate

选择一个日志文件系统
================

通俗的说，计算机的文件系统就是一个像磁盘这样的存储设备如何存储、检索以及管理文件的方式。文件系统需要记录的不仅是文件本身每一个字节，及其在存储设备上的位置，还要存储文件相关的信息。比如，也要存储每个文件的名字、文件存放的层次结构（目录），还有文件的元数据，像文件的修改时间等。

虽然在linux上可以使用许多不同的文件系统，但是绝大多数用户很少去关注使用哪一个，它们通常都被忽视了。选择使用什么样的文件系统视情况而定，要考虑的相关因素包括兼容性、性能、还原能力、使用的介质、存储介质的大小和数量、特性，还有安全考虑等。

日志文件系统是一种特殊类型的文件系统，它记录一个被称为日志的追踪文件。日志可以让系统能够修复在异常终止时出现的不一致情况。它通过追踪之前提交到主文件系统的更改。在计算机非正常关机的情况下，任何数据丢失都可被重建。因此,这种文件系统不太可能遭受破坏，并且可以使文件系统快速恢复工作。

为了深入了解日志文件系统的使用，我们整理出一个首选列表。

现在，让我们讨论一下手边的日志文件系统。

- [ext3][1] 	许多流行的Linux发行版默认的文件系统
- [XFS][2] 	  为高性能和大文件设计的文件系统
- [Btrfs][3] 	校检copy-on-write(写入时复制)文件系统
- [ext4][4] 	由ext3增加许多显著特性和扩展进化而来的文件系统


###ext3

ext3, or third extended filesystem, is a journaled file system that is commonly used by the Linux kernel. The journaling capability means no more waiting for fsck's or worrying about metadata corruption.

It is the default file system for many popular Linux distributions, including Debian. ext3 was originally released in September 1999.

Ext3 partitions contain a used space of 5% for special reasons by default. The main reason is so root can log in even when the filesystem becomes full.

> **ext3** 

> 0.9.18

> Price : Free to download

> Size : 13.8KB

> License : GNU GPL

> Developer : Stephen Tweedie

> Website : ftp://ftp.kernel.org/

> System Requirements :

> Support Sites : [FAQ][5], [Mailing List][6]

> Selected Reviews:

Features include:

- Simple, robust, and extensible
- In-kernel and userspace code has been extensively tested
-Adds features to ext2:
	- A journal - improves reliability and eliminates the need to check the file system after an unclean shutdown
	- Various journal modes: Journal, Ordered, and Writeback
	- Automatic recover when the filesystem is remounted
	- All VFS operations (including quota) should be journaled
	- Add data updates are also journaled
	- Online file system growth
	- HTree indexing for larger directories
- Extended attribute blocks and large inodes
- Online filesystem resize reservations
- Hash-indexed directories
- Journal file/device present
- File type in directory entries
- Journal recovery required
- Reduced block group backups
- Reduced superblock backups
- Files larger than 2GiB in size
- Easy conversion of ext2 file systems without needing to backup, recover and format the partition
- Unix permission, ACLs and arbitrary security attributes

###XFS

XFS is a 64-bit, high-performance journaling file system with guaranteed filesystem consistency created by Silicon Graphics, Inc. It was the default file system in IRIX releases 5.3 and onwards and later ported to the Linux kernel.

XFS combines advanced journaling technology with full 64-bit addressing and scalable structures and algorithms.

XFS has been maintained in the official Linux kernel kernel trees starting with Linux 2.4. All modern Linux distributions include support for XFS.

> **XFS**

> Price : Free to download

> License : GNU GPL v2

> Developer : Silicon Graphics Inc.

> Website: http://oss.sgi.com/projects/xfs/

> System Requirements

> Support Sites: http://XFS.org, [FAQ][7], [Mailing Lists][8]

> Selected Reviews:

Features include:

- Quick Recovery - restarts very quickly after an unexpected interruption, regardless of the number of files it is managing
- Fast Transactions - provides the advantages of journaling while minimizing the performance impact of journaling on read and write data transactions
- Massive scalability - supports a maximum file system size of 8 exbibytes minus one
- Efficient Allocations - implements extremely sophisticated space management technique
- Excellent Bandwidth - capable of delivering very close to the raw I/O performance that the underlying hardware can provide
- Provides journaling for file system metadata, where file system updates are first written to a serial journal before the actual disk blocks are updated
- Supports filesystem growth for mounted volumes, allows filesystem "freeze" and "thaw" operations to support volume level snapshots, and provides an online file defragmentation utility
- Implements fully journaled extended attributes
- Supports the ACL semantics and interfaces described in the draft POSIX 1003.1e standard
- NFS Compatibility
- Uses the Open Source Samba server to export XFS filesystems to Microsoft Windows systems
- Data Management API (DMAPI/XDSM) allows implementation of hierarchical storage management software with no kernel modifications
- Supports the notion of a "realtime subvolume" - a separate area of disk space where only file data is stored

###Btrfs

Btrfs (B-Tree File System) is a Copy on Write file system for Linux. Copy On Write (COW) is an optimization technique for maintaining a copy of a collection of data, handling resources when multiple tasks are using the same data.

The aim of this journaling file system is to bring more efficient storage management and better data integrity features to Linux.

Btrfs is notable for implementing advanced features whilst maintaining fault tolerance, scalability and reliability. The file system has been in development since 2007 and its code base has now reached a level of maturity that its disk format should not change. The code base is under heavy development.

Btrfs debuted in the Linux 2.6.29 released. Btrfs can handle up to 2 64 inodes, less a few hundred for special items.

> **Btrfs**

> Price : Free to download

> License : GNU GPL

> Developer : Oracle Corporation

> Website : http://btrfs.wiki.kernel.org

> System Requirements

> Support Sites: [A Beginner's Guide to Btrfs][9], [How I Use the Advanced Capabilities of Btrfs][10], [Getting Started with the Btrfs File System][11]

> Selected Reviews: [Josef Bacik][12] 

Features include:

- Scalable, 64-bit file system that can span large volumes to provide files and file systems as large as 16 exabytes
- Integrated volume management
- Online file system defragmentation - defragging can occur while the drive is mounted or online
- Offline filesystem check
- Online volume growth and shrinking
- Online block device addition and removal
- Online balancing (movement of objects between block devices to balance load)
- Offline filesystem check
- Uses a B-tree structure to store data types and point to information stored on disk
- Online data scrubbing for finding errors and automatically fixing them for files with redundant copies
- Delayed allocation to allow for better disk allocation
	- Space-efficient packing of small files
	- Space-efficient indexed directories
- Subvolumes (separate internal filesystem roots)
- Transparent compression (zlib and LZO)
- Simple to use writable snapshots, read-only snapshots. Snapshots show up as normal directories under the snapshotted directory
- Send/receive (saving diffs between snapshots to a binary stream)
- Data integrity:
	- Built-in RAID support (RAID0, RAID1, RAID5, RAID6 and RAID10). Data scrubbing can be used, particularly with RAID 1
	- Fault isolation and checksum algorithms - fault isolation is achieved by storing metadata separately from user data
	- Checksums on data and all metadata (CRC-32C). Option to turn off data checksumming
	- Even on a single device, metadata is duplicated and maintained in two locations for redundancy
	- Rebuild times
	- Encryption
- File cloning (copy-on-write on individual files, or byte ranges thereof)
- In-place conversion (with rollback) from ext3/4 to Btrfs
- File system seeding
- SSD (Flash storage) awareness (TRIM/Discard for reporting free blocks for reuse) and optimizations
- File Striping, File Mirroring, File Striping+Mirroring, Striping with Single and Dual Parity implementations
- Hierarchical per-subvolume quota
- Extent based file storage
- Provides minimal user tuning to guard against misuse


###ext4

The ex4, or fourth extended file system, is a journailing file system for Linux which evolved from ext3. It is marked stable in Linux kernel 2.6.28.

ext4 adds many notable features particularly extents - a single descriptor for a range of contiguous blocks, as opposed to the traditional block mapping scheme used by ext2 and ext3. This represents an efficient way to represent large files, as well as utilising CPU more efficiently, and with fewer metadata IOs. This also makes for quicker file system checks, which becomes more beneficial as the file system grows in size.

> **ext4**

> Price : Free to download

> License : GNU GPL

> Developer :Mingming Cao, Andreas Dilger, Alex Zhuravlev (Tomas), Dave Kleikamp, Theodore Ts'o, Eric Sandeen, others

> Website : http://ext4.wiki.kernel.org

> System Requirements

> Support Sites : [Wiki][13], [FAQ][14], [Kernel Newbies][15]

> Selected Reviews:

Features include:

- Extended attribute blocks and large inodes 
- Extent-based disk format
- Online Defragmentation
- Online filesystem resize reservations
- Hash-indexed directories
- Journal file/device present
- File type in directory entries
- Journal recovery required
- Files allocated with extent format
- Support for more than 2^32 filesystem blocks
- Flexible block group metadata location
- Reduced block group backups
- Reduced superblock backups
- Files larger than 2GiB in size
- Group descriptor checksums and sparse inode table
- Over 32000 subdirectories
- Inode-features
	- Larger inodes
	- Inode reservation
	- Nanosecond timestamps and creation time 
- Files larger than 2TiB in size
- Journal checksumming - checksums the journal data to know if the journal blocks are failing or corrupted
- Option to turn off journaling
- Persistent preallocation
- Backward compatible with ext2 and ext3
- Allocation schemes:
	- Persistent pre-allocation
	- Delayed allocation
	- Multi-block allocation
	- Stripe-aware allocation
- Extended attributes
- Quota journaling
- Implements discard/TRIM



---

via: http://www.linuxlinks.com/article/20130927180305497/JournalingFileSystems.html

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf]:http://linux.cn/space/flsf01
[Caroline]:http://linux.cn/space/14763

[1]:ftp://ftp.kernel.org/pub/linux/kernel/people/sct/ext3/
[2]:http://oss.sgi.com/projects/xfs/
[3]:http://btrfs.wiki.kernel.org/
[4]:https://ext4.wiki.kernel.org/index.php/Main_Page
[5]:http://batleth.sapienti-sat.org/projects/FAQs/ext3-faq.html
[6]:https://listman.redhat.com/archives/ext3-users/
[7]:http://xfs.org/index.php/XFS_FAQ
[8]:http://xfs.org/index.php/XFS_email_list_and_archives
[9]:http://www.howtoforge.com/a-beginners-guide-to-btrfs
[10]:http://www.oracle.com/technetwork/articles/servers-storage-admin/advanced-btrfs-1734952.html
[11]:http://www.oracle.com/technetwork/articles/servers-storage-admin/gettingstarted-btrfs-1695246.html
[12]:http://static.usenix.org/publications/login/2012-02/openpdfs/Bacik.pdf
[13]:https://ext4.wiki.kernel.org/index.php/Main_Page
[14]:https://ext4.wiki.kernel.org/index.php/Frequently_Asked_Questions
[15]:http://kernelnewbies.org/Ext4


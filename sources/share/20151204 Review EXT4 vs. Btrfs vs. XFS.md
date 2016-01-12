bazz2222222222222222222222222222222222222222222
Review EXT4 vs. Btrfs vs. XFS
================================================================================
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/09/1385698302_funny_linux_wallpapers-593x445.jpg)

To be honest, one of the things that comes last in people’s thinking is to look at which file system on their PC is being used. Windows users as well as Mac OS X users even have less reason for looking as they have really only 1 choice for their operating system which are NTFS and HFS+. Linux operating system, on the other side, has plenty of various file system options, with the current default is being widely used ext4. However, there is another push for changing the file system to something other which is called btrfs. But what makes btrfs better, what are other file systems, and when can we see the distributions making the change?

Let’s first have a general look at file systems and what they really do, then we will make a small comparison between famous file systems.

### So, What Do File Systems Do? ###

Just in case if you are unfamiliar about what file systems really do, it is actually simple when it is summarized. The file systems are mainly used in order for controlling how the data is stored after any program is no longer using it, how access to the data is controlled, what other information (metadata) is attached to the data itself, etc. I know that it does not sound like an easy thing to be programmed, and it is definitely not. The file systems are continually still being revised for including more functionality while becoming more efficient in what it simply needs to do. Therefore, however, it is a basic need for all computers, it is not quite as basic as it sounds like.

### Why Partitioning? ###

Many people have a vague knowledge of what the partitions are since each operating system has an ability for creating or removing them. It can seem strange that Linux operating system uses more than 1 partition on the same disk, even while using the standard installation procedure, so few explanations are called for them. One of the main goals of having different partitions is achieving higher data security in the disaster case.

By dividing your hard disk into partitions, the data may be grouped and also separated. When the accidents occur, only the data stored in the partition which got the hit will only be damaged, while data on the other partitions will survive most likely. These principles date from the days when the Linux operating system didn’t have a journaled file system and any power failure might have led to a disaster.

The using of partitions will remain for security and the robustness reasons, then the breach on 1 part of the operating system does not automatically mean that whole computer is under risk or danger. This is currently most important factor for the partitioning process. For example, the users create scripts, the programs or web applications which start filling up the disk. If that disk contains only 1 big partition, then entire system may stop functioning if that disk is full. If the users store data on separate partitions, then only that data partition can be affected, while system partitions and the possible other data partitions will keep functioning.

Mind that to have a journaled file system will only provide data security in case if there is a power failure as well as sudden disconnection of the storage devices. Such will not protect the data against the bad blocks and the logical errors in the file system. In such cases, the user should use a Redundant Array of Inexpensive Disks (RAID) solution.

### Why Switch File Systems? ###

The ext4 file system has been an improvement for the ext3 file system that was also an improvement over the ext2 file system. While the ext4 is a very solid file system which has been the default choice for almost all distributions for the past few years, it is made from an aging code base. Additionally, Linux operating system users are seeking many new different features in file systems which ext4 does not handle on its own. There is software which takes care of some of such needs, but in the performance aspect, being able to do such things on the file system level could be faster.

### Ext4 File System ###

The ext4 has some limits which are still a bit impressive. The maximum file size is 16 tebibytes (which is roughly 17.6 terabytes) and is much bigger than any hard drive a regular consumer can currently buy. While, the largest volume/partition you can make with ext4 is 1 exbibyte (which is roughly 1,152,921.5 terabytes). The ext4 is known to bring the speed improvements over ext3 by using multiple various techniques. Like in the most modern file systems, it is a journaling file system that means that it will keep a journal of where the files are mainly located on the disk and of any other changes that happen to the disk. Regardless all of its features, it doesn’t support the transparent compression, the data deduplication, or the transparent encryption. The snapshots are supported technically, but such feature is experimental at best.

### Btrfs File System ###

The btrfs, many of us pronounce it different ways, as an example, Better FS, Butter FS, or B-Tree FS. It is a file system which is completely made from scratch. The btrfs exists because its developers firstly wanted to expand the file system functionality in order to include snapshots, pooling, as well as checksums among the other things. While it is independent from the ext4, it also wants to build off the ideas present in the ext4 that are great for the consumers and the businesses alike as well as incorporate those additional features that will benefit everybody, but specifically the enterprises. For the enterprises who are using very large programs with very large databases, they are having a seemingly continuous file system across the multiple hard drives could be very beneficial as it will make a consolidation of the data much easier. The data deduplication could reduce the amount of the actual space data could occupy, and the data mirroring could become easier with the btrfs as well when there is a single and broad file system which needs to be mirrored.

The user certainly can still choose to create multiple partitions so that he does not need to mirror everything. Considering that the btrfs will be able for spanning over the multiple hard drives, it is a very good thing that it can support 16 times more drive space than the ext4. A maximum partition size of the btrfs file system is 16 exbibytes, as well as maximum file size is 16 exbibytes too.

### XFS File System ###

The XFS file system is an extension of the extent file system. The XFS is a high-performance 64-bit journaling file system. The support of the XFS was merged into Linux kernel in around 2002 and In 2009 Red Hat Enterprise Linux version 5.4 usage of the XFS file system. XFS supports maximum file system size of 8 exbibytes for the 64-bit file system. There is some comparison of XFS file system is XFS file system can’t be shrunk and poor performance with deletions of the large numbers of files. Now, the RHEL 7.0 uses XFS as the default filesystem.

### Final Thoughts ###

Unfortunately, the arrival date for the btrfs is not quite known. But officially, the next-generation file system is still classified as “unstable”, but if the user downloads the latest version of Ubuntu, he will be able to choose to install on a btrfs partition. When the btrfs will be classified actually as “stable” is still a mystery, but users shouldn’t expect the Ubuntu to use the btrfs by default until it’s indeed considered “stable”. It has been reported that Fedora 18 will use the btrfs as its default file system as by the time of its release a file system checker for the btrfs should exist. There is a good amount of work still left for the btrfs, as not all the features are yet implemented and the performance is a little sluggish if we compare it to the ext4.

So, which is better to use? Till now, the ext4 will be the winner despite the identical performance. But why? The answer will be the convenience as well as the ubiquity. The ext4 is still excellent file system for the desktop or workstation use. It is provided by default, so the user can install the operating system on it. Also, the ext4 supports volumes up to 1 Exabyte and files up to 16 Terabyte in size, so there’s still a plenty of room for the growth where space is concerned.

The btrfs might offer greater volumes up to 16 Exabyte and improved fault tolerance, but, till now, it feels more as an add-on file system rather than one integrated into the Linux operating system. For example, the btrfs-tools have to be present before a drive will be formatted with the btrfs, which means that the btrfs is not an option during the Linux operating system installation though that could vary with the distribution.

Even though the transfer rates are so important, there’s more to a just file system than speed of the file transfers. The btrfs has many useful features such as Copy-on-Write (CoW), extensive checksums, snapshots, scrubbing, self-healing data, deduplication, as well as many more good improvements that ensure the data integrity. The btrfs lacks the RAID-Z features of ZFS, so the RAID is still in an experimental state with the btrfs. For pure data storage, however, the btrfs is the winner over the ext4, but time still will tell.

Till the moment, the ext4 seems to be a better choice on the desktop system since it is presented as a default file system, as well as it is faster than the btrfs when transferring files. The btrfs is definitely worth to look into, but to completely switch to replace the ext4 on desktop Linux might be few years later. The data farms and the large storage pools could reveal different stories and show the right differences between ext4, XCF, and btrfs.

If you have a different or additional opinion, kindly let us know by commenting on this article.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/review-ext4-vs-btrfs-vs-xfs/

作者：[M.el Khamlichi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/

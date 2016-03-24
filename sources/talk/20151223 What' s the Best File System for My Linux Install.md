What’s the Best File System for My Linux Install?
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/05/file-systems-feature-image.jpg)

File systems: they’re not the most exciting things in the world, but important nonetheless. In this article we’ll go over the popular choices for file systems on Linux – what they’re about, what they can do, and who they’re for.

### Ext4 ###

![file-systems-ext4](https://www.maketecheasier.com/assets/uploads/2015/05/file-systems-ext4.png)

If you’ve ever installed Linux before, chances are you’ve seen the “Ext4” during installation. There’s a good reason for that: it’s the file system of choice for just about every Linux distribution available right now. Sure, there are some that choose other options, but there’s no denying that Extended 4 is the file system of choice for almost all Linux users.

#### What can it do? ####

Extended 4 has all of the goodness that you’ve come to expect from past file system iterations (Ext2/Ext3) but with enhancements. There’s a lot to dig into, but here are the best parts of what Ext4 can do for you:

- file system journaling
- journal checksums
- multi-block file allocation
- backwards compatibility support for Extended 2 and 3
- persistent pre-allocation of free space
- improved file system checking (over previous versions)
- and of course, support for larger files

#### Who is it for? ####

Extended 4 is for those looking for a super-stable foundation to build upon, or for those looking for something that just works. This file system won’t snapshot your system; it doesn’t even have the greatest SSD support, but If your needs aren’t too extravagant, you’ll get along with it just fine.

### BtrFS ###

![file-systems-btrFS](https://www.maketecheasier.com/assets/uploads/2015/05/file-systems-btrFS-e1450065697580.png)

The B-tree file system (also known as butterFS) is a file system for Linux developed by Oracle. It’s a new file system and is in heavy development stages. The Linux community considers it unstable to use for some. The core principle of BtrFS is based around the principle of copy-on-write. **Copy on write** basically means that the system has one single copy of a bit of data before the data has been written. When the data has been written, a copy of it is made.

#### What can it do? ####

Besides supporting copy-on-write, BtrFS can do many other things – so many things, in fact, that it’d take forever to list everything. Here are the most notable features: The file system supports read-only snapshots, file cloning, subvolumes, transparent compression, offline file system check, in-place conversion from ext3 and 4 to Btrfs, online defragmentation, anew has support for RAID 0, RAID 1, RAID 5, RAID 6 and RAID 10.

#### Who is it for? ####

The developers of BtrFS have promised that this file system is the next-gen replacement for other file systems out there. That much is true, though it certainly is a work in progress. There are many killer features for advanced users and basic users alike (including great performance on SSDs). This file system is for those looking to get a little bit more out of their file system and who want to try the copy-on-write way of doing things.

### XFS ###

![file-systems-xfs](https://www.maketecheasier.com/assets/uploads/2015/05/file-systems-xfs.jpg)

Developed and created by Silicon Graphics, XFS is a high-end file system that specializes in speed and performance. XFS does extremely well when it comes to parallel input and output because of its focus on performance. The XFS file system can handle massive amounts of data, so much in fact that some users of XFS have close to 300+ terabytes of data.

#### What can it do? ####

XFS is a well-tested data storage file system created for high performance operations. Its features include:

- striped allocation of RAID arrays
- file system journaling
- variable block sizes
- direct I/O
- guaranteed-rate I/O
- snapshots
- online defragmentation
- online resizing

#### Who is it for? ####

XFS is for those looking for a rock-solid file solution. The file system has been around since 1993 and has only gotten better and better with time. If you have a home server and you’re perplexed on where you should go with storage, consider XFS. A lot of the features the file system comes with (like snapshots) could aid in your file storage system. It’s not just for servers, though. If you’re a more advanced user and you’re interested in a lot of what was promised in BtrFS, check out XFS. It does a lot of the same stuff and doesn’t have stability issues.

### Reiser4 ###

![file-system-riser4](https://www.maketecheasier.com/assets/uploads/2015/05/file-system-riser4.gif)

Reiser4, the successor to ReiserFS, is a file system created and developed by Namesys. The creation of Reiser4 was backed by the Linspire project as well as DARPA. What makes Reiser4 special is its multitude of transaction models. There isn’t one single way data can be written; instead, there are many.

#### What can it do? ####

Reiser4 has the unique ability to use different transaction models. It can use the copy-on-write model (like BtrFS), write-anywhere, journaling, and the hybrid transaction model. It has a lot of improvements upon ReiserFS, including better file system journaling via wandering logs, better support for smaller files, and faster handling of directories. Reiser4 has a lot to offer. There are a lot more features to talk about, but suffice it to say it’s a huge improvement over ReiserFS with tons of added features.

#### Who is it for? ####

Resier4 is for those looking to stretch one file system across multiple use-cases. Maybe you want to set up one machine with copy-on-write, another with write-anywhere, and another with hybrid transaction, and you don’t want to use different types of file systems to accomplish this task. Reiser4 is perfect for this type of use-case.

### Conclusion ###

There are many file systems available on Linux. Each serves a unique purpose for unique users looking to solve different problems.This post focuses on the most popular choices for the platform. There is no doubt there are other choices out there for other use-cases.

What’s your favorite file system to use on Linux? Tell us why below!

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/best-file-system-linux/

作者：[Derrik Diener][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/

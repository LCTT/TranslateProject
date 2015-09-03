translating----geekpi

How to Defragment Linux Systems
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-featured.png)

There is a common myth that Linux disks never need defragmentation at all. In most cases, this is true, due mostly to the excellent journaling filesystems Linux uses (ext2, 3, 4, btrfs, etc.) to handle the filesystem. However, in some specific cases, fragmentation might still occur. If that happens to you, the solution is fortunately very simple.

### What is fragmentation? ###

Fragmentation occurs when a file system updates files in little chunks, but these chunks do not form a contiguous whole and are scattered around the disk instead.  This is particularly true for FAT and FAT32 filesystems. It was somewhat mitigated in NTFS and almost never happens in Linux (extX). Here is why.

In filesystems such as FAT and FAT32, files are written right next to each other on the disk. There is no room left for file growth or updates:

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-fragmented.png)

The NTFS leaves somewhat more room between the files, so there is room to grow. As the space between chunks is limited, fragmentation will still occur over time.

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-ntfs.png)

Linux’s journaling filesystems take a different approach. Instead of placing files beside each other, each file is scattered all over the disk, leaving generous amounts of free space between each file. There is sufficient room for file updates/growth and fragmentation rarely occurs.

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-journal.png)

Additionally, if fragmentation does happen, most Linux filesystems would attempt to shuffle files and chunks around to make them contiguous again.

### Disk fragmentation on Linux ###

Disk fragmentation seldom occurs in Linux unless you have a small hard drive, or it is running out of space. Some possible fragmentation cases include:

- if you edit large video files or raw image files, and disk space is limited
- if you use older hardware like an old laptop, and you have a small hard drive
- if your hard drives start filling up (above 85% used)
- if you have many small partitions cluttering your home folder

The best solution is to buy a larger hard drive. If it’s not possible, this is where defragmentation becomes useful.

### How to check for fragmentation ###

The `fsck` command will do this for you – that is, if you have an opportunity to run it from a live CD, with **all affected partitions unmounted**.

This is very important: **RUNNING FSCK ON A MOUNTED PARTITION CAN AND WILL SEVERELY DAMAGE YOUR DATA AND YOUR DISK**.

You have been warned. Before proceeding, make a full system backup.

**Disclaimer**: The author of this article and Make Tech Easier take no responsibility for any damage to your files, data, system, or any other damage, caused by your actions after following this advice. You may proceed at your own risk. If you do proceed, you accept and acknowledge this.

You should just boot into a live session (like an installer disk, system rescue CD, etc.) and run `fsck` on your UNMOUNTED partitions. To check for any problems, run the following command with root permission:

    fsck -fn [/path/to/your/partition]

You can check what the `[/path/to/your/partition]` is by running

    sudo fdisk -l

There is a way to run `fsck` (relatively) safely on a mounted partition – that is by using the `-n` switch. This will result in a read only file system check without touching anything. Of course, there is no guarantee of safety here, and you should only proceed after creating a backup. On an ext2 filesystem, running

    sudo fsck.ext2 -fn /path/to/your/partition

would result in plenty of output – most of them error messages resulting from the fact that the partition is mounted. In the end it will give you fragmentation related information.

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-fsck.png)

If your fragmentation is above 20%, you should proceed to defragment your system.

### How to easily defragment Linux filesystems ###

All you need to do is to back up **ALL** your files and data to another drive (by manually **copying** them over), format the partition, and copy your files back (don’t use a backup program for this). The journalling file system will handle them as new files and place them neatly to the disk without fragmentation.

To back up your files, run

    cp -afv [/path/to/source/partition]/* [/path/to/destination/folder]

Mind the asterix (*); it is important.

Note: It is generally agreed that to copy large files or large amounts of data, the dd command might be best. This is a very low level operation and does copy everything “as is”, including the empty space, and even the junk left over. This is not what we want, so it is probably better to use `cp`.

Now you only need to remove all the original files.

    sudo rm -rf [/path/to/source/partition]/*

**Optional**: you can fill the empty space with zeros. You could achieve this with formatting as well, but if for example you did not copy the whole partition, only large files (which are most likely to cause fragmentation), this might not be an option.

    sudo dd if=/dev/zero of=[/path/to/source/partition]/temp-zero.txt

Wait for it to finish. You could also monitor the progress with `pv`.

    sudo apt-get install pv
    sudo pv -tpreb | of=[/path/to/source/partition]/temp-zero.txt

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-dd.png)

When it is done, just delete the temporary file.

    sudo rm [/path/to/source/partition]/temp-zero.txt

After you zeroed out the empty space (or just skipped that step entirely), copy your files back, reversing the first cp command:

    cp -afv [/path/to/original/destination/folder]/* [/path/to/original/source/partition]

### Using e4defrag ###

If you prefer a simpler approach, install `e2fsprogs`,

    sudo apt-get install e2fsprogs

and run `e4defrag` as root on the affected partition. If you don’t want to or cannot unmount the partition, you can use its mount point instead of its path. To defragment your whole system, run

    sudo e4defrag  /

It is not guaranteed to succeed while mounted (you should also stop using your system while it is running), but it is much easier than copying all files away and back.

### Conclusion ###

Fragmentation should rarely be an issue on a Linux system due to the the journalling filesystem’s efficient data handling. If you do run into fragmentation due to any circumstances, there are simple ways to reallocate your disk space like copying all files away and back or using `e4defrag`. It is important, however, to keep your data safe, so before attempting any operation that would affect all or most of your files, make sure you make a backup just to be on the safe side.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/defragment-linux/

作者：[Attila Orosz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/

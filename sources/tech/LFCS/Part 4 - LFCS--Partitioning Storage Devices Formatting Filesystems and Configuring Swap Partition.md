GHLandy Translating

Part 4 - LFCS: Partitioning Storage Devices, Formatting Filesystems and Configuring Swap Partition
================================================================================
Last August, the Linux Foundation launched the LFCS certification (Linux Foundation Certified Sysadmin), a shiny chance for system administrators to show, through a performance-based exam, that they can perform overall operational support of Linux systems: system support, first-level diagnosing and monitoring, plus issue escalation – if needed – to other support teams.

![Linux Foundation Certified Sysadmin – Part 4](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-4.png)

Linux Foundation Certified Sysadmin – Part 4

Please aware that Linux Foundation certifications are precise, totally based on performance and available through an online portal anytime, anywhere. Thus, you no longer have to travel to a examination center to get the certifications you need to establish your skills and expertise.

Please watch the below video that explains The Linux Foundation Certification Program.

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

This post is Part 4 of a 10-tutorial series, here in this part, we will cover the Partitioning storage devices, Formatting filesystems and Configuring swap partition, that are required for the LFCS certification exam.

### Partitioning Storage Devices ###

Partitioning is a means to divide a single hard drive into one or more parts or “slices” called partitions. A partition is a section on a drive that is treated as an independent disk and which contains a single type of file system, whereas a partition table is an index that relates those physical sections of the hard drive to partition identifications.

In Linux, the traditional tool for managing MBR partitions (up to ~2009) in IBM PC compatible systems is fdisk. For GPT partitions (~2010 and later) we will use gdisk. Each of these tools can be invoked by typing its name followed by a device name (such as /dev/sdb).

#### Managing MBR Partitions with fdisk ####

We will cover fdisk first.

    # fdisk /dev/sdb

A prompt appears asking for the next operation. If you are unsure, you can press the ‘m‘ key to display the help contents.

![fdisk Help Menu](http://www.tecmint.com/wp-content/uploads/2014/10/fdisk-help.png)

fdisk Help Menu

In the above image, the most frequently used options are highlighted. At any moment, you can press ‘p‘ to display the current partition table.

![Check Partition Table in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Show-Partition-Table.png)

Show Partition Table

The Id column shows the partition type (or partition id) that has been assigned by fdisk to the partition. A partition type serves as an indicator of the file system, the partition contains or, in simple words, the way data will be accessed in that partition.

Please note that a comprehensive study of each partition type is out of the scope of this tutorial – as this series is focused on the LFCS exam, which is performance-based.

**Some of the options used by fdisk as follows:**

You can list all the partition types that can be managed by fdisk by pressing the ‘l‘ option (lowercase l).

Press ‘d‘ to delete an existing partition. If more than one partition is found in the drive, you will be asked which one should be deleted.

Enter the corresponding number, and then press ‘w‘ (write modifications to partition table) to apply changes.

In the following example, we will delete /dev/sdb2, and then print (p) the partition table to verify the modifications.

![fdisk Command Options](http://www.tecmint.com/wp-content/uploads/2014/10/fdisk-options.png)

fdisk Command Options

Press ‘n‘ to create a new partition, then ‘p‘ to indicate it will be a primary partition. Finally, you can accept all the default values (in which case the partition will occupy all the available space), or specify a size as follows.

![Create New Partition in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Create-New-Partition.png)

Create New Partition

If the partition Id that fdisk chose is not the right one for our setup, we can press ‘t‘ to change it.

![Change Partition Name in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Change-Partition-Name.png)

Change Partition Name

When you’re done setting up the partitions, press ‘w‘ to commit the changes to disk.

![Save Partition Changes](http://www.tecmint.com/wp-content/uploads/2014/10/Save-Partition-Changes.png)

Save Partition Changes

#### Managing GPT Partitions with gdisk ####

In the following example, we will use /dev/sdb.

    # gdisk /dev/sdb

We must note that gdisk can be used either to create MBR or GPT partitions.

![Create GPT Partitions in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Create-GPT-Partitions.png)

Create GPT Partitions

The advantage of using GPT partitioning is that we can create up to 128 partitions in the same disk whose size can be up to the order of petabytes, whereas the maximum size for MBR partitions is 2 TB.

Note that most of the options in fdisk are the same in gdisk. For that reason, we will not go into detail about them, but here’s a screenshot of the process.

![gdisk Command Options](http://www.tecmint.com/wp-content/uploads/2014/10/gdisk-options.png)

gdisk Command Options

### Formatting Filesystems ###

Once we have created all the necessary partitions, we must create filesystems. To find out the list of filesystems supported in your system, run.

    # ls /sbin/mk*

![Check Filesystems Type in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Check-Filesystems.png)

Check Filesystems Type

The type of filesystem that you should choose depends on your requirements. You should consider the pros and cons of each filesystem and its own set of features. Two important attributes to look for in a filesystem are.

- Journaling support, which allows for faster data recovery in the event of a system crash.
- Security Enhanced Linux (SELinux) support, as per the project wiki, “a security enhancement to Linux which allows users and administrators more control over access control”.

In our next example, we will create an ext4 filesystem (supports both journaling and SELinux) labeled Tecmint on /dev/sdb1, using mkfs, whose basic syntax is.

    # mkfs -t [filesystem] -L [label] device
    or
    # mkfs.[filesystem] -L [label] device

![Create ext4 Filesystems in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystems.png)

Create ext4 Filesystems

### Creating and Using Swap Partitions ###

Swap partitions are necessary if we need our Linux system to have access to virtual memory, which is a section of the hard disk designated for use as memory, when the main system memory (RAM) is all in use. For that reason, a swap partition may not be needed on systems with enough RAM to meet all its requirements; however, even in that case it’s up to the system administrator to decide whether to use a swap partition or not.

A simple rule of thumb to decide the size of a swap partition is as follows.

Swap should usually equal 2x physical RAM for up to 2 GB of physical RAM, and then an additional 1x physical RAM for any amount above 2 GB, but never less than 32 MB.

So, if:

M = Amount of RAM in GB, and S = Amount of swap in GB, then

    If M < 2
    	S = M *2
    Else
    	S = M + 2

Remember this is just a formula and that only you, as a sysadmin, have the final word as to the use and size of a swap partition.

To configure a swap partition, create a regular partition as demonstrated earlier with the desired size. Next, we need to add the following entry to the /etc/fstab file (X can be either b or c).

    /dev/sdX1 swap swap sw 0 0

Finally, let’s format and enable the swap partition.

    # mkswap /dev/sdX1
    # swapon -v /dev/sdX1

To display a snapshot of the swap partition(s).

    # cat /proc/swaps

To disable the swap partition.

    # swapoff /dev/sdX1

For the next example, we’ll use /dev/sdc1 (=512 MB, for a system with 256 MB of RAM) to set up a partition with fdisk that we will use as swap, following the steps detailed above. Note that we will specify a fixed size in this case.

![Create-Swap-Partition in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Create-Swap-Partition.png)

Create Swap Partition

![Add Swap Partition in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Enable-Swap-Partition.png)

Enable Swap Partition

### Conclusion ###

Creating partitions (including swap) and formatting filesystems are crucial in your road to Sysadminship. I hope that the tips given in this article will guide you to achieve your goals. Feel free to add your own tips & ideas in the comments section below, for the benefit of the community.
Reference Links

- [About the LFCS][1]
- [Why get a Linux Foundation Certification?][2]
- [Register for the LFCS exam][3]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-partitions-and-filesystems-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://training.linuxfoundation.org/certification/LFCS
[2]:https://training.linuxfoundation.org/certification/why-certify-with-us
[3]:https://identity.linuxfoundation.org/user?destination=pid/1

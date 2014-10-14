Linux FAQs with Answers--How to create and mount an XFS file system on Linux
================================================================================
> **Question**: I heard good things about XFS, and would like to create an XFS file system on my disk partition. What are the Linux commands to format and mount an XFS file system? 

[XFS][1] is a high-performance file system which was designed by SGI for their IRIX platform. Since XFS was ported to the Linux kernel in 2001, XFS has remained a preferred choice for many enterprise systems especially with massive amount of data, due to its [high performance][2], architectural scalability and robustness. For example, RHEL/CentOS 7 and Oracle Linux have adopted XFS as their default file system, and SUSE/openSUSE have long been an avid supporter of XFS.

XFS has a number of unique features that make it stand out among the file system crowd, such as scalable/parallel I/O, journaling for metadata operations, online defragmentation, suspend/resume I/O, delayed allocation for performance, etc.

If you want to create and mount an XFS file system on your Linux platform, here is how to do it.

### Install XFS System Utilities ###

First, you need to install XFS system utilities, which allow you to perform various XFS related administration tasks (e.g., format, [expand][3], repair, setting up quota, change parameters, etc).

On Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install xfsprogs 

On Fedora, CentOS or RHEL:

    $ sudo yum install xfsprogs 

On Arch Linux:

    $ sudo pacman -S xfsprogs 

### Create an XFS-Formatted Disk Partition ###

Now let's first prepare a disk partition to create XFS on. Assuming that your disk is located at /dev/sdb, create a partition by:

    $ sudo fdisk /dev/sdb 

![](https://farm6.staticflickr.com/5604/15474273555_1c0c4be527_b.jpg)

Let's say the created partition is assigned /dev/sdb1 device name.

Next, format the partition as XFS using mkfs.xfs command. The "-f" option is needed if the partition has any other file system created on it, and you want to overwrite it.

    $ sudo mkfs.xfs -f /dev/sdb1 

![](https://farm4.staticflickr.com/3930/15287704767_fe5ded8ea1_b.jpg)

Now you are ready to mount the formatted partition. Let's assume that /storage is a local mount point for XFS. Go ahead and mount the partition by running:

    $ sudo mount -t xfs /dev/sdb1 /storage 

Verify that XFS mount is succesful by running:

    $ df -Th /storage 

![](https://farm4.staticflickr.com/3938/15474273445_aeacdca6eb_o.png)

If you want the XFS partition to be mounted at /storage automatically upon boot, add the following line to /etc/fstab.

    /dev/sdb1  /storage xfs  defaults  0  0

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/create-mount-xfs-file-system-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xfs.org/
[2]:http://lwn.net/Articles/476263/
[3]:http://ask.xmodulo.com/expand-xfs-file-system.html
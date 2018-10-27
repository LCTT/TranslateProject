FSSlc translating

How To Find The Mounted Filesystem Type In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/07/filesystem-720x340.png)

As you may already know, the Linux supports numerous filesystems, such as Ext4, ext3, ext2, sysfs, securityfs, FAT16, FAT32, NTFS, and many. The most commonly used filesystem is Ext4. Ever wondered what type of filesystem are you currently using in your Linux system? No? Worry not! We got your back. This guide explains how to find the mounted filesystem type in Unix-like operating systems.

### Find The Mounted Filesystem Type In Linux

There can be many ways to find the filesystem type in Linux. Here, I have given 8 different methods. Let us get started, shall we?

#### Method 1 – Using findmnt command

This is the most commonly used method to find out the type of a filesystem. The **findmnt** command will list all mounted filesystems or search for a filesystem. The findmnt command can be able to search in **/etc/fstab** , **/etc/mtab** or **/proc/self/mountinfo**.

findmnt command comes pre-installed in most Linux distributions, because it is part of the package named **util-linux**. Just in case if it is not available, simply install this package and you’re good to go. For instance, you can install **util-linux** package in Debian-based systems using command:
```
$ sudo apt install util-linux

```

Let us go ahead and see how to use findmnt command to find out the mounted filesystems.

If you run it without any arguments/options, it will list all mounted filesystems in a tree-like format as shown below.
```
$ findmnt

```

**Sample output:**

![][2]

As you can see, the findmnt command displays the target mount point (TARGET), source device (SOURCE), file system type (FSTYPE), and relevant mount options, like whether the filesystem is read/write or read-only. (OPTIONS). In my case, my root(/) filesystem type is EXT4.

If you don’t like/want to display the output in tree-like format, use **-l** flag to display in simple, plain format.
```
$ findmnt -l

```

![][3]

You can also list a particular type of filesystem, for example **ext4** , using **-t** option.
```
$ findmnt -t ext4
TARGET SOURCE FSTYPE OPTIONS
/ /dev/sda2 ext4 rw,relatime,commit=360
└─/boot /dev/sda1 ext4 rw,relatime,commit=360,data=ordered

```

Findmnt can produce df style output as well.
```
$ findmnt --df

```

Or
```
$ findmnt -D

```

Sample output:
```
SOURCE FSTYPE SIZE USED AVAIL USE% TARGET
dev devtmpfs 3.9G 0 3.9G 0% /dev
run tmpfs 3.9G 1.1M 3.9G 0% /run
/dev/sda2 ext4 456.3G 342.5G 90.6G 75% /
tmpfs tmpfs 3.9G 32.2M 3.8G 1% /dev/shm
tmpfs tmpfs 3.9G 0 3.9G 0% /sys/fs/cgroup
bpf bpf 0 0 0 - /sys/fs/bpf
tmpfs tmpfs 3.9G 8.4M 3.9G 0% /tmp
/dev/loop0 squashfs 82.1M 82.1M 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 ext4 92.8M 55.7M 30.1M 60% /boot
tmpfs tmpfs 788.8M 32K 788.8M 0% /run/user/1000
gvfsd-fuse fuse.gvfsd-fuse 0 0 0 - /run/user/1000/gvfs

```

You can also display filesystems for a specific device, or mountpoint too.

Search for a device:
```
$ findmnt /dev/sda1
TARGET SOURCE FSTYPE OPTIONS
/boot /dev/sda1 ext4 rw,relatime,commit=360,data=ordered

```

Search for a mountpoint:
```
$ findmnt /
TARGET SOURCE FSTYPE OPTIONS
/ /dev/sda2 ext4 rw,relatime,commit=360

```

You can even find filesystems with specific label:
```
$ findmnt LABEL=Storage

```

For more details, refer the man pages.
```
$ man findmnt

```

The findmnt command is just enough to find the type of a mounted filesystem in Linux. It is created for that specific purpose only. However, there are also few other ways available to find out the filesystem type. If you’re interested to know, read on.

#### Method 2 – Using blkid command

The **blkid** command is used locate and print block device attributes. It is also part of the util-linux package, so you don’t bother to install it.

To find out the type of a filesystem using blkid command, run:
```
$ blkid /dev/sda1

```

#### Method 3 – Using df command

The **df** command is used to report filesystem disk space usage in Unix-like operating systems. To find the type of all mounted filesystems, simply run:
```
$ df -T

```

**Sample output:**

![][4]

For details about df command, refer the following guide.

Also, check man pages.
```
$ man df

```

#### Method 4 – Using file command

The **file** command determines the type of a specified file. It works just fine for files with no file extension.

Run the following command to find the filesystem type of a partition:
```
$ sudo file -sL /dev/sda1
[sudo] password for sk:
/dev/sda1: Linux rev 1.0 ext4 filesystem data, UUID=83a1dbbf-1e15-4b45-94fe-134d3872af96 (needs journal recovery) (extents) (large files) (huge files)

```

Check man pages for more details:
```
$ man file

```

#### Method 5 – Using fsck command

The **fsck** command is used to check the integrity of a filesystem or repair it. You can find the type of a filesystem by passing the partition as an argument like below.
```
$ fsck -N /dev/sda1
fsck from util-linux 2.32
[/usr/bin/fsck.ext4 (1) -- /boot] fsck.ext4 /dev/sda1

```

For more details, refer man pages.
```
$ man fsck

```

#### Method 6 – Using fstab Command

**fstab** is a file that contains static information about the filesystems. This file usually contains the mount point, filesystem type and mount options.

To view the type of a filesystem, simply run:
```
$ cat /etc/fstab

```

![][5]

For more details, refer man pages.
```
$ man fstab

```

#### Method 7 – Using lsblk command

The **lsblk** command displays the information about devices.

To display info about mounted filesystems, simply run:
```
$ lsblk -f
NAME FSTYPE LABEL UUID MOUNTPOINT
loop0 squashfs /var/lib/snapd/snap/core/4327
sda
├─sda1 ext4 83a1dbbf-1e15-4b45-94fe-134d3872af96 /boot
├─sda2 ext4 4d25ddb0-5b20-40b4-ae35-ef96376d6594 /
└─sda3 swap 1f8f5e2e-7c17-4f35-97e6-8bce7a4849cb [SWAP]
sr0

```

For more details, refer man pages.
```
$ man lsblk

```

#### Method 8 – Using mount command

The **mount** command is used to mount a local or remote filesystems in Unix-like systems.

To find out the type of a filesystem using mount command, do:
```
$ mount | grep "^/dev"
/dev/sda2 on / type ext4 (rw,relatime,commit=360)
/dev/sda1 on /boot type ext4 (rw,relatime,commit=360,data=ordered)

```

For more details, refer man pages.
```
$ man mount

```

And, that’s all for now folks. You now know 8 different Linux commands to find out the type of a mounted Linux filesystems. If you know any other methods, feel free to let me know in the comment section below. I will check and update this guide accordingly.

More good stuffs to come. Stay tuned!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-the-mounted-filesystem-type-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/07/findmnt-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/07/findmnt-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/07/df.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/07/fstab.png

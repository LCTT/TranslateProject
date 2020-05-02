[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using mergerfs to increase your virtual storage)
[#]: via: (https://fedoramagazine.org/using-mergerfs-to-increase-your-virtual-storage/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

Using mergerfs to increase your virtual storage
======

![][1]

What happens if you have multiple disks or partitions that you’d like to use for a media project and you don’t want to lose any of your existing data, but you’d like to have everything located or mounted under one drive. That’s where mergerfs can come to your rescue!

[mergerfs][2] is a union filesystem geared towards simplifying storage and management of files across numerous commodity storage devices.

You will need to grab the latest RPM from their github page [here][3]. The releases for Fedora have _**fc**_ and the version number in the name. For example here is the version for Fedora 31:

[mergerfs-2.29.0-1.fc31.x86_64.rpm][4]

### Installing and configuring mergerfs

Install the mergerfs package that you’ve downloaded using sudo:

```
$ sudo dnf install mergerfs-2.29.0-1.fc31.x86_64.rpm
```

You will now be able to mount multiple disks as one drive. This comes in handy if you have a media server and you’d like all of your media files to show up under one location. If you upload new files to your system, you can copy them to your mergerfs directory and mergerfs will automatically copy them to which ever drive has enough free space available.

Here is an example to make it easier to understand:

```
$ df -hT | grep disk
/dev/sdb1      ext4      23M  386K 21M 2% /disk1
/dev/sdc1      ext4      44M  1.1M 40M 3% /disk2

$ ls -l /disk1/Videos/
total 1
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Our Wedding.mkv

$ ls -l /disk2/Videos/
total 2
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Baby's first Xmas.mkv
-rw-rw-r--. 1 curt curt 0 Mar 8 17:21 Halloween hijinks.mkv
```

In this example there are two disks mounted as _disk1_ and _disk2_. Both drives have a _**Videos**_ directory with existing files.

Now we’re going to mount those drives using mergerfs to make them appear as one larger drive.

```
$ sudo mergerfs -o defaults,allow_other,use_ino,category.create=mfs,moveonenospc=true,minfreespace=1M /disk1:/disk2 /media
```

The mergerfs man page is quite extensive and complex so we’ll break down the options that were specified.

  * _defaults_: This will use the default settings unless specified.
  * _allow_other_: allows users besides sudo or root to see the filesystem.
  * _use_ino_: Causes mergerfs to supply file/directory inodes rather than libfuse. While not a default it is recommended it be enabled so that linked files share the same inode value.
  * _category.create=mfs_: Spreads files out across your drives based on available space.
  * _moveonenospc=true_: If enabled, if writing fails, a scan will be done looking for the drive with the most free space.
  * _minfreespace=1M_: The minimum space value used.
  * _disk1_: First hard drive.
  * _disk2_: Second hard drive.
  * _/media_: The directory folder where the drives are mounted.



Here is what it looks like:

```
$ df -hT | grep disk
/dev/sdb1  ext4           23M      386K 21M 2% /disk1
/dev/sdc1  ext4           44M      1.1M 40M 3% /disk2

$ df -hT | grep media
1:2        fuse.mergerfs  66M      1.4M 60M 3% /media
```

You can see that the mergerfs mount now shows a total capacity of 66M which is the combined total of the two hard drives.

Continuing with the example:

There is a 30Mb video called _Baby’s second Xmas.mkv_. Let’s copy it to the _/media_ folder which is the mergerfs mount.

```
$ ls -lh "Baby's second Xmas.mkv"
-rw-rw-r--. 1 curt curt 30M Apr 20 08:45 Baby's second Xmas.mkv
$ cp "Baby's second Xmas.mkv" /media/Videos/
```

Here is the end result:

```
$ df -hT | grep disk
/dev/sdb1  ext4          23M 386K 21M 2% /disk1
/dev/sdc1  ext4          44M 31M 9.8M 76% /disk2

$ df -hT | grep media
1:2        fuse.mergerfs 66M 31M 30M 51% /media
```

You can see from the disk space utilization that mergerfs automatically copied the file to disk2 because disk1 did not have enough free space.

Here is a breakdown of all of the files:

```
$ ls -l /disk1/Videos/
total 1
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Our Wedding.mkv

$ ls -l /disk2/Videos/
total 30003
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Baby's first Xmas.mkv
-rw-rw-r--. 1 curt curt 30720000 Apr 20 08:47 Baby's second Xmas.mkv
-rw-rw-r--. 1 curt curt 0 Mar 8 17:21 Halloween hijinks.mkv

$ ls -l /media/Videos/
total 30004
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Baby's first Xmas.mkv
-rw-rw-r--. 1 curt curt 30720000 Apr 20 08:47 Baby's second Xmas.mkv
-rw-rw-r--. 1 curt curt 0 Mar 8 17:21 Halloween hijinks.mkv
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Our Wedding.mkv
```

When you copy files to your mergerfs mount, it will always copy the files to the hard disk that has enough free space. If none of the drives in the pool have enough free space, then you won’t be able to copy them.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-mergerfs-to-increase-your-virtual-storage/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/mergerfs-816x346.png
[2]: https://github.com/trapexit/mergerfs
[3]: https://github.com/trapexit/mergerfs/releases
[4]: https://github.com/trapexit/mergerfs/releases/download/2.29.0/mergerfs-2.29.0-1.fc31.x86_64.rpm

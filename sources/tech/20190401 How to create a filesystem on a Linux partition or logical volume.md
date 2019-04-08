[#]: collector: (lujun9972)
[#]: translator: (liujing97)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create a filesystem on a Linux partition or logical volume)
[#]: via: (https://opensource.com/article/19/4/create-filesystem-linux-partition)
[#]: author: (Kedar Vijay Kulkarni (Red Hat) https://opensource.com/users/kkulkarn)

How to create a filesystem on a Linux partition or logical volume
======
Learn to create a filesystem and mount it persistently or
non-persistently in your system.
![Filing papers and documents][1]

In computing, a filesystem controls how data is stored and retrieved and helps organize the files on the storage media. Without a filesystem, information in storage would be one large block of data, and you couldn't tell where one piece of information stopped and the next began. A filesystem helps manage all of this by providing names to files that store data and maintaining a table of files and directories—along with their start/end location, total size, etc.—on disks within the filesystem.

In Linux, when you create a hard disk partition or a logical volume, the next step is usually to create a filesystem by formatting the partition or logical volume. This how-to assumes you know how to create a partition or a logical volume, and you just want to format it to contain a filesystem and mount it.

### Create a filesystem

Imagine you just added a new disk to your system and created a partition named **/dev/sda1** on it.

  1. To verify that the Linux kernel can see the partition, you can **cat** out **/proc/partitions** like this:

```
[root@localhost ~]# cat /proc/partitions
major minor  #blocks  name

 253            0   10485760 vda
 253            1       8192000 vda1
  11            0       1048575 sr0
  11            1       374 sr1
   8            0   10485760 sda
   8            1   10484736 sda1
 252            0       3145728 dm-0
 252            1       2097152 dm-1
 252            2       1048576 dm-2
   8    16      1048576 sdb
```


  2. Decide what kind of filesystem you want to create, such as ext4, XFS, or anything else. Here are a few options:

```
[root@localhost ~]# mkfs.<tab><tab>
mkfs.btrfs mkfs.cramfs mkfs.ext2 mkfs.ext3 mkfs.ext4 mkfs.minix mkfs.xfs
```


  3. For the purposes of this exercise, choose ext4. (I like ext4 because it allows you to shrink the filesystem if you need to, a thing that isn't as straightforward with XFS.) Here's how it can be done (the output may differ based on device name/sizes):

```
[root@localhost ~]# mkfs.ext4 /dev/sda1
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=8191 blocks
194688 inodes, 778241 blocks
38912 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=799014912
24 block groups
32768 blocks per group, 32768 fragments per group
8112 inodes per group
Superblock backups stored on blocks:
     32768, 98304, 163840, 229376, 294912

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done
```

  4. In the previous step, if you want to create a different kind of filesystem, use a different **mkfs** command variation.



### Mount a filesystem

After you create your filesystem, you can mount it in your operating system.

  1. First, identify the UUID of your new filesystem. Issue the **blkid** command to list all known block storage devices and look for **sda1** in the output:

```
 [root@localhost ~]# blkid
/dev/vda1: UUID="716e713d-4e91-4186-81fd-c6cfa1b0974d" TYPE="xfs"
/dev/sr1: UUID="2019-03-08-16-17-02-00" LABEL="config-2" TYPE="iso9660"
/dev/sda1: UUID="wow9N8-dX2d-ETN4-zK09-Gr1k-qCVF-eCerbF" TYPE="LVM2_member"
/dev/mapper/test-test1: PTTYPE="dos"
/dev/sda1: UUID="ac96b366-0cdd-4e4c-9493-bb93531be644" TYPE="ext4"
[root@localhost ~]#
```


  2. Run the following command to mount the **/dev/sd1** device :

```
 [root@localhost ~]# mkdir /mnt/mount_point_for_dev_sda1
[root@localhost ~]# ls /mnt/
mount_point_for_dev_sda1
[root@localhost ~]# mount -t ext4 /dev/sda1 /mnt/mount_point_for_dev_sda1/
[root@localhost ~]# df -h
Filesystem Size Used Avail Use% Mounted on
/dev/vda1 7.9G 920M 7.0G 12% /
devtmpfs 443M 0 443M 0% /dev
tmpfs 463M 0 463M 0% /dev/shm
tmpfs 463M 30M 434M 7% /run
tmpfs 463M 0 463M 0% /sys/fs/cgroup
tmpfs 93M 0 93M 0% /run/user/0
/dev/sda1 2.9G 9.0M 2.7G 1% /mnt/mount_point_for_dev_sda1
[root@localhost ~]#
```
 The **df -h** command shows which filesystem is mounted on which mount point. Look for **/dev/sd1**. The mount command above used the device name **/dev/sda1**. Substitute it with the UUID identified in the **blkid** command. Also, note that a new directory was created to mount **/dev/sda1** under **/mnt**.



  3. A problem with using the mount command directly on the command line (as in the previous step) is that the mount won't persist across reboots. To mount the filesystem persistently, edit the **/etc/fstab** file to include your mount information:

```
UUID=ac96b366-0cdd-4e4c-9493-bb93531be644 /mnt/mount_point_for_dev_sda1/ ext4 defaults 0 0
```



  4. After you edit **/etc/fstab** , you can **umount /mnt/mount_point_for_dev_sda1** and run the command **mount -a** to mount everything listed in **/etc/fstab**. If everything went right, you can still list **df -h** and see your filesystem mounted:

```
root@localhost ~]# umount /mnt/mount_point_for_dev_sda1/
[root@localhost ~]# mount -a
[root@localhost ~]# df -h
Filesystem Size Used Avail Use% Mounted on
/dev/vda1 7.9G 920M 7.0G 12% /
devtmpfs 443M 0 443M 0% /dev
tmpfs 463M 0 463M 0% /dev/shm
tmpfs 463M 30M 434M 7% /run
tmpfs 463M 0 463M 0% /sys/fs/cgroup
tmpfs 93M 0 93M 0% /run/user/0
/dev/sda1 2.9G 9.0M 2.7G 1% /mnt/mount_point_for_dev_sda1
```

  5. You can also check whether the filesystem was mounted:

```
[root@localhost ~]# mount | grep ^/dev/sd
/dev/sda1 on /mnt/mount_point_for_dev_sda1 type ext4 (rw,relatime,seclabel,stripe=8191,data=ordered)
```



Now you know how to create a filesystem and mount it persistently or non-persistently within your system.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/create-filesystem-linux-partition

作者：[Kedar Vijay Kulkarni (Red Hat)][a]
选题：[lujun9972][b]
译者：[liujing97](https://github.com/liujing97)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kkulkarn
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)

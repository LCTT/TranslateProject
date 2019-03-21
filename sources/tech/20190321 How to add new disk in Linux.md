[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to add new disk in Linux)
[#]: via: (https://kerneltalks.com/hardware-config/how-to-add-new-disk-in-linux/)
[#]: author: (kerneltalks https://kerneltalks.com)

How to add new disk in Linux
======

* * *

_Step by step procedure to add disk in Linux machine_

![New disk addition in Linux][1]

In this article we will walk you through steps to add new disk in Linux machine. Adding raw disk to linux machine may very depending upon the type of server you have but once disk is presented to machine, procedure of getting it to mount points is almost same.

**Objective** : Add new 10GB disk to server and create 5GB mount point out of it using LVM and newly created volume group.

* * *

### Adding raw disk to Linux machine

If you are using AWS EC2 Linux server, you may [follow these steps][2] to add raw disk. If you are on VMware Linux VM you will have different set of steps to follow to add disk. If you are running physical rack mount/blade server then adding disk will be a physical task.

Now once the disk is attached to Linux machine physically/virtually, it will be identified by kernel and then our rally starts.

* * *

### Identifying newly added disk in Linux

After attachment of raw disk, you need to ask kernel to [scan new disk][3]. Mostly its done now automatically by kernel in new versions.

First thing is to identify newly added disk and its name in kernel. There are numerous ways to achieve this. I will list few –

  * You can observer `lsblk` output before and after adding/scanning disk to get new disk name.
  * Check newly created disk files in `/dev` filesystem. Match timestamp of file and disk addition time.
  * Observer `fdisk -l` output before and after adding/scanning disk to get new disk name.



For our example I am using AWS EC2 server and I added 5GB disk to my server. here is my lsblk output –


```
[root@kerneltalks ~]# lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
├─xvda1 202:1    0   1M  0 part
└─xvda2 202:2    0  10G  0 part /
xvdf    202:80   0  10G  0 disk
```

You can see xvdf is our newly added disk. Full path for disk is `/dev/xvdf`.

* * *

### Add new disk in LVM

We are using LVM here since its widely used and flexible volume manager on Linux plateform. Make sure you have `lvm` or `lvm2` [package installed on your system][4]. If not, [install lvm/lvm2 package][5].

Now, we are going to add this RAW disk in Logical Volume Manager and create 10GB of mount point out of it. List of commands you need to follow are –

  * [pvcreate][6]
  * [vgcreate][7]
  * [lvcreate][8]



If you are willing to add disk to existing mount point and use its space to [extend mount point][9] then `vgcreate` should be replaced by `vgextend`.

Sample outputs from my session –

```
[root@kerneltalks ~]# pvcreate /dev/xvdf
  Physical volume "/dev/xvdf" successfully created.
[root@kerneltalks ~]# vgcreate vgdata /dev/xvdf
  Volume group "vgdata" successfully created
[root@kerneltalks ~]# lvcreate -L 5G -n lvdata vgdata
  Logical volume "lvdata" created.
```

Now, you have logical volume created. You need to format it with filesystem on your choice and mount it. We are choosing ext4 filesystem here and formatting using `mkfs.ext4` .

```
[root@kerneltalks ~]# mkfs.ext4 /dev/vgdata/lvdata
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
327680 inodes, 1310720 blocks
65536 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=1342177280
40 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736
 
Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

* * *

### Mounting volume from new disk on mount point

Lets mount the logical volume of 5GB which we created and formatted on /data mount point using `mount` command.

```
[root@kerneltalks ~]# mount /dev/vgdata/lvdata /data
[root@kerneltalks ~]# df -Ph /data
Filesystem                 Size  Used Avail Use% Mounted on
/dev/mapper/vgdata-lvdata  4.8G   20M  4.6G   1% /data
```

Verify your mount point with df command as above and you are all done! You can always add an entry in [/etc/fstab][10] to make this mount persistent over reboots.

You have attached 10GB disk to Linux machine and created 5GB mount point out of it!

--------------------------------------------------------------------------------

via: https://kerneltalks.com/hardware-config/how-to-add-new-disk-in-linux/

作者：[kerneltalks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kerneltalks.com
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/kerneltalks.com/wp-content/uploads/2019/03/How-to-add-new-disk-in-Linux.png?ssl=1
[2]: https://kerneltalks.com/cloud-services/how-to-add-ebs-disk-on-aws-linux-server/
[3]: https://kerneltalks.com/disk-management/howto-scan-new-lun-disk-linux-hpux/
[4]: https://kerneltalks.com/tools/check-package-installed-linux/
[5]: https://kerneltalks.com/tools/package-installation-linux-yum-apt/
[6]: https://kerneltalks.com/disk-management/lvm-command-tutorials-pvcreate-pvdisplay/
[7]: https://kerneltalks.com/disk-management/lvm-commands-tutorial-vgcreate-vgdisplay-vgscan/
[8]: https://kerneltalks.com/disk-management/lvm-commands-tutorial-lvcreate-lvdisplay-lvremove/
[9]: https://kerneltalks.com/disk-management/extend-file-system-online-lvm/
[10]: https://kerneltalks.com/config/understanding-etcfstab-file/

translating by lujun9972
xfs file system commands with examples
======

![Learn xfs commands with examples][1]

In our another article we walked you through [what is xfs, features of xfs etc][2]. In this article we will see some frequently used xfs administrative commands. We will see how to create xfs filesystem, how to grow xfs filesystem, how to repair xfs file system and check xfs filesystem along with command examples.

### Create XFS filesystem

`mkfs.xfs` command is used to create xfs filesystem. Without any special switches command output looks like one below -
```
root@kerneltalks # mkfs.xfs /dev/xvdf
meta-data=/dev/xvdf              isize=512    agcount=4, agsize=1310720 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=5242880, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
```

> Note : Once XFS filesystem is created it can not be reduced. It can only be extended to bigger size.

### Resize XFS file system

In XFS, you can only extend file system and can not reduce it. To grow XFS file system use `xfs_growfs`. You need to specify new size of mount point along with `-D` switch. `-D` takes argument number as file system blocks. If you dont supply `-D` switch, `xfs_growfs` will grow filesystem to maximum available limit on that device.

```
root@kerneltalks # xfs_growfs /dev/xvdf -D 256
meta-data=/dev/xvdf              isize=512    agcount=4, agsize=720896 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=2883584, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data size 256 too small, old size is 2883584
```

In above output, observe last line. Since I supplied new size smaller than the existing size, `xfs_growfs`didnt change filesystem. This show you can not reduce XFS file system. You can only extend it.

```
root@kerneltalks #  xfs_growfs /dev/xvdf -D 2883840
meta-data=/dev/xvdf              isize=512    agcount=4, agsize=720896 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=2883584, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data blocks changed from 2883584 to 2883840
```

Now, I supplied new size 1GB extra and it successfully grew the file system.

 **1GB blocks calculation :**

Current filesystem has bsize=4096 i.e. block size of 4MB. We need 1 GB i.e. 256 blocks. So add 256 in current number of blocks i.e. 2883584 which gives you 2883840\. So I used 2883840 as argument to `-D` switch.

### Repair XFS file system

File system consistency check and repair of XFS can be performed using `xfs_repair` command. You can run command with `-n` switch so that it will not modify anything on filesystem. It will only scans and reports which modification to be done. If you are running it without -n switch, it will modify file system wherever necessary to make it clean.

Please note that you need to un-mount XFS filesystem before you can run checks on it. Otherwise you will see below error.

```
root@kerneltalks # xfs_repair -n /dev/xvdf
xfs_repair: /dev/xvdf contains a mounted filesystem
xfs_repair: /dev/xvdf contains a mounted and writable filesystem
 
fatal error -- couldn't initialize XFS library
```
Once successfully un-mounting file system you can run command on it.
```
root@kerneltalks # xfs_repair -n /dev/xvdf
Phase 1 - find and verify superblock...
Phase 2 - using internal log
        - zero log...
        - scan filesystem freespace and inode maps...
        - found root inode chunk
Phase 3 - for each AG...
        - scan (but don't clear) agi unlinked lists...
        - process known inodes and perform inode discovery...
        - agno = 0
        - agno = 1
        - agno = 2
        - agno = 3
        - agno = 4
        - process newly discovered inodes...
Phase 4 - check for duplicate blocks...
        - setting up duplicate extent list...
        - check for inodes claiming duplicate blocks...
        - agno = 0
        - agno = 1
        - agno = 2
        - agno = 3
        - agno = 4
No modify flag set, skipping phase 5
Phase 6 - check inode connectivity...
        - traversing filesystem ...
        - traversal finished ...
        - moving disconnected inodes to lost+found ...
Phase 7 - verify link counts...
No modify flag set, skipping filesystem flush and exiting.
```

In above output you can observe, in each phase command shows possible modification which can be done to make file system healthy. If you want command to do those modification during scan then run command without any switch.

```
xfs_repair output
```

```
root @ kerneltalks # xfs_repair /dev/xvdf

Phase 1 - find and verify superblock . . .
Phase 2 - using internal log
        - zero log . . .
        - scan filesystem freespace and inode maps . . .
        - found root inode chunk
Phase 3 - for each AG . . . 
        - scan and clear agi unlinked lists . . .
        - process known inodes and perform inode discovery . . .
        - agno = 0 
        - agno = 1
        - agno = 2
        - agno = 3
        - agno = 4
        - process newly discovered inodes . . . 
Phase 4 - check for duplicate blocks . . .
        - setting up duplicate extent list . . .
        - check for inodes claiming duplicate blocks . . .
        - agno = 0
        - agno = 1
        - agno = 2
        - agno = 3
        - agno = 4 
Phase 5 - rebuild AG headers and trees . . .
        - reset superblock . . .
Phase 6 - check inode connectivity . . .
        - resetting contents of realtime bitmap and summary inodes
        - traversing filesystem . . .
        - traversal finished . . .
        - moving disconnected inodes to lost + found . . .
Phase 7 - verify and correct link counts . . . 
done
```

In above output you can observer `xfs_repair` command is executing possible filesystem modification as well to make it healthy.

### Check XFS version and details

Checking xfs file system version is easy. Run `xfs_info` command with `-V` switch on mount point.

```
root@kerneltalks # xfs_info -V /shrikant
xfs_info version 4.5.0
```

To view details of XFS file system like block size and number of blocks which helps you in calculating new block number for growing XFS file system, use `xfs_info` without any switch.

```
root@kerneltalks # xfs_info /shrikant
meta-data=/dev/xvdf              isize=512    agcount=5, agsize=720896 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=2883840, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
```

It displays all details as it shows while creating XFS file system

There are another XFS file system management commands which alters and manages its metadata. We will cover them in another article.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/commands/xfs-file-system-commands-with-examples/

作者：[kerneltalks][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://c3.kerneltalks.com/wp-content/uploads/2018/01/xfs-commands.png
[2]:https://kerneltalks.com/disk-management/xfs-filesystem-in-linux/

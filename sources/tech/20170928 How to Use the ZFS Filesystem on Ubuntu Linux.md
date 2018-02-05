How to Use the ZFS Filesystem on Ubuntu Linux  
======
There are a myriad of [filesystems available for Linux][1]. So why try a new one? They all work, right? They're not all the same, and some have some very distinct advantages, like ZFS.

### Why ZFS

ZFS is awesome. It's a truly modern filesystem with built-in capabilities that make sense for handling loads of data.

Now, if you're considering ZFS for your ultra-fast NVMe SSD, it might not be the best option. It's slower than others. That's okay, though. It was designed to store huge amounts of data and keep it safe.

ZFS eliminates the need to set up traditional RAID arrays. Instead, you can create ZFS pools, and even add drives to those pools at any time. ZFS pools behave almost exactly like RAID, but the functionality is built right into the filesystem.

ZFS also acts like a replacement for LVM, allowing you to partition and manage partitions on the fly without the need to handle things at a lower level and worry about the associated risks.

It's also a CoW filesystem. Without getting too technical, that means that ZFS protects your data from gradual corruption over time. ZFS creates checksums of files and lets you roll back those files to a previous working version.

### Installing ZFS

![Install ZFS on Ubuntu][2]

Installing ZFS on Ubuntu is very easy, though the process is slightly different for Ubuntu LTS and the latest releases.

 **Ubuntu 16.04 LTS**
```
 sudo apt install zfs
```

 **Ubuntu 17.04 and Later**
```
 sudo apt install zfsutils
```

After you have the utilities installed, you can create ZFS drives and partitions using the tools provided by ZFS.

### Creating Pools

![Create ZFS Pool][3]

Pools are the rough equivalent of RAID in ZFS. They are flexible and can easily be manipulated.

#### RAID0

RAID0 just pools your drives into what behaves like one giant drive. It can increase your drive speeds, but if one of your drives fails, you're probably going to be out of luck.

To achieve RAID0 with ZFS, just create a plain pool.
```
sudo zpool create your-pool /dev/sdc /dev/sdd
```

#### RAID1/MIRROR

You can achieve RAID1 functionality with the `mirror` keyword in ZFS. Raid1 creates a 1-to-1 copy of your drive. This means that your data is constantly backed up. It also increases performance. Of course, you use half of your storage to the duplication.
```
sudo zpool create your-pool mirror /dev/sdc /dev/sdd
```

#### RAID5/RAIDZ1

ZFS implements RAID5 functionality as RAIDZ1. RAID5 requires drives in multiples of three and allows you to keep 2/3 of your storage space by writing backup parity data to 1/3 of the drive space. If one drive fails, the array will remain online, but the failed drive should be replaced ASAP.
```
sudo zpool create your-pool raidz1 /dev/sdc /dev/sdd /dev/sde
```

#### RAID6/RAIDZ2

RAID6 is almost exactly like RAID5, but it works in multiples of four instead of multiples of three. It doubles the parity data to allow up to two drives to fail without bringing the array down.
```
sudo zpool create your-pool raidz2 /dev/sdc /dev/sdd /dev/sde /dev/sdf
```

#### RAID10/Striped Mirror

RAID10 aims to be the best of both worlds by providing both a speed increase and data redundancy with striping. You need drives in multiples of four and will only have access to half of the space. You can create a pool in RAID10 by creating two mirrors in the same pool command.
```
sudo zpool create your-pool mirror /dev/sdc /dev/sdd mirror /dev/sde /dev/sdf
```

### Working With Pools

![ZFS pool Status][4]

There are also some management tools that you have to work with your pools once you've created them. First, check the status of your pools.
```
sudo zpool status
```

#### Updates

When you update ZFS you'll need to update your pools, too. Your pools will notify you of any updates when you check their status. To update a pool, run the following command.
```
sudo zpool upgrade your-pool
```

You can also upgrade them all.
```
sudo zpool upgrade -a
```

#### Adding Drives

You can also add drives to your pools at any time. Tell `zpool` the name of the pool and the location of the drive, and it'll take care of everything.
```
sudo zpool add your-pool /dev/sdx
```

### Other Thoughts

![ZFS in File Browser][5]

ZFS creates a directory in the root filesystem for your pools. You can browse to them by name using your GUI file manager or the CLI.

ZFS is awesomely powerful, and there are plenty of other things that you can do with it, too, but these are the basics. It is an excellent filesystem for working with loads of storage, even if it is just a RAID array of hard drives that you use for your files. ZFS works excellently with NAS systems, too.

Regardless of how stable and robust ZFS is, it's always best to back up your data when you implement something new on your hard drives.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/use-zfs-filesystem-ubuntu-linux/

作者：[Nick Congleton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/nickcongleton/
[1]:https://www.maketecheasier.com/best-linux-filesystem-for-ssd/
[2]:https://www.maketecheasier.com/assets/uploads/2017/09/zfs-install.jpg (Install ZFS on Ubuntu)
[3]:https://www.maketecheasier.com/assets/uploads/2017/09/zfs-create-pool.jpg (Create ZFS Pool)
[4]:https://www.maketecheasier.com/assets/uploads/2017/09/zfs-pool-status.jpg (ZFS pool Status)
[5]:https://www.maketecheasier.com/assets/uploads/2017/09/zfs-pool-open.jpg (ZFS in File Browser)

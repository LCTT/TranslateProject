[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Stratis – up and running)
[#]: via: (https://fedoramagazine.org/getting-started-with-stratis-up-and-running/)
[#]: author: (Gordon Keegan https://fedoramagazine.org/author/gmkeegan/)

Getting started with Stratis – up and running
======

![][1]

[Photo][2] by [Jeremy Lapak][3] on [Unsplash][4]

When adding storage to a Linux server, system administrators often use commands like _pvcreate_, _vgcreate_, _lvcreate_, and _mkfs_ to integrate the new storage into the system. [Stratis][5] is a command-line tool designed to make managing storage much simpler. It creates, modifies, and destroys pools of storage. It also allocates and deallocates filesystems from the storage pools.

Instead of an entirely in-kernel approach like ZFS or Btrfs, Stratis uses a hybrid approach with components in both user space and kernel land. It builds on existing block device managers like device mapper and existing filesystems like XFS. Monitoring and control is performed by a user space daemon.

Stratis tries to avoid some ZFS characteristics like restrictions on adding new hard drives or replacing existing drives with bigger ones. One of its main design goals is to achieve a positive command-line experience.

### Install Stratis

Begin by installing the required packages. Several Python-related dependencies will be automatically pulled in. The _stratisd_ package provides the _stratisd_ daemon which creates, manages, and monitors local storage pools. The _stratis-cli_ package provides the _stratis_ command along with several Python libraries.

```
# yum install -y stratisd stratis-cli
```

Next, enable the _stratisd_ service.

```
# systemctl enable --now stratisd
```

Note that the “enable –now” syntax shown above both permanently enables and immediately starts the service.

After determining what disks/block devices are present and available, the three basic steps to using Stratis are:

  1. Create a pool of the desired disks.
  2. Create a filesystem in the pool.
  3. Mount the filesystem.



In the following example, four virtual disks are available in a virtual machine. Be sure not to use the root/system disk (/dev/vda in this example)!

```
# sfdisk -s
/dev/vda:  31457280
/dev/vdb:   5242880
/dev/vdc:   5242880
/dev/vdd:   5242880
/dev/vde:   5242880
total:  52428800 blocks
```

### Create a storage pool using Stratis

```
# stratis pool create testpool /dev/vdb /dev/vdc
# stratis pool list
Name Total Physical Size  Total Physical Used
testpool   10 GiB         56 MiB
```

After creating the pool, check the status of its block devices:

```
# stratis blockdev list
Pool Name   Device Node Physical Size   State  Tier
testpool    /dev/vdb            5 GiB  In-use  Data
testpool    /dev/vdc            5 GiB  In-use  Data
```

### Create a filesystem using Stratis

Next, create a filesystem. As mentioned earlier, Stratis uses the existing DM (device mapper) and XFS filesystem technologies to create thinly-provisioned filesystems. By building on these existing technologies, large filesystems can be created and it is possible to add physical storage as storage needs grow.

```
# stratis fs create testpool testfs
# stratis fs list
Pool Name  Name   Used     Created                                 Device                    UUID
testpool   testfs 546 MiB  Apr 18 2020 09:15 /stratis/testpool/testfs  095fb4891a5743d0a589217071ff71dc
```

Note that “fs” in the example above can optionally be written out as “filesystem”.

### Mount the filesystem

Next, create a mount point and mount the filesystem.

```
# mkdir /testdir
# mount /stratis/testpool/testfs /testdir
# df -h | egrep 'stratis|Filesystem'
Filesystem                                 Size  Used Avail Use% Mounted on
/dev/mapper/stratis-1-3e8e[truncated]71dc  1.0T  7.2G 1017G   1% /testdir
```

The actual space used by a filesystem is shown using the _stratis fs list_ command demonstrated previously. Notice how the _testdir_ filesystem has a virtual size of **1.0T**. If the data in a filesystem approaches its virtual size, and there is available space in the storage pool, Stratis will automatically grow the filesystem. Note that beginning with Fedora 34, the form of device path will be _/dev/stratis/&lt;pool-name&gt;/&lt;filesystem-name&gt;_.

### Add the filesystem to fstab

To configure automatic mounting of the filesystem at boot time, run following commands:

```
# UUID=`lsblk -n -o uuid /stratis/testpool/testfs`
# echo "UUID=${UUID} /testdir xfs defaults 0 0" >> /etc/fstab
```

After updating fstab, verify that the entry is correct by unmounting and mounting the filesystem:

```
# umount /testdir
# mount /testdir
# df -h | egrep 'stratis|Filesystem'
Filesystem                                 Size  Used Avail Use% Mounted on
/dev/mapper/stratis-1-3e8e[truncated]71dc  1.0T  7.2G 1017G   1% /testdir
```

### Adding cache devices with Stratis

Suppose _/dev/vdd_ is an available SSD (solid state disk). To configure it as a cache device and check its status, use the following commands:

```
# stratis pool add-cache testpool  /dev/vdd
# stratis blockdev
Pool Name   Device Node Physical Size  State    Tier
testpool    /dev/vdb            5 GiB  In-use   Data
testpool    /dev/vdc            5 GiB  In-use   Data
testpool    /dev/vdd            5 GiB  In-use   Cache
```

### Growing the storage pool

Suppose the _testfs_ filesystem is close to using all the storage capacity of _testpool_. You could add an additional disk/block device to the pool with commands similar to the following:

```
# stratis pool add-data testpool /dev/vde
# stratis blockdev
Pool Name  Device Node Physical Size   State    Tier
testpool   /dev/vdb            5 GiB   In-use   Data
testpool   /dev/vdc            5 GiB   In-use   Data
testpool   /dev/vdd            5 GiB   In-use   Cache
testpool   /dev/vde            5 GiB   In-use   Data
```

After adding the device, verify that the pool shows the added capacity:

```
# stratis pool
Name      Total Physical Size   Total Physical Used
testpool               15 GiB               606 MiB
```

### Conclusion

Stratis is a tool designed to make managing storage much simpler. Creating a filesystem with enterprise functionalities like thin-provisioning, snapshots, volume management, and caching can be accomplished quickly and easily with just a few basic commands.

See also [Getting Started with Stratis Encryption][6].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-stratis-up-and-running/

作者：[Gordon Keegan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gmkeegan/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/stratis-up-and-running-816x345.jpg
[2]: https://unsplash.com/photos/CVvFVQ_-oUg
[3]: https://unsplash.com/@jeremy_justin?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/s/photos/runner?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://stratis-storage.github.io/
[6]: https://fedoramagazine.org/getting-started-with-stratis-encryption/

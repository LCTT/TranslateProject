[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing RAID arrays with mdadm)
[#]: via: (https://fedoramagazine.org/managing-raid-arrays-with-mdadm/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Managing RAID arrays with mdadm
======

![][1]

Mdadm stands for Multiple Disk and Device Administration. It is a command line tool that can be used to manage software [RAID][2] arrays on your Linux PC. This article outlines the basics you need to get started with it.

The following five commands allow you to make use of mdadm’s most basic features:

  1. **Create a RAID array** :
### mdadm --create /dev/md/test --homehost=any --metadata=1.0 --level=1 --raid-devices=2 /dev/sda1 /dev/sdb1
  2. **Assemble (and start) a RAID array** :
### mdadm --assemble /dev/md/test /dev/sda1 /dev/sdb1
  3. **Stop a RAID array** :
### mdadm --stop /dev/md/test
  4. **Delete a RAID array** :
### mdadm --zero-superblock /dev/sda1 /dev/sdb1
  5. **Check the status of all assembled RAID arrays** :
### cat /proc/mdstat



#### Notes on features

##### `mdadm --create`

The _create_ command shown above includes the following four parameters in addition to the create parameter itself and the device names:

  1. **–homehost** :
By default, mdadm stores your computer’s name as an attribute of the RAID array. If your computer name does not match the stored name, the array will not automatically assemble. This feature is useful in server clusters that share hard drives because file system corruption usually occurs if multiple servers attempt to access the same drive at the same time. The name _any_ is reserved and disables the _homehost_ restriction.
  2. **–metadata** :
_mdadm_ reserves a small portion of each RAID device to store information about the RAID array itself. The _metadata_ parameter specifies the format and location of the information. The value _1.0_ indicates to use version-1 formatting and store the metadata at the end of the device.
  3. **–level** :
The _level_ parameter specifies how the data should be distributed among the underlying devices. Level _1_ indicates each device should contain a complete copy of all the data. This level is also known as [disk mirroring][3].
  4. **–raid-devices** :
The _raid-devices_ parameter specifies the number of devices that will be used to create the RAID array.



By using _level=1_ (mirroring) in combination with _metadata=1.0_ (store the metadata at the end of the device), you create a RAID1 array whose underlying devices appear normal if accessed without the aid of the mdadm driver. This is useful in the case of disaster recovery, because you can access the device even if the new system doesn’t support mdadm arrays. It’s also useful in case a program needs _read-only_ access to the underlying device before mdadm is available. For example, the [UEFI][4] firmware in a computer may need to read the bootloader from the [ESP][5] before mdadm is started.

##### `mdadm --assemble`

The _assemble_ command above fails if a member device is missing or corrupt. To force the RAID array to assemble and start when one of its members is missing, use the following command:

```
# mdadm --assemble --run /dev/md/test /dev/sda1
```

#### Other important notes

Avoid writing directly to any devices that underlay a mdadm RAID1 array. That causes the devices to become out-of-sync and mdadm won’t know that they are out-of-sync. If you access a RAID1 array with a device that’s been modified out-of-band, you can cause file system corruption. If you modify a RAID1 device out-of-band and need to force the array to re-synchronize, delete the mdadm metadata from the device to be overwritten and then re-add it to the array as demonstrated below:

```
# mdadm --zero-superblock /dev/sdb1
# mdadm --assemble --run /dev/md/test /dev/sda1
# mdadm /dev/md/test --add /dev/sdb1
```

These commands completely overwrite the contents of sdb1 with the contents of sda1.

To specify any RAID arrays to automatically activate when your computer starts, create an _/etc/mdadm.conf_ configuration file.

For the most up-to-date and detailed information, check the man pages:

```
$ man mdadm
$ man mdadm.conf
```

The next article of this series will show a step-by-step guide on how to convert an existing single-disk Linux installation to a mirrored-disk installation, that will continue running even if one of its hard drives suddenly stops working!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-raid-arrays-with-mdadm/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/mdadm-816x345.jpg
[2]: https://en.wikipedia.org/wiki/RAID
[3]: https://en.wikipedia.org/wiki/Disk_mirroring
[4]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface
[5]: https://en.wikipedia.org/wiki/EFI_system_partition

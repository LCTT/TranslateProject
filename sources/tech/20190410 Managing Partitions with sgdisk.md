[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing Partitions with sgdisk)
[#]: via: (https://fedoramagazine.org/managing-partitions-with-sgdisk/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Managing Partitions with sgdisk
======

![][1]

[Roderick W. Smith][2]‘s _sgdisk_ command can be used to manage the partitioning of your hard disk drive from the command line. The basics that you need to get started with it are demonstrated below.

The following six parameters are all that you need to know to make use of sgdisk’s most basic features:

  1. **-p**
_Print_ the partition table:
### sgdisk -p /dev/sda
  2. **-d x**
_Delete_ partition x:
### sgdisk -d 1 /dev/sda
  3. **-n x:y:z**
Create a _new_ partition numbered x, starting at y and ending at z:
### sgdisk -n 1:1MiB:2MiB /dev/sda
  4. **-c x:y**
_Change_ the name of partition x to y:
### sgdisk -c 1:grub /dev/sda
  5. **-t x:y**
Change the _type_ of partition x to y:
### sgdisk -t 1:ef02 /dev/sda
  6. **–list-types**
List the partition type codes:
### sgdisk --list-types



![The SGDisk Command][3]

As you can see in the above examples, most of the commands require that the [device file name][4] of the hard disk drive to operate on be specified as the last parameter.

The parameters shown above can be combined so that you can completely define a partition with a single run of the sgdisk command:

### sgdisk -n 1:1MiB:2MiB -t 1:ef02 -c 1:grub /dev/sda

Relative values can be specified for some fields by prefixing the value with a **+** or **–** symbol. If you use a relative value, sgdisk will do the math for you. For example, the above example could be written as:

### sgdisk -n 1:1MiB:+1MiB -t 1:ef02 -c 1:grub /dev/sda

The value **0** has a special-case meaning for several of the fields:

  * In the _partition number_ field, 0 indicates that the next available number should be used (numbering starts at 1).
  * In the _starting address_ field, 0 indicates that the start of the largest available block of free space should be used. Some space at the start of the hard drive is always reserved for the partition table itself.
  * In the _ending address_ field, 0 indicates that the end of the largest available block of free space should be used.



By using **0** and relative values in the appropriate fields, you can create a series of partitions without having to pre-calculate any absolute values. For example, the following sequence of sgdisk commands would create all the basic partitions that are needed for a typical Linux installation if in run sequence against a blank hard drive:

### sgdisk -n 0:0:+1MiB -t 0:ef02 -c 0:grub /dev/sda
### sgdisk -n 0:0:+1GiB -t 0:ea00 -c 0:boot /dev/sda
### sgdisk -n 0:0:+4GiB -t 0:8200 -c 0:swap /dev/sda
### sgdisk -n 0:0:0 -t 0:8300 -c 0:root /dev/sda

The above example shows how to partition a hard disk for a BIOS-based computer. The [grub partition][5] is not needed on a UEFI-based computer. Because sgdisk is calculating all the absolute values for you in the above example, you can just skip running the first command on a UEFI-based computer and the remaining commands can be run without modification. Likewise, you could skip creating the swap partition and the remaining commands would not need to be modified.

There is also a short-cut for deleting all the partitions from a hard disk with a single command:

### sgdisk --zap-all /dev/sda

For the most up-to-date and detailed information, check the man page:

$ man sgdisk

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-partitions-with-sgdisk/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/managing-partitions-816x345.png
[2]: https://www.rodsbooks.com/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/04/sgdisk.jpg
[4]: https://en.wikipedia.org/wiki/Device_file
[5]: https://en.wikipedia.org/wiki/BIOS_boot_partition

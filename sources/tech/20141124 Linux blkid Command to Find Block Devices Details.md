Linux blkid Command to Find Block Devices Details
================================================================================
Today we will show you how to use **lsblk** and **blkid** utilities to find out information about block devices and we are using a CentOS 7.0 installed machine.

**lsblk** is a Linux utility that will display information about all the available block devices on your system. It reads and gathers from them from [the sysfs filesystem][1]. The utility will display information about all block devices (with the exception of RAM disks) in a tree-like format by default.

### Lsblk default output ###

By default lsblk will display a tree-like format of the block devices:

**NAME**

    – the device name

**MAJ:MIN**

    - Every device on a Linux operating system is represented by a file, for block (disk) devices, they describe the device using major and minor device numbers.

**RM**

    – removable device – shows 1 if this is a removable device and 0 if it’s not

**TYPE**

    – the device type

**MOUNTPOINT**

    - the location where the device is mounted

**RO**

    – it will display 1 for read-only filesystems and 0 for those that are not read-only

**SIZE**

    – the size of the device

![](http://blog.linoxide.com/wp-content/uploads/2014/10/lsblk.jpg)

### Display the owner of the devices ###

To display information about the owenership of the device, the user and group that own the file and the mode that the filesystem has been mounted with you can use the –m option like this:

    lsblk –m

![](http://blog.linoxide.com/wp-content/uploads/2014/10/lsblk-m.jpg)

### List the device blocks ###

If you wish to just list the devices and not show them as a tree you can use the –l option:

    lsblk –l

### Use in scripts ###

Advanced tip: if you wish to use this in a script and don’t want to have the heading displayed you can use the –n flag like so:

    lsblk –ln

![](http://blog.linoxide.com/wp-content/uploads/2014/10/lsblk-ln.jpg)

The **blkid** program is a command-line utility that displays information about available block devices. It can determine the type of content (e.g. filesystem, swap) a block device holds and also attributes (tokens, NAME=value pairs) from the content metadata (e.g. LABEL or UUID fields). It has two main forms of operation: either searching for a device with a specific NAME=value pair or displaying NAME=value pairs for one or more devices.

### blkid usage ###

Simply running blkid without any argument will list all the available devices with their Universally Unique Identifier (UUID), the TYPE of the file-system and the LABEL if it's set.

    # blkid

![](http://blog.linoxide.com/wp-content/uploads/2014/10/blkid.jpg)

### Listing devices based on name or UUID ###

If you wish to have information displayed only for a specific device you can use the device name as an option after blkid to do so:

    # blkid /dev/sda1

Also if you know the UUID of a device but don't know the device name and wish to find it out you can use the 0-U option like this:

    # blkid -U d3b1dcc2-e3b0-45b0-b703-d6d0d360e524

![](http://blog.linoxide.com/wp-content/uploads/2014/10/blkid-uuid.jpg)

### Detailed information ###

If you wish to obtain mode detailed information you can use the -p and -o udev option to have it display in a nice format like this:

    # blkid -po udev /dev/sda1

![](http://blog.linoxide.com/wp-content/uploads/2014/10/blkid-po.jpg)

### Reset cache ###

Sometimes the device list might not be updated, if you think this is the case you can use the -g option that will perform a garbage collection pass on the blkid cache to remove devices which no longer exist.

    # blkid -g

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-command-lsblk-blkid/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:https://www.kernel.org/doc/Documentation/filesystems/sysfs.txt
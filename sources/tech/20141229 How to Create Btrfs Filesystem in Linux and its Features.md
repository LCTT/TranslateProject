Translating by GOLinux!
How to Create Btrfs Filesystem in Linux and its Features
================================================================================
**Btrfs** (B-tree file system) is a new CoW (copy-on-write) file system for Linux. It's development began at [Oracle Corporation][1] in 2007 and it was marked as stable in August 2014. The purpose of Btrfs is to address the lack of pooling, snapshots, checksums, and integral multi-device spanning in Linux file systems and its goal was to let Linux scale for the storage that will be available. Scaling is not just about addressing the storage but also means being able to administer and to manage it with a clean interface that lets people see what's being used and makes it more reliable.

You should note that Btrfs has just become stable so it is recommended to always use the latest available version of the kernel to avoid any problems or bugs.

### Btrfs Features ###

Among the most important features of the new file system:

- Extent based file storage
- 16 EiB maximum file size
- Space-efficient packing of small files and indexed directories
- Dynamic inode allocation
- Writable snapshots and read-only snapshots
- Subvolumes (separate internal filesystem roots)
- Checksums on data and metadata
- Compression (gzip and LZO)
- Integrated multiple device support
- File Striping, File Mirroring, and File Striping+Mirroring implementations
- Efficient incremental backup
- Background scrub process for finding and fixing errors on files with redundant copies
- Online filesystem defragmentation and Offline filesystem check
- Btrfs filesystem have much enhancement on RAID 5/ RAID 6 support and many [bug fixes has been added on linux 3.19][2]

You can [read about the new features][3] on this wiki article covering the subject.

### Converting to Btrfs ###

**WARNING: You should always backup your data before atempting to convert a file system. Although this operation is stable and safe it can lead to data loss and the only way to prevent this is to always have a backup of your data.**

Converting an existing ext4 filesystem to btrfs is quite simple and straightforward, you will first need to use fsck to check if there are any errors on your existing partition and then use the btrfs-convert command to convert it. If the partition you wish to convert is /dev/sda3 you can do it like this:

    # fsck.ext4 /dev/sda4
    # btrfs-convert /dev/sda4

You can then use the mount command to mount it where you wish.

![btrfs-convert](http://blog.linoxide.com/wp-content/uploads/2014/11/btrfs-convert.jpg)

### Converting the root partition ###

If you wish to convert the root partition of your system you will first have to boot a live CD, you can do this by using the Ubuntu installation CD and selecting "Try Ubuntu" from the first screen or use any other Live CD image available.

After you boot open a terminal and use it to convert the filesystem.

    # fsck.ext4 /dev/sda1
    # btrfs-convert /dev/sda1

Next chroot to the filesystem so you can change fstab and reinstall grub

    # mount /dev/sda1 /mnt
    # for i in dev dev/pts proc sys ; do mount --bind /$i /mnt/$i ; done
    # chroot /mnt
    # blkid | grep sda1

![btrfs-root-convert](http://blog.linoxide.com/wp-content/uploads/2014/11/btrfs-root-convert.jpg)

Now edit fstab and replace the current UUID of the / filesystem with the one blkid outputted and the filesystem type with btrfs, the new line should look like this:

    UUID=8e7e80aa-337e-4179-966d-d60128bd3714 / btrfs defaults 0 1

Then reinstall Grub:

    # grub-install /dev/sda
    # update-grub

You can now reboot the machine without using the boot CD and use it with the new filesystem.

--------------------------------------------------------------------------------

via: http://linoxide.com/file-system/create-btrfs-features/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://www.oracle.com/index.html
[2]:http://lkml.iu.edu/hypermail/linux/kernel/1412.1/03583.html
[3]:https://btrfs.wiki.kernel.org/index.php/Main_Page#Features

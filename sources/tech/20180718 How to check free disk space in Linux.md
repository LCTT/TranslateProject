How to check free disk space in Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

Keeping track of disk utilization information is on system administrators' (and others') daily to-do list. Linux has a few built-in utilities that help provide that information.

### df

The `df` command stands for "disk-free," and shows available and used disk space on the Linux system.

`df -h` shows disk space in human-readable format

`df -a` shows the file system's complete disk usage even if the Available field is 0
![](https://opensource.com/sites/default/files/uploads/df-ha.png)
`df -T` shows the disk usage along with each block's filesystem type (e.g., xfs, ext2, ext3, btrfs, etc.)

`df -i` shows used and free inodes
![](https://opensource.com/sites/default/files/uploads/df-ti.png)

### du

`du` shows the disk usage of files, folders, etc. in the default kilobyte size

`du -h` shows disk usage in human-readable format for all directories and subdirectories

`du -a` shows disk usage for all files

`du -s` provides total disk space used by a particular file or directory
![](https://opensource.com/sites/default/files/uploads/du-has.png)

The following commands will check your total space and your utilized space.

### ls -al

`ls -al` lists the entire contents, along with their size, of a particular directory
![](https://opensource.com/sites/default/files/uploads/ls-al.png)

### stat

`stat <file/directory> `displays the size and other stats of a file/directory or a filesystem.
![](https://opensource.com/sites/default/files/uploads/stat.png)

### fdisk -l

`fdisk -l` shows disk size along with disk partitioning information
![](https://opensource.com/sites/default/files/uploads/fdisk.png)

These are most of the built-in utilities for checking file space in Linux. There are many similar tools, like [Disks][1] (GUI), [Ncdu][2], etc., that also show disk space utilization. Do you have a favorite tool that's not on this list? Please share in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/how-check-free-disk-space-linux

作者：[Archit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[1]:https://wiki.gnome.org/Apps/Disks
[2]:https://dev.yorhel.nl/ncdu

Translating by GOLinux ...
Linux FAQs with Answers--How to expand an XFS file system
================================================================================
> **Question**: I have extra space in my disk, so I want to grow the size of an existing XFS file system created on it, in order to fully utilize the extra space. What is a proper way to expand an XFS file system? 

XFS is an open-source (GPL) journaling file system originally developed by Silicon Graphics. The suport for XFS file system is available on most Linux distros nowadays. In fact, XFS has become the default file system adopted by the latest CentOS/RHEL 7. One of its many features is "online resizing", where an existing XFS file system can be expanded while it is mounted. Support for shrinking an XFS file system is not available though.

To expand an existing XFS file system, you can use a command line utility called xfs_growfs, which is available by default on most Linux distros. Since XFS supports online resizing, the target file system can be mounted or unmounted.

Here is the basic usage of **xfs_growfs**:

![](https://farm6.staticflickr.com/5551/14915082088_b4e29af3cf_z.jpg)

As the destination XFS file system to expand, you can specify either a mountpoint, a disk partition, or logical volume (in case of LVM). You specify the size of a new XFS file system as the number of data blocks. You can use xfs_info command-line tool to check data block size and the number of data blocks:

![](https://farm6.staticflickr.com/5584/14915075270_cd272d4468_z.jpg)

To extend the size of an XFS file system to 1986208:

    $ sudo xfs_growfs /dev/centos/root -D 1986208

If you do not specify size with "-D" option, xfs_growfs will automatically expand an XFS file system to the largest possible size.

    $ sudo xfs_growfs /dev/centos/root

![](https://farm6.staticflickr.com/5569/14914950529_ddfb71c8dd_z.jpg)

Note that when you expand an existing XFS file system, you must prepare added space for the XFS file system to grow beforehand. It may be obvious, but if there is no free space available in the underlying partition or disk volume, xfs_growfs will not do anything. Also, if you attempt to extend XFS file system size beyond the size of disk partition or volume, xfs_growfs will fail.

![](https://farm4.staticflickr.com/3870/15101281542_98a49a7c3a_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/expand-xfs-file-system.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

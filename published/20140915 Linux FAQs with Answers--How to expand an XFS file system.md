Linux有问必答：如何扩展XFS文件系统
================================================================================
> **问题**：我的磁盘上有额外的空间，所以我想要扩展其上创建的现存的XFS文件系统，以完全使用额外空间。怎样才是扩展XFS文件系统的正确途径？

XFS是一个开源的（GPL）日志文件系统，最初由硅谷图形（SGI）开发，现在大多数的Linux发行版都支持。事实上，XFS已被最新的CentOS/RHEL 7采用，成为其默认的文件系统。在其众多的特性中，包含了“在线调整大小”这一特性，使得现存的XFS文件系统在已经挂载的情况下可以进行扩展。然而，对于XFS文件系统的**缩减**却还没有支持。

要扩展一个现存的XFS文件系统，你可以使用命令行工具xfs_growfs，这在大多数Linux发行版上都默认可用。由于XFS支持在线调整大小，目标文件系统可以挂在，也可以不挂载。

下面展示了**xfs_growfs**的基本用法：

![](https://farm6.staticflickr.com/5551/14915082088_b4e29af3cf_z.jpg)

作为目标XFS文件系统来扩展，你可以指定挂载点、磁盘分区或者逻辑卷（在使用LVM时），使用数据块数量来指定新的XFS文件系统的大小。你可以使用xfs_info命令行工具来检查数据块大小和数量：

![](https://farm6.staticflickr.com/5584/14915075270_cd272d4468_z.jpg)

要将XFS文件扩展到1986208：

    $ sudo xfs_growfs /dev/centos/root -D 1986208

如果你不使用“-D”选项来指定大小，xfs_growfs将会自动扩展XFS文件系统到最大的可用大小。

    $ sudo xfs_growfs /dev/centos/root

![](https://farm6.staticflickr.com/5569/14914950529_ddfb71c8dd_z.jpg)

注意，当你扩展一个现存的XFS文件系统时，必须准备好事先添加用于XFS文件系统扩展的空间。这虽然是很显然的事，但是如果在所在的分区或磁盘卷上没有空闲空间可用的话，xfs_growfs就没有办法了。同时，如果你尝试扩展XFS文件系统大小到超过磁盘分区或卷的大小，xfs_growfs将会失败。

![](https://farm4.staticflickr.com/3870/15101281542_98a49a7c3a_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/expand-xfs-file-system.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

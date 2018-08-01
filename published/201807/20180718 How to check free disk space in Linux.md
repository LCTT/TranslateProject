如何检查 Linux 中的可用磁盘空间
======

> 用这里列出的方便的工具来跟踪你的磁盘利用率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

跟踪磁盘利用率信息是系统管理员（和其他人）的日常待办事项列表之一。Linux 有一些内置的使用程序来帮助提供这些信息。

### df

`df` 命令意思是 “disk-free”，显示 Linux 系统上可用和已使用的磁盘空间。

`df -h` 以人类可读的格式显示磁盘空间。

`df -a` 显示文件系统的完整磁盘使用情况，即使 Available（可用） 字段为 0。

![](https://opensource.com/sites/default/files/uploads/df-ha.png)

`df -T` 显示磁盘使用情况以及每个块的文件系统类型（例如，xfs、ext2、ext3、btrfs 等）。

`df -i` 显示已使用和未使用的 inode。

![](https://opensource.com/sites/default/files/uploads/df-ti.png)

### du

`du` 显示文件，目录等的磁盘使用情况，默认情况下以 kb 为单位显示。

`du -h` 以人类可读的方式显示所有目录和子目录的磁盘使用情况。

`du -a` 显示所有文件的磁盘使用情况。

`du -s` 提供特定文件或目录使用的总磁盘空间。

![](https://opensource.com/sites/default/files/uploads/du-has.png)

### ls -al

`ls -al` 列出了特定目录的全部内容及大小。

![](https://opensource.com/sites/default/files/uploads/ls-al.png)

### stat

`stat <文件/目录> `显示文件/目录或文件系统的大小和其他统计信息。

![](https://opensource.com/sites/default/files/uploads/stat.png)

### fdisk -l

`fdisk -l` 显示磁盘大小以及磁盘分区信息。

![](https://opensource.com/sites/default/files/uploads/fdisk.png)

这些是用于检查 Linux 文件空间的大多数内置实用程序。有许多类似的工具，如 [Disks][1]（GUI 工具），[Ncdu][2] 等，它们也显示磁盘空间的利用率。你有你最喜欢的工具而它不在这个列表上吗？请在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/how-check-free-disk-space-linux

作者：[Archit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[1]:https://wiki.gnome.org/Apps/Disks
[2]:https://dev.yorhel.nl/ncdu

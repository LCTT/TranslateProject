Btrfs文件系统在Linux中的创建及其特性
================================================================================

**Btrfs**（B-tree file system，B-tree文件系统）是针对Linux开发的一个新的CoW（copy-on-write，写时复制）文件系统。它最初是由[甲骨文公司][1]在2007年着手开始开发的，并在2014年8月正式发布其稳定版。开发Btrfs的目的在于解决Linux文件系统中缺少池、快照、校验和以及集成的跨多设备访问等问题，目标在于实现Linux的规模化存储。规模化不仅仅是指解决存储问题，也意味着通过简洁的界面提供对存储的管控和管理能力，让大家能看到已使用的内容并使它更可靠。

你应该注意到，Btrfs才刚刚发布稳定版，所以强烈推荐你使用最新版的内核以避免可能出现的问题和漏洞。

### Btrfs特性 ###

新文件系统的最重要的特性有：

- 基于扩展的文件存储
- 文件大小上限16EiB
- 小文件和索引目录的高效空间利用
- 动态索引节点分配
- 支持快照可写和快照只读
- 子卷（分离内部文件系统的根） 
- 支持数据和元数据的校验和
- 压缩 （gzip和LZO）
- 整合的多设备支持
- 支持文件条块化、文件镜像和文件条块化+镜像三种部署方案
- 高效的增量备份
- 后台消除进程支持查找和修复冗余副本上的文件错误
- 支持在线文件系统碎片整理和离线文件系统检查
- Btrfs文件系统对RAID 5/RAID 6加强支持，[在linux 3.19中添加了许多漏洞修补][2]

你可以在此关于本主题的维基文章中[阅读关于新特性的内容][3]。

### 转换到Btrfs ###

**警告：在尝试转换文件系统前，请务必备份数据！虽然此操作很稳定，也很安全，但它仍然可能导致数据丢失，而防止此情况发生的唯一途径就是进行数据备份。**

将现存的ext4文件系统转换到btrfs是相当简单而易懂的。你首先需要使用fsck来检查你现存分区上是否存在错误，然后使用btrfs-convert命令进行转换。如果你想要对/dev/sda3分区进行转换，你可以进行以下操作：

    # fsck.ext4 /dev/sda4
    # btrfs-convert /dev/sda4

然后，你就可以使用mount命令将它挂载到你想要的任何位置。

![btrfs-convert](http://blog.linoxide.com/wp-content/uploads/2014/11/btrfs-convert.jpg)

### 转换根分区 ###

如果你想要对你系统上的根分区进行转换，你首先需要使用Live CD启动。对于Ubuntu，你可以使用Ubuntu安装盘来完成此操作，在启动后第一个屏幕选择“尝试Ubuntu”。对于其它系统，你同样可以使用Live CD镜像，操作类似。

在启动后，打开终端，使用下面的命令来转换文件系统。

    # fsck.ext4 /dev/sda1
    # btrfs-convert /dev/sda1

接下来，chroot到文件系统，这样你就可以修改fstab并重新安装grub了。

    # mount /dev/sda1 /mnt
    # for i in dev dev/pts proc sys ; do mount --bind /$i /mnt/$i ; done
    # chroot /mnt
    # blkid | grep sda1

![btrfs-root-convert](http://blog.linoxide.com/wp-content/uploads/2014/11/btrfs-root-convert.jpg)

现在来编辑fstab，并根据blkid输出的结果来修改当前“/”文件系统的UUID，并将它的文件系统类型修改为btrfs，修改后的行如下：

    UUID=8e7e80aa-337e-4179-966d-d60128bd3714 / btrfs defaults 0 1

然后，重新安装Grub：

    # grub-install /dev/sda
    # update-grub

现在，你可以把启动光盘丢到一边了，重启机器后，你就可以使用新的文件系统了。

--------------------------------------------------------------------------------

via: http://linoxide.com/file-system/create-btrfs-features/

作者：[Adrian Dinu][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://www.oracle.com/index.html
[2]:http://lkml.iu.edu/hypermail/linux/kernel/1412.1/03583.html
[3]:https://btrfs.wiki.kernel.org/index.php/Main_Page#Features

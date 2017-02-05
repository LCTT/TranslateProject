在 Linux 中使用 SSD（固态驱动器）：启用 TRIM
============================================================

 ![Solid state drives in Linux: Enabling TRIM for SSDs](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUSINESS_robots.png?itok=6eqf2Wjv "Solid state drives in Linux: Enabling TRIM for SSDs") 

图片提供： opensource.com

当我在运行 Linux 的计算机上安装我的第一块固态驱动器（SSD）后，我开始探索如何用好它们。SSD 在操作方式上与传统磁性驱动器不同，并且它们需要在软件上另行处理以达到功能优化。

在传统磁盘驱动器上，删除时所删除的文件不会从磁盘中完全删除。这就是为什么你可以恢复已删除的文件的原因。基本上，文件系统仅引用磁盘上文件的位置，并且当文件被删除时，该引用被擦除，以允许你在这些空间中写入新数据覆盖原来的数据。然而，对于 SSD，新数据只能写在驱动器上完全新的或已擦除的单元上。因为必须在写入之前清除空间，如果在写入文件时尚未有足够的可用空间，则必须首先擦除该空间。这可能会对性能产生负面影响。

如果操作系统在写入新数据之前就擦除了未使用的空间，而不是在写入时同时进行擦除，则可以提高文件保存性能。这种做法就是 [TRIM][1]。 TRIM 命令本质上允许你的操作系统告诉驱动器哪些区域的数据不再使用，以便擦除它们，加快驱动器将来的写入，可以 SSD 的用户提供更佳的体验。

在 Linux 中，`fstrim` 提供此功能，它可以为写入新数据而准备驱动器，并延长驱动器的使用寿命。由于在我使用的 Linux 发行版上 SSD 的 trim 不是自动的，所以必须去调度该操作，否则 SSD 的性能会随着时间的推移而降低。

为了在驱动器上运行 `fstrim`，驱动器本身以及其上的文件系统必须支持 TRIM。在文件系统挂载过程中可以启用 TRIM。例如，为了将设备 `/dev/sda2` 启用 TRIM 挂载到 `/mnt`，你要运行：

```
mount -t ext4 -o discard /dev/sda2 /mnt
```

一旦启用，TRIM 过程本身就相当简单。TRIM SSD 也可以在命令行或 cron 任务中手动完成。作为超级用户（使用 `su` 或 `sudo`），运行 `fstrim / -v` 以完成手动 trim，或者设置 cron 任务以在计算机未使用时定期为你运行此命令。对于 `fstrim` 的完整选项列表请参考它的 [man 手册][3]。

硬件支持根据使用的驱动器接口类型如 PCI、[ATA][4]、[SCSI][5] 还是 [SD/MMC][6] 而有所不同。你需要咨询你的 Linux 供应商以了解你的特定发行版是如何支持 TRIM 的。

例如，红帽提供以下 [SSD 磁盘指南][7]。“性能随着所使用的块数接近磁盘容量而降低，性能影响程度因供应商而异，但是所有设备都会遇到一些性能降低。为了解决性能降低问题，主机系统（例如 Linux 内核）使用丢弃请求以通知存储器给定范围的块不再使用。”

[Debian wiki][8] 提供了 SSD 使用的一些基本注意事项：使用 Linux 3.2 或更高版本内核，使用 SSD 的最新固件，使用 EXT4 文件系统，并且“在正常工作负载下有足够的 DRAM 用来操作而不用使用交换空间“。

--------------------------------------------------------------------------------

作者简介：

Don Watkins - 教育家、教育技术专家、企业家、开源倡导者。教育心理学硕士、教育领导硕士、Linux 系统管理员、CCNA、使用 Virtual Box 虚拟化。关注我 @Don_Watkins。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/solid-state-drives-linux-enabling-trim-ssds

作者：[Don Watkins][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://en.wikipedia.org/wiki/Trim_(computing)
[2]:https://opensource.com/article/17/1/solid-state-drives-linux-enabling-trim-ssds?rate=7ZBblixmfl2icbl8HWXjIfzUr3-EUjlgkOGyEhI1DK8
[3]:http://man7.org/linux/man-pages/man8/fstrim.8.html
[4]:https://en.wikipedia.org/wiki/Trim_(computing)#ATA
[5]:https://en.wikipedia.org/wiki/Trim_(computing)#SCSI
[6]:https://en.wikipedia.org/wiki/Trim_(computing)#SD.2FMMC
[7]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administration_Guide/ch-ssd.html
[8]:https://wiki.debian.org/SSDOptimization
[9]:https://opensource.com/user/15542/feed
[10]:https://opensource.com/article/17/1/solid-state-drives-linux-enabling-trim-ssds#comments
[11]:https://opensource.com/users/don-watkins

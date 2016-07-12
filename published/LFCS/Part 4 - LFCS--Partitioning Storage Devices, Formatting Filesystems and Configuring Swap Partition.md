LFCS 系列第四讲：对存储设备分区、格式化文件系统和配置交换分区
================================================================================

去年八月份，Linux 基金会发起了 LFCS（Linux Foundation Certified Sysadmin，Linux 基金会认证系统管理员）认证，给所有系统管理员一个展现自己的机会。通过基础考试后，他们可以胜任在 Linux 上的整体运维工作：包括系统支持、一流水平的诊断和监控以及在必要之时向其他支持团队提交帮助请求等。

![Linux Foundation Certified Sysadmin – Part 4](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-4.png)

*LFCS 系列第四讲*

需要注意的是，Linux 基金会认证是非常严格的，通过与否完全要看个人能力。通过在线链接，你可以随时随地参加 Linux 基金会认证考试。所以，你再也不用到考试中心了，只需要不断提高自己的专业技能和经验就可去参加考试了。

请看一下视频，这里将讲解 Linux 基金会认证程序。

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

本讲是系列教程中的第四讲。在本讲中，我们将涵盖对存储设备进行分区、格式化文件系统和配置交换分区等内容，这些都是 LFCS 认证中的必备知识。

### 对存储设备分区 ###

分区是一种将单独的硬盘分成一个或多个区的手段。一个分区只是硬盘的一部分，我们可以认为这部分是独立的磁盘，里边包含一个单一类型的文件系统。分区表则是将硬盘上这些分区与分区标识符联系起来的索引。

在 Linux 上，IBM PC 兼容系统里边用于管理传统 MBR（用到2009年）分区的工具是 fdisk。对于 GPT（2010年至今）分区，我们使用 gdisk。这两个工具都可以通过程序名后面加上设备名称（如 /dev/sdb）进行调用。

#### 使用 fdisk 管理 MBR 分区 ####

我们先来介绍 fdisk：
 
    # fdisk /dev/sdb

然后出现提示说进行下一步操作。若不确定如何操作，按下 “m” 键显示帮助。

![fdisk Help Menu](http://www.tecmint.com/wp-content/uploads/2014/10/fdisk-help.png)

*fdisk 帮助菜单*

上图中，使用频率最高的选项已高亮显示。你可以随时按下 “p” 显示分区表。

![Check Partition Table in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Show-Partition-Table.png)

*显示分区表*

Id 列显示由 fdisk 分配给每个分区的分区类型（分区 id）。一个分区类型代表一种文件系统的标识符，简单来说，包括该分区上数据的访问方法。

请注意，每个分区类型的全面讲解将超出了本教程的范围——本系列教材主要专注于 LFCS 测试，以考试为主。

**下面列出一些 fdisk 常用选项：**

按下 “l”（小写 L）选项来显示所有可以由 fdisk 管理的分区类型。

按下 “d” 可以删除现有的分区。若硬盘上有多个分区，fdisk 将询问你要删除那个分区。

键入对应的数字，并按下 “w” 保存更改（将更改写入分区表）。

在下图的命令中，我们将删除 /dev/sdb2，然后显示（p）分区表来验证更改。

![fdisk Command Options](http://www.tecmint.com/wp-content/uploads/2014/10/fdisk-options.png)

*fdisk 命令选项*

按下 “n” 后接着按下 “p” 会创建新一个主分区。最后，你可以使用所有的默认值（这将占用所有的可用空间），或者像下面一样自定义分区大小。

![Create New Partition in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Create-New-Partition.png)

*创建新分区*

若 fdisk 分配的分区 Id 并不是我们想用的，可以按下 “t” 来更改。

![Change Partition Name in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Change-Partition-Name.png)

*更改分区类型*

全部设置好分区后，按下 “w” 将更改保存到硬盘分区表上。

![Save Partition Changes](http://www.tecmint.com/wp-content/uploads/2014/10/Save-Partition-Changes.png)

*保存分区更改*

#### 使用 gdisk 管理 GPT 分区 ####

下面的例子中，我们使用 /dev/sdb。

    # gdisk /dev/sdb

必须注意的是，gdisk 可以用于创建 MBR 和 GPT 两种分区表。

![Create GPT Partitions in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Create-GPT-Partitions.png)

*创建 GPT 分区*

使用 GPT 分区方案，我们可以在同一个硬盘上创建最多 128 个分区，单个分区最大以 PB 为单位，而 MBR 分区方案最大的只能 2TB。

注意，fdisk 与 gdisk 中大多数命令都是一样的。因此，我们不会详细介绍这些命令选项，而是给出一张使用过程中的截图。

![gdisk Command Options](http://www.tecmint.com/wp-content/uploads/2014/10/gdisk-options.png)

*gdisk 命令选项*

### 格式化文件系统 ###

一旦创建完需要的分区，我们就必须为分区创建文件系统。查询你所用系统支持的文件系统，请运行：

    # ls /sbin/mk*

![Check Filesystems Type in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Check-Filesystems.png)

*检查文件系统类型*

选择文件系统取决于你的需求。你应该考虑到每个文件系统的优缺点以及其特点。选择文件系统需要看的两个重要属性：

- 日志支持，允许从系统崩溃事件中快速恢复数据。
- 安全增强式 Linux（SELinux）支持，按照项目 wiki 所说，“安全增强式 Linux 允许用户和管理员更好的控制访问控制权限”。

在接下来的例子中，我们通过 mkfs 在 /dev/sdb1 上创建 ext4 文件系统（支持日志和 SELinux），标卷为 Tecmint。mkfs 基本语法如下：

    # mkfs -t [filesystem] -L [label] device
    或者
    # mkfs.[filesystem] -L [label] device

![Create ext4 Filesystems in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystems.png)

*创建 ext4 文件系统*

### 创建并启用交换分区 ###

要让 Linux 系统访问虚拟内存，则必须有一个交换分区，当内存（RAM）用完的时候，将硬盘中指定分区（即 Swap 分区）当做内存来使用。因此，当有足够的系统内存（RAM）来满足系统的所有的需求时，我们并不需要划分交换分区。尽管如此，是否使用交换分区取决于管理员。

下面列出选择交换分区大小的经验法则：

> 物理内存不高于 2GB 时，取两倍物理内存大小即可；物理内存在 2GB 以上时，取一倍物理内存大小即可；并且所取大小应该大于 32MB。

所以，如果：

M为物理内存大小，S 为交换分区大小，单位 GB，那么：

    若 M < 2
    	S = M *2
    否则
    	S = M + 2

记住，这只是基本的经验。对于作为系统管理员的你，才是决定是否使用交换分区及其大小的关键。

要配置交换分区，首先要划分一个常规分区，大小像我们之前演示的那样来选取。然后添加以下条目到 /etc/fstab 文件中（其中的 X 要更改为对应的 b 或 c）。

    /dev/sdX1 swap swap sw 0 0

最后，格式化并启用交换分区：

    # mkswap /dev/sdX1
    # swapon -v /dev/sdX1

显示交换分区的快照：

    # cat /proc/swaps

关闭交换分区：

    # swapoff /dev/sdX1

下面的例子，我们会使用 fdisk 将 /dev/sdc1（512MB，系统和内存为 256MB）来设置交换分区，下面是我们之前详细提过的步骤。注意，这种情况下我们使用的是指定大小分区。

![Create-Swap-Partition in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Create-Swap-Partition.png)

*创建交换分区*

![Add Swap Partition in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Enable-Swap-Partition.png)

*启用交换分区*

### 结论 ###

在你的系统管理员之路上，创建分区（包括交换分区）和格式化文件系统是非常重要的一步。我希望本文中所给出的技巧指导你到达你的管理员目标。随时在本讲评论区中发表你的技巧和想法，一起为社区做贡献。

参考链接

- [About the LFCS][1]
- [Why get a Linux Foundation Certification?][2]
- [Register for the LFCS exam][3]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-partitions-and-filesystems-in-linux/

作者：[Gabriel Cánepa][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://training.linuxfoundation.org/certification/LFCS
[2]:https://training.linuxfoundation.org/certification/why-certify-with-us
[3]:https://identity.linuxfoundation.org/user?destination=pid/1

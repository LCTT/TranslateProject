Linux有问必答-如何创建和挂载XFS文件系统
================================================================================
> **问题**: 我听说一个牛X的文件系统XFS，打算在我的磁盘上试试XFS。那格式化和挂载XFS文件系统的Linux命令是什么呢？

[XFS][1]是高性能文件系统，SGI为他们的IRIX平台而设计。自从2001年移植到Linux内核上，由于它的[高性能][2]，XFS成为了许多企业级系统的首选，特别是有大量数据，需要结构化伸缩性和稳定性的。例如，RHEL/CentOS 7 和Oracle Linux将XFS作为默认文件系统，SUSE/openSUSE已经为XFS做了长期支持。

XFS有许多独特的性能提升功能使他从众多文件系统中脱颖而出，像可伸缩/并行 IO，元数据日志，热碎片整理，IO 暂停/恢复，延迟分配等。

如果你想要创建和挂载XFS文件系统到你的Linux平台，下面是相关的操作命令。

### 安装 XFS系统工具集 ###

首先，你需要安装XFS系统工具集，这样允许你执行许多XFS相关的管理任务。（例如：格式化，[扩展][3]，修复，设置配额，改变参数等）

Debian, Ubuntu , Linux Mint系统：

    $ sudo apt-get install xfsprogs 

Fedora, CentOS, RHEL系统:

    $ sudo yum install xfsprogs 

其他版本Linux:

    $ sudo pacman -S xfsprogs 

### 创建 XFS格式分区 ###

先准备一个分区来创建XFS。假设你的分区在/dev/sdb,如下：

    $ sudo fdisk /dev/sdb 

![](https://farm6.staticflickr.com/5604/15474273555_1c0c4be527_b.jpg)

假设此创建的分区叫/dev/sdb1。

接下来，格式化分区为XFS，使用mkfs.xfs命令。如果已有其他文件系统创建在此分区，必须加上"-f"参数来覆盖它。

    $ sudo mkfs.xfs -f /dev/sdb1 

![](https://farm4.staticflickr.com/3930/15287704767_fe5ded8ea1_b.jpg)

至此你已经准备好格式化后分区来挂载。假设/storage是XFS本地挂载点。使用下述命令挂载：

    $ sudo mount -t xfs /dev/sdb1 /storage 

验证XFS挂载是否成功：

    $ df -Th /storage 

![](https://farm4.staticflickr.com/3938/15474273445_aeacdca6eb_o.png)

如果你想要启动时自动挂载XFS分区在/storage上，加入下列行到/etc/fstab：

    /dev/sdb1  /storage xfs  defaults  0  0

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/create-mount-xfs-file-system-linux.html

译者：[Vic___/VicYu](http://www.vicyul.net/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xfs.org/
[2]:http://lwn.net/Articles/476263/
[3]:http://ask.xmodulo.com/expand-xfs-file-system.html

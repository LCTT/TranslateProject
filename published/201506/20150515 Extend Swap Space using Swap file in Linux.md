在linux上使用交换文件扩展交换空间
================================================================================
想像一种情景，当我们的Linux系统用尽交换空间时，在这种情况下，我们想要使用swap分区扩展交换空间，但在某些情况下磁盘上已经没有可用的空闲分区了，致使我们不能把它扩大。

因此，在这种情况下，我们可以使用交换文件增加swap空间。

### 以下是使用交换文件在Linux上扩展swap空间的方法 ###

让我们首先检查现有的交换空间/分区的大小，使用命令 ‘**free -m‘** 或者 ‘**swapon -s**‘

![](http://www.linuxtechi.com/wp-content/uploads/2015/06/free-output-with-swap.jpg)
free-output-with-swap

我的交换分区大小是2 GB，我们将把交换空间扩展1GB。

#### 第一步：使用下面的dd命令创建大小为1GB交换文件 ####

    [root@linuxtechi ~]# dd if=/dev/zero of=/swap_file bs=1G count=1
    1+0 records in
    1+0 records out
    1073741824 bytes (1.1 GB) copied, 414.898 s, 2.6 MB/s
    [root@linuxtechi ~]#

根据你的需要替换 ‘**bs**‘ 和 ‘**count**‘ 的大小.

#### 第二步：设置交换文件权限为600 ####

    [root@linuxtechi ~]# chmod 600 /swap_file

#### 第三步：用文件开启交换区（swap_file）####

用mkswap命令开启交换区

    [root@linuxtechi ~]# mkswap /swap_file
    Setting up swapspace version 1, size = 1048572 KiB
    no label, UUID=f7b3ae59-c09a-4dc2-ba4d-c02abb7db33b
    [root@linuxtechi ~]#

#### 第四步：在fstab文件中添加交换文件条目 ####

在fstab文件中添加以下条目，以便交换文件每次重启后互能继续使用.

    /swap_file  swap  swap  defaults  0 0

![swap-file-fstab-entry](http://www.linuxtechi.com/wp-content/uploads/2015/06/swap-file-fstab-entry.jpg)

#### 第五步：用命令 ‘mkswap on’ 启用交换文件. ####

    [root@linuxtechi ~]# swapon /swap_file
    [root@linuxtechi ~]#

#### 第六步：现在查看交换空间 ####

![swap-space-after-extension](http://www.linuxtechi.com/wp-content/uploads/2015/06/swap-space-after-extension.jpg)

**Note**: 为了避免出现意外的情况，如下所示使用swapoff命令关闭它，仅在需要使用时，使用步骤5所示的swapon命令，重新启用交换文件。

    [root@linuxtechi ~]# swapoff /swap_file
    [root@linuxtechi ~]#

请分享您的宝贵意见或者评论此文章。

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/extend-swap-space-using-swap-file-in-linux/

作者：[Pradeep Kumar][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/

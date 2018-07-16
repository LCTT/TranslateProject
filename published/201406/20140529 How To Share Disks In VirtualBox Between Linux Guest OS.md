如何在VirtualBox中的Linux客户机系统间共享磁盘
================================================================================
在本教程中，让我来给你们展示一下如何在VirtualBox中的两个Linux客户机系统间共享一个磁盘。

本教程对于那些想配置一下并玩玩GFS或者集群的人来说还是很有帮助的。

下图是VirtualBox的标准界面：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102225.png)

第一个客户系统机CentOS1：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102252.png)

第二个客户机系统CentOS2：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102314.png)

给第一台机器添加额外的磁盘：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102459.png)

点击文件->虚拟介质管理器（Control+D）打开虚拟介质管理器界面：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102657.png)

设置磁盘为可共享（Shareable）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102719.png)

在客户机CentOS 2上，你可以添加现有磁盘，该磁盘在CentOS1客户机系统之前已经创建好：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/v2014-05-28_113908.png)

完成后，你可以重启第二个客户机系统，并检查驱动器是否已经添加：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_111903.png)

大功告成。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/share-disks-virtualbox-linux-guest-os/

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

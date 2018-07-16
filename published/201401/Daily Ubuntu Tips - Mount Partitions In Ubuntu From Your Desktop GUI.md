Ubuntu 每日小贴士 - 在Ubuntu下用桌面图形界面挂载分区
================================================================================

如果在之前你询问过经验丰富的 Linux 用户如何在 Ubuntu 下挂载磁盘分区，他们可能会告诉你使用在 **/etc** 目录里的fstab文件。这似乎是 Linux 系统包括 Ubuntu 挂载分区的唯一方式。

呵呵，幸亏有了[GNOME Disk Utility][1]，让挂载分区变得更加多样化。使用这个磁盘工具，你就可以在图形界面下轻松的挂载分区，不需要再在命令行下修改 fstab 文件。fstab 文件是一个用来列出可用磁盘和分区的 Linux 文件，同时指示出他们的挂载情况。

mount 命令查找 fstab 文件中的配置，它决定了设备挂载的方式和位置。这只能通过系统管理员或 root 来修改。

这个简短的教程将会展示给你如何在 Ubuntu 下轻松的挂载分区，在不主动修改 fstab 文件的前提下。对于新手和那些刚开始使用 Ubuntu 的用户，他们会发现这个方法易于挂载额外的分区和设备。

虽然有一些工具也许能帮助你构建 fstab 文件，但是在 Ubuntu 下很少有像这个磁盘工具那么高效的。

如果你在 Ubuntu 下打开了fstab 文件， 你会看到类似下面的内容。

    #<File System>  <Mount Point>    <type>   <options>  <dump>  <pass>
    /dev/fd0      /media/floppy0    vfat    rw,user,noauto    0   0       


上列只是 Ubuntu 分区挂载的一个样例。每一个设备都有它自己的文件类型和挂载点。对于刚接触 Ubuntu 的用户，可能会感到生畏。

对于经验丰富的 Linux 用户来说，管理 fstab 并不困难。如果你已经做过一次了，那么下次会更加的轻松。

所以，接下来动手吧。在 fstab 文件中添加一个条目或挂载一个分区，打开 Unity Dash 搜索**Disk app**并打开。当程序打开后，选择你想要挂载和格式化的驱动器。在格式完后，选择**选项 -> 编辑挂载选项**。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/mountguiubuntu.png)

最后，关闭自动挂载选项并手动指定你的挂载选项。磁盘会自动的将这些选项写入到 fstab 文件中，这样 mount 命令才可以读取挂载的分区。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/mountguiubuntu1.png)

保存你的设置并重启，或用 mount 命令挂载分区。

上面的选项在 fstab 文件中会像这样显示。

    /dev/sdb /media/richard/ExtPartition ntfs-3g rw,auto,user,fmask=0111,dmask=0000 0 0

好了，这些就是今天全部内容！每当你启动你的机子是新分区将会自动挂载上。

Enjoy!

好好享受吧！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-mount-partitions-in-ubuntu-from-your-desktop-gui/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://wiki.gnome.org/Design/Apps/Disks

Ubuntu 一天一课 － 合上笔记本，系统不睡眠
================================================================================
Ubuntu 是一个处在牛 A 和牛 C 之间的现代操作系统，全世界数百万人和公司都在使用它。无论是充当工作台还是高级工程机器（译者表示不知道 advanced engineering machines 是个什么东西），Ubuntu 都游刃有余。

如果你是 Ubuntu 初学者，使用过程还需要高手指导，那就关注本博客吧。我们已经写了数百 Ubuntu 教程，足以带你入门。从安装 Ubuntu 到系统基本设置，我们都有涉猎。

这篇简单的教程为你介绍当笔记本盖子合上时该干嘛还是干嘛，而不是进入睡眠模式或者直接关机。

很多现代操作系统（包括 Windows）会在笔记本合上时进入睡眠状态。Ubuntu 也是这样做的。如果你想让你的笔记本盖子合上时不睡眠，就跟着我们学习吧。

要达到这个目的，Ubuntu 有两种方法。第一种是打开 **System Settings –> Power**（中文版是打开 **系统设置 -> 电源**），然后进行设置。一些用户设置后不会生效。

另一个方法是直接编辑 Login Manager 的配置文件（**logind.conf**）。这个方法基本能生效，你最好用这个。

要开始了，按下 **Ctrl – Alt – T** 组合键，打开终端。然后运行下面的命令打开 logind.conf 文件。你的所有修改都在这个文件内。

    sudo gedit /etc/systemd/logind.conf

打开文件后修改下面这行：

    #HandleLidSwitch=suspend

改成这副德行：

    HandleLidSwitch=ignore

保存文件，重启 Login Manager 服务：

    sudo restart systemd-logind

工作完成！

配置文件的 “ignore” 值告诉 Ubuntu 当笔记本合上后不要睡眠或挂起。不要动其它设置然后保存文件。

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/photo.jpg)

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/12/daily-ubuntu-tips-do-nothing-when-laptop-lid-is-closed/

译者：[bazz2](https://github.com/bazz2) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出 

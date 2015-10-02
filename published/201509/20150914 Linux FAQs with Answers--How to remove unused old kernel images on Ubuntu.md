Linux有问必答：如何删除Ubuntu上不再使用的旧内核
================================================================================
> **提问**：过去我已经在我的Ubuntu上升级了几次内核。现在我想要删除这些旧的内核镜像来节省我的磁盘空间。如何用最简单的方法删除Ubuntu上先前版本的内核？

在Ubuntu上，有几个方法来升级内核。在Ubuntu桌面中，软件更新允许你每天检查并更新到最新的内核上。在Ubuntu服务器上，最为重要的安全更新项目之一就是 unattended-upgrades 软件包会自动更新内核。然而，你也可以手动用apt-get或者aptitude命令来更新。

随着时间的流逝，持续的内核更新会在系统中积聚大量的不再使用的内核，浪费你的磁盘空间。每个内核镜像和其相关联的模块/头文件会占用200-400MB的磁盘空间，因此由不再使用的内核而浪费的磁盘空间会快速地增加。

![](https://farm1.staticflickr.com/636/21352725115_29ae7aab5f_c.jpg)

GRUB管理器为每个旧内核都维护了一个GRUB入口，以备你想要使用它们。

![](https://farm6.staticflickr.com/5803/21164866468_07760fc23c_z.jpg)

作为磁盘清理的一部分，如果你不再使用这些，你可以考虑清理掉这些镜像。

### 如何清理旧内核镜像 ###

在删除旧内核之前，记住最好留有2个最近的内核（最新的和上一个版本），以防主要的版本出错。现在就让我们看看如何在Ubuntu上清理旧内核。

在Ubuntu内核镜像包含了以下的包。

- **linux-image-<VERSION-NUMBER>**: 内核镜像
- **linux-image-extra-<VERSION-NUMBER>**: 额外的内核模块
- **linux-headers-<VERSION-NUMBER>**: 内核头文件

首先检查系统中安装的内核镜像。

    $ dpkg --list | grep linux-image
    $ dpkg --list | grep linux-headers

在列出的内核镜像中，你可以移除一个特定的版本（比如3.19.0-15）。

    $ sudo apt-get purge linux-image-3.19.0-15
    $ sudo apt-get purge linux-headers-3.19.0-15

上面的命令会删除内核镜像和它相关联的内核模块和头文件。

注意如果你还没有升级内核那么删除旧内核会自动触发安装新内核。这样在删除旧内核之后，GRUB配置会自动升级来移除GRUB菜单中相关GRUB入口。

如果你有很多没用的内核，你可以用shell表达式来一次性地删除多个内核。注意这个括号表达式只在bash或者兼容的shell中才有效。

    $ sudo apt-get purge linux-image-3.19.0-{18,20,21,25}
    $ sudo apt-get purge linux-headers-3.19.0-{18,20,21,25}

![](https://farm6.staticflickr.com/5619/21352725355_39cc4fc2d0_c.jpg)

上面的命令会删除4个内核镜像：3.19.0-18、3.19.0-20、3.19.0-21 和 3.19.0-25。

如果GRUB配置由于任何原因在删除旧内核后没有正确升级，你可以尝试手动用update-grub2命令来更新配置。

    $ sudo update-grub2

现在就重启来验证GRUB菜单是否已经正确清理了。

![](https://farm1.staticflickr.com/593/20731623163_cccfeac854_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/remove-kernel-images-ubuntu.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni

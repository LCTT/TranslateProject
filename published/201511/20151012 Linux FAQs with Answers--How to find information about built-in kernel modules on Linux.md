Linux有问必答：如何找出Linux中内置模块的信息
================================================================================
> **提问**：我想要知道Linux系统中内核内置的模块，以及每个模块有哪些参数。有什么方法可以得到内置模块和设备驱动的列表，以及它们的详细信息呢？

现代Linux内核正在随着时间变化而迅速增长，以支持大量的硬件、文件系统和网络功能。在此期间，“可加载模块（loadable kernel modules，[LKM]）”的引入防止内核变得越来越臃肿，以及在不同的环境中灵活地扩展功能及硬件支持，而不必重新构建内核。

最新的Linux发行版的内核只带了相对较小的“内置模块（built-in modules）”，其余的特定硬件驱动或者自定义功能作为“可加载模块”来让你选择地加载或卸载。

内置模块被静态地编译进了内核。不像可加载内核模块可以动态地使用`modprobe`、`insmod`、`rmmod`、`modinfo`或者`lsmod`等命令地加载、卸载、查询模块，内置的模块总是在启动时就加载进了内核，不会被这些命令管理。

### 找出内置模块列表 ###

要得到内置模块列表，运行下面的命令。

    $ cat /lib/modules/$(uname -r)/modules.builtin 

![](https://farm1.staticflickr.com/697/21481933835_ef6b9c71e1_c.jpg)

你也可以用下面的命令来查看有哪些内置模块：

![](https://farm6.staticflickr.com/5643/21295025949_57f5849c36_c.jpg)

### 找出内置模块参数 ###

每个内核模块无论是内置的还是可加载的都有一系列的参数。对于可加载模块，`modinfo`命令可以显示它们的参数信息。然而这个命令对内置模块没有用。你会得到下面的错误。

    modinfo: ERROR: Module XXXXXX not found.

如果你想要查看内置模块的参数，以及它们的值，你可以在 **/sys/module** 下检查它们的内容。

在 /sys/module目录下，你可以找到内核模块（包含内置和可加载的）命名的子目录。进入每个模块目录，这里有个“parameters”目录，列出了这个模块所有的参数。

比如你要找出tcp_cubic（内核默认的TCP实现）模块的参数。你可以这么做：

    $ ls /sys/module/tcp_cubic/parameters 

接着阅读这个文件查看每个参数的值。

    $ cat /sys/module/tcp_cubic/parameters/tcp_friendliness 

![](https://farm6.staticflickr.com/5639/21293886250_a199b9c8f7_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/find-information-builtin-kernel-modules-linux.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni

Linux有问必答：如何在Debian或Ubuntu上安装完整的内核源码
================================================================================
> **问题**:我需要为我的Debian或Ubuntu下载并安装完整树结构的内核源码以供编译一个定制的内核。那么在Debian或Ubuntu上有什么可行的方法来下载完整的内核源码呢？

在给你的Linux安装完整内核源码之前，先问问自己是否真的需要这样做。如果你仅仅是尝试去编译一个内核模块或是为内核定制驱动，你并不需要完整的内核源码树。你只需要安装[一些与内核对应的头文件][1],这样就足够了。

只有在你需要生成一个定制的内核，而且内核源码中的一些内核默认设置要被你调整了的情况下，你才需要完整的内核源码树。

这里将会解答如何**在Debian或Ubuntu的库中下载并安装完整树结构的内核源码**。你可以在[https://www.kernel.org/pub/linux/kernel/][2]下载官方的内核源码，不过使用发行版软件仓库可以允许你下载包含补丁的内核源码。

### 在Debian上安装完整的内核源码 ###

在下载内核源码之前，先安装dpkg-dev，其中包含你在Debian上生成源代码时需要的开发工具套件。不仅如此，dpkg-dev中还包含在用来解压Debian源码包并自动打补丁的工具dpgk-source。

    $ sudo apt-get install dpkg-dev 

然后，运行以下命令下载完整的内核源码。

    $ apt-get source linux-image-$(uname -r) 

伴随着完整内核源码（linux_X.X.XX.orig.tar.xz）的还有一些可用的内核补丁（linux_X.X.X+XXX.debian.tar.xz）和源码控制文件（linux_XXXX.dsc），这些都将被下载并存储到当前目录。在.dsc文件中会指出如何给内核源码打补丁。

当下载完成，以上的命令将会自动调用工具dpkg-source将下载的内核源码解压到当前的目录中，与此同时根据.dsc文件来下补丁。

最终完整的内核源码树将会以"linux-X.X.XX"的形式呈现在当前目录中。

![](https://farm9.staticflickr.com/8676/16341110300_b4f059eeb0_b.jpg)

### 在Ubuntu上安装完整内核源码 ###

如果你想安装完整内核源码的话，以上在Debian上的那一套做法在Ubuntu上仍然奏效。

在Ubuntu上还有另一套方法安装完整内核源码。事实上，你可以查一下由Canonical为Ubuntu不同发行版维护的内核源码树。

    $ sudo apt-get install git
    $ git clone git://kernel.ubuntu.com/ubuntu/ubuntu-$(lsb_release --codename | cut -f2).git

举个例子，如果你使用的是Ubuntu 14.04，以上的命令将会查看Git的"ubuntu-trusty"仓库中的代码。

![](https://farm9.staticflickr.com/8642/16526856391_de636ff9b8_c.jpg)

一旦在你对Git仓库的查询结束后，使用以下的命令来安装用来访问生成内核源码树所需依赖的重要开发包。

    $ sudo apt-get build-dep linux-image-$(uname -r) 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-full-kernel-source-debian-ubuntu.html

作者：[Dan Nanni][a]
译者：[martin qi](https://github.com/martin2011qi)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/install-kernel-headers-linux.html
[2]:https://www.kernel.org/pub/linux/kernel/

Linux有问必答：如何检查Linux上的glibc版本
================================================================================
> **问题**：我需要找出我的Linux系统上的GNU C库（glibc）的版本，我怎样才能检查Linux上的glibc版本呢？

GNU C库（glibc）是标准C库的GNU实现。glibc是GNU工具链的关键组件，用于和二进制工具和编译器一起使用，为目标架构生成用户空间应用程序。

当从源码进行构建时，一些Linux程序可能需要链接到某个特定版本的glibc。在这种情况下，你可能想要检查已安装的glibc信息以查看是否满足依赖关系。

这里介绍几种简单的方法，方便你检查Linux上的glibc版本。

### 方法一 ###

下面给出了命令行下检查GNU C库的简单命令。

    $ ldd --version 

![](https://farm6.staticflickr.com/5613/15631104658_940163834a_z.jpg)

在本例中，**glibc**版本是**2.19**。

### 方法二 ###

另一个方法是在命令行“输入”**glibc 库的名称**（如，libc.so.6），就像命令一样执行。

输出结果会显示更多关于**glibc库**的详细信息，包括glibc的版本以及使用的GNU编译器，也提供了glibc扩展的信息。glibc变量的位置取决于Linux版本和处理器架构。

在基于Debian的64位系统上：

    $ /lib/x86_64-linux-gnu/libc.so.6

在基于Debian的32位系统上：

    $ /lib/i386-linux-gnu/libc.so.6

在基于Red Hat的64位系统上：

    $ /lib64/libc.so.6

在基于Red Hat的32位系统上：

    $ /lib/libc.so.6

下图中是输入glibc库后的输出结果样例。

![](https://farm8.staticflickr.com/7516/15631334667_ef50b247a4_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-glibc-version-linux.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

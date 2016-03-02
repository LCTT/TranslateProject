DFileManager：封面流（CoverFlow）文件管理器
================================================================================

这个一个 Ubuntu 标准软件仓库中缺失的像宝石般的、有着其独特的功能的文件管理器。这是 DFileManager 在推特中的宣称。

有一个不好回答的问题，如何知道到底有多少个 Linux 的开源软件？好奇的话，你可以在 Shell 里输入如下命令：

    ~$ for f in /var/lib/apt/lists/*Packages; do printf '%5d %s\n' $(grep '^Package: ' "$f" | wc -l) ${f##*/} done | sort -rn

在我的 Ubuntu 15.04 系统上，产生结果如下：

![Ubuntu 15.04 Packages](http://www.linuxlinks.com/portal/content/reviews/FileManagers/UbuntuPackages.png)

正如上面的截图所示，在 Universe  仓库中，大约有39000个包，在 main 仓库中大约有8500个包。这听起来很多。但是这些包括了开源应用、工具、库，有很多不是由 Ubuntu 开发者打包的。更重要的是，有很多重要的软件不在库中，只能通过源代码编译。DFileManager 就是这样一个软件。它是仍处在开发早期的一个基于 QT 的跨平台文件管理器。QT提供单一源码下的跨平台可移植性。

现在还没有二进制文件包，用户需要编译源代码才行。对于一些工具来说，这个可能会产生很大的问题，特别是如果这个应用依赖于某个复杂的依赖库，或者需要与已经安装在系统中的软件不兼容的某个版本。

### 安装 ###

幸运的是，DFileManager 非常容易编译。对于我的老 Ubutnu 机器来说，在开发者网站上的安装介绍提供了大部分的重要步骤，不过少量的基础包没有列出（为什么总是这样？虽然许多库会让文件系统变得一团糟！）。在我的系统上，从github 下载源代码并且编译这个软件，我在 Shell 里输入了以下命令：

    ~$ sudo apt-get install qt5-default qt5-qmake libqt5x11extras5-dev
    ~$ git clone git://git.code.sf.net/p/dfilemanager/code dfilemanager-code
    ~$ cd dfilemananger-code
    ~$ mkdir build
    ~$ cd build
    ~$ cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    ~$ make
    ~$ sudo make install

你可以通过在shell中输入如下命令来启动它：

    ~$ dfm

下面是运行中的 DFileManager，完全展示了其最吸引人的地方：封面流（Cover Flow）视图。可以在当前文件夹的项目间滑动，提供了一个相当有吸引力的体验。这是看图片的理想选择。这个文件管理器酷似 Finder（苹果操作系统下的默认文件管理器)，可能会吸引你。

![DFileManager in action](http://www.linuxlinks.com/portal/content/reviews/FileManagers/Screenshot-dfm.png)

### 特点: ###

- 4种视图：图标、详情、列视图和封面流
- 按位置和设备归类书签
- 标签页
- 简单的搜索和过滤
- 自定义文件类型的缩略图，包括多媒体文件
- 信息栏可以移走
- 单击打开文件和目录
- 可以排队 IO 操作
- 记住每个文件夹的视图属性
- 显示隐藏文件

DFileManager 不是 KDE 的 Dolphin 的替代品，但是能做相同的事情。这个是一个真正能够帮助人们的浏览文件的文件管理器。还有，别忘了反馈信息给开发者，任何人都可以做出这样的贡献。

--------------------------------------------------------------------------------

via: http://gofk.tumblr.com/post/131014089537/dfilemanager-cover-flow-file-manager-a-real-gem

作者：[gofk][a]
译者：[bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://gofk.tumblr.com/

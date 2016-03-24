DFileManager:文件流文件管理器
================================================================================
一个像宝石一样的文件管理器从Ubuntu标准库中缺失，但是有器自己的独特的特色。DFileManager是一个推特一样的产品

一个很棘手的问题是，如何知道有多少个Linux开源软件可以被使用。出于好奇，你可以在Shell里输入如下命令

    ~$ for f in /var/lib/apt/lists/*Packages; do printf ’%5d %s\n’ $(grep ’^Package: ’ “$f” | wc -l) ${f##*/} done | sort -rn

在我的Ubuntu15.04系统上，会产生如下结果
![Ubuntu 15.04 Packages](http://www.linuxlinks.com/portal/content/reviews/FileManagers/UbuntuPackages.png)

正如上面的截图所示，在所有的库中，大约有39000个包，在主库中有8500个包。这听起来很少.但是这些自助形式的开源软件、组件、支持库有很多不是由Ubuntu开发者打包的。重要的是，有很多重要的组件不在库中，只能通过源代码编译。DFileManager就是这样一个组件。他是仍处在早期阶段的一个QT跨平台文件管理器.QT提供单一源码的跨平台可移植性。

在缺失二进制文件的包里，用户需要编译源代码。对于一些工具来说，这个可能会产生很大的问题，特别是如果这个应用依赖于任何一个含糊不清的依赖库，或者某个没有被编译在系统中的特殊软件版本。
### 安装 ###

幸运的是，DFileManager非常容易编译。对于我的老Ubutnu来说，这个在开发者网站上的安装介绍提供了大部分的重要步骤，不过，少量的基础包没有在上面（为什么总是这样？虽然支持库会让文件系统变得一团糟！）。在我的系统上，为了做好准备，从github上下载源代码并且编译这个软件，我在Shell里输入了以下命令：

    ~$ sudo apt-get install qt5-default qt5-qmake libqt5x11extras5-dev
    ~$ git clone git://git.code.sf.net/p/dfilemanager/code dfilemanager-code
    ~$ cd dfilemananger-code
    ~$ mkdir build
    ~$ cd build
    ~$ cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    ~$ make
    ~$ sudo make install

你可以通过在shell中输入如下命令来启动它

    ~$ dfm

下面是在最吸引人的操作界面下操作的DFileManager，文件流视图.这提供了一个拥有相当有吸引力的体验的滑动当前文件夹下的文件的能力。这是看图片的理想选择。这个文件管理器酷似Finder(Macintosh 操作系统下的默认文件管理器)，可能会对你有吸引力。

![DFileManager in action](http://www.linuxlinks.com/portal/content/reviews/FileManagers/Screenshot-dfm.png)

### 特点: ###

- 4种视图：图标、详请、列和文件流
- 通过位置和设备归类书签
- 标签页
- 简单的搜索和过滤
- 自定义文件类型的缩略图，包括多媒体文件
- 可以移动的信息栏
- 单击打开文件和目录
- 控制队列IO操作
- 记住每个文件夹的视图属性
- 显示隐藏文件

DFileManager 不是KDE 的Dolphin,但是能做相同的事情。这个是一个真正能够帮助人们的浏览文件的文件管理器。还有，别忘了反馈信息给开发者，任何人都可以做出这样的贡献

--------------------------------------------------------------------------------

via: http://gofk.tumblr.com/post/131014089537/dfilemanager-cover-flow-file-manager-a-real-gem

作者：[gofk][a]
译者：[bestony](https://github.com/bestony)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://gofk.tumblr.com/

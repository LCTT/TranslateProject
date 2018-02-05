ttyload：在终端中用彩色显示 Linux 的平均负载
============================================================

ttyload 是一个轻量级的实用程序，它为 Linux 和其他类 Unix 系统上提供随着时间变化的彩色平均负载。它实现了在终端中（“tty”）图形化跟踪系统的平均负载。

它已知可以在诸如 Linux、IRIX、Solaris、FreeBSD、MacOS X (Darwin) 和 Isilon OneFS 等系统上运行。它被设计为可以容易地移植到其他平台，但这也带来了一些艰苦的工作。

它的一些值得注意功能是：它使用标准的硬编码 ANSI 转义序列进行屏幕显示和着色。如果你想要在一个没有什么负载压力的系统中查看工作的情况，它甚至还自带了一个相对独立（默认不会安装，甚至不会构建）的负载炸弹。

**建议阅读：**[GoTTY：把你的 Linux 终端放到浏览器里面][1]

在本篇中，我们会向你展示如何在 Linux 安装及使用 ttyload，以在终端中用彩色图形查看系统的平均负载。

### 如何在 Linux 中安装 ttyload

在基于 Debian/Ubuntu 的发行版中，你可以输入下面的 [apt 命令][2]来从默认的系统仓库中安装 ttyload。

```
$ sudo apt-get install ttyload
```

在其他发行版中，你可以如下从 ttyload 的源码安装。

```
$ git clone https://github.com/lindes/ttyload.git
$ cd ttyload
$ make
$ ./ttyload
$ sudo make install
```

安装完成后，你可以输入下面的命令启动。

```
$ ttyload
```

[![ttyload - Graphical View of Linux Load Average](https://www.tecmint.com/wp-content/uploads/2017/05/ttyload-Graphical-View-of-Linux-Load-Average-.png)][3] 

*ttyload - 图形浏览 Linux 的平均负载*

注意：要关闭程序，只需按下 `Ctrl+C` 键。

你也可以定义两次刷新之间间隔的秒数。默认是 4 秒，最小是 1 秒。

```
$ ttyload -i 5
$ ttyload -i 1
```

要以单色模式运行，即它会关闭 ANSI 转义，如下使用 `-m`：

```
$ ttyload -m
```

[![ttyload - Monochrome Mode](https://www.tecmint.com/wp-content/uploads/2017/05/ttyload-monochrome-mode.png)][4] 

*ttyload – 单色模式*

要获取 ttyload 的使用信息以及帮助，输入：

```
$ ttyload -h 
```

下面是一些尚不支持的重要功能：

*   支持任意大小调整。
*   使用相同的基本引擎制作 X 前端，“3xload”。
*   面向日志的模式。

要获得更多信息，访问 ttyload 的主页：[http://www.daveltd.com/src/util/ttyload/][5]

就是这样了！在本文中，我们向你展示了如何在 Linux 中安装及使用 ttyload。通过下面的评论栏给我们回馈。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S 的爱好者，即将推出的 Linux SysAdmin 网络开发人员，目前也是 TecMint 的内容创作者，他喜欢和电脑一起工作，并且坚信共享知识。


-------------------

via: https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://linux.cn/article-8445-1.html
[2]:https://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[3]:https://www.tecmint.com/wp-content/uploads/2017/05/ttyload-Graphical-View-of-Linux-Load-Average-.png
[4]:https://www.tecmint.com/wp-content/uploads/2017/05/ttyload-monochrome-mode.png
[5]:http://www.daveltd.com/src/util/ttyload/
[6]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#
[7]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#
[8]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#
[9]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#
[10]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#comments
[11]:https://www.tecmint.com/author/aaronkili/
[12]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[13]:https://www.tecmint.com/free-linux-shell-scripting-books/

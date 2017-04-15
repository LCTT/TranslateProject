如何在 Linux 中安装最新的 Python 3.6 版本
============================================================

在这篇文章中，我将展示如何在 CentOS/RHEL 7、Debian 以及它的衍生版本比如 Ubuntu（最新的 Ubuntu 16.04 LTS 版本已经安装了最新的 Python 版本）或 Linux Mint 上安装和使用 Python 3.x 。我们的重点是安装可用于命令行的核心语言工具。

然后，我们也会阐述如何安装 Python IDLE － 一个基于 GUI 的工具，它允许我们运行 Python 代码和创建独立函数。

### 在 Linux 中安装 Python 3.6

在我写这篇文章的时候（2017 年三月中旬），在 CentOS 和 Debian 8 中可用的最新 Python 版本分别是 Python 3.4 和 Python 3.5 。

虽然我们可以使用 [yum][1] 和 [aptitude][2]（或 [apt-get][3]）安装核心安装包以及它们的依赖，但在这儿，我将阐述如何使用源代码进行安装。

为什么？理由很简单：这样我们能够获取语言的最新的稳定发行版（3.6），并且提供了一种和 Linux 版本无关的安装方法。

在 CentOS 7 中安装 Python 之前，请确保系统中已经有了所有必要的开发依赖：

```
# yum -y groupinstall development
# yum -y install zlib-devel
```

在 Debian 中，我们需要安装 gcc、make 和 zlib 压缩/解压缩库：

```
# aptitude -y install gcc make zlib1g-dev
```

运行下面的命令来安装 Python 3.6：

```
# wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tar.xz
# tar xJf Python-3.6.0.tar.xz
# cd Python-3.6.0
# ./configure
# make && make install
```

现在，放松一下，或者饿的话去吃个三明治，因为这可能需要花费一些时间。安装完成以后，使用 `which` 命令来查看主要二进制代码的位置：

```
# which python3
# python3 -V
```

上面的命令的输出应该和这相似：

[
 ![Check Python Version in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Python-Version-in-Linux.png) 
][4]

*查看 Linux 系统中的 Python 版本*

要退出 Python 提示符，只需输入：

```
quit()
或
exit()
```

然后按回车键。

恭喜！Python 3.6 已经安装在你的系统上了。

### 在 Linux 中安装 Python IDLE

Python IDLE 是一个基于 GUI 的 Python 工具。如果你想安装 Python IDLE，请安装叫做 idle（Debian）或 python-tools（CentOS）的包：

```
# apt-get install idle       [On Debian]
# yum install python-tools   [On CentOS]
```

输入下面的命令启动 Python IDLE：

```
# idle
```

### 总结

在这篇文章中，我们阐述了如何从源代码安装最新的 Python 稳定版本。

最后但不是不重要，如果你之前使用 Python 2，那么你可能需要看一下 [从 Python 2 迁移到 Python 3 的官方文档][5]。这是一个可以读入 Python 2 代码，然后转化为有效的 Python 3 代码的程序。

你有任何关于这篇文章的问题或想法吗？请使用下面的评论栏与我们联系

--------------------------------------------------------------------------------

作者简介：

Gabriel Cánepa - 一位来自阿根廷圣路易斯梅塞德斯镇 (Villa Mercedes, San Luis, Argentina) 的 GNU/Linux 系统管理员，Web 开发者。就职于一家世界领先级的消费品公司，乐于在每天的工作中能使用 FOSS 工具来提高生产力。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-python-in-linux/

作者：[Gabriel Cánepa][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/linux-package-management/
[3]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Python-Version-in-Linux.png
[5]:https://docs.python.org/3.6/library/2to3.html

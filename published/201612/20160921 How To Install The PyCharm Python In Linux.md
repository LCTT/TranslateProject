如何在 Linux 下安装 PyCharm
============================================

![](https://fthmb.tqn.com/ju1u-Ju56vYnXabPbsVRyopd72Q=/768x0/filters:no_upscale()/about/pycharmstart-57e2cb405f9b586c351a4cf7.png)

### 简介

Linux 经常被看成是一个远离外部世界，只有极客才会使用的操作系统，但是这是不准确的，如果你想开发软件，那么 Linux 能够为你提供一个非常棒的开发环境。

刚开始学习编程的新手们经常会问这样一个问题：应该使用哪种语言？当涉及到 Linux 系统的时候，通常的选择是 C、C++、Python、Java、PHP、Perl 和 Ruby On Rails。

Linux 系统的许多核心程序都是用 C 语言写的，但是如果离开 Linux 系统的世界， C 语言就不如其它语言比如 Java 和 Python 那么常用。

对于学习编程的人来说， Python 和 Java 都是不错的选择，因为它们是跨平台的，因此，你在 Linux 系统上写的程序在 Windows 系统和 Mac 系统上也能够很好的工作。

虽然你可以使用任何编辑器来开发 Python 程序，但是如果你使用一个同时包含编辑器和调试器的优秀的集成开发环境（IDE）来进行开发，那么你的编程生涯将会变得更加轻松。

PyCharm 是由 Jetbrains 公司开发的一个跨平台编辑器。如果你之前是在 Windows 环境下进行开发，那么你会立刻认出 Jetbrains 公司，它就是那个开发了 Resharper 的公司。 Resharper 是一个用于重构代码的优秀产品，它能够指出代码可能存在的问题，自动添加声明，比如当你在使用一个类的时候它会自动为你导入。

这篇文章将讨论如何在 Linux 系统上获取、安装和运行 PyCharm 。

### 如何获取 PyCharm

你可以通过访问[https://www.jetbrains.com/pycharm/][1]获取 PyCharm 。

屏幕中央有一个很大的 'Download' 按钮。

你可以选择下载专业版或者社区版。如果你刚刚接触 Python 编程那么推荐下载社区版。然而，如果你打算发展到专业化的编程，那么专业版的一些优秀特性是不容忽视的。

### 如何安装 PyCharm

下载好的文件的名称可能类似这种样子 ‘pycharm-professional-2016.2.3.tar.gz’。

以 “tar.gz” 结尾的文件是被 [gzip][2] 工具压缩过的，并且把文件夹用 [tar][3] 工具归档到了一起。你可以阅读关于[提取 tar.gz 文件][4]指南的更多信息。

加快速度，为了解压文件，你需要做的是首先打开终端，然后通过下面的命令进入下载文件所在的文件夹：

```
cd ~/Downloads
```

现在，通过运行下面的命令找到你下载的文件的名字：

```
ls pycharm*
```

然后运行下面的命令解压文件：

```
tar -xvzf pycharm-professional-2016.2.3.tar.gz -C ~
```

记得把上面命令中的文件名替换成通过 `ls` 命令获知的 pycharm 文件名。（也就是你下载的文件的名字）。上面的命令将会把 PyCharm 软件安装在 `home` 目录中。

### 如何运行 PyCharm

要运行 PyCharm， 首先需要进入 `home` 目录：

```
cd ~
```

运行 `ls` 命令查找文件夹名：

```
ls
```

查找到文件名以后，运行下面的命令进入 PyCharm 目录：

```
cd pycharm-2016.2.3/bin
```

最后，通过运行下面的命令来运行 PyCharm：

```
sh pycharm.sh &
```

如果你是在一个桌面环境比如 GNOME 、 KDE 、 Unity 、 Cinnamon 或者其他现代桌面环境上运行，你也可以通过桌面环境的菜单或者快捷方式来找到 PyCharm 。

### 总结

现在， PyCharm 已经安装好了，你可以开始使用它来开发一个桌面应用、 web 应用和各种工具。

如果你想学习如何使用 Python 编程，那么这里有很好的[学习资源][5]值得一看。里面的文章更多的是关于 Linux 学习，但也有一些资源比如 Pluralsight 和 Udemy 提供了关于 Python 学习的一些很好的教程。

如果想了解 PyCharm 的更多特性，请点击[这儿][6]来查看。它覆盖了从创建项目到描述用户界面、调试以及代码重构的全部内容。

-----------------------------------------------------------------------------------------------------------

via: https://www.lifewire.com/how-to-install-the-pycharm-python-ide-in-linux-4091033

作者：[Gary Newell][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[oska874](https://github.com/oska874)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.lifewire.com/gary-newell-2180098
[1]:https://www.jetbrains.com/pycharm/
[2]:https://www.lifewire.com/example-uses-of-the-linux-gzip-command-4078675
[3]:https://www.lifewire.com/uses-of-linux-command-tar-2201086
[4]:https://www.lifewire.com/extract-tar-gz-files-2202057
[5]:https://www.lifewire.com/learn-linux-in-structured-manner-4061368
[6]:https://www.lifewire.com/pycharm-the-best-linux-python-ide-4091045
[7]:https://fthmb.tqn.com/ju1u-Ju56vYnXabPbsVRyopd72Q=/768x0/filters:no_upscale()/about/pycharmstart-57e2cb405f9b586c351a4cf7.png

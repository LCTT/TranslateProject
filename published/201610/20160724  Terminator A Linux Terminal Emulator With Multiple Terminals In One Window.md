Terminator：一款一个窗口包含多个终端的 Linux 终端仿真器
=============================================================================

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/lots-of-terminals-in-terminator_1.jpg?659)

为了通过命令行和系统互动，每一款 Linux 发行版都有一款默认的终端仿真器。但是，默认的终端应用可能不适合你。为了大幅提升你工作的速度，有好多款终端应用提供了更多的功能，可以同时执行更多的任务。这些有用的终端仿真器就包括 Terminator，这是一款 Linux 系统下支持多窗口的自由开源的终端仿真器。

### 什么是 Linux 终端仿真器

Linux 终端仿真器是一个让你和 shell 交互的程序。所有的 Linux 发行版都会自带一款 Linux 终端应用让你向 shell 传递命令。

### Terminator，一款自由开源的 Linux 终端应用

Terminator 是一款 Linux 终端模拟器，提供了你的默认的终端应用不支持的多个特性。它提供了在一个窗口创建多个终端的功能，以加快你的工作速度。除了多窗口外，它也允许你修改其它特性，例如字体、字体颜色、背景色等等。让我们看看我们如何安装它，并且如何在不同的 Linux 发行版下使用 Terminator。

### 如何在 Linux 下安装 Terminator？

#### 在基于 Ubuntu 的发行版上安装 Terminator

Terminator 在默认的 Ubuntu 仓库就可以使用。所以你不需要添加额外的 PPA。只需要使用 APT 或者“软件应用”在 Ubuntu 下直接安装。

```
sudo apt-get install terminator
```

假如你的默认的仓库中 Terminator 不可用，只需要使用源码编译 Terminator 即可。

- [下载源码][1]

下载 Terminator 源码并且解压到你的桌面。现在打开你的默认的终端，然后 `cd` 到解压的目录。

现在就可以使用下面的命令来安装 Terminator 了：

```
sudo ./setup.py install
```

#### 在 Fedora 及衍生的操作系统上安装 Terminator

```
dnf install terminator
```

#### 在 OpenSuse 上安装 Terminator

参见此文：[在 OPENSUSE 上安装][2]。

### 如何在一个窗口使用多个终端？

安装好 Terminator 之后，你可以简单的在一个窗口打开多个终端。只需要右键点击并切分。

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/multiple-terminals-in-terminator_orig.jpg)

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/multiple-terminals-in-terminator-emulator.jpg?697)

只要你愿意，你可以创建尽可能多的终端，只要你能管理得过来。

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/lots-of-terminals-in-terminator.jpg?706)

### 定制终端 

右键点击终端，并单击属性。现在你可以定制字体、字体颜色、标题颜色和背景，还有终端字体颜色和背景。

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/customize-terminator-interface.jpg?702)

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/free-terminal-emulator_orig.jpg)

### 结论：什么是你最喜欢的终端模拟器

Terminator 是一款先进的终端模拟器，它可以让你自定义界面。如果你还没有从你默认的终端模拟器中切换过来的话，你可以尝试一下它。我知道你将会喜欢上它。如果你正在使用其他的自由开源的终端模拟器的话，请让我们知道你最喜欢的那一款。不要忘了和你的朋友分享这篇文章。或许你的朋友正在寻找类似的东西。

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/terminator-a-linux-terminal-emulator-with-multiple-terminals-in-one-window

作者：[author][a]
译者：[yangmingming](https://github.com/yangmingming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxandubuntu.com/home/terminator-a-linux-terminal-emulator-with-multiple-terminals-in-one-window
[1]: https://launchpad.net/terminator/+download
[2]: http://software.opensuse.org/download.html?project=home%3AKorbi123&package=terminator

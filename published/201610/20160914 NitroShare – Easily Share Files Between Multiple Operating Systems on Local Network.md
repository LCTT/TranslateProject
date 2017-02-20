NitroShare：内网多操作系统间快捷文件共享工具
====

网络的最重要用途之一就是实现文件共享的目的。现在，虽然有多种方式可以让在同一网络中的 Linux 和 Windows 以及 MacOS X 用户之间共享文件，但这篇文章，我们只打算介绍 Nitroshare。这是一款跨平台、开源以及易于使用的应用软件，可以在本地网络（内网）中共享文件。

Nitroshare 大大简化了本地网络的文件共享操作，一旦安装上，它就会与操作系统无缝集成。Ubuntu 系统中，从应用程序显示面板中可以简单的打开，在 Windows 系统中，在系统托盘中可以找到它。

此外，在装有 Nirtroshare 的机器上，它会自动检测在同一网段的其它安装了它的设备，用户只需选择好需要传输到的设备，就可以直接向其传输文件。

Nitroshare 的特性如下：

- 跨平台，即可以运行于 Linux， Windows 和 MacOS X 系统
- 设置容易，无需配置
- 易于使用
- 支持在本地网络上自动发现运行着 Nitroshare 设备的能力
- 安全性上支持可选的 TLS (Transport Layer Security，传输层安全协议) 编码传输方式
- 支持网络高速传输功能
- 支持文件和目录（Windows 上的文件夹）传输
- 支持对发送文件、连接设备等这些的桌面通知功能

最新版本的 Nitroshare 是使用 Qt5 开发的，它做了一些重大的改进，例如：  

- 用户界面焕然一新
- 简化设备发现过程
- 移除不同版本传输文件大小的限制
- 为了使用方便，已经去除配置向导

### Linux 系统中安装 Nitroshare

NitroShare 可运行于各种各样的现代 Linux 发行版和桌面环境。

#### Debian Sid 和 Ubuntu 16.04+

NitroShare 已经包含在 Debian 和 Ubuntu 的软件源仓库中，所以可以很容易的就安装上，使用如下命令：

```
$ sudo apt-get install nitroshare
```

但安装的版本可能已经过期了。要安装最新的版本的话，可按照如下的命令添加最新的 PPA。

```
$ sudo apt-add-repository ppa:george-edison55/nitroshare
$ sudo apt-get update
$ sudo apt-get install nitroshare
```

#### Fedora 24-23

最近，NitroShare 已经包含在 Fedora 源仓库中了，可以按如下命令安装：

```
$ sudo dnf install nitroshare
```

#### Arch Linux

在 Arch Linux 系统中，NitroShare 包在 AUR 上已经可用了，可以用如下命令来构建/安装：

```
# wget https://aur.archlinux.org/cgit/aur.git/snapshot/nitroshare.tar.gz
# tar xf nitroshare.tar.gz
# cd nitroshare
# makepkg -sri
```

### Linux 中使用 NitroShare

注意：如我前面所述，在本地网络中，您想要共享文件的其它机器设备都需要安装上 Nitroshare 并运行起来。

在成功安装后，在系统 dash 面板里或系统菜单里搜索 Nitroshare，然后启动。Nitroshare 非常容易使用，你可从该应用或托盘图标上找到“发送文件”、“发送目录”、“查看传输”等选项。

![](http://www.tecmint.com/wp-content/uploads/2016/09/NitroShare-Send-Files.png)

选择文件后，点击“打开”继续选择目标设备，如下图所示。如果在本地网络有设备正的运行 Nitroshare 的话，选择相应的设备然后点击“确定”。

![](http://www.tecmint.com/wp-content/uploads/2016/09/NitroShare-Local-Devices.png)

![](http://www.tecmint.com/wp-content/uploads/2016/09/NitroShare-File-Transfer-Progress.png)

如果需要，在 NitroShare 的配置 -- 通用标签页里，您可以增加设备的名字，设置默认文件下载位置，在高级设置里您能设置端口、缓存、超时时间等等。

主页：<https://nitroshare.net/index.html>

这就是所要介绍的，如果您有关于 Nitroshare 的任何问题，可以在下面的评论区给我们分享。您也可以给我们提供一些建议，告诉一些可能我们不知道的很不错的跨平台文件共享应用程序。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/nitroshare-share-files-between-linux-ubuntu-windows/

作者：[Aaron Kili][a]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/

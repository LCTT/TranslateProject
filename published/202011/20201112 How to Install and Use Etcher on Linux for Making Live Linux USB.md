[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12847-1.html)
[#]: subject: (How to Install and Use Etcher on Linux for Making Live Linux USB)
[#]: via: (https://itsfoss.com/install-etcher-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

如何在 Linux 上安装和使用 Etcher 来制作 Linux 临场 USB
======

![](https://img.linux.net.cn/data/attachment/album/202011/21/214209xor9upp7jznd9djd.jpg)

> Etcher 是一款流行的 USB 烧录应用，可用于创建可启动的 Linux USB。让我来告诉你如何安装它，以及如何使用它来制作一个 Linux 临场盘。

### Etcher：一个用于在 SD 卡和 USB 驱动器中烧录 Linux ISO 的开源工具

Etcher 是一个由 [Balena][1] 开发的开源项目，来用于为树莓派烧录 SD 卡。事实上，我们在[如何在 SD 卡上安装 Raspbian OS][2] 的教程中就使用了它。

它不仅仅局限于 SD 卡，你还可以使用 Etcher 来[制作一个可启动的 USB 驱动器][3]，我们就通过它的帮助在 Linux 中制作了一个 [Manjaro 的临场 USB][4]。

自首次发布以来，Etcher 就以其整洁的界面和简单的使用方式引起了人们的注意。

![][5]

在本文中，我将重点介绍帮助你在 Linux 上安装 Etcher 的步骤。然后，我还将展示如何使用它。在这之前，让我先给大家介绍一下它的功能。

### Etcher 的功能

  * 在烧录前验证驱动器
  * 漂亮的用户界面
  * 自动检测 USB 驱动器/SD 卡，防止电脑上的硬盘被擦除。
  * 跨平台支持（Windows、macOS 和 Linux）。
  * 快速烧录
  * 简单的三步过程

理论上，你已经有了在 SD 卡和 USB 驱动器上烧录操作系统镜像所需的一切。同样令人激动的是，根据他们的[路线图][6]，他们计划增加对多个设备的同步写入支持。

### 在 Linux 上安装 Etcher

要开始使用，你需要从它的官方网站上下载它提供的 AppImage 文件（适用于任何 Linux 发行版）。

你只需要前往它的[主页][7]，并根据你的系统（32 位/64 位）下载一个程序：

![][8]

在我的例子中，我下载了 Ubuntu 的 64 位 AppImage 文件。你可以通过我们的指南来了解[在 Linux 上使用 AppImage文件][9]，但我会让你先知道下一步需要做什么。

你需要给文件执行权限，你可以右击**AppImage 文件 -> 属性**来实现。

![][10]

接下来，点击权限选项卡下的“**允许作为程序执行**”，如下图所示。

![][11]

现在，只需双击 AppImage 文件即可启动 Etcher!

这应该可以在任何 Linux 发行版上运行。在任何情况下，如果你想从源码构建或者直接使用 .rpm 或 .deb 文件安装，你也可以前往它的 [Github 发布页][12]找到 RPM、DEB 和源码。

你也可以参考我们的[在 Ubuntu 中使用 deb 文件][13]来安装应用。

> 注意！
> 
> 我们注意到，当你使用 Etcher 创建 Linux 发行版的临场 USB 时，它会使 USB 处于明显的不可使用状态，即它只有几 MB 的空闲空间，并且不能直接格式化。在 Linux 上，你可以[使用磁盘工具手动删除分区，然后格式化它][14]。

### 在 Linux 上使用 Etcher

只需三步就可以开始使用 Etcher。在你启动它之后，根据屏幕上的提示应该是清晰的，但为了给你一个好的开始，以下是你要做的事情：

**步骤 1：** 选择合适的 ISO 镜像文件或你需要烧录的文件的 URL（如下图所示）。

![][15]

**步骤 2：** 接下来，你需要选择目标设备。它会自动检测并高亮显示可移动设备，以防止你选择任何内部存储位置。

![][16]

在这里，我连接了一个 USB 驱动器，我也选择了它（如下图所示）。

![][17]

**步骤 3：** 现在，你所有需要做的就是烧录镜像并等待它成功完成。

![][18]

这是进度的样子：

![][19]

完成了!

![][20]

- [下载 balenaEtcher][7]

### 总结

Etcher 是一个有用的工具，可以为 SD 卡和 USB 驱动器烧录操作系统镜像。我倾向于主要使用它来创建临场 USB 驱动器来测试 Linux 发行版，我对它很满意。

你更喜欢用什么来创建可启动驱动器？你是否已经尝试过 Etcher？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-etcher-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.balena.io/
[2]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[3]: https://itsfoss.com/create-bootable-ubuntu-usb-drive-mac-os/
[4]: https://itsfoss.com/create-live-usb-manjaro-linux/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/etcher-mxlinux-2.png?resize=800%2C518&ssl=1
[6]: https://github.com/balena-io/etcher/milestones
[7]: https://www.balena.io/etcher
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-official-site-download.png?resize=800%2C580&ssl=1
[9]: https://itsfoss.com/use-appimage-linux/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/balena-etcher-permission.jpg?resize=800%2C378&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/balena-etcher-execute.jpg?resize=800%2C445&ssl=1
[12]: https://github.com/balena-io/etcher/releases/tag/v1.5.109
[13]: https://itsfoss.com/install-deb-files-ubuntu/
[14]: https://itsfoss.com/cant-format-usb-disk/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/balena-etcher-select.jpg?resize=800%2C521&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-select-target.jpg?resize=800%2C509&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-target-device.jpg?resize=800%2C521&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-flash.jpg?resize=800%2C516&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-flashing.jpg?resize=800%2C510&ssl=1
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-flash-complete.jpg?resize=800%2C507&ssl=1

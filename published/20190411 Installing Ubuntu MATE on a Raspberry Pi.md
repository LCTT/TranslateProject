[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10817-1.html)
[#]: subject: (Installing Ubuntu MATE on a Raspberry Pi)
[#]: via: (https://itsfoss.com/ubuntu-mate-raspberry-pi/)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

在树莓派上安装 Ubuntu MATE
=================================

> 简介: 这篇快速指南告诉你如何在树莓派设备上安装 Ubuntu MATE。

[树莓派][1] 是目前最流行的单板机并且是创客首选的板子。[Raspbian][2] 是基于 Debian 的树莓派官方操作系统。它是轻量级的，内置了教育工具和能在大部分场景下完成工作的工具。

[安装 Raspbian][3] 安装同样简单，但是与 [Debian][4] 随同带来的问题是慢的升级周期和旧的软件包。

在树莓派上运行 Ubuntu 可以给你带来一个更丰富的体验和最新的软件。当在你的树莓派上运行 Ubuntu 时我们有几个选择。

  1. [Ubuntu MATE][5] ：Ubuntu MATE 是仅有的原生支持树莓派且包含一个完整的桌面环境的发行版。
  2. [Ubuntu Server 18.04][6] + 手动安装一个桌面环境。
  3. 使用 [Ubuntu Pi Flavor Maker][7] 社区构建的镜像，这些镜像只支持树莓派 2B 和 3B 的变种，并且**不能**更新到最新的 LTS 发布版。

第一个选择安装是最简单和快速的，而第二个选择给了你自由选择安装桌面环境的机会。我推荐选择前两个中的任一个。

这里是一些磁盘镜像下载链接。在这篇文章里我只会提及 Ubuntu MATE 的安装。

### 在树莓派上安装 Ubuntu MATE

去 Ubuntu MATE 的下载页面获取推荐的镜像。

![][8]

试验性的 ARM64 版本只应在你需要在树莓派服务器上运行像 MongoDB 这样的 64 位应用时使用。

- [下载为树莓派准备的 Ubuntu MATE][9]

#### 第 1 步：设置 SD 卡

镜像文件一旦下载完成后需要解压。你可以简单的右击来提取它。

也可以使用下面命令做同样的事。

```
xz -d ubuntu-mate***.img.xz
```

如果你在 Windows 上你可以使用 [7-zip][10] 替代。

安装 [Balena Etcher][11]，我们将使用这个工具将镜像写入 SD 卡。确保你的 SD 卡有至少 8 GB 的容量。

启动 Etcher，选择镜像文件和 SD 卡。

![][12]

一旦进度完成 SD 卡就准备好了。

#### 第 2 步：设置树莓派

你可能已经知道你需要一些外设才能使用树莓派，例如鼠标、键盘、HDMI 线等等。你同样可以[不用键盘和鼠标安装树莓派][13]，但是这篇指南不是那样。

  * 插入一个鼠标和一个键盘。
  * 连接 HDMI 线缆。
  * 插入 SD 卡 到 SD 卡槽。

插入电源线给它供电。确保你有一个好的电源供应（5V、3A 至少）。一个不好的电源供应可能降低性能。

#### Ubuntu MATE 安装

一旦你给树莓派供电，你将遇到非常熟悉的 Ubuntu 安装过程。在这里的安装过程相当直接。

![选择你的键盘布局][14]

![选择你的时区][15]

选择你的 WiFi 网络并且在网络连接中输入密码。

![添加用户名和密码][16]

在设置了键盘布局、时区和用户凭证后，在几分钟后你将被带到登录界面。瞧！你快要完成了。

![][17]

一旦登录，第一件事你应该做的是[更新 Ubuntu][18]。你应该使用下列命令。

```
sudo apt update
sudo apt upgrade
```

你同样可以使用软件更新器。

![][19]

一旦更新完成安装你就可以开始了。你可以根据你的需要继续安装树莓派平台为 GPIO 和其他 I/O 准备的特定软件包。

是什么让你考虑在 Raspberry 上安装 Ubuntu，你对 Raspbian 的体验如何呢？请在下方评论来让我知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-mate-raspberry-pi/

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://www.raspberrypi.org/downloads/
[3]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[4]: https://www.debian.org/
[5]: https://ubuntu-mate.org/
[6]: https://wiki.ubuntu.com/ARM/RaspberryPi#Recovering_a_system_using_the_generic_kernel
[7]: https://ubuntu-pi-flavour-maker.org/download/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/ubuntu-mate-raspberry-pi-download.jpg?ssl=1
[9]: https://ubuntu-mate.org/download/
[10]: https://www.7-zip.org/download.html
[11]: https://www.balena.io/etcher/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/Screenshot-from-2019-04-08-01-36-16.png?ssl=1
[13]: https://linuxhandbook.com/raspberry-pi-headless-setup/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Keyboard-layout-ubuntu.jpg?fit=800%2C467&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/select-time-zone-ubuntu.jpg?fit=800%2C468&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Credentials-ubuntu.jpg?fit=800%2C469&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Desktop-ubuntu.jpg?fit=800%2C600&ssl=1
[18]: https://itsfoss.com/update-ubuntu/
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/update-software.png?ssl=1



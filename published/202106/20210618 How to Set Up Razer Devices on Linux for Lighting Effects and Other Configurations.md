[#]: subject: (How to Set Up Razer Devices on Linux for Lighting Effects and Other Configurations)
[#]: via: (https://itsfoss.com/set-up-razer-devices-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13538-1.html)

如何在 Linux 上设置雷蛇设备的灯光效果和其他配置
======

你有了一个闪亮的新雷蛇硬件，但你找不到 Linux 的 Razer Synapse 软件。而你最终没有正确 RGB 同步，也没有办法定制它。你会怎么做呢？

好吧，对于某些功能，比如给你的鼠标添加宏，你仍然需要（在 Windows 或 MacOS 上）访问 Razer Synapse。

但是，要调整其他一些选项，如键盘的宏，改变鼠标的 DPI，或灯光效果，你可以在 Linux 上轻松设置你的雷蛇外设。

![My Razer Basilisk V2 with lighting effect][1]

这里有一些鼠标和鼠标垫的照片。这是同样的设置，但有不同的照明方案。点击图片可以看到更大的图片。

![][2]

![][3]

![][4]

雷蛇 Basilisk 是一款不错的游戏鼠标。如果你想，你可以从亚马逊订购或从当地商店获得。

如果你已经拥有一个雷蛇设备，让我展示一下配置它的步骤，就像我在这里做的那样。

### 步骤 1：安装 OpenRazer

**OpenRazer** 是一个开源的驱动程序，使雷蛇硬件在 Linux 上工作。它支持几种功能来定制和控制你的设备，包括 RGB 鼠标垫。

虽然这不是官方 Linux 驱动，但它在各种设备上工作良好。

它为各种 Linux 发行版提供支持，包括 Solus、openSUSE、Fedora、Debian、Arch Linux、Ubuntu 和其他一些发行版。

在这里，我将重点介绍在任何基于 Ubuntu 的发行版上安装它的步骤，对于其他发行版，你可能想参考 [官方说明][8]。

你需要在 Ubuntu 上 [使用 PPA][9] 安装 OpenRazer，下面是如何做的：

```
sudo apt install software-properties-gtk
sudo add-apt-repository ppa:openrazer/stable
sudo apt update
sudo apt install openrazer-meta
```

它也提供了一个 [守护进程][10]，你可以选择让它工作，你要把你的用户加入到 `plugdev` 组，它给了设备的特权访问：

```
sudo gpasswd -a $USER plugdev
```

我不需要用上述命令中配置/添加一个守护程序，但我仍然可以很好地使用这些设备。守护进程主要是确保驱动保持活跃。

- [下载 OpenRazer][11]

### 步骤 2：安装一个 GUI 来管理和调整选项

现在驱动已经安装完毕，你所需要的是一个图形用户界面 （GUI） 来帮助你定制你的雷蛇硬件。

你可以找到一些可用的选择，但我将推荐安装 [Polychromatic][12]，它提供了一个有吸引力的用户界面，而且运行良好。

![][13]

Polychromatic 是我能推荐的最接近 Razer Synapse 的应用，而且效果不错。

对于基于 Ubuntu 的发行版，你需要做的就是使用 PPA 安装它：

```
sudo add-apt-repository ppa:polychromatic/stable
sudo apt update
sudo apt install polychromatic
```

对于 Arch Linux 用户，你可以在 [AUR][14] 中找到它。关于更多的安装说明，你可以参考[官方下载页面][15]。

- [下载 Polychromatic][16]

你会得到不同设备的不同选项。在这里，我试着改变 DPI，自定义颜色周期，以及我的雷蛇 Basilisk v2 鼠标的轮询率，它完全正常。

![Customization options for a mouse][17]

如果你知道你想做什么，它还为你提供了轻松重启或停止 [守护进程][10]、改变小程序图标和执行高级配置选项的能力。

另外，你可以试试 [RazerGenie][18]、[Snake][19] 或 [OpenRGB][20] （用于改变颜色）来调整鼠标的颜色或任何其他设置。

### 总结

现在你可以轻松地定制你的雷蛇硬件了，希望你能玩得开心！

虽然你可能会找到一些其他的选择来配置你的雷蛇设备，但我没有找到任何其他效果这么好的选择。

如果你遇到了一些有用的东西，值得在这里为所有的雷蛇用户提一下，请在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/set-up-razer-devices-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/Razer-Basilisk-V2.jpg?resize=800%2C600&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/razer-mouse-pad-lighting-effect-3-com.jpg?resize=800%2C600&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/razer-mouse-pad-lighting-effect-2-com.jpg?resize=800%2C600&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/razer-mouse-pad-lighting-effect-1-com.jpg?resize=800%2C600&ssl=1
[8]: https://openrazer.github.io/#download
[9]: https://itsfoss.com/ppa-guide/
[10]: https://itsfoss.com/linux-daemons/
[11]: https://openrazer.github.io/
[12]: https://polychromatic.app
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/polychromatic-app-1.png?resize=800%2C500&ssl=1
[14]: https://itsfoss.com/aur-arch-linux/
[15]: https://polychromatic.app/download/
[16]: https://polychromatic.app/
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/razer-basilisk-polychromatic.png?resize=800%2C505&ssl=1
[18]: https://github.com/z3ntu/RazerGenie
[19]: https://github.com/bithatch/snake
[20]: https://itsfoss.com/openrgb/

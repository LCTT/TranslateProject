[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12365-1.html)
[#]: subject: (Customize your Raspberry Pi operating system for everyday use)
[#]: via: (https://opensource.com/article/20/6/custom-raspberry-pi)
[#]: author: (Patrick H. Mullins https://opensource.com/users/pmullins)

定制用于日常使用的树莓派系统
======

> 安装精简版树莓派系统，让你的树莓派更加轻盈。

![](https://img.linux.net.cn/data/attachment/album/202006/30/133836pfm4u3sq073ffmbf.jpg)

你有一个运行<ruby>[树莓派系统][2]<rt>Raspberry Pi OS</rt></ruby>（以前称为 Raspbian）操作系统的<ruby>树莓派<rt>Raspberry Pi</rt></ruby>，你肯定知道，它是一个非常棒的小型电脑，有一个很好的操作系统，对于初学者来说，它包括了你可能想要的一切。然而，一旦你熟悉了它，并且想用它干一些别的事情的时候，你可能不想要那个默认囊括了一切组件的操作系统。

在这种情况下，你两个选择：要么你可以绞尽脑汁地把所有你不需要的东西都删干净，要么你还可以用<ruby>精简版树莓派系统<rt>Raspberry Pi OS Lite</rt></ruby>来构建专门为你的需求而定制的轻量级操作系统。我的建议是，用第二种方法，既简便又节省时间。

### Raspberry Pi OS Lite

“<ruby>精简版<rt>Lite</rt></ruby>”的<ruby>树莓派系统<rt>Raspberry Pi OS</rt></ruby>其实没什么特别的，就是一个基于最新版本的 [Debian][3] 的最小化镜像。这个镜像仅包含了操作系统核心和启动到命令行的部分，而不会进入图形桌面。可以将这个作为你的定制树莓派系统的基础。这之后的所有东西都是建立在这个核心之上的。

前往树莓派基金会的网站上[下载][2]这个轻量级镜像。下载完成后，查看详细的[安装指南][4]，这里面介绍了在 Linux、Windows 或者 macOS 下如何烧制树莓派操作系统的 SD 卡。

如果你计划用树莓派作为一个极简系统来运行一些脚本和服务的话，差不多这么多就够了。如果你还想干更多事，那继续往下读。

### X Window

首先，如果偶尔需要通过图形用户界面（GUI）连接到你的树莓派，安装一个窗口系统还是不错的。

[X Window 系统][5]，有时候称为 X11，是 Unix 操作系统上一个常见的基本窗口系统。X11 提供了一套 GUI 桌面环境的基本框架。它可以让你通过窗口、鼠标和键盘与计算机交互。

#### 安装 X Window

下面这一行安装了能让 X11 运行的最少的包。

```
sudo apt install -y --no-install-recommends xserver-xorg-core xserver-xorg xfonts-base xinit
```

如果使用 `--no-install-recommends`，则只安装了主要的一些依赖（`Depends` 字段中的包）。这样可以节省很多空间，因为没有安装那些建议却不一定需要的包。

### 进阶：使用 Xfce 桌面环境

如果你愿意，可以就此停下了，然后开始使用 X Window 作为你的桌面。不过，我并不建议这么做。X Window 自带的这种最小化的窗口管理工具走的是极简主义风格，某种程度上让人感觉过时了。相反，我建议安装现代化的桌面环境，比如说像 Xfce、GNOME 或者 KDE。当用在微型计算机上时，我更倾向于 [Xfce][6] 而不是其他的，因为它就是为资源有限的系统设计的，而且你可以通过主题、图标或者其他东西对它进行定制。

#### 安装 Xfce

安装 Xfce 桌面环境相当简单。只需要：

```
sudo apt install -y --no-install-recommends xfce4 desktop-base lightdm
```

这就够了。你现在安装了 X Window（X11）和 Xfce 了。现在是时候来定制一下环境并且安装一些核心应用了。

### 核心应用

目前为止，你已经安装了 X Window（X11）、Xfce 桌面环境和 LightDM（一个 Xfce 自带的显示管理器）。现在，你已经有了一个可以启动并且正常使用的轻量级的完整系统。不过，在彻底完成之前，我还是喜欢装一些核心应用。

下面这条命令安装了一个终端程序、[Audacious][7] 音频播放器、[Ristretto][8] 图像浏览器、[Mousepad][9] 文本编辑器、[File Roller][10] 存档管理器和 [Thunar][11] 容量管理器。

```
sudo apt install -y --no-install-recommends xfce4-terminal audacious ristretto
sudo apt install -y --no-install-recommends mousepad file-roller thunar-volman
```

#### 其他可选项

其他一些你可能想安装的东西，包括一个好的网络管理器、任务管理器、PDF 阅读器和通知工具，以及桌面背景管理器、截图工具、一些新的图标和光标主题。简单来说，如果树莓派是你的首选系统，这些都算是日常工作的一些补充。

```
sudo apt install -y --no-install-recommends network-manager xfce4-taskmanager xfce4-notifyd
sudo apt install -y --no-install-recommends  xpdf gnome-icon-theme dmz-cursor-theme
```

### 下一步该做什么？

如果一切都正常工作的话，你现在就有一个基于 Xfce 和 Debian Lite 超轻量级操作系统的树莓派了。我建议现在你去 Xfce 网站上查看其它很酷的好东西，这些你都可以安装并使用。下一步做什么完全由你决定！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/custom-raspberry-pi

作者：[Patrick H. Mullins][a]
选题：[lujun9972][b]
译者：[Yufei-Yan](https://github.com/Yufei-Yan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_cartoon.png?itok=m3TcBONJ (Cartoon graphic of Raspberry Pi board)
[2]: https://www.raspberrypi.org/downloads/raspberry-pi-os/
[3]: https://www.debian.org/
[4]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[5]: https://en.wikipedia.org/wiki/X_Window_System
[6]: http://xfce.org
[7]: https://audacious-media-player.org/
[8]: https://docs.xfce.org/apps/ristretto/start
[9]: https://github.com/codebrainz/mousepad
[10]: https://gitlab.gnome.org/GNOME/file-roller
[11]: https://docs.xfce.org/xfce/thunar/thunar-volman
[12]: https://goodies.xfce.org/

[#]: subject: "10 Things to Do After Installing elementary OS 6 “Odin”"
[#]: via: "https://www.debugpoint.com/2021/08/10-things-to-do-after-install-elementary-os-6/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "anine09"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13749-1.html"

安装 elementary OS 6 “Odin” 后要做的 10 件事
======

> 一个精心准备的在安装 elementary OS 6 “Odin” 后要做的事情的列表。

![](https://img.linux.net.cn/data/attachment/album/202109/04/081345bf9co7ot40szdytg.jpg)

在经过两年多的开发后 [elementary OS 6 “Odin”][1] 于不久前发布，此次版本更新在核心模块、 Pantheon 桌面、原生应用方面带来了一大批新特性。elementary OS 6 “Odin” 是基于 Ubuntu 20.04 LTS 的。

如果你完成了安装，你可能想要尝试通过一些特定的设置来使你的系统更加的个性化。这里描述的选项是通用的，在某些情况下可能对你没有用，但是我们觉得有必要列出一些基本的东西，让你有合适的方式来探索这个漂亮的 elementary OS。

### 安装完 elementary OS 6 “Odin” 后要做的事情

准备步骤：

首先确保你已经连上了互联网，你可以在顶部的通知区域查看可用的网络列表

#### 1、更改主机名

这可能不是你想做的第一件事。但是我不知道为什么在安装过程中没有给出更改主机名的选项。例如，见下图的终端提示， 这个主机名是 elementary OS 的默认硬件配置。在我看来这一点都不好。

![主机名修改之前][2]

打开终端并运行下列命令以更改主机名：

```
hostnamectl set-hostname your-new-hostname
```

示例：

![修改主机名][3]

![主机名修改之后][4]

#### 2、升级你的系统

在安装任何 Linux 发行版后，你应该做的第一件事就是确保系统处于最新的软件包和安全更新状态。

你可以通过打开应用中心来检查或者安装更新。

或者打开终端运行下列命令：

```
sudo apt update
sudo apt upgrade
```

#### 3、安装 Pantheon Tweaks

Pantheon Tweaks 是 elementary OS 的必备应用。它提供了一些无法通过系统原生设置程序修改的额外的设置和配置选项，请打开终端并运行以下命令以安装 Pantheon Tweaks。注意：先前版本的 Tweak 工具叫做 elementary Tweaks，从 Odin 版本开始更名为 Pantheon Tweaks。

```
sudo apt install software-properties-common
sudo add-apt-repository -y ppa:philip.scott/pantheon-tweaks
sudo apt install -y pantheon-tweaks
```

安装后打开系统设置，你可以在那里找到 “<ruby>调整<rt>Tweaks</rt></ruby>” 选项。

[这里][5] 提供了更详细的安装指南（如果你需要了解更多信息）。

### 4、配置 Dock

Dock 是整个桌面的中心。老实说，Dock 中默认包含的应用并不常用，因此你可以通过以下步骤配置 Dock 中的项目。

  * 移除：右键单击并取消 “<ruby>在 Dock 中驻留<rt>Keep in Dock</rt></ruby>” 选项。
  * 添加新的项目：单击顶部的应用程序。然后右键单击你想要放在 Dock 的应用图标。选择 “<ruby>添加到 Dock<rt>Add to Dock</rt></ruby>”。

在我看来，你应该至少把文件管理、截图工具、Firefox 、计算器，以及其他的一些应用添加到 Dock。然后移除 Dock 上那些你不需要的应用。

#### 5、更改外观

elementary OS 6 Odin 改进了桌面的整体外观，为整个桌面和应用程序提供了自带的强调色和原生的夜间模式，同时，系统自带了许多漂亮的壁纸。你可以通过 “应用 > 系统设置 > 桌面” 来定制壁纸、外观、面板和多任务视图。

![elementary OS 6 Odin 桌面设置界面][6]

按照你希望的样子来配置你系统的外观。

你也可以基于日出和日落的时间来设置夜间模式。

#### 6、安装其他的应用

自带的应用中心非常适合这个系统，我发现它是 Linux 桌面最好的应用商店之一。然而，有时候需要安装没有预装的必要应用（大多数是知名的应用）。下面是个新系统推荐安装的软件列表。（说真的，为什么 LibreOffice 没有预装？）

  * firefox
  * gimp
  * gedit
  * inkscape
  * obs-studio
  * libreoffice

#### 7、一些针对笔记本电脑的省电贴士

有许多方法可以配置你的 elementary OS（或者一般的 Linux 桌面），以达到延长电池寿命的目的。记住，电池寿命取决于你的笔记本硬件，以及电池和笔记本的使用年限。所以，遵循下面的一些建议，最大限度的利用你的笔记本电池。

  * 安装 [tlp][8]。`tlp` 是一个简单易用的命令行程序，用来帮你在 Linux 上延长电池寿命。你只需要安装它，默认情况下，它会处理好其他的设置。安装命令：

    ```
    sudo add-apt-repository ppa:linrunner/tlp
    sudo apt update
    sudo apt-get install tlp
    sudo tlp start
    ```

  * 关闭蓝牙，默认情况下，蓝牙是开启状态。在需要的时候再启动它。

  * 通过下面的命令安装 `thermald`。这个实用程序（实际是个守护进程）控制着你的 CPU 的 P-States 和 T-States 的温度以及 CPU 发热。

    ```
    sudo apt install thermald
    ```

  * 根据你的需要将亮度调到最小。

#### 8、安装磁盘实用程序

在很多情况下，你发现你需要格式化 USB 或者向 USB 中写入一些东西。默认情况下，系统没有安装任何相关的应用。你可以安装以下这些易用的应用。

  * gnome-disk-utility
  * gparted

#### 9、启用最大化和最小化选项

许多用户喜欢在窗口标题栏左边或者右边使用最大化、最小化的按钮，elementary OS 默认只提供关闭和恢复两个选项。这没什么问题，因为这就是它的设计理念。然而你可以通过使用 Pantheon Tweaks 来开启最大化和最小化按钮，具体的方式是：“调整 > 外观 > 窗口控制”。

![在 elementary OS 中启动最大化和最小化设置][9]

#### 10、在 Odin 中学习新的多点触控手势

如果你是笔记本用户，并且使用 elementary OS “Odin”，那么你一定要看看这些超酷的新触控手势。三根手指向上滑动，就会平滑的打开多任务视图，展示打开的应用程序和工作空间。用三根手指向左或向右滑动，就能在动态工作空间之间流畅的切换，使任务之间的切换更快。

用两根手指也可以在原生应用中实现类似的功能。

### 结束语

我希望这篇安装 elementary OS 6 “Odin” 后要做的 10 件事能帮助到你，让你可以上手使用 elementary OS 6 “Odin”，尽管这些事情完全是用户的偏好，因此这些事情有可能适合你也有可能不适用于你，但总的来说，这些都是一般用户喜欢的预期调整。

如果你觉得有更多的东西应该添加到列表中，请在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/10-things-to-do-after-install-elementary-os-6/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[anine09](https://github.com/anine09)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2021/08/elementary-os-6/
[2]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/hostname-change-before.jpeg
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/changing-hostname.jpeg
[4]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/changed-hostname.jpeg
[5]: https://www.debugpoint.com/2021/07/elementary-tweaks-install/
[6]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/elementary-OS-6-Odin-settings-window-Desktop.jpeg
[7]: https://www.debugpoint.com/2020/09/elementary-os-6-odin-new-features-release-date/
[8]: https://linrunner.de/tlp/
[9]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/enable-minimize-maximize-buttons-elementary-OS-1024x501.png


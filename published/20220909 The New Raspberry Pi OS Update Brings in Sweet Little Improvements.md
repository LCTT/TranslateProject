[#]: subject: "The New Raspberry Pi OS Update Brings in Sweet Little Improvements"
[#]: via: "https://news.itsfoss.com/raspberry-pi-os-sep-update/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: "zjsoftceo"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15032-1.html"

新树莓派操作系统更新带来一些不错的小改进
======

> 树莓派操作系统更新，增加了对 NetworkManager 支持以及新的操作快捷方式。

![The New Raspberry Pi OS Update Brings in Sweet Little Improvements][1]

如果你是小型迷你计算机的狂热粉丝的话，你可能知道树莓派可以用作成熟的桌面计算机使用。此外，它也是支持各种电子/物联网项目的核心组件。

虽然许多 Linux 发行版为树莓派提供了镜像文件，但树莓派基金会仍然提供了其官方操作系统，即 <ruby>[树莓派操作系统][2]<rt>Raspberry Pi OS</rt></ruby>。

顺便说一句，树莓派操作系统是基于 Debian 的。具体来说，当前版本是基于 [Debian 11 Bullseye][3] 的，它是采用 LXDE 作为桌面应用环境的轻量级操作系统。

### 树莓派操作系统：带来了什么最新内容？

尽管这个最新的更新并不是一个重大更新，但它仍然带来了一些有用的补充。如果你把树莓派用作桌面计算机来使用，你一定会欢迎它的。

让我们来看看新版本提供了什么。

#### 主菜单的快速搜索功能

虽然 Windows 系统和许多 Linux 发行版已经包含了这个基本功能，但树莓派操作系统之前一直没有这个功能。

用户可以点击“树莓派”图标或键盘上的默认主机键，打开主菜单，键入要启动的应用程序的名称，就会自动出现一个新的搜索框。

可用向上和向下箭头键来浏览菜单，用回车键选择应用。

![主菜单的新搜索框][4]

如果用户不键入任何内容，则主菜单的功能与点击“树莓派”图标以显示应用程序时的功能完全相同。

再也不需要用鼠标光标来打开应用程序了。

#### 全新的键盘操作快捷方式

就像主菜单一样，你还可以通过键盘打开 Wi-Fi 和切换蓝牙功能。

按下 `Ctrl+Alt+W` 将打开 Wi-Fi 菜单，而 `Ctrl+Alt+B` 是用于蓝牙的。

#### 增强型音频输入控制

任务栏现在将为输入和输出设备显示两个单独的图标，而不是单个默认音量图标。

![音量滑块][5]

每当连接音频输入设备时，扬声器图标旁边也会弹出一个麦克风图标。此外，如果连接了多个音频输入设备，用户可以右键单击该图标从列表中选择设备，而左键单击将显示音量控制滑块。

#### 支持 NetworkManager

NetworkManager 是许多 Linux 发行版用来处理网络功能的流行的守护程序。它包括许多功能，可帮助用户相应地调整和配置网络设置。

如果你想进一步了解，请在此处了解有关 Linux 中守护程序的更多信息：

> **[什么是 Linux 中的守护进程？为什么使用它们？][6]**

就其功能而言，引入了对 NetworkManager 的初步支持，以作为 dhcpcd 的替代选项。这意味着用户可以轻松管理 VPN 连接，而不会有太多麻烦，甚至可以将树莓派配置为一个 Wi-Fi 接入点。

![][8]

> 请注意，NetworkManager 的支持应该还在测试中。为了获得稳定的网络体验，建议用户继续使用 dhcpcd。
> 
> 如果你仍然想尝试 NetworkManager，则需要遵循一些高级步骤。但可以放心，如果在使用 NetworkManager 时遇到任何问题，可以选择切换回 dhcpcd。

如果你想了解有关该版本的更多信息，[官方发行说明][9] 包括了更多详细信息。

### 获取树莓派操作系统

前往下面链接的官方下载页面下载新的镜像文件。

> **[获取树莓派操作系统][10]**

你可以在任何系统上使用树莓派 Imager 来制作要在树莓派上使用的 microSD 卡。不管如何，你都可以单独下载树莓派操作系统文件进行设置。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/raspberry-pi-os-sep-update/ 

作者：[Rishabh Moharir][a]
选题：[lkxed][b]
译者：[zjsoftceo](https://github.com/zjsoftceo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/raspberry-pi-os.jpg
[2]: https://www.raspberrypi.com/software/
[3]: https://news.itsfoss.com/debian-11-feature/
[4]: https://news.itsfoss.com/content/images/2022/09/menu.png
[5]: https://news.itsfoss.com/content/images/2022/09/mic.png
[6]: https://itsfoss.com/linux-daemons/
[8]: https://news.itsfoss.com/content/images/2022/09/nm.png
[9]: https://www.raspberrypi.com/news/the-latest-update-to-raspberry-pi-os/
[10]: https://www.raspberrypi.com/software/

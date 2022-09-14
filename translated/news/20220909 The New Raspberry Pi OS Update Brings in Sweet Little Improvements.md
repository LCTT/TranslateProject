[#]: subject: "The New Raspberry Pi OS Update Brings in Sweet Little Improvements"
[#]: via: "https://news.itsfoss.com/raspberry-pi-os-sep-update/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: "zjsoftceo"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

新树莓派操作系统更新带来甜蜜的小改进
======
树莓派操作系统更新，增加网络管理器以及新的操作快捷方式的支持。
![The New Raspberry Pi OS Update Brings in Sweet Little Improvements][1]
如果你是小型迷你计算机的狂热粉丝的话，您可能知道树莓派可以用作成熟的迷你桌面式计算机。不要忘记，它也是支持各种电子/物联网项目核心。
虽然许多Linux发行版为树莓派提供了许多系统镜像文件，但树莓派基金会保留了官方操作系统，我们便称之为[树莓派操作系统][2]。
如果你不知道，树莓派操作系统是基于Linux发行版Debian。具体来说，以[Debian 11][3]作为是当前树莓派操作系统最核心、轻量级版本并使用了LXDE作为其桌面应用环境。
### 树莓派操作系统：带来了什么最新内容？
尽管最新的更新并不是一个最主要的更新，但它仍然带来了一些有用的补充。如果您将树莓派用作迷你台式PC来使用，您一定会欢迎它们的。
让我们来看看新版本提供了什么。
#### 主菜单的主目录具有快速搜索功能
虽然Windows系统和许多Linux发行版已经包含了这个基本功能，但树莓派操作系统直到现在还没有它。
用户可以点击Raspberry Pi键或键盘上的默认主机键，这将打开主菜单，一旦用户开始键入要启动的应用程序的名称，就会自动出现一个新的搜索框。
向上和向下箭头键可用于导航菜单，而回车键可用于选择应用。

![主菜单的新搜索框][4]

如果用户不键入任何内容，则主菜单的功能将与单击Raspberry Pi图标以显示应用程序时的功能完全相同。无需再使用鼠标光标打开应用程序。
#### 全新的键盘操作快捷方式
就像主菜单一样，您还可以通过键盘调出Wi-Fi和蓝牙功能的切换。
执行 Ctrl+Alt+W 将打开 Wi-Fi 菜单，而 Ctrl+Alt+B 是为蓝牙保留的。
#### 增强型音频输入控制
任务栏现在将为输入和输出设备显示两个单独的图标，而不是单个默认音量图标。

![Volume Slider][5]

每当连接音频输入设备时，扬声器图标旁边也会弹出一个麦克风图标。此外，如果连接了多个音频输入设备，用户可以右键单击同一图标以从列表中选择设备，而左键单击将显示音量控制滑块。
#### 网络管理功能支持
网络管理器是许多 Linux 发行版用来处理网络功能的流行守护程序。它包括许多功能，可帮助用户相应地调整和配置网络设置。

如果您很好奇，请在此处了解有关 Linux 中守护程序的更多信息：

[什么是 Linux 中的守护进程？为什么使用它们？][6]

就其功能而言，引入了对网络管理器的初始支持，作为 dhcpcd 的替代选项。这意味着用户可以轻松管理VPN连接，而不会有太多麻烦，甚至可以将Pi配置为Wi-Fi接入点。

![][8]

如果您仍然想尝试网络管理器，则需要遵循一些高级步骤。用户可以放心，如果他们在使用网络管理器时遇到任何问题，可以选择切换回dhcpcd。

[官方发行说明][9]包括更多详细信息，如果您想了解有关该版本的更多信息。

### 获取更多的树莓派操作系统
前往下面链接的官方下载页面下载新的镜像文件。
您可以在任何系统上使用树莓派成像仪来准备要在树莓派上使用的microSD卡。在任何一种情况下，您都可以单独下载树莓派操作系统文件进行设置。

[获取树莓派操作系统][10]
--------------------------------------------------------------------------------

via: https://news.itsfoss.com/raspberry-pi-os-sep-update/ 

作者：[Rishabh Moharir][a]
选题：[lkxed][b]
译者：[zjsoftceo](https://github.com/zjsoftceo)
校对：[校对者ID](https://github.com/校对者ID)

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

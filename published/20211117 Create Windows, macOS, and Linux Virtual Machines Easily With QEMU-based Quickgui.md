[#]: subject: "Create Windows, macOS, and Linux Virtual Machines Easily With QEMU-based Quickgui"
[#]: via: "https://itsfoss.com/quickgui/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13998-1.html"

利用基于 QEMU 的 Quickgui 轻松创建虚拟机
======

![](https://img.linux.net.cn/data/attachment/album/202111/19/104431xwh8h8hw228e77hh.jpg)

> Quickgui 旨在成为 VirtualBox 的一个更简单的替代品，帮助你快速创建虚拟机。让我们来看看它。

目前，借助 VirtualBox、VMware 和其他一些程序，创建虚拟机相当容易。

你当然可以 [在你的 Linux 系统中安装 VirtualBox][1] 来创建虚拟机。但是，在这篇文章中，我把重点放在一个令人兴奋的工具上，即 Quickgui，它使用简单，运行速度快，能帮助你快速启动虚拟机。

### Quickgui：Quickemu 的图形用户界面前端

![][2]

Quickemu 是一个基于终端的工具，可以让你创建优化的桌面虚拟机并轻松地管理它们。该工具专注于消除配置虚拟机的所有细微差别。相反，它根据虚拟机的可用系统资源选择最佳配置以使其正常工作。

不仅限于配置，它还会下载操作系统的镜像（使用 quickget 包）。

因此，你所要做的就是像通常那样安装操作系统，然后开始工作。

Quickemu 以 [QEMU][3] 为核心，旨在用 Bash 和 QEMU 取代 VirtualBox。

QEMU 是一个开源的机器仿真器和虚拟化器。

Quickemu 是一个有趣的项目，由 [Martin Wimpress][4]（Ubuntu MATE 负责人）在一些贡献者的帮助下完成。

作为对这个工具的补充，Quickgui 是一个使用 [Flutter][5] 开发的前端，由另一组开发人员开发，以帮助在没有终端的情况下使用 Quickemu。

在此，我们重点介绍使用 Quickemu 创建和管理虚拟机的前端 Quickgui。

### Quickgui 的特点

![在 Zorin OS 16 上使用 Quickgui 运行虚拟机][6]

如上所述，Quickgui 作为一个前端，其核心利用的是 Quickemu。因此，你可以期待其具有同样的功能。

你可以用它做的一些事情包括：

  * 搜索操作系统并下载它们以创建虚拟机。
  * 管理你现有的虚拟机。
  * 当你建立一个虚拟机时，创建默认配置。
  * 提供黑暗模式。
  * 开箱即用地创建 Windows 和 macOS 虚拟机。
  * 支持各种 Linux 发行版，包括 elementaryOS、ZorinOS、Ubuntu 等。
  * 支持 FreeBSD 和 OpenBSD。
  * 支持 EFI 和传统的 BIOS。
  * 不需要提升权限就能工作。
  * 默认情况下，宿主机/访客机共享剪贴板。
  * 可以选择镜像压缩方法。
  * 能够禁用输入。
  * 能够切换虚拟机中宿主机/访客机的可用 USB 设备。
  * 包括对 [SPICE 连接][7] 的支持。
  * 网络端口转发。
  * Samba 文件共享。
  * VirGL 加速。
  * 智能卡直通。

鉴于它是如此简单和容易使用，其功能集令人印象深刻。让我给你提供一些使用的技巧。

### Quickgui 入门

用户界面非常简单，你可以选择 “<ruby>管理现有机器<rt>Manage existing machines</rt></ruby>” 和 “<ruby>创建新机器<rt>Create new machines</rt></ruby>”。

你需要点击“<ruby>创建<rt>Create</rt></ruby>”来开始制作虚拟机。

![Quickgui VM Creation][8]

选择操作系统，你应该看到一个列表。如果你找不到目标操作系统，只需搜索一下，它应该会出现。

![][9]

你会看到各种各样的操作系统。在接下来的选择中，选择所需的操作系统及其版本。然后，点击 “<ruby>下载<rt>Download</rt></ruby>”。

它应该会下载恢复镜像或 ISO，这取决于你正在尝试的操作系统。下载将取决于你的互联网连接，但它工作得很完美。

如果你想自己下载 ISO，你将就得为它创建配置并进行设置。看看 [Quickemu 的 GitHub 页面][10]，了解一下它的说明。

![][11]

你只需要在下载完成后点击 “<ruby>去除<rt>Dismiss</rt></ruby>”。

在这篇文章中，我测试了启动一个 Linux 虚拟机（[elementary OS 6][12]）、一个 macOS 实例，以及一个 Windows 虚拟机。

我成功地以虚拟机方式运行了 Linux 和 macOS 。然而，我在快速建立一个 Windows 虚拟机时遇到了一些问题。我在 Quickemu 的 GitHub 页面上找不到任何相关信息，所以我没有费心去排除故障。

如果你需要使用 Windows 虚拟机，可以自己试试，并在他们的 [Discord 服务器][13] 中联系他们寻求帮助。

你不一定需要改变虚拟机的配置来使其工作。因此，它变成了一个节省时间的工具。

### 在 Linux 中安装 Quickgui

要使用 Quickgui，你需要先安装 Quickemu。

对于基于 Ubuntu 的发行版，你可以使用 PPA 来安装它：

```
sudo apt-add-repository ppa:flexiondotorg/quickemu
sudo apt update
sudo apt install quickemu
```

它应该安装了你需要的所有东西（连同 quickget 包），使其发挥作用。

完成后，你可以使用另一个 PPA 继续安装 Quickgui：

```
sudo add-apt-repository ppa:yannick-mauray/quickgui
sudo apt update
sudo apt install quickgui
```

如果你使用的是其他 Linux 发行版，你可以参考 [Quickemu 的 GitHub 页面][10] 和查看 [Quickgui 的 GitHub 页面][14]，以获得更多说明。

### 总结

Quickgui 使人们能够方便地利用 Quickemu 的能力，快速创建和管理多个虚拟机，而不需要进行任何配置。

更有好的是，你不需要提升权限就能让它工作。

因此，如果你正在寻找 VirtualBox 的替代品，这可能就是答案。或者，你也可以试试 [GNOME Boxes][15] 作为一个更简单的替代品。

你对 Quickgui 有什么看法？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/quickgui/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-virtualbox-ubuntu/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickgui-emu.png?resize=800%2C547&ssl=1
[3]: https://www.qemu.org/
[4]: https://twitter.com/m_wimpress
[5]: https://itsfoss.com/install-flutter-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickgui-vms.png?resize=800%2C450&ssl=1
[7]: https://www.spice-space.org/index.html
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickgui-select.png?resize=800%2C534&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickgui-quickemu-selection.png?resize=800%2C559&ssl=1
[10]: https://github.com/wimpysworld/quickemu
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickemu-gui-mac.png?resize=800%2C552&ssl=1
[12]: https://news.itsfoss.com/elementary-os-6-features/
[13]: https://discord.com/invite/sNmz3uw
[14]: https://github.com/quickgui/quickgui
[15]: https://help.gnome.org/users/gnome-boxes/stable/

[#]: subject: "Parch Linux: A Simple & Easy-to-Use Arch-based Distro"
[#]: via: "https://news.itsfoss.com/parch-linux/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16565-1.html"

Parch Linux：一个简洁易用的基于 Arch 的发行版
======

![][0]

> 这是一个简约直观的基于 Arch 的发行版，无需繁琐的开箱定制。

最近，我在寻求一些最佳的 [基于 Arch 的 Linux 发行版][1]。

在浏览过我们过去的报道，并进行了一番搜索之后，我找到了一些颇为出色的发行版。

其中 [Archcraft][2] 这款发行版让我眼前一亮，它极具用户友好性。我希望能有更多类似 Archcraft 的发行版，幸运的是，在几天前，我发现了 **Parch Linux**。

一起来看看这个引人入胜的发行版，它“力图做到美观、易用、轻量、快捷且稳定”。

### Parch Linux：概述 ⭐

![][3]

[Parch Linux][4] 是 **一款面向 Linux 新手和经验者的开源轻量级发行版**。它以 Arch Linux 为基础，为用户提供了清新的体验。

一些 **关键特点** 包括：

 * 直观的用户界面
 * 采用滚动更新机制
 * 集成 pacman 包管理器
 * 少量的定制以增强用户体验

#### 初体验 👨‍💻

我在 [虚拟机][5] 上尝试安装了 **Parch GNOME** 版本，整个过程十分简单明了。点击 “欢迎” 应用程序的一键“安装 Parch”按钮即可启动 [Calamares 安装程序][6]。

![][7]

尽管外观和感觉有所不同，但此次的安装体验，确是你能从 Calamares 那里预期的。

![][8]

我依次设置了时区、键盘布局，然后开始设置用户，输入常见的信息，如用户名、密码、计算机的名称等。

![][9]

熟悉的 **磁盘分区** 步骤也随之而来，诸如 _ext4_ 、 _btrfs_ 、 _jfs_ 、 _xfs_ 、 _f2fs_ 和 _reiser_ 等文件系统皆在选项之中。

![][10]

所有的设置就位后，安装程序开始运行，屏幕底部出现了进度条，屏幕中心处是 Parch Linux 的徽标。

![][11]

安装完成后，系统重新启动到了这个美丽的桌面，GNOME 45.1 的全新工作区切换器和更新后的快速设置菜单等新功能一览无余。

![][12]

我在想还有没有其他的壁纸。你可以在一些带有 Parch Linux 徽标的壁纸中找到一些有趣的选择。

不忘记，停靠栏已经对齐到了屏幕的左侧。

![][13]

我还发现 Parch Linux 提供了一套 **实用的应用程序**，包含诸如 [GParted][14]、[KeePassXC][15]、Vim，以及 GNOME 的一些常见应用，比如图像浏览、视频播放、地图查看等。

![][16]

这个发行版内置了最新的核心包 Pacman 6.0.2，使用 `pacman -Syu` 命令即可获取最新的包。

然后，我注意到了与默认 GNOME 终端不同的终端模拟器。

![][17]

Parch Linux 采用了 [Blackbox][18] 终端，这是一个精致的 GTK4 终端，用于满足喜欢极简终端模拟器的用户。

总的来说，我喜欢 Parch Linux 所提供的一切。

当然，在任何基于 Arch 的发行版上，你都可以自定义所有的东西。

但我认为，Parch Linux 在 Arch Linux 的基础上打造出更简单的用户体验，并且刻意做了一些定制，这对新的 Linux 用户来说，是有益的。

### 📥 下载 Parch Linux

尽管我试验的是 GNOME 版本，但还有其他更多版本可供选择。比如 **Parch KDE**、**Parch XFCE**、**Parch Cinnamon** 等。

所以，如果你要获取 Parch Linux 的任何版本，你可以直接访问其 [官方网站][20] 或者 [FOSS Torrents 页面][21]。

> **[Parch Linux][20]**

如果你遇到任何问题，或者对这个发行版有任何问题，都可以访问 [Parch Linux 论坛][22] 或者它的 [GitHub 仓库][23]。

如果你在想为什么我们更关注 Arch-based 发行版，可能原因在于：

> **[喜欢 Arch Linux 的六个原因][24]**

💬 可以分享一下你对这个基于 Arch 的发行版的看法吗？我们已经有足够多的发行版了，还是依然需要更多？

*（题图：DA/1fee979e-9788-4bc8-a9cc-e8bccc2172c2）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/parch-linux/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/arch-based-linux-distros/
[2]: https://news.itsfoss.com/archcraft/
[3]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_a.jpg
[4]: https://parchlinux.com/
[5]: https://itsfoss.com/virtual-machine/
[6]: https://calamares.io/
[7]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_b.jpg
[8]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_c.jpg
[9]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_f.jpg
[10]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_g.jpg
[11]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_h.jpg
[12]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_i.jpg
[13]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_l.jpg
[14]: https://itsfoss.com/gparted/
[15]: https://itsfoss.com/keepassxc/
[16]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_j.jpg
[17]: https://news.itsfoss.com/content/images/2024/01/Parched_Linux_k.jpg
[18]: https://itsfoss.com/blackbox-terminal/
[19]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[20]: https://parchlinux.com/download
[21]: https://fosstorrents.com/distributions/parch-linux/
[22]: https://forum.parchlinux.com/
[23]: https://github.com/parchlinux
[24]: https://itsfoss.com/why-arch-linux/
[0]: https://img.linux.net.cn/data/attachment/album/202401/17/192209fa7jrrysxaryi39h.jpg
[#]: subject: "EndeavourOS and Manjaro: An in-depth Comparison Between Two of the Best Arch Linux Based Distros"
[#]: via: "https://itsfoss.com/endeavouros-vs-manjaro/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14183-1.html"

EndeavourOS vs. Manjaro：两个基于 Arch Linux 的最佳发行版之间的深度比较
======

如果你曾经尝试过使用 Arch Linux，你就知道如果没有适当的文档和 Linux 知识，几乎不可能安装它。而实际上，这就是 Arch Linux 的 [魅力][1]。

但由于 Arch Linux 属于专业级的 Linux 发行版，因此有几个 [基于 Arch 的发行版，它们试图让普通人可以更轻松地使用它们][2]。

当谈到 “基于 Arch 的 Arch 替代品” 时，Manjaro 和 EndeavourOS 是两个最受欢迎的选择。

所以让我们来看看这两个的区别。为什么你要选择其中一个而不是另一个？

![][3]

### 桌面变体

这两个发行版都有多种桌面风格。Manjaro 有三种官方风格：Xfce、KDE 和 GNOME。此外还有社区版：Budgie、Cinnamon、Deepin、Mate、Sway 和 i3。

Endeavour OS 官方提供了更多的变体。除了 Manjaro 所拥有的那些，它还有 LXQT、BSPWM、Openbox 和 Qtile。

由于每种风格都有不同的 [桌面环境][4]（DE）及特定于该桌面的捆绑应用程序。这就导致了没有一个“严格”的最低系统要求基线。

[根据 EndeavourOS 的网站][5]，下面是每种桌面环境对内存的系统要求清单（对 Manjaro 也应该是一样的）：

  * Xfce - 至少 2GB 内存，但建议 4GB。
  * Mate - 至少 2GB 内存，但建议 4GB。
  * Cinnamon - 需要至少 4GB 的内存
  * Gnome - 至少需要 4GB 的内存（假设对 KDE 相同）
  * Budgie - 至少需要 4GB 的内存
  * Plasma - 至少需要 4GB 的内存
  * LXQT - 至少需要 2GB 的内存，但建议 4GB

### 获取 ISO

正如我上面提到的，Manjaro 和 EndeavourOS 有各种各样的风格。这意味着，我不能给你指出一个单一的 ISO 下载链接。但是，出于本文比较操作系统的意图和目的，我选择了默认的产品 —— Xfce 风格的 ISO。

- [下载 Manjaro][6]
- [下载 EndeavourOS][7]

### 安装操作系统

EndeavourOS 和 Manjaro 都使用 Calameres 安装程序，并在其 GRUB 启动菜单中提供了一些有用的选项。

#### EndeavourOS 的安装

当你首次启动 EndeavourOS 时，它将向你展示一个 GRUB 菜单，有以下选项：

  * 使用 Intel/AMD 驱动启动（**默认选项**）
  * 使用专有的 NVIDIA 图形驱动启动
  * 运行 [Memtest86+][8]（内存测试）
  * 运行 [HDT][9]（硬件检测工具）

EndeavourOS 启动后，它的欢迎屏幕将为你提供一些选项。

这些选项用来管理分区、安装社区版本、更新镜像和启动安装程序。

![EndeavourOS 安装程序上的选项列表][10]

有两个选项用于安装：

  * 在线 - 让你选择把你的桌面环境改成 Xfce 以外的其它桌面。
  * 离线 - 给你提供带有 EndeavourOS 主题的 Xfce 桌面。

如前所述，EndeavourOS 使用开源的 Calameres 安装程序。但在此基础上，它还为你提供了一些选项，以便更好地控制用户体验和安装。

EndeavourOS 安装程序提供的可用选项列举如下：

  * [LTS 内核][11]（与最新的稳定内核 *并列*）
  * XFCE4
  * KDE
  * GNOME
  * i3 WM
  * Mate 桌面环境
  * Cinnamon 桌面环境
  * Budgie 桌面环境
  * LXQT
  * LXDE

EndeavourOS 安装程序中的无障碍工具列表如下：

  * espeak-ng: 开源的文本朗读合成器
  * mousetweaks: 指针设备的无障碍增强工具
  * orca：可编写脚本的屏幕阅读器

#### Manjaro 的安装

![][12]

当你第一次启动 Manjaro 时，你会看到一个 GRUB 菜单，有以下选项：

  * 使用 Intel/AMD 驱动启动（**默认选项**）
  * 使用专有的 NVIDIA 图形驱动启动
  * 运行内存测试（[不再包括 Memtest，而且在 UEFI 模式下似乎也没有了][13]）

除了 Manjaro 开发人员对 Calameres 安装程序所做的品牌和操作系统特定的改变之外，原版 Calameres 安装程序和你在 Manjaro 上的没有什么区别。

![][14]

> **Calameres 不是 Manjaro 的唯一安装程序**
>
> 如果你想在 Manjaro 上进行自定义安装，你可以使用 [Manjaro Architect][15] ISO 来进行完全自定义的 CLI 安装。
>
> **请记住，在写这篇文章的时候，Manjaro 的 Architect 版本 [似乎没有被维护][16]，有一个未解决的软件包冲突。如果你有必要的技能和时间，请帮助维护这个项目** : )

这可能是一件好事，也可能是一件坏事，取决于你问谁。

在我看来，如果你是第一个 Linux 发行版就使用 Manjaro 的初学者，那么你的选择最好是有限的。

这意味着更少的进入门槛，可供选择的声音服务器、显示服务器、显示管理器和/或窗口管理器太多会造成进入门槛。

一旦你对 Linux 发行版有了足够的了解，就可以对你的系统进行修补，随心所欲地添加一些东西。

如果你想定制你安装的系统，你必须在你的操作系统安装好后进行。

### 首次启动

在你安装了 Manjaro 或 EndeavourOS 之后，你会看到一个欢迎屏幕，对于一个刚接触 Linux 的人，或者刚接触 Manjaro 或 EndeavourOS 或基于 Arch 的发行版的人来说，它有一些有用的选项。

EndeavourOS 的选项包括更新镜像、更新系统、改变显示管理器（lightdm、gdm、lxdm 和 sddm）、浏览 AUR 软件包、安装 libreoffice、chromium、akm（[一个内核管理器][17]）等软件包。

在 Manjaro 方面，与 EndeavourOS 相比，我认为提供的选项是有限的，但我觉得它是“足够的有限”。

这只是你（作为初学者）开始使用 Manjaro 所需要的适当数量的东西。

Manjaro 欢迎屏幕上的几个选项是官方维基的链接、支持论坛、邮件列表、参与 Manjaro 开发、安装和/或删除应用程序等。

Manjaro 和 EndeavourOS 的欢迎屏幕上都有一个选项，如果你喜欢该项目和它的方向，你可以选择捐赠，但只有你有足够的钱才能这样做。

### 软件打包

让我们面对现实吧，操作系统的安装只是 Linux 发行版的一个部分。

软件包管理器和软件打包的方式对 Linux 发行版的稳定程度起着重要作用。

如果你在更新/安装一个软件包时，它更新了一个已经安装的库 —— 而其他软件包依赖于它，那么……这就很糟糕。它创造了所谓的“依赖性地狱”。软件包管理器应该处理这个问题。

那么，Manjaro 和 EndeavourOS 在这方面怎么比较呢？

好吧，因为 Manjaro 和 EndeavourOS 都是基于 Arch Linux 的，它们使用 Arch Linux 使用的 [pacman 软件包管理器][18]。pacman 的许多功能之一是它为你处理依赖关系。

#### Manjaro

尽管 Manjaro 使用 pacman 软件包管理器，但 Manjaro 有自己的软件库。

软件包每天从 Arch Linux 中取出，并在 Manjaro Unstable 软件库中 “镜像”，然后推送到 Manjaro Testing，用于 —— 你猜对了 —— 测试。

一旦这些软件包被认为是稳定的，它们就会被推送到主软件库供其他人安装。

安全更新则是通过 Manjaro 所谓的 “快速跟踪” 直接推送到公共软件包库，以更快地解决问题。

![Manjaro 测试 Arch Linux 软件包的稳定性][19]

这种测试软件包的方法可以确保不会因为某某被修改而出现意外的软件包损坏。

但是，这也意味着用户需要等待几周（通常是 2 到 4 周），才可以安装新版本的软件。

#### EndeavourOS

EndeavourOS 没有自己的软件库。他们依赖于 Arch Linux 主软件库，如果你使用 EndeavourOS，这样做你会得到最 “普通” 的体验。

如果你在同一台机器上安装 Arch Linux 和 EndeavourOS，除了桌面环境或窗口管理器和/或它们的主题以及安装体验外，几乎所有东西都应该保持不变。

### 包含的软件包

现在，你可能已经注意到 Manjaro 和 EndeavourOS 之间的差异模式了。

#### EndeavourOS

EndeavourOS 在理念上优先考虑最接近 Arch Linux。

有自定义的安装？有。

只安装必要的软件包以获得完整的桌面体验？对。

在发行库中拥有最前沿的软件包？没错。

EndeavourOS 让你有机会学习 Arch，而无需同时学习 EFI、驱动搜索和安装（看着你的 nVidia）、桌面环境/窗口管理器、显示管理器等。

它可以一次性设置好所有东西，让你有时间按照自己的节奏学习 Arch Linux 的内部工作。

![EndeavourOS 的强制 neofetch 截图][20]

#### Manjaro

而 Manjaro，在你使用它的整个过程中，它一直握着你的手（看看我做了什么？）。它处理从安装到软件包稳定性的一切，并让你可以即时获得安全更新。

它旨在用作你计算机的通用操作系统。

它默认安装了相当多的开源应用程序。这对一个新的 Linux 用户来说是非常有帮助的。

它为你安装了一些应用程序，如音频播放器、GUI 防火墙（gufw）、GIMP、HP 设备管理器、电子邮件客户端（thunderbird）、视频播放器（vlc）、办公套件（onlyoffic 桌面版）。

![Manjaro 的强制 neftech 截图][21]

### 我应该使用哪个？

嗯，这是你的决定。我只能根据他们的使用情况和目标受众推荐一个或两个。

如果你自认是一个普通电脑用户，只需要办公套件（[LibreOffice][22]、[ONLYOFFICE][23]）、媒体播放器和网页浏览器来做你的事情，我建议你试试 Manjaro，因为他们自己的仓库有 [大部分] 稳定的软件包，而且安装起来不费事。

但是，另一方面，如果你是一个以前使用过 [Ubuntu][24]、[Pop!_OS][25]、[Linux Mint][26]、[ElementaryOS][27]、[Fedora][28] 等发行版的人，现在想学习如何从窗口管理器到 GRUB 菜单来安装你的 Linux 发行版（没错，[构建 GRUB 也是个事][29]）。所以，如果你需要一个像 Arch 一样的基本 Linux 发行版，我会向你推荐 EndeavourOS。

现在你也可以说：*告诉 Fedora*，我使用 Arch 了。 ( ͡° ͜ʖ ͡°)

--------------------------------------------------------------------------------

via: https://itsfoss.com/endeavouros-vs-manjaro/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-arch-linux/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/manjrao-vs-endeavouros.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/what-is-desktop-environment/
[5]: https://endeavouros.com/
[6]: https://manjaro.org/download/
[7]: https://endeavouros.com/latest-release/
[8]: https://www.memtest.org/
[9]: https://wiki.syslinux.org/wiki/index.php?title=Hdt_(Hardware_Detection_Tool)
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/01_endeavour_options.webp?resize=800%2C434&ssl=1
[11]: https://itsfoss.com/linux-kernel-release-support/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/manjaro_install_grub.png?resize=800%2C597&ssl=1
[13]: https://forum.manjaro.org/t/memory-test-no-longer-included-on-live-isos/62074/2
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/manjaro_install_welcome.png?resize=800%2C452&ssl=1
[15]: https://wiki.manjaro.org/index.php/Installation_with_Manjaro_Architect
[16]: https://forum.manjaro.org/t/maintainer-s-wanted/19502
[17]: https://discovery.endeavouros.com/endeavouros-tools/akm/2021/08/
[18]: https://archlinux.org/pacman/pacman.8.html
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/04_manjaro_repos.webp?resize=569%2C439&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/03_neofetch_endeavouros-1.webp?resize=800%2C434&ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/02_neofetch_manjaro-1.webp?resize=800%2C434&ssl=1
[22]: https://www.libreoffice.org/
[23]: https://www.onlyoffice.com/
[24]: https://ubuntu.com/
[25]: https://pop.system76.com/
[26]: https://linuxmint.com/
[27]: https://elementary.io/
[28]: https://getfedora.org/
[29]: https://www.reddit.com/r/unixporn/comments/m5522z/grub2_had_some_fun_with_grub/

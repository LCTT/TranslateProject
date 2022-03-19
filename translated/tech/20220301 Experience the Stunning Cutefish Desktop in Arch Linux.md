[#]: subject: "Experience the Stunning Cutefish Desktop in Arch Linux"
[#]: via: "https://www.debugpoint.com/2022/02/cutefish-arch-linux-install/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

体验 Arch Linux 中令人惊叹的 Cutefish 桌面
======
现在你可以在 Arch Linux 中体验 Cutefish桌 面了。本文概述了在 Arch Linux 系统中安装 Cutefish 桌面环境的步骤。
![Cutefish Desktop in Arch Linux][1]

### Cutefish 桌面

前一阵子，[我们评论了 CutefishOS][2]，它的特点是看起来非常棒的 Cutefish 桌面，它得到了我们门户网站的读者的积极反应和关注。因此，我们认为这是一个完美的时机，如果你想在你最喜欢的 Arch Linux 中用这个桌面做一些实验。为什么不呢？

在你进入安装部分之前，这里有一些关于 Cutefish Desktop 的小知识。

Cutefish Desktop 是 [Cutefish OS][3] 的一部分，这是一个正在开发的新的 Linux 发行版。这个基于 Debian 的 Linux 发行版具有令人难以置信的外观、轻量级的 Cutefish 桌面。

Cutefish 桌面是以 Qt Quick、QML、C++ 和 KDE 框架为基础编写的内部工作。这个现代的桌面环境使用 KWin 和 SDDM 进行窗口和显示管理。

Cutefish 桌面带来了一个完整的 macOS，启发你寻找开箱即用的 Linux 桌面。 这意味着你可以获得令人惊叹的图标、壁纸、全局菜单、带有漂亮通知弹出窗口的顶部栏和底部 dock。

你可在[这里]阅读详细的评论。

### 在 Arch Linux 中安装 Cutefish 桌面

#### 安装基础 Arch 系统

本指南假设在尝试这些步骤之前，你的系统中已经安装了基本的 Arch Linux。或者，如果你也安装了任何基于 Arch 的 Linux 发行版，你也可以尝试。只是在这些情况下要注意显示管理的问题。

如果你是 Arch 的新手，你可以参考我们的 Arch Linux 安装指南。

  * [如何使用 archinstall 安装 Arch Linux（推荐）][4]
  * [如何安装 Arch Linux（基本指南）][5］



#### 安装 Cutefish 桌面

Arch Linux 社区仓库包含 Cutefish 组，其中有该桌面运行所需的所有组件。它包括核心软件包、原生应用和下面提到的附加工具。

在你的 Arch Linux 系统的终端提示下，运行下面的命令来安装所有 Cutefish Desktop 软件包。

```

    pacman -S cutefish

```

![A base Arch Linux prompt][6]

![Install Cutefish in Arch Linux][7]

接下来，我们需要通过下面的命令安装 Xorg 和显示管理器 SDDM。如果你将 Cutefish 桌面安装在安装有其他桌面环境的 Arch Linux 中，如 GNOME、KDE Plasma 或 Xfce，那么请注意。因为你已经安装了一个显示管理器和 Xorg。所以，你可以轻松跳过这一步。

```

    pacman -S xorg sddm

```

上述命令完成后，通过 systemctl 启用显示管理器。

```

    systemctl enable sddm

```

这就是裸机安装 Cutefish 桌面的全部内容。完成后，重启系统，登录后你应该看到 Cutefish 桌面如下。

基础安装需要额外的定制，因为它不像 Cutefish OS 那样接近。

### 安装后的配置

尽管 Arch 仓库中的 Cutefish 组包含了它的原生应用，如计算器和文件管理器，但桌面缺乏基本的应用，你需要单独安装这些应用来使它成为一个功能齐全的高效桌面。

我建议使用下面的命令来安装以下基本的应用。你可以跳过这一步，或者选择任何其他的应用/组合。

  * Firefox 网络浏览器
  * Kwrite 文本编辑器
  * Fonts（ttf-freefont）
  * VLC 媒体播放器
  * Gwenview 图像查看器
  * GIMP 图像编辑器
  * LibreOffice
  * Transmission



```

    pacman -S firefox ttf-freefont kwrite vlc gwenview gimp libreoffice-still transmission-qt

```

安装后，打开设置，改变你选择的字体。默认字体是 courier，它在桌面上看起来很糟糕。

按照你的选择完成所有的定制后，重启系统。然后享受 Arch Linux 中的 Cutefish 桌面。

![The Stunning Login Lock Screen of Cutefish Desktop][9]

### 结束语

这个桌面正在开发中，所以在写这篇文章时，你不会发现很多设置项目。例如，没有办法改变分辨率、隐藏 Dock 和其他选项。这就是说，你仍然可以用额外的应用来使用它，供你使用。如果你想做实验，你可以去试试。

干杯。

* * *

我们带来最新的科技、软件新闻和重要的东西。通过 [Telegram][10]、[Twitter][11]、[YouTube][12] 和 [Facebook][13] 保持联系，永远不会错过任何更新！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/cutefish-arch-linux-install/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/02/Cutefish-Desktop-in-Arch-Linux-1024x575.jpg
[2]: https://www.debugpoint.com/2021/11/cutefish-os-review-2021/
[3]: https://en.cutefishos.com/
[4]: https://www.debugpoint.com/2022/01/archinstall-guide/
[5]: https://www.debugpoint.com/2020/11/install-arch-linux/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/02/A-base-Arch-Linux-prompt.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/02/Install-Cutefish-in-Arch-Linux.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/02/The-Stunning-Login-Lock-Screen-of-Cutefish-Desktop-1024x576.jpg
[10]: https://t.me/debugpoint
[11]: https://twitter.com/DebugPoint
[12]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[13]: https://facebook.com/DebugPoint

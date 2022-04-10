[#]: subject: "Firefox 99 Brings These Two Changes for Linux Users"
[#]: via: "https://news.itsfoss.com/firefox-99-release/"
[#]: author: "Shobhit Singh https://news.itsfoss.com/author/shobhit/"
[#]: collector: "lujun9972"
[#]: translator: "zd200572"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Firefox 99为Linux用户带来了两点改变
======

Mozilla的Firefox是最受欢迎的开源浏览器之一，这也是它在许多Linux发行版（如Mint和Ubuntu）中用作默认浏览器的原因。

最近，Mozilla发布了Firefox 99.0版本，为Linux版本带来了新的安全和UI特性。

### 更新了什么呢？

  * 现在，您可以使用键盘快捷键“n”在阅读器模式中切换“讲述”。
  * 您可以在PDF查看器中找到对搜索的附加支持（带或不带音调符号）。
  * 添加了GTK叠加滚动条
  * Linux沙箱已得到加强：暴露于Web内容的进程不再有权访问X Window系统（X11）。
  * Firefox现在在德国和法国支持信用卡自动填充和捕获。



在本文中，我们将深入研究这些内容，并进一步扩展Linux版本特定的变化。

### GTK 叠加滚动条

这个版本的Firefox为滚动条配备了一个新的、时尚的和更窄的设计。如果不在使用中，滚动条也会隐藏，这让浏览器给人以更现代和优雅的感觉。

![][1]

但在稳定版中这个特性默认不启用。开启这个特性，转到`about:config`，搜索`widget.gtk.overlay-scrollbars.enabled`。这个值默认是`false`，双击它将设置为`true`，这将启用新的滚动条。

![][2]

### Linux沙箱得到加强

这是一个安全更新，目的是将Firefox进程与系统的其余部分隔离开来。沙箱环境是一个应用可以在不影响任何外部应用或与任何外部应用程序交互的情况下运行的环境。这次的更新禁止了任何Web进程和X server的互动。X server或 X11是Linux发行版的默认GUI服务器。

Snap，Flatpak和Appimage已经提供了在隔离容器中运行的App沙箱版本。如果你是一个Snap或者Appimage用户，这是个好消息。然而，有[报道称][3]这会破坏硬件加速功能。

_硬件加速是应用程序将某些任务加载到硬件的过程，从而提高性能和提高硬件使用效率。糟糕的硬件加速是Linux上电池性能不佳的原因之一。_

### 结束语

总之，这是Firefox最后一次大的两位数版本号更新，很高兴看到Firefox对隐私和安全的一贯决心。此版本中未解决的一些问题，例如与硬件加速相关的错误，希望在下次更新中得到解决。

这就把我们带到了Firefox 100。每日构建版本的Firefox 100已经发布。完整的稳定版本将在2022.5.3发布。它承诺提供诸如画中画格式的字幕和改进的硬件加速等功能。您可以通过在每日构建中的`about:preferences#experimental`启用`Firefox 100 User-Agent String`来尝试Firefox的这些实验性版本。

想要了解更多？查看一些不为人知的[Firefox功能，以获得更好的浏览体验][4].

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/firefox-99-release/

作者：[Shobhit Singh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/zd200572)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/shobhit/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjgxMCIgd2lkdGg9IjEwODAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU3IiB3aWR0aD0iNjc0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIvPg==
[3]: https://bbs.archlinux.org/viewtopic.php?id=275415
[4]: https://itsfoss.com/firefox-useful-features/

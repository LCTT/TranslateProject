[#]: subject: "Firefox 99 Brings These Two Changes for Linux Users"
[#]: via: "https://news.itsfoss.com/firefox-99-release/"
[#]: author: "Shobhit Singh https://news.itsfoss.com/author/shobhit/"
[#]: collector: "lujun9972"
[#]: translator: "zd200572"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14455-1.html"

Firefox 99 为 Linux 用户带来了两点改变
======

> 最新发布的 Firefox 浏览器为桌面 Linux 用户带来了两点改变。

![](https://news.itsfoss.com/wp-content/uploads/2022/04/firefox.png)

Mozilla 的 Firefox 是最受欢迎的开源浏览器之一，这也是它在许多 Linux 发行版（如 Mint 和 Ubuntu）中用作默认浏览器的原因。

最近，Mozilla 发布了 Firefox 99.0 版本，为 Linux 版本带来了新的安全性和 UI 特性。

### 更新了什么呢？

  * 现在，你可以使用键盘快捷键 `n` 在<ruby>阅读器模式<rt>ReaderMode</rt></ruby>中切换“<ruby>讲述<rt>Narrate</rt></ruby>”模式。
  * 你可以在 PDF 查看器中找到对搜索音调符号的附加支持。
  * 添加了 GTK 叠加滚动条。
  * Linux 沙箱已得到加强：暴露于 Web 内容的进程不再有权访问 X Window 系统（X11）。
  * Firefox 现在在德国和法国支持信用卡自动填充和捕获。

在本文中，我们将深入研究这些内容，并进一步扩展Linux版本特定的变化。

### GTK 叠加滚动条

这个版本的 Firefox 为滚动条做了一个新的、时尚的、更窄的设计。如果不在使用中，滚动条也会隐藏，这让浏览器给人以更现代和优雅的感觉。

![][1]

但在稳定版中这个特性默认没有启用。开启这个特性，转到 `about:config`，搜索 `widget.gtk.overlay-scrollbars.enabled`。这个值默认是 `false`，双击它将设置为 `true`，这将启用新的滚动条。

![][2]

### Linux 沙箱得到加强

这是一个安全更新，目的是将 Firefox 进程与系统的其余部分隔离开来。沙箱环境是一个应用可以在不影响任何外部应用，或与任何外部应用程序交互的情况下运行的环境。这个特别的更新禁止了 Web 进程和 X 服务器的任何互动。X 服务器（X11）是大多数 Linux 发行版中使用的默认 GUI 服务器。

Snap、Flatpak 和 Appimage 已经提供了其应用程序的沙盒版本。如果你是一个 Snap 或者 Appimage 用户，这是个好消息。然而，有 [报道称][3] 这会破坏硬件加速功能。

_硬件加速是应用程序将某些任务加载到硬件的过程，从而提高性能和提高硬件使用效率。糟糕的硬件加速是 Linux 上电池性能不佳的原因之一。_

### 结束语

总之，这是 Firefox 最后一次大的两位数版本号更新，很高兴看到 Firefox 对隐私和安全的一贯决心。此版本中未解决的一些问题，例如与硬件加速相关的错误，希望在下次更新中得到解决。

这就把我们带到了 Firefox 100。每日构建版本的 Firefox 100 已经发布。完整的稳定版本将在 2022.5.3 发布。它承诺提供诸如画中画格式的字幕和改进的硬件加速等功能。你可以通过在每日构建中的 `about:preferences#experimental` 启用 `Firefox 100 User-Agent String` 来尝试 Firefox 的这些实验性版本。

想要了解更多？查看一些不为人知的 [Firefox 功能，以获得更好的浏览体验][4]。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/firefox-99-release/

作者：[Shobhit Singh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/zd200572)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/shobhit/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/wp-content/uploads/2022/04/Before-After_gtk_overlay-scrollbars-edited.png
[2]: https://news.itsfoss.com/wp-content/uploads/2022/04/Overlay-scrollbar-config-option.png
[3]: https://bbs.archlinux.org/viewtopic.php?id=275415
[4]: https://itsfoss.com/firefox-useful-features/

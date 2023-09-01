[#]: subject: "Rolling-Release Ubuntu-based Rhino Linux Has Landed"
[#]: via: "https://news.itsfoss.com/rhino-linux-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16110-1.html"

一直在期待的基于 Ubuntu 的滚动发布 Rhino Linux 终于来了
======

![][0]

> Rhino Linux 绝对值得关注！

你可能还记得我们 [去年][1] 报道过，Rhino Linux 将会接替现已停止开发的 “[Rolling Rhino Remix][2]”。

经过漫长的等待，它的首个稳定版本终于发布了！

现在我们就一起来看看 Rhino Linux 有哪些值得特别关注的地方。

### Rhino Linux 到底是什么？ 🦏

![][3]

Rhino Linux 是一个基于 Ubuntu，使用了改版的 XFCE 4.18 以及 Pacstall 作为核心，提供了无忧用户体验的滚动发布版系统。

> 📋 滚动发布的系统能接收到规律的软件升级，而不只是负责维护修复。

采用 XFCE 4.18 使得 Rhino Linux 能利用各种新优化，比如 Thunar 文件管理器的提升，增强的桌面/面板 等等。

你可以查看我们的相关报道以了解更多。

> [Xfce 4.18 版本发布：令人印象深刻][4]

接着我们来说说 [Pacstall][5]，一个受到 AUR 启发的包管理器，它可以处理从内核安装到安装网页浏览器的所有任务。

所有与 Rhino Linux 相关的包都打包成 [pacscript][6]，任何操作系统的更新都可以通过 Pacstall 来完成。

**那么，这个发行版的感觉和表现如何？**

首次启动 Rhino Linux 时，你会遇到一个使用 Rust 构建的简洁现代的快速设置向导。

![][7]

> 📋 我们的网站上有一份新的 [Rust 基础教程系列][8]。你可以查看，学习一下 Rust 编程语言。

当你进行下一步时，你可以在三种不同的包管理器中进行选择：Flatpak ，Snap，以及 AppImage。

![][9]

这样的功能得益于他们自创的定制包管理包装器 rhino-pkg，它可以让你从各种支持的仓库中搜索、安装、移除和更新包。

相比于最新的官方 Ubuntu 版本，你可以自由选择从开箱即用的 Flatpak 开始。

然后还有一些额外设置你可以选择启用。

其中一个是启用这个精妙的基于 Python 的 apt 包管理前端，，[Nala][10]。

![][11]

另一个是 [Apport][13]，这是一个崩溃报告系统，在系统崩溃的情况下可以让开发者知道你的安装有任何问题。

完成这些设置后，你看见的是一个非常简洁的桌面布局，包括一个干净的壁纸和一个悬浮的程序坞。

![][14]

他们将自家桌面称为 “<ruby>独角兽桌面<rt>Unicorn Desktop</rt></ruby>”，这是一个基于大幅修改过的 XFCE 构建的桌面。

它的目标是将现代和传统的最佳实践结合在一起，为桌面用户体验提供包含两者优点的体验。

![][15]

独角兽桌面还包含了一些附加的免费软件解决方案，如 [uLauncher][16]（替代了 spotlight 的搜索工具）、lightpad（作为新的应用启动器）以及许多其他功能。

![][17]

可以 [在这里][18] 阅读更多关于他们定制桌面体验的信息。

总的来说，用户体验相对直观，而且 Rhino 主题的壁纸看起来很漂亮。

**还有其他亮点吗？**

当然有！

本次发布还包含了一个我很期待看到的引人注目的版本。

这是一个**用于 PinePhone 设备（原版/Pro 版）的 Rhino Linux 移植版**，基于最新的 **Ubuntu Touch（20.04）**，它是首个基于 XFCE 的移动环境。

正如你可以从负责这个移植的 Oren Klopfer 分享的视频中看到的，它还处在非常初步的状态。

他打算在 XFCE 4.20 发布时就进行切换，以获得 Wayland 的支持并摒弃 X11。

我迫不及待地想看到结果了！

在 [发布博客][19] 上你可以找到更多关于 Rhino Linux 的细节。

### 📥 获取 Rhino Linux

有三个不同版本供你选择，一个是通用 ISO，适用于 x86_64/ARM64 ，提到的PinePhone ISO，还有Raspberry Pi ISO。

你可以在 [此处][20] 下载对应的 ISO。

> **[Rhino Linux][20]**

你还可以使用其 [GitHub 仓库][21] 中的源代码从头构建。

我非常期待看到 Rhino Linux 在未来能做出什么。⭐

*（题图：MJ/c6cb42de-7196-4759-a9a6-10db8adbc058）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/rhino-linux-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/rhino-linux/
[2]: https://github.com/rollingrhinoremix
[3]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_1.png
[4]: https://news.itsfoss.com/xfce-4-18-release/
[5]: https://pacstall.dev/
[6]: https://github.com/pacstall/pacstall/wiki/Pacscript-101
[7]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_2.png
[8]: https://itsfoss.com/tag/rust/
[9]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_3.png
[10]: https://itsfoss.com/nala/
[11]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_4.png
[12]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[13]: https://wiki.ubuntu.com/Apport
[14]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_5.png
[15]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_6.png
[16]: https://ulauncher.io/
[17]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_7.png
[18]: https://rhinolinux.org/unicorn.html
[19]: https://rhinolinux.org/news-6.html
[20]: https://rhinolinux.org/download.html
[21]: https://github.com/rhino-linux
[22]: https://mastodon.social/@itsfoss
[23]: https://t.me/itsfoss_official
[24]: https://linuxhandbook.com/tag/bash-beginner/
[25]: https://itsfoss.community/
[26]: https://itsfoss.com/newsletter/
[0]: https://img.linux.net.cn/data/attachment/album/202308/19/225228tqqrndfredi8drge.jpg
[#]: subject: "Fedora 37: Top New Features and Release Wiki"
[#]: via: "https://www.debugpoint.com/fedora-37/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14968-1.html"

Fedora 37 新功能披露
======

![](https://img.linux.net.cn/data/attachment/album/202208/26/000924lz0vl82vsq2zf0v7.jpg)

> 关于 Fedora 37 及其新特性、发布细节等等。

Fedora 37 的开发工作已经结束，Beta 测试版即将来临。在这个阶段，Fedora 37 的功能和软件包已经最终确定。

在这篇常规的功能指南页面中，我总结了你应该知道的关于 Fedora 37 的基本功能，让你对预期的功能有一个概念。但是在这之前，先看看暂定的时间表：

* 测试版的发布日期是 2022 年 9 月 13 日。后备日期是 2022 年 9 月 20 日。
* Fedora 37 最终版计划于 2022 年 10 月 18 日发布。后备日期是 2022 年 10 月 25 日。

![Fedora 37 Workstation with GNOME 43][1]

### Fedora 37 的主要新功能

#### 内核

首先是构成核心的关键项目。Fedora 37 采用了 Linux 内核 5.19，这是目前最新的主线内核。Linux 内核 5.19 带来了一些基本功能，比如修复了 Retbleed 漏洞、支持 ARM、支持苹果 M1 NVMe SSD 控制器以及许多此类功能，你可以在我们的 [内核功能指南][2] 中了解更多。

使用最新内核的好处是，你可以保证你使用的是此时此刻最新、最好的硬件支持。

其次，桌面环境在这个版本中得到了更新。

#### 桌面环境

Fedora 37 是第一个带来令人惊叹的 GNOME 43 桌面的发行版，它带来了一些优秀的功能，比如：

* [重新改版后的快速设置功能][3]，带有药片式按钮
* 移植了 GTK4 和 libadwaita 的文件管理器 v43（nautilus）
* 带有橡皮筋、徽章、响应式侧边栏等功能的文件管理器
* 更新了 GNOME Web，支持 WebExtension API

还有许多你期待了多年的功能。请查看我的 [GNOME 43 功能指南][4] 以了解更多。

Fedora 37 带来了 KDE Plasma 5.26 桌面环境，包括大量的新功能、性能改进和错误修复。KDE Plasma 桌面最值得注意的功能包括：

* 一个更新的概览屏幕
* 深色和浅色主题的动态墙纸
* 更新的 KDE 框架和应用程序

由于轻量级桌面 LXQt 更新了稳定版 1.1.0，它来到了 Fedora 37 中。LXQt 1.1.0 为深色主题带来了一个外观统一的默认调色板、应用程序菜单的两个变体（简单和紧凑）和重新排列的 GTK 设置。此外，LXQt 1.1.0 也开始了 Qt 6.0 桌面组件移植的初始工作。所有这些 bug 修复和增强功能都在 Fedora LXQt 版本中出现。

此外，其他主要的桌面版本由于没有重要的新的更新到来，仍然保持在当前版本，即 Xfce 4.16 和 MATE 1.24 用在各自的 Fedora 定制版中。

让我们看看这个版本中影响所有 Fedora 定制版的系统级变化是什么。

#### 系统级的变化

最重要的变化是对树莓派 4 的正式支持。得益于多年来的努力，你现在可以在最喜欢的树莓派上享受到开箱即用的 Fedora 37 了。

Fedora Linux 一直是推动技术发展的先锋，在其他发行版之前就采用了最新的功能。因此，现在在 KDE Plasma（和 Kinoite）和不同的定制版中，SDDM 显示管理器默认采用了 Wayland。这样，从 Fedora 发行版方面就完成了 Wayland 各个定制版的过渡。

正如我 [之前的报道][5]，Fedora Linux 37 计划为我们提供 Anaconda 的网页安装程序的预览镜像。它可能不会在发布后立即可用，但它应该在发布后的几天内出现。

其他值得注意的功能包括将默认的主机名从 `fedora` 改为 `localhost`，以避免一些第三方系统配置检测问题。

除此之外，Fedora Core OS 被打造为 Fedora 官方版本，现在与服务器版、物联网版和云计算版同列，以便你可以更好地发现和采用它。最小资源占用的 Fedora Core OS 主要用于容器工作负载，并带来了自动更新和额外的功能。

遵循传统，这个版本也有一个 [全新的墙纸][6]，有夜间和白天两个版本。我必须得说，它看起来很棒（见上面的桌面图片）。

最后，在这个版本中，Fedora 删除了 32 位的 Java 包，包括 JDK 8、11 和 17，因为使用率很低。此外，openssl 1.1 软件包也被弃用。

工具链、应用程序和编程栈更新如下：

* Glibc 2.36 和 Binutils 2.38
* Node.js 18.x
* Perl 5.36
* Python 3.11

### Fedora 37 功能摘要

那么，这个版本的功能就到此为止了。下面是对 Fedora 37 功能的总结：

* Linux 内核 5.19
* GNOME 43
* KDE Plasma 5.26
* Xfce 4.16
* MATE 1.24
* LXQt 1.1.0
* 新的基于网页的安装程序的预览镜像
* SDDM 显示管理器默认采用 Wayland（在 KDE Plasma 和其他桌面环境中）。
* 官方支持树莓派 4
* Fedora Core OS 成为官方版本
* 一些关键软件包放弃了 32 位支持
* 还有相关的工具链和编程语言更新。

如果你有空闲时间，你可以 [体验一下][7]。虽然，它是非常不稳定的，不推荐运行测试版之前的开发版。

**那么，这个版本中你最喜欢的功能是什么？请在评论区告诉我**。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/fedora-37/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/Fedora-37-Workstation-with-GNOME-43-1024x572.jpg
[2]: https://www.debugpoint.com/linux-kernel-5-19/
[3]: https://www.debugpoint.com/gnome-43-quick-settings/
[4]: https://www.debugpoint.com/gnome-43/
[5]: https://debugpointnews.com/fedora-37-anaconda-web-ui-installer/
[6]: https://debugpointnews.com/fedora-37-wallpaper/
[7]: https://dl.fedoraproject.org/pub/fedora/linux/development/37/Workstation/x86_64/iso/

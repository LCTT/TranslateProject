[#]: subject: "Fedora 35 Debuts With GNOME 41 and a New KDE Variant"
[#]: via: "https://news.itsfoss.com/fedora-35-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13949-1.html"

Fedora 35 登场：带来了 GNOME 41 和一个新的 KDE 变体
======

> Fedora 35 发布了，带来了 GNOME 41，并有一个专注于可靠性的基于 KDE 的新变体。

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/fedora-35-release.png?w=1200&ssl=1)

在测试版发布几周后，Fedora 35 稳定版终于来了！这个版本带来了一些关键性的改进，我们将在这里介绍它们。

这些改进中最值得注意的是加入了最近发布的 GNOME 41，同时还有一些小的升级，如 Linux 内核 5.14 和完成向 PipeWire 的过渡。

现在，让我们来简要看一下这些变化，以及 Fedora 35 引入的一些改进。

### Fedora 35 的关键升级

下面是 Fedora 35 中一些比较有影响的升级和新增功能。

### 桌面环境

Fedora 因其对最新桌面环境的支持而闻名，而这一点在这个版本中似乎没有改变。

#### GNOME 41

![][9]

Fedora 35 工作站现在搭载了目前最受欢迎的 GNOME 41。这意味着它有了新的“<ruby>连接<rt>Connections</rt></ruby>”应用、显著改进的软件中心，以及一些很棒的多任务控制。

它还对笔记本用户有所帮助，因为它改进了触摸板手势、电源配置文件和移动数据设置。

如果你想看看还有什么新东西，你可以看看我们的 [GNOME 41 发布报道][2]。

#### KDE Plasma 5.22

![][10]

不过，这个版本并不包括最近发布的 Plasma 5.23，而是选择了 [Plasma 5.22][3]。不过，这是可以理解的，因为 Fedora 团队只有一周的时间。

虽然是一个相当小的升级，Plasma 5.22 确实带来了自适应透明功能，以及改进的 Krunner 和系统设置。如果你有兴趣，你可以看看 [KDE Plasma 5.22][3] 的更多信息。

### 新的 KDE 版本：Fedora Kinoite

![][11]

Fedora Kinoite 采用 KDE Plasma 桌面，并且它是基于 rpm-ostree 技术的。你可以得到开箱即用的 Flatpak 应用程序支持，以轻松安装软件。

根据其官方的描述：

> “Kinoite 提供原子更新和一个不可变操作系统，以提高可靠性。”

因此，它可能是一个值得尝试的选择，可以作为你的 Linux 桌面操作系统用于日常工作，而不存在因更新而破坏用户体验的风险。

截至目前，它支持 X86_64 和 AArch64 架构。你可以去它的 [项目网站][4] 了解一下。

### Linux  5.14 内核

早在八月份，我就介绍了 [新的 Linux 5.14][5] 内核，它现在已经出现在了 Fedora 35 中。这对那些基于 ARM 的系统来说是个好消息，因为 Linux 5.14 带来了许多针对 ARM 的改进。

如果你没有使用 ARM 计算机，你仍然会从 Linux 5.14 的一些其他改进中受益。这些改进主要与 GPU 有关，以及对 USB 4 的改进支持。

#### DNS over TLS 支持

随着隐私变得越来越重要，像 DNS over TLS（DoT）这样的技术正在成为我们隐私的一个关键部分。现在，Fedora 35 带来了对这项技术的支持，它有助于加密你进出 DNS 服务器的互联网流量。

这意味着你的 ISP 不能监视你的浏览习惯，我相信每个人都会喜欢这一点。

### 其他改进

除了前面提到的那些，Fedora 35 还带来了对以下新功能的支持。

  * Firewalld 软件包更新
  * GNU 工具链更新
  * 支持第三方软件库中的 Flathub 应用程序
  * Fedora Cloud 默认采用 btrfs 文件系统
  * 过渡到 Pipewire

如果你想看完整的变化列表，可以在 [官方更新列表][6] 或 [官方公告][7] 中找到。

### 总结

虽然这个版本没有像 Fedora 34 那样带来很多突破性的改进，但我认为用户会对它更加满意。在 GNOME 41 和 Linux 5.14 之间，用户应该会发现他们的系统有了不错的改进。

如果你想亲自尝试一下 Fedora 35，请随时从下面的链接中下载它。

- [下载Fedora 35][8]

你对 Fedora 35 中引入的变化有什么看法？请在下面的评论中告诉我！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-35-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[2]: https://news.itsfoss.com/gnome-41-release/
[3]: https://news.itsfoss.com/kde-plasma-5-22-release/
[4]: https://kinoite.fedoraproject.org/
[5]: https://news.itsfoss.com/kernel-5-14-release/
[6]: https://fedoraproject.org/wiki/Releases/35/ChangeSet
[7]: https://fedoramagazine.org/announcing-fedora-35/
[8]: https://getfedora.org/
[9]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/Gnome-41-Fedora.png?w=1366&ssl=1
[10]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/KDE-5.22-Fedora.png?w=1366&ssl=1
[11]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/kde-kinoite.jpg?resize=1568%2C882&ssl=1
[#]: subject: "Fedora 36 Release Date and New Features"
[#]: via: "https://news.itsfoss.com/fedora-36-release-date-features/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14316-1.html"

Fedora 36 发布时间表和新功能
======

>  Fedora 36 很快就要发布了，预期会有哪些功能呢？还有，它准备什么时候发布？

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fedora-36-release.jpg?w=1200&ssl=1)

Fedora 36 是 [今年最值得期待的发布][1] 之一。

虽然我们期待每一个重要的发布，但去年，[Fedora 35][2] 以 GNOME 41 和一个新的 KDE 流派（Kinoite）让人期待它带来一些令人兴奋的变化。

别着急；如果你等不及要看到 Fedora 36，我将重点指出有关该版本的基本细节。

### Fedora 36 发布日期

按照官方的时间表，Fedora 36 测试版的早期发布日期是 **2022 年 3 月 15 日**。而且，Fedora 36 测试版的延迟发布日期（万一延迟）是 **2022 年 3 月 22 日**。

一旦公开测试完成，最终的发布日期可望在 **2022 年 4 月 19 日**。如果出现延迟，发布日期将被推至 **2022 年 4 月 26 日**。

你还应该注意，Fedora Linux 34 将在 **2022 年 5 月 17 日** 走到其生命的终点。

![][3]

你现在可以尝试用每夜构建版来下载 Fedora 36（链接在本文底部），但是距离测试版发布还有几周时间，你应该等等。

### Fedora 36 功能

![][4]

像往常一样，Fedora 36 拥有最新的 GNOME 以及其他的补充和改进。

主要的亮点包括：

#### 1、GNOME 42

[GNOME 42][5] 是一次令人兴奋的升级，有各种视觉和功能的变化。

它还包括性能和视觉上的调整及其他改进。如果你没了解过 [GNOME 41 增加的功能][6]，你也应该看看。

当然，你可以预期在 Fedora 36 中找到所有这些变化。在这里，我将重点指出那些 Fedora 36 中的细节（如果你没有用上 GNOME 42）。

### 2、全系统的深色模式

![][7]

Fedora 36 享有从 GNOME 42 引入的全系统深色模式。

虽然在其他 Linux 发行版上有深色模式的实现，但 GNOME 42 帮助 Fedora 36 成为桌面用户的一个有吸引力的选择。

深色模式完美地融合在一起，给人一种干净的 GNOME 体验。

### 3、新壁纸

如果没有一张新的壁纸，其他的改进听起来都很乏味。

所以，Fedora 设计团队在 Fedora 36 中带来了一张制作精美的壁纸，这是一张风景插图，看起来很不错。

![][8]

默认的壁纸有日间/夜间的变体。正如你所注意到的上面的白天的壁纸，下面是晚上的艺术作品。

![][8a]

两者看起来都很奇妙，对眼睛也很舒畅。

### 4、Linux 内核 5.17

众所周知，Fedora 36 提供最新的 Linux 内核版本。截至目前，它正在运行即将发布的 Linux 内核 5.17 的候选版本。

随着 Fedora 36 的最终发布，你应该看到 Linux 内核 5.17 的稳定版本。

### 5、深色/浅色壁纸

除了 Fedora 36 的新默认壁纸之外，它还具有与 GNOME 42 一起引入的深色/浅色模式壁纸集。

![][9]

截至目前，在测试 Fedora 36 工作站（预发布版本）时，我只能找到其中一张壁纸，而不是 GNOME 42 中的整个系列。

所以，你也许可以期待在 Fedora 36 测试版中增加更多的内容。

你可以从外观上选择壁纸及其可用的深色/浅色变体。

### 6、屏幕截图用户界面和本地屏幕录制

GNOME 42 引入的新的屏幕截图用户界面是一个奇妙的补充。另外，只需切换一下，你就可以开始录制你的屏幕了！

![][10]

你可以看到 Fedora 36 的这个功能，工作得非常好。

### 7、桌面环境更新

由于显而易见的原因，你应该在 Fedora 36 看到提供的最新的桌面环境。

最基本的应该是 GNOME 42、[KDE Plasma 5.24][11] 和 Xfce 4.16。

除此之外，LXQt 也已经更新到 1.0.0。

### 8、重要的技术变化

除了视觉上的变化和 Linux 内核的升级，Fedora 36 还有各种技术改进。

其中一些值得一提的包括：

  * 将系统的 openJDK 包从 Java 11 更新为 Java 17。
  * 引入了即将推出的 Golang 1.18 版本。
  * 将各种语言的字体切换为 Noto 字体作为默认字体，以确保文本渲染的一致性。
  * 今后自动升级时排除推荐软件包的行为（如果你没有安装它们）。
  * GNU 工具链更新至 gcc 12 和 glibc 2.35。
  * 修复某些情况下的升级性问题。
  * 默认的 Wayland 会话与 NVIDIA 专有驱动程序。
  * 更新 PHP 栈到最新的 8.1.x。
  * RPM 数据库将被重新定位到 `/usr` 目录，目前它在 `/var`。

关于更多的技术细节，你可以参考 [官方变更集][12]。如果你想下载预发布版本，你可以从下面的链接抓取 ISO。

- [Fedora 36（预发布）][13]。

### 总结

Fedora 36 将会是一个令人激动的版本。

当它发布时，我很期待在 Fedora 36 工作站上尝试 Wayland 会话与 NVIDIA 专有驱动程序。

你对这个版本有什么期待？请在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-36-release-date-features/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/linux-distro-releases-2022/
[2]: https://news.itsfoss.com/fedora-35-release/
[3]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fedora-36-screen.jpg?w=1200&ssl=1
[4]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fedora-36-pre-neofetch.png?w=1008&ssl=1
[5]: https://news.itsfoss.com/gnome-42-features/
[6]: https://news.itsfoss.com/gnome-41-release/
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fedora-36-dark-mode.jpg?resize=1568%2C740&ssl=1
[8]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/f36-01-day.jpg?w=1200&ssl=1
[8a]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/f36-02-night.jpg?w=1200&ssl=1
[9]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fedora-36-pre-wallpapers.jpg?w=1126&ssl=1
[10]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fedora-36-screenshot-tool.jpg?w=738&ssl=1
[11]: https://news.itsfoss.com/kde-plasma-5-24-lts-release/
[12]: https://fedoraproject.org/wiki/Releases/36/ChangeSet
[13]: https://kojipkgs.fedoraproject.org/compose/branched/latest-Fedora-36/compose/Workstation/x86_64/iso/

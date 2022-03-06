[#]: subject: "Oldest Active Linux Distro Slackware Finally Releases Version 15"
[#]: via: "https://news.itsfoss.com/slackware-15-release/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14243-1.html"

最古老的活跃 Linux 发行版 Slackware 终于发布了第 15 版
======

> 带着 Linux 内核 5.15 LTS 和 KDE Plasma 5.23 的最新改进，Slackware 15.0 已经来到。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/Slackware-15-release.png?w=1200&ssl=1)

欢呼吧！Linux 粉丝们会很高兴地知道，传奇发行版 Slackware 在很久之后发布了一个新版本。或许你不知道，Slackware 上一个版本的发布要追溯到 2016 年。

当开发者在去年（2021 年）2 月宣布 Slackware 15.0 的计划时，整个 Linux 社区都为此感到兴奋。

从年初的 Alpha 版本开始，在过去的一年里，开发人员在 Slackware Linux 15.0 的开发中取得了快速进展。经过一段时间后，他们发布了其最后一个候选版本，但现在它发布了！

让我们来看看 Slackware 15.0 有哪些新内容。

### Slackware 15.0 的新内容

![][1]

如前所述，Slackware 15.0 有许多变化。不要忘了，在最终发布之前，它可是发布了一个测试版和两个候选发布版（RC）。

如果你一直在关注我们的报道，早在去年 4 月份你就可能已经看到了我们的 [测试版][2] 报道。

在测试版 / RC 版中，还有一些东西没有被披露。因此，在这里，我们会介绍它的所有重要内容。

#### Linux 内核 5.15 LTS

Slackware 15 的主要亮点是增加了最新的 [Linux 内核 5.15 LTS][3]。这与我们在测试版中注意到的 Linux 内核 5.10 LTS 相比，有了很大的飞跃。

![][4]

值得注意的是，Slackware 团队在确定使用 Linux 内核 5.15.19 之前测试了数百个 Linux 内核版本。在发布说明中提到：

> 在最终宣布 Slackware 15.0 稳定版的过程中，我们在过去一年里实际上构建了超过 400 个不同的 Linux 内核版本（相比之下，我们在开发 Slackware 14.2 时测试了 34 个内核版本）。在 Greg Kroah-Hartman 确认 5.15.19 版内核将获得至少到 2023 年 10 月（很可能比这更久）的长期支持后，我们最终选择了它。

如果你感到好奇，Linux 内核 5.15 带来了一些更新，如增强的 NTFS 驱动支持和对英特尔 / AMD 处理器以及苹果 M1 芯片的改进。它还增加了对英特尔第 12 代处理器的初步支持。

总的来说，有了 Linux 内核 5.15 LTS，对于这个最古老的活跃 Linux 发行版，你应该会得到良好的硬件兼容性。

Linux 内核提供了两种版本，一种是带驱动的，不需要 initrd；另一种是依靠 initrd 来加载内核模块。发行说明中提到了更多关于它的内容：

> 像往常一样，内核提供了两种类型：通用内核和巨型内核。巨型内核包含足够多的内置驱动程序，在大多数情况下不需要 initrd 来启动系统。通用内核需要使用 initrd 来加载挂载根文件系统所需的内核模块。使用通用内核可以节省一些内存，并可能避免一些启动时的警告。我强烈建议使用通用内核以获得最佳的内核模块兼容性。

#### KDE Plasma 5.23 和 Xfce 4.16

谈到 KDE，你应该会发现 KDE Plasma 软件包更新到了 5.23，而 KDE 框架则更新到了 5.88 版本。

[KDE Plasma 5.23][5] 是 KDE 的 25 周年纪念版，包括了 UI 的改进，以及一系列细微的变化来改善用户体验。

除此之外，Slackware 15 还配备了 Xfce 4.16 作为桌面环境选项之一。

#### 对 PipeWire 和 Wayland 的支持

作为 PulseAudio 的替代品，Slackware 15 加入了对 PipeWire 的支持。

而且，对于那些想摆脱 X11 的用户来说，对 Wayland 的支持也在这个版本中出现。

#### 32 位支持

因为 Slackware 是 [适合 32 位系统的 Linux 发行版][6] 之一，最新版本提供了特定的内核版本来支持它。

从技术上讲，有 SMP 和非 SMP 内核，分别用于单核和多核处理器。

建议使用 SMP 内核以获得更好的性能和内存管理，但是如果你的处理器比奔腾 3 还要老，非 SMP 内核应该会派上用场。

#### 其他改进

![][7]

一些技术上的升级包括 GCC 编译器升级到 11.2.0 版本。相当多的安全和错误也得到了解决。

公告上还说，开发人员正专注于将 Python 更新到 3.3.4 版本，以修复 Samba 的构建。

其他基本软件包和应用程序，如网络管理器、OpenSSH、Krita、Falkon 浏览器和 Ocular 也得到了升级。Mozilla Firefox 和 Thunderbird 也被更新到它们最新的可用软件包。

如果你想获得这个版本的所有技术细节，你可以查看 [官方更新日志][8]。其它一些重要的内容包括：

  * 改进了 Slackware pkgtools，使软件安装体验无障碍，消除了并行冲突。
  * Slackware 15 首次包括一个 `make_world.sh` 脚本，以帮助从源代码重建整个操作系统。
  * 增加了更多的脚本，以方便重建安装程序和内核包。
  * 抛弃了 Qt4，转而使用 Qt5。
  * 增加了对<ruby>特权访问管理<rt>Privileged Access Management</rt></ruby>（PAM）的支持，以支持那些不支持<ruby>影子<rt>shadow</rt></ruby>密码的较新项目。

值得注意的是，你不能简单地从 Slackware 14.2 升级。因此，最好是进行一次全新的安装。

- Slackware 15 x86_64： ftp://ftp.slackware.com/pub/slackware-iso/slackware64-15.0-iso
- Slackware 15 x86_32： ftp://ftp.slackware.com/pub/slackware-iso/slackware-15.0-iso


无论是哪种情况，你都应该保留一份数据备份，如果你对使用新的 ISO 安装不感兴趣，可以尝试按照 [官方升级说明][10] 来进行。

### 总结

Slackware 是最古老的仍然活跃的 Linux 发行版，我很高兴看到 Slackware 有了新的版本。

虽然它仍然推荐给有经验的用户或手工爱好者使用，但最新的 Slackware 15.0 也支持 UEFI 和旧系统。如果你正在寻求冒险，并希望为你的桌面安装一个独特的 Linux 发行版，你可以试试 Slackware 15。

你用过 Slaceware 吗？你会测试 Slackware 15.0 吗？你认为 Slackware 的未来会是怎样的呢？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/slackware-15-release/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/slackware-15-screenshot.png?w=1278&ssl=1
[2]: https://news.itsfoss.com/slackware-15-beta-release/
[3]: https://news.itsfoss.com/linux-kernel-5-15-release/
[4]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/slackware-15-about.png?w=775&ssl=1
[5]: https://news.itsfoss.com/kde-plasma-5-23-release/
[6]: https://itsfoss.com/32-bit-linux-distributions/
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/slackware-firefox.png?w=679&ssl=1
[8]: http://www.slackware.com/changelog/current.php?cpu=x86_64
[9]: http://www.slackware.com/
[10]: https://ftp.osuosl.org/pub/slackware/slackware64-15.0/UPGRADE.TXT

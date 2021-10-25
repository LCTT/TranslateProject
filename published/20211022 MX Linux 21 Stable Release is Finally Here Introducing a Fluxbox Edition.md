[#]: subject: "MX Linux 21 Stable Release is Finally Here Introducing a Fluxbox Edition"
[#]: via: "https://news.itsfoss.com/mx-linux-21-release/"
[#]: author: "Omar Maarof https://news.itsfoss.com/author/omar/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13912-1.html"

MX Linux 21 稳定版发布
======

> 基于 Debian 的 MX Linux 21 现已经推出，带来了一些不错的改进。

![](https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/09/mx-linux-21-release-ft.png?w=1200&ssl=1)

[MX Linux][1] 是一个基于 Debian 的 Linux/GNU 发行版，旨在追求优雅、稳定和性能。

我们之前报道过它的 [尚处于测试阶段的新 Fluxbox 版][2]，但现在稳定版出来了。让我们来探讨一下 MX Linux 21 “Wildflower” 的新内容。

### MX Linux 21 主要亮点

![][3]

MX Linux 21 基于 Debian 11 “Bullseye”，运行 Linux 5.10LTS 内核。在这次的新更新中，你可以发现一些新的应用和对当前应用的升级。

![][4]

“Wildflower” 系列包括一个带有 Fluxbox 1.3.7 的新版本，它可以使旧电脑重新焕发活力。补充一下，Fluxbox 是一个窗口管理器，可以在高端计算机上无缝工作，但资源占用很少。

它的安装程序有一个新的分区选择区，支持 LVM（逻辑卷管理器）。

![MX Linux 21 有一个漂亮的图形化安装程序][3]

当启动系统时，无论你是使用<ruby>临时启动<rt>live boot</rt></ruby>还是持久化使用，你都可以选择使用新的 UEFI 临时系统启动菜单，而不是旧的控制台菜单。

对于桌面环境，Xfce 4.16 和 KDE Plasma 5.20 都是最新版本。

然而，还没有 Xfce 版。

它新提供的一个方便的工具是在管理任务中默认使用管理员密码。然而，如果你不需要它，你可以把它关掉。

### 其他改进

  * 安装程序和临时系统已经更新到最新版本。
  * 大部分的翻译仍在进行中。另一方面，有些部分的翻译工作完成的很好的。
  * 默认软件包集现在包括 [Mesa Vulkan][5] 驱动。
  * 对某些 Realtek 硬件的 Wi-Fi 有了更好的支持。
  * 已默认启用 Debian 安全库。
  * Xfce 有了一些改进，其中之一是为 Thunar 文件管理器增加了一个 samba 共享插件。
  * KDE 对其文件管理器 Dolphin 进行了修复。

![][3]

### 总结

MX Linux 21 是它目前最新的稳定版本。更加优雅，性能更强，因此更加适合作为日常使用。

尽管与其他流行的选择相比，MX Linux 是一个相对较新的 Linux/GNU 发行版，但它在提供一个由 Debian、MX 存储库和 [antiX Linux][6] 支持的完整操作系统方面有很大的潜力。

你可以参考 [官方公告][7] 了解更多细节。

- [下载 MX Linux 21][8]

你对这个版本有什么看法？你碰巧在使用 MX Linux 吗？请在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mx-linux-21-release/

作者：[Omar Maarof][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/omar/
[b]: https://github.com/lujun9972
[1]: https://mxlinux.org/
[2]: https://news.itsfoss.com/mx-linux-21-fluxbox-beta-release/
[3]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/09/MX_Linux_21-1.png?w=1366&ssl=1
[4]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/mx-linux-21-fluxbox.png?w=902&ssl=1
[5]: https://www.mesa3d.org/
[6]: https://antixlinux.com/
[7]: https://mxlinux.org/blog/mx-21-wildflower-released/
[8]: https://mxlinux.org/download-links/

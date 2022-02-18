[#]: subject: "Nobara Project Aims to Offer an Unofficial Fedora Linux 35 Spin Tailored for Gaming"
[#]: via: "https://news.itsfoss.com/fedora-nobara-gaming/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14282-1.html"

Nobara：一个为游戏量身定做的非官方 Fedora Linux 35 衍生版
======

> Nobara 项目添加了必要的软件包/工具，并修复了一些问题，使 Fedora Linux 适合游戏，并计划在未来进行进一步的完善！

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fedora-nobara-project-gaming.png?w=1200&ssl=1)

Fedora 35 是一个令人印象深刻的 Linux 发行版，在这个版本中首次推出了 GNOME 41 并引入了一个新的 KDE 变体。

你可以阅读我们的 [原始报道][1]，了解更多关于它的信息。

虽然 Fedora Linux 一直在不断改进桌面体验，但它可能不是每个用户的理想桌面发行版。此外，即使它包括开箱即用的开源工具和实用程序，它也不是为了提供毫不费力的游戏体验。

你需要安装一些依赖性的东西，并配置好发行版，才能轻松地玩一个游戏。

由红帽工程师 Thomas Crider（又名 Glorious Eggroll）发起 的 Nobara 项目旨在改变这种状况，并提供一个为游戏而生的非官方 Fedora 35 工作站衍生版。

### Nobara 工作站 35 有什么新东西？

Fedora 35 支持几个 Linux 游戏。然而，如果你需要使用 Proton 或 Wine 来玩 Windows 专属的游戏，你得配置一些东西，并可能需要排除一些游戏中的故障。

所以，Nobara 项目旨在提供一个非官方的衍生版，为其添加用户友好的修复，使其成为 Linux 玩家的理想选择。

![][2]

#### 对于 Fedora 35 的小白用户

如果你已经使用了一段时间的 Linux，并且能够自如地使用 Linux终端，你应该知道 [在 Linux 上设置 Wine][3]、Proton 和安装任何额外的编解码器是相当容易的。

然而，对于依赖预装包和软件中心提供的应用程序的小白用户来说，他们需要做出一些努力来了解它。

#### Lutris、Steam、OBS Studio 和 Kdenlive 预装版

Lutris 可以帮助你在 Linux 上管理和进行游戏。不要忘了，它已经 [帮助 Linux 成长为一个适合游戏的平台][4]，提供了一个易于使用的 GUI，让用户可以玩只支持 Windows 的游戏。

使用 Nobara 工作站 35，已经预装了 Lutris。这个项目背后的开发者也正好在维护 Lutris。因此，可以在 Nobara 工作站 35 上看到 Lutris 的最新版本。

不仅仅是 Lutris，你还会得到 Steam、OBS Studio 和 Kdenlive 的支持。

当然，顺便说一句，你也会得到标准的 Fedora 工作站软件包。

#### 对游戏的修复

在 Fedora 35 上玩几个游戏时有一些已知的问题。该项目提到，游戏开发者希望 Fedora 解决这些问题，显然，Fedora 将问题抛给了游戏开发者。而这些问题仍然没有解决。

因此，在 Nobara 工作站 35 中，其中一些问题已经得到解决。问题如：

  * 由于 libusb 和 xow（Xbox One 无线加密狗的驱动）的问题导致 CPU 负载过高
  * 为 Dying Light 添加必要的符号链接

#### X11 作为默认的显示服务器

Wayland 可能提供了比 X11 会话更多的技术改进。然而，X11 与游戏的兼容性更好。

此外，它也是 AMD 的 FSR 技术、以及 [Steam Play/Proton][5] 和 Wine 的一些其他东西的可以工作的必要条件。

#### 其他变化

考虑到 Nobara 工作站 35 相对较新，令人惊讶的是，你可以发现一些明显的不同。

一些值得一提的关键亮点包括：

  * Nobara 工作站 35 禁用了 Fedora 官方软件库中的一些软件包，而倾向于使用自己的。例如，与 Fedora 的官方软件库相比，你应该在 Nobara 的软件库中找到一个更新一些的 Lutris 版本。
  * Nobara 工作站 35 使用了一个定制的内核。
  * [RPM Fusion 仓库][6] 是默认启用的。
  * 用于 Wine 64/32 位游戏兼容性的额外软件包。

开发者计划很快通过添加以下内容来进一步改进它。

  * 添加自定义的 OBS Studio 及浏览器集成插件，和 vulkan+opengl 捕捉支持。
  * Nobara 特定的主题设计。
  * 包括 [Proton-GE][7] 和 Lutris Win-GE 的构建。

你可以在其 [官方网站][8] 上了解其他技术变化。

### 结束语

如果 Nobara 项目使 Fedora Linux 适用于游戏，我们应该多了一个 [以游戏为重点的 Linux 发行版][9]。

对于适应 Fedora Linux 的 Linux 玩家来说，这将是一个不错的选择。

- [下载 Nobara 工作站 35][8]

你可以从其官方网站下载合适的 ISO（GNOME 和 KDE 版本）来尝试。请注意，这是一个相当新的衍生版，所以在它取代作为你的日常用机之前，你可能要三思而行。

你对 Noboara 项目有什么看法？我们是否需要一个针对游戏的 Fedora Linux 版本？请在评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-nobara-gaming/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/fedora-35-release/
[2]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fedora-nobara-scaled.jpg?resize=1568%2C773&ssl=1
[3]: https://itsfoss.com/use-windows-applications-linux/
[4]: https://news.itsfoss.com/lutris-creator-interview/
[5]: https://itsfoss.com/steam-play/
[6]: https://itsfoss.com/fedora-third-party-repos/
[7]: https://github.com/GloriousEggroll/proton-ge-custom
[8]: https://nobaraproject.org/
[9]: https://itsfoss.com/linux-gaming-distributions/

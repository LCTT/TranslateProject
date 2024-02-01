[#]: subject: "Valve is Not Happy With Ubuntu's Snap Version of Steam: Here's Why"
[#]: via: "https://news.itsfoss.com/valve-steam-snap-ubuntu/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16590-1.html"

Valve 对于 Ubuntu 的 Snap 版本的 Steam 并不满意：原因何在
======

![][0]

> 你可能会发现，Snap 版本的 Steam 并不如你期待的那样好，你怎么看？

近年来，由于 Wine、Proton 等工具的兴起，在 Linux 上 [玩游戏][1] 变得非常容易。

甚至，**越来越多的游戏开发商为 Linux 提供原生支持**，通过为运行 [SteamOS][2] 的 Valve 手持设备 Steam Deck 发布游戏。

然而，最近的报道显示，**一名 Valve 开发者注意到，Steam 客户端的非官方 Snap 版表现并不如预期**。

**事情是这样的：** 一位负责 Valve 的 Steam 客户端开发的开发者，Timothée Besset，在 [Mastodon][4] 上对 Linux 的 Steam Snap 版本表达了担忧。

需要知道的是，[该 Snap 版本][5] 是 Canonical 在 2022 年发布的非官方版本，作为他们全力打造 Ubuntu 游戏体验的一部分。

该开发者指出，他们**发现由 Snap 版本的 Steam 客户端引发的问题报告数量大幅度增加**。

然而，问题在于，**许多用户可能并未意识到他们正在运行的是 Steam 客户端的 Snap 版本**，反倒是首先向 Valve 报告问题，而非与 Canonical 取得联系。 

原因何在呢？

主要是因为 Ubuntu（及其官方发行版）在推广 Snap 包的使用。同时，当用户从软件中心安装 Steam 时，系统会默认安装 Snap 应用，许多用户并未觉察。

![][6]

然而，用户并未得到任何关于这个包并非由 Valve 官方维护的信息。

虽然有一个标记表明 Canonical 是它的维护者，验证了包的真实性，但是，它并不是 Valve 官方推荐的东西。

因此，若在 Ubuntu 上安装 Steam，用户可能会被误导（或是产生困惑）。

![][7]

自然地，用户会希望软件开箱即用。如果做不到，就会有人声称 “Steam 在 Ubuntu 或 Linux 上无法工作”，这会对 Valve 的声誉产生影响。

**如何应对：** 根据 Timothée 的建议，对于 Debian 及其它基于 Debian 的发行版（当然，包括 Ubuntu），你**最佳的选择是从他们的 [GitHub 仓库][8] 下载并安装官方的 _.deb_** 包。

作为替代，你也可以选择 [非官方的 Flatpak][9]。

有人**建议让 Steam 检测 Snap 并禁止其运行**，Timothée 进一步补充说：

> 运行报告会检测到 snap/flatpak（或即将检测到）。但考虑到用户的自由等等因素，我们通常不会因此停止服务。如果真的出现严重问题，我们可能会开始发出警告。

我觉得发出警告听起来不错。但当然，既然 Valve 的关切已经被公之于众，Canonical 应对这个问题采取行动，与 Valve 合作改善现状。

💬 你觉得呢？ Canonical 会采取行动，解决他们所开发的基于 Snap 的 Steam 客户端存在的问题吗？

> 参考：[GamingOnLinux][10]

*（题图：DA/13bf0574-9608-4d18-97ef-c136cbd81ef4）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/valve-steam-snap-ubuntu/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://itsfoss.com/steamos/
[3]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[4]: https://mastodon.social/@TTimo/111772575146054328
[5]: https://snapcraft.io/steam
[6]: https://news.itsfoss.com/content/images/2024/01/steam-list-app.png
[7]: https://news.itsfoss.com/content/images/2024/01/steam-snap.png
[8]: https://github.com/ValveSoftware/steam-for-linux/
[9]: https://flathub.org/apps/com.valvesoftware.Steam
[10]: https://www.gamingonlinux.com/2024/01/valve-seeing-increasing-bug-reports-due-to-steam-snap-other-methods-recommended/
[0]: https://img.linux.net.cn/data/attachment/album/202401/28/093058ewv0j4za4i4a4lgv.jpg
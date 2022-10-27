[#]: subject: "Epic Games Store Now Works on Steam Deck"
[#]: via: "https://news.itsfoss.com/epic-games-steam-deck/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "zd200572"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14374-1.html"

Epic 游戏商店现在可在 Steam Deck 上使用啦
======

> 现在可以在 Steam Deck 上运行 Epic 游戏商店了，几乎无懈可击! 但是，它是非官方的。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/run-epicgames-on-steam-deck-now.png?w=1200&ssl=1)

Steam Deck 在加强对 Linux 平台的游戏支持方面做出了有力推动。

它运行在 **Steam OS 3.0**（基于 Arch）上，并具有 KDE Plasma 桌面环境。感谢 Valve，它没有锁定平台并让用户在上面进行试验。 

尽管不是每个人都可以拿到它，但这是一款令人兴奋的硬件，可以挑战任天堂 Switch 掌机。

它可能还不支持所有的流行游戏（比如《命运 2》、《堡垒之夜》），但它在几个 3A 级大作和独立游戏上取得了不错的进展。你可以到官方的 [Deck 认证][1] 页面查看有关支持游戏的最新信息。

现在，更令人激动的是，事实证明 Steam Deck 也可以使用 [Epic 游戏商店][2]（**非官方的**）来运行游戏。但是，怎样运行呢，让我们来一探究竟。

### 通过 Heroic 游戏启动器使用 Epic 游戏商店

是的，这就是 [去年][4] 制作的 [Heroic 游戏启动器][3], 并且已知它可以运行在 Linux 桌面上。

另外，（据 [GamingOnLinux][5]）感谢 Liam Dawe，他和各位开发者协调，成功地在 Steam Deck 上测试运行了 Heroic 游戏启动器（及 [Heroic Bash 启动器][6]）。

[![][7]](https://youtu.be/89Dw3I6NJX4)

补充一句，**Heroic Bash 启动器** 是一个为所有已安装的 Heroic 游戏创建启动脚本（.sh 文件）的工具，它允许你直接从终端或者游戏前端/启动器启动游戏，而不必打开 Heroic。

故事的发生是这样的（根据我与 Heroic Bash 启动器开发者的简短交谈）:

最初，在 Steam Deck 上实验运行 Epic 游戏商店时，Steam 控制器无法工作，因为 Epic 游戏商店是使用 Steam 客户端以一个“非 Steam 游戏”运行的。

所以，Heroic Bash 启动器的开发者，[Rishabh Moharir][8]（也是这里的一位作者）建议使用他的工具，按照他 [GitHub 上的维基指南][9] 来试试。

Heroic Bash 启动器可以在 Linux 桌面上与 Epic 游戏商店配合使用。所以，这值得一试！

然后，幸运地，它工作了。

### 在 Steam Deck 上安装 Epic 游戏商店

首先，你需要在 Steam Deck 上使用可用的 AppImage 文件在**桌面模式**下安装 **Heroic 游戏启动器**。

完成后，你需要登录并下载你选择的游戏。

接下来，你需要下载最新的 [legendary][10] 二进制文件，并在启动器设置中将其设置为替代的 legendary 二进制文件。

你需要在启动器的游戏设置中配置并设置兼容层为 Proton 7.0。

这时，你需要下载最新的 [Heroic Bash 启动器二进制文件][11]，然后运行它。

最后，你必须根据这个 [GitHub 上的官方维基指南][9]，把游戏添加到 Steam 中（以便在 Steam Deck 的界面中找到它）。

总之，“手工爱好者”们肯定需要花好大一会儿才能使其工作。另外，如果你仍然困惑，你可以在 [维基][12] 上找到包含详细信息的同样的一套步骤和细节，这是 Heroic 游戏启动器团队整理的（或者参考上面的视频）。

对我来说，这听起来可行，应该不会超越大多数 Steam Deck 用户的能力。不幸的是，我无法在印度买到 Steam Deck（目前）。

至于 Steam Deck 上的 Epic 游戏商店的未来，我们只能抱以最好的期望。

你试过 Steam Deck 吗？在下面的评论区让我知道你的看法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/epic-games-steam-deck/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[zd200572](https://github.com/zd200572)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.steamdeck.com/en/verified
[2]: https://www.epicgames.com/store/en-US/
[3]: https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher
[4]: https://news.itsfoss.com/heroic-games-launcher/
[5]: https://www.gamingonlinux.com/2022/03/heroic-games-launcher-now-works-nicely-on-steam-deck/
[6]: https://github.com/redromnon/HeroicBashLauncher
[7]: https://i0.wp.com/i.ytimg.com/vi/UvuGAQDagWE/hqdefault.jpg?w=780&ssl=1
[8]: https://news.itsfoss.com/author/rishabh/
[9]: https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/wiki/Adding-Games-to-Steam-on-Linux
[10]: https://github.com/derrod/legendary/releases/
[11]: https://github.com/redromnon/HeroicBashLauncher/releases/
[12]: https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/wiki/SteamDeck---Running-Epic-Games

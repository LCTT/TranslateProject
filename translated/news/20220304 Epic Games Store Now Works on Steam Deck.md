[#]: subject: "Epic Games Store Now Works on Steam Deck"
[#]: via: "https://news.itsfoss.com/epic-games-steam-deck/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "zd200572"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Epic游戏商店现在可在Steam Deck上使用啦
======

Steam Deck已经在努力增强对Linux平台的游戏支持。

它运行在**Steam OS 3.0**（基于Arch）上，并具有KDE Plasma桌面环境。 感谢Valve没有锁定平台并让用户进行试验。 

尽管它不是每个人都可以用，但这是一款令人兴奋的硬件，挑战手持式的Nintendo Switch。

它可能还不支持所有流行的游戏(比如《命运 2》、《堡垒之夜》), 但它在几个3A和独立游戏上取得了不错的进展。你可以到官方页面[Deck认证][1]查看有关支持游戏的最新信息。

现在，更令人激动的是，事实证明Steam Deck也可以使用[Epic游戏商店][2](**非官方**)来运行游戏。但是，怎样运行呢，让我们来一探究竟。

### 将Heroic游戏启动器和Epic游戏商店一起使用

是的，与[去年][4]制作的[Heroic游戏启动器][3]相同, 并且已知它可以运行在Linux桌面上。

另外。感谢Liam Dawe(通过[GamingOnLinux][5])，和各自的开发者协调，成功在Steam Deck上测试了Heroic游戏启动器 (和[Heroic Bash启动器][6])。

![][7]

如果你好奇：**Heroic Bash启动器**_是一个为所有已安装的Heroic游戏创建启动脚本(.sh文件)的工具，允许你直接从终端或者游戏前端/启动器启动游戏，而不必打开Heroic。_

以下是这一切是如何发生的(根据我与Heroic Bash启动器开发者的简短交谈):

最初，在Steam Deck上进行Epic游戏商店试验时，Steam控制器无法工作，因为Epic游戏商店作为一个“非Steam游戏”，使用Steam客户端运行。

所以，Heroic Bash启动器的开发者, [Rishabh Moharir][8] (也是这里的一位作者)建议使用他的工具，按照他[GitHub上的wiki指南][9]来使其工作.

Heroic Bash启动器在Linux桌面上与Epic游戏商店配合使用。所以，这值得一试！

然后，幸运地，它工作了。


### 在Steam Deck上安装Epic游戏商店



首先，你需要在**桌面模式**下使用可用的AppImage文件，在Steam Deck上安装**Heroic游戏启动器**。

一旦完成，你需要登陆并下载你选择的游戏。

接下来，你需要下载最新的[legendary][10]二进制文件，并将其设置为启动器设置中的可选legendary二进制文件。

你需要在启动器的游戏设置中配置和设置兼容层为Proton 7.0。

这时，你需要下载最新的[Heroic Bash启动器二进制文件][11]，然后运行它。

最后，你必需根据这个[GitHub上的官方wiki指南][9]把游戏添加到Steam(在Steam Deck的界面中找到它)。

总之，“修补匠“肯定需要花好大一会儿才能使其工作。另外，如果你仍然困惑，你可以在[wiki][12]上找到包含详细信息的相同步骤集，这是Heroic游戏启动器团队整理的(或者参考上面的视频)。

对于我，这听起来可行，应该不会超越大多数用户的能力。不幸的是，我还不能进入到到印度的Steam Deck。

对于Epic游戏商店在Steam Deck的未来，我们只能抱最好的希望！

_你试过Steam Deck吗？在下面的评论区让我知道你的想法._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/epic-games-steam-deck/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/zd200572)
校对：[校对者ID](https://github.com/校对者ID)

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

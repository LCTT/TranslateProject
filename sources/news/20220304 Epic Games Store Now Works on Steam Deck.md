[#]: subject: "Epic Games Store Now Works on Steam Deck"
[#]: via: "https://news.itsfoss.com/epic-games-steam-deck/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Epic游戏商店现在在Steam Deck上可用啦
======

Steam Deck已经在努力增强对Linux平台的游戏支持。

运行在**Steam OS 3.0**（基于Arch）上，以KDE Plasma桌面为特色。 感谢 Valve 没有锁定平台并让用户进行试验。 

尽管它不是每个人都能用，但对于 Nintendo Switch这是一个令人兴奋有硬件挑战。

它可能不会支持所有流行的游戏(比如Destiny 2, Fortnite), 但它在往3A和深度内容的方向上作出好的进步。你可以到官网页面[Deck Verified][1]查看支持游戏的最新信息。

现在，更令人激动的是，Steam Deck也可以使用[Epic Games Store][2] (**unofficially**)来运行游戏。但是，怎样运行呢，我们一起看下：

### 通过英雄游戏启动器使用Epic游戏商店

是的，相同的[Heroic Games launcher][3][去年][4]正在制作, 同时已经已知可以工件在一个Linux桌面上。

另外。感谢Liam Dawe(通过[GamingOnLinux][5])，已经和尊敬的开发者一道，成功在Steam Deck测试了Heroic Games Launcher (and [Heroic Bash Launcher][6])。

![][7]

If you’re curious: **Heroic Bash Launcher** _is a tool that creates launch scripts (.sh files) for all installed Heroic games and allows you to launch the game directly from the terminal or game frontend/launcher without having any need to open Heroic._

Here’s how it all went down (as per my brief chat with the developer of Heroic Bash Launcher):

Initially, with Epic Games Store experiment on Steam Deck, the Steam controller did not work, considering the Epic Games Store ran as a “Non-Steam game” using the Steam client.

So, the developer of Heroic Bash Launcher, [Rishabh Moharir][8] (also a fellow writer here) suggested using his tool to make it work by following his [wiki guide on GitHub][9].

The Heroic Bash Launcher works with Epic Games Store on a Linux desktop. So, it was worth a try!

And, fortunately, it worked!

### Installing Epic Games Store on Steam Deck

First, you need to install the **Heroic Games Launcher** on Steam Deck using the available AppImage file in the **Desktop mode**.

Once done, you need to log in and download the game of your choice.

Next, you need to download the latest binary files for [legendary][10] and set it as the alternative legendary binary from the launcher’s settings.

You need to configure and set the compatibility layer to Proton 7.0 from the game settings in the launcher.

That’s when you need to download the latest [Heroic Bash Launcher binary][11] and run it.

Finally, you have to add the game to Steam (to find it in Steam Deck’s UI) following the [official wiki guide on GitHub][9].

Overall, it sure took a while for tinkerers to make it work. And, if you are still confused, you can find the same set of steps with all the details in the [wiki][12] put together by the Heroic Games Launcher team (or refer to the video above).

To me, it sounds doable and should not be an overwhelming process for most Steam Deck users as of now. Unfortunately, I can’t get my hands on the Steam Deck in India (yet).

As for the future of Epic Games Store on Steam Deck, we can only hope for the best!

_Have you tried Steam Deck yet? Let me know your thoughts in the comments down below._

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

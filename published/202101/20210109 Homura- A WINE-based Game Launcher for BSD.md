[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13026-1.html)
[#]: subject: (Homura: A WINE-based Game Launcher for BSD)
[#]: via: (https://itsfoss.com/homura-game-launcher-bsd/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Homura：基于 WINE 的 BSD 游戏启动器
======

BSD 不只是用于服务器。人们也将其用于桌面，并执行通常任务，包括休闲游戏。为了帮助实现这一点，我们将看看一个能让你在 FreeBSD 上运行 Windows 游戏的应用。

### 什么是 Homura？

![][1]

[Homura][2] 是一个能让你在 FreeBSD 上玩 Windows 游戏的工具。它的灵感来自于 [Lutris][3]。它允许你安装和管理多个 Windows 游戏和游戏商店启动器。它主要使用 Wine，但也附带了一些修复和变通的方法来让游戏工作。

Homura 的创建者 [Alexander Vereeken][4] 说，他创建这个应用是因为“当我开始使用 FreeBSD 时，没有能用的可以在 Wine 中安装游戏或启动器的程序，所以我自己创建了一个”。当时，Wine 是唯一的选择。Linux 版本的 Steam 并不存在。

![Homura install list][5]

以下是你可以用 Homura 安装的清单：

  * Anarchy Online
  * Arc
  * Bethesda 启动器
  * 暴雪启动器
  * 暗黑破坏神 II
  * Discord
  * 龙歌 OL
  * GOG
  * 建造乌托邦
  * 英雄联盟
  * Origin 启动器
  * PokeMMO
  * 精灵宝可梦 绿铀
  * RuneScape
  * Steam
  * 地铁跑酷
  * Teamspeak
  * 猴岛大冒险 2
  * UC 浏览器
  * 育碧
  * 战游游戏中心
  * Itch.io

Homura 是以动画 [Madoka Magica][6] 中的一个角色命名的。在创建者转移到 GitLab 之前，它最初托管在 GitHub 上。目前它被托管在 Codeberg 上。希望它现在还能留在那里。

![Homura][7]

### 在 BSD 上安装 Homura 游戏启动器

你可以用这个命令从 FreeBSD 仓库中安装 Homura：

```
pkg install games/homura
```

你也可以使用这个命令从 ports 构建并安装它：

```
cd /usr/ports/games/homura/ && make install clean
```

安装完成后，你可以从菜单中选择 Homura，或在命令行中输入 `Homura` 来运行它。（在终端中名字必须大写开头，否则将无法运行。）

如果你通过 Homura 安装 Steam，你需要从 Homura 启动它。如果你想从操作系统的菜单中启动它，它当前不会显示在那里。

Steam 的库和商店标签由内置的 Web 浏览器显示。由于某些原因，这在 FreeBSD 上是不行的。但如果你从 Homura 的菜单中启动 Steam，它将使用列表模式，工作没有问题。

### 体验

我在 GhostBSD 上安装了 Homura，并用它来安装 Steam。之后，我安装了几个游戏来测试它。并不是所有的游戏都能正常运行，主要是因为它们试图使用或安装一个不可用的 Windows 专用软件。然而，我能够玩我最喜欢的游戏之一，微软的“国家的崛起”，没有任何问题。（我的测试变成了几个小时的游戏。）

![Homura Main Menu][8]

我也尝试安装 GOG 启动器。由于某些原因，它对我不起作用。加载页面会弹出，但什么都不会发生。我打算提交一个议题。我没有测试过任何安装程序/启动器，因为我没有使用它们。

### 总结

并不是所有的东西都能顺利地与 Homura 一起使用，但我可以玩一些我最喜欢的游戏。

![Rise of Nation on BSD][9]

这款应用是一个典型的用户有了需求，并决定去填补它的案例。通过这样做，他让其他人的生活变得更轻松。希望这个应用能让人们更容易地开始使用 FreeBSD 作为他们的操作系统。

--------------------------------------------------------------------------------

via: https://itsfoss.com/homura-game-launcher-bsd/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/homura.jpg?resize=800%2C450&ssl=1
[2]: https://codeberg.org/Alexander88207/Homura
[3]: https://lutris.net/
[4]: https://codeberg.org/Alexander88207
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/homura-install.jpg?resize=800%2C421&ssl=1
[6]: https://madoka.fandom.com/wiki/Puella_Magi_Madoka_Magica
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/homura-about.jpg?resize=800%2C411&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/homura-main-menu.jpg?resize=500%2C776&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/rise-of-nation-bsd.jpg?resize=800%2C450&ssl=1
[10]: https://%0Areddit.com/r/linuxusersgroup

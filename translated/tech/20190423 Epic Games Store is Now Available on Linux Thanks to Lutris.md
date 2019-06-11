[#]: collector: (lujun9972)
[#]: translator: (Modrisco)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Epic Games Store is Now Available on Linux Thanks to Lutris)
[#]: via: (https://itsfoss.com/epic-games-lutris-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

有了 Lutris，Linux 现在也可以启动 Epic 游戏商城
======

_**简介: 开源游戏平台 Lutris 现在使您能够在 Linux 上使用 Epic 游戏商城。我们使用 Ubuntu 19.04 版本测试，以下是我们的使用体验。**_


[在 Linux 上玩游戏][1] 正变得越来越容易。Steam 的  [in-progress][3] 特性可以帮助您实现 [在 Linux 上玩 Windows 游戏][2]。

Steam 在 Linux 运行 Windows 游戏领域还是新玩家，而 Lutris 却已从事多年。

[Lutris][4] 是一款为 Linux 开发的开源游戏平台，提供诸如 Origin、Steam、战网等平台的游戏安装器。它使用 Wine 来运行 Linux 不能支持的程序。

Lutris 近期宣布您可以通过它来运行 Epic 游戏商店。

### Lutris 为 Linux 带来了 Epic 游戏

![Epic Games Store Lutris Linux][5]

[Epic 游戏商城][6] 是一个类似 Steam 的电子游戏分销平台。它目前只支持 Windows 和 macOS。

Lutris 团队付出了大量努力使 Linux 用户可以通过 Lutris 使用 Epic 游戏商城。虽然我不是一个 Epic 商城的粉丝，但可以通过 Lutris 在 Linux 上运行 Epic 商城终归是个好消息。

> 好消息！ 您现在可以通过 Lutris 安装获得 [@EpicGames][7] 商城在 Linux 下的全功能支持！没有发现任何问题。 <https://t.co/cYmd7PcYdG>[@TimSweeneyEpic][8] 可能会很喜欢 😊 [pic.twitter.com/7mt9fXt7TH][9]
>
> — Lutris Gaming (@LutrisGaming) [April 17, 2019][10]

作为一名狂热的游戏玩家和 Linux 用户，我立即得到了这个消息，并安装了 Lutris 来运行 Epic 游戏。

**备注：** _我使用来 [Ubuntu 19.04][11] 来测试 Linux 环境下的游戏运行情况。_

### 通过 Lutris 在 Linux 下使用 Epic 游戏商城

为了在您的 Linux 系统中安装 Epic 游戏商城，请确保您已经安装了 Wine 和 Python 3。接下来，[在  Ubuntu 中安装 Wine][12] ，或任何您正在使用的 Linux 发行版本。然后， [从官方网站下载 Lutris][13].

[][14]

Ubuntu Mate 是 Entroware 笔记本的默认系统。

#### 安装 Epic 游戏商城

Lutris 安装成功后，可以很方便地启动。

当我尝试时，我遇到了一个问题（当我用 GUI 启动时却没有遇到）。不过，当我尝试在命令行输入 “ **lutris** ” 来启动时，我发现了下图所示的错误：

![][15]

感谢 Abhishek，我了解到了这是一个常见问题 (你可以在 [GitHub][16] 上查看这个问题)。

总之，为了解决这个问题，我需要在命令行中输入以下命令：

```
export LC_ALL=C
```

当你遇到同样的问题时，只要你输入这个命令，就能正常启动 Lutris 了。

**注意**：_每次启动 Lutris 时都必须输入这个命令。因此，最好将其添加到 .bashrc 文件或环境变量列表中。_

上述操作完成后，只要启动并搜索 “**Epic Games Store**” 会显示以下图片中的内容：

![Epic Games Store in Lutris][17]

在这里，我已经安装过了，所以您将会看到“安装”选项，它会自动询问您是否需要安装需要的包。只需要继续操作就可以成功安装。就是这样，不需要任何黑科技。

#### 玩一款 Epic 游戏商城中的游戏

![Epic Games Store][18]

现在我们已经通过 Lutris 在 Linux 上安装了 Epic 游戏商城，启动它并登陆您的账号就可以开始了。

但这真会奏效吗？

_是的， Epic 游戏商城可以运行_。 **但是所有游戏都不能玩。**

我还没有尝试过所有内容，但是我拿了一个免费的游戏（晶体管 —— 一款回合制 ARPG 游戏）来检查它是否有效。

![Transistor – Epic Games Store][19]

很不幸，游戏没有启动。当我运行时界面显示了 “Running” 不过什么都没有发生。

到目前为止，我还不知道有什么解决方案 —— 所以如果我找到解决方案，我会尽力让你们知道最新情况。

[][20]

建议参考 Linux 的新版 Skype 客户端 Alpha 版本来参考。

**总结**

通过 Lutris 这样的工具使 Linux 的游戏场景得到了改善，这终归是个好消息 。不过，仍有许多工作要做。

对于在Linux上运行的游戏来说，无障碍运行仍然是一个挑战。其中可能就会有我遇到的这种问题，或者其他类似的。但它正朝着正确的方向发展 —— 即使还存在着一些问题。

你有什么看法吗？你是否也尝试用 Lutris 在 Linux 上启动 Epic 游戏商城？在下方评论让我们看看您的意见。

--------------------------------------------------------------------------------

via: https://itsfoss.com/epic-games-lutris-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[Modrisco](https://github.com/Modrisco)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://itsfoss.com/steam-play/
[3]: https://itsfoss.com/steam-play-proton/
[4]: https://lutris.net/
[5]: https://itsfoss.com/wp-content/uploads/2019/04/epic-games-store-lutris-linux-800x450.png
[6]: https://www.epicgames.com/store/en-US/
[7]: https://twitter.com/EpicGames?ref_src=twsrc%5Etfw
[8]: https://twitter.com/TimSweeneyEpic?ref_src=twsrc%5Etfw
[9]: https://t.co/7mt9fXt7TH
[10]: https://twitter.com/LutrisGaming/status/1118552969816018948?ref_src=twsrc%5Etfw
[11]: https://itsfoss.com/ubuntu-19-04-release-features/
[12]: https://itsfoss.com/install-latest-wine/
[13]: https://lutris.net/downloads/
[14]: https://itsfoss.com/ubuntu-mate-entroware/
[15]: https://itsfoss.com/wp-content/uploads/2019/04/lutris-error.jpg
[16]: https://github.com/lutris/lutris/issues/660
[17]: https://itsfoss.com/wp-content/uploads/2019/04/lutris-epic-games-store-800x520.jpg
[18]: https://itsfoss.com/wp-content/uploads/2019/04/epic-games-store-800x450.jpg
[19]: https://itsfoss.com/wp-content/uploads/2019/04/transistor-game-epic-games-store-800x410.jpg
[20]: https://itsfoss.com/skpe-alpha-linux/

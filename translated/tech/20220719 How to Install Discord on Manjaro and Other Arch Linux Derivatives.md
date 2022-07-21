[#]: subject: "How to Install Discord on Manjaro and Other Arch Linux Derivatives"
[#]: via: "https://itsfoss.com/install-discord-arch-manjaro/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Manjaro 和其他 Arch Linux 衍生品上安装 Discord
======

[Discord][1] 是一个跨平台的应用，可用于语音通话、视频通话、文本消息，以及分享媒体和文件。

它在游戏玩家和主播中非常流行。虽然，许多开源项目已经开始使用它来主持他们的社区讨论。你可以为这类开源社区找到[官方 Discord 服务器][2]。

Discord 可以直接从你的网络浏览器访问。安装官方桌面客户端可以让你获得系统通知和集中交流，而不是在多个打开的标签中摸索 Discord 标签。

虽然 Discord 为 Ubuntu 提供了 Deb 文件，但在 Arch Linux 上却没有这样的即用型软件包。

别担心。在本教程中，我将向你展示两种在 [Arch Linux][3] 及其衍生版本上安装 Discord 的方法。

* 通过 [Pacman][4] 安装 Discord（命令行方法，对所有基于 Arch 的发行版有效）。
* 通过 [Pamac][5] 安装 Discord（GUI 方法，对 Manjaro 和其他一些使用 Pamac 工具的基于 Arch 的发行版有效）。

### 方法 1: 通过 pacman 命令安装 Discord

首先，更新你的系统，因为它是一个滚动发布的版本，[不支持部分升级][6]。

在终端输入以下 [pacman 命令][7]来[更新你的 Arch Linux 系统][8]。

```
sudo pacman -Syu
```

现在你可以通过以下命令安装 Discord 包。

```
sudo pacman -S discord
```

安装后，只需从应用菜单中启动应用，然后登录就可以开始使用 Discord。

![Discord client in Arch Linux][9]

**如果你想安装 Discord 的 Nightly 版本**来测试即将到来的新功能，请使用以下命令。请注意，它可能并不稳定，所以如果你想要这个版本，请再考虑一下。

```
sudo pacman -S discord-canary
```

#### 删除 Discord

如果你想删除 Discord，使用下面的命令来删除它以及它的依赖关系和配置文件：

```
sudo pacman -Rns discord
```

如果你选择的是 Nightly 版本，请使用以下命令将其删除：

```
sudo pacman -Rns discord-canary
```

这很不错。现在对于不喜欢使用终端的人来说，有一个替代方案。我将在下一节讨论这个问题。

### 方法 2：通过 Pamac 安装 Discord

如果你使用 Arch Linux 的衍生产品，如 [Manjaro Linux][10]、[Garuda Linux][11] 等，你就有一个叫做 Pamac 的图形化软件中心。

有了这个图形化的工具，你可以轻松地安装新的应用程序或删除现有的应用，而不必进入终端。

从应用程序菜单中启动 Pamac（添加/删除软件）。

![pamac menu][12]

点击更新来更新你的系统。

![pamac update][13]

现在点击浏览，使用左上方的搜索按钮搜索 discord。然后，选择软件包并点击应用来安装。

![Installing Discord from Pamac][14]

你可以用 Pamac 来卸载软件包，就像你安装它一样。

我希望这个关于在基于 Arch 的 Linux 发行版上安装 Discord 的快速技巧对你有帮助。如果你有任何问题或建议，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-discord-arch-manjaro/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://discord.com/
[2]: https://discord.com/open-source
[3]: https://archlinux.org/
[4]: https://archlinux.org/pacman/
[5]: https://gitlab.manjaro.org/applications/pamac
[6]: https://wiki.archlinux.org/title/System_maintenance#Partial_upgrades_are_unsupported
[7]: https://itsfoss.com/pacman-command/
[8]: https://itsfoss.com/update-arch-linux/
[9]: https://itsfoss.com/wp-content/uploads/2022/06/discord.png
[10]: https://manjaro.org/
[11]: https://garudalinux.org/
[12]: https://itsfoss.com/wp-content/uploads/2022/06/pamac-menu.png
[13]: https://itsfoss.com/wp-content/uploads/2022/06/pamac-update.png
[14]: https://itsfoss.com/wp-content/uploads/2022/06/pamac-discord.png

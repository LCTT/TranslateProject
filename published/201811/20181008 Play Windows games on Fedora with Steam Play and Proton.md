在 Fedora 上使用 Steam play 和 Proton 来玩 Windows 游戏 
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/steam-proton-816x345.jpg)

之前，Steam [宣布][1]要给 Steam Play 增加一个新组件，用于支持在 Linux 平台上使用 Proton 来玩 Windows 的游戏，这个组件是 WINE 的一个分支。这个功能仍然处于测试阶段，且并非对所有游戏都有效。这里有一些关于 Steam 和 Proton 的细节。

据 Steam 网站称，测试版本中有以下这些新功能：

  * 现在没有 Linux 版本的 Windows 游戏可以直接从 Linux 上的 Steam 客户端进行安装和运行，并且有完整、原生的 Steamworks 和 OpenVR 的支持。
  * 现在 DirectX 11 和 12 的实现都基于 Vulkan，它可以提高游戏的兼容性并减小游戏性能收到的影响。
  * 全屏支持已经得到了改进，全屏游戏时可以无缝扩展到所需的显示程度，而不会干扰到显示屏本身的分辨率或者说需要使用虚拟桌面。
  * 改进了对游戏控制器的支持，游戏自动识别所有 Steam 支持的控制器，比起游戏的原始版本，能够获得更多开箱即用的控制器兼容性。
  * 和 vanilla WINE 比起来，游戏的多线程性能得到了极大的提高。

### 安装

如果你有兴趣，想尝试一下 Steam 和 Proton。请按照下面这些简单的步骤进行操作。（请注意，如果你已经安装了最新版本的 Steam，可以忽略启用 Steam 测试版这个第一步。在这种情况下，你不再需要通过 Steam 测试版来使用 Proton。）

打开 Steam 并登陆到你的帐户，这个截屏示例显示的是在使用 Proton 之前仅支持 22 个游戏。

![][3]

现在点击客户端顶部的 “Steam” 选项，这会显示一个下拉菜单。然后选择“设置”。

![][4]

现在弹出了设置窗口，选择“账户”选项，并在 “参与 Beta 测试” 旁边，点击“更改”。

![][5]

现在将 “None” 更改为 “Steam Beta Update”。

![][6]

点击“确定”，然后系统会提示你重新启动。

![][7]

让 Steam 下载更新，这会需要一段时间，具体需要多久这要取决于你的网络速度和电脑配置。

![][8]

在重新启动之后，返回到上面的设置窗口。这次你会看到一个新选项。确定勾选了“为提供支持的游戏使用 Stream Play” 、“让所有的游戏都使用 Steam Play 运行”，“使用这个工具替代 Steam 中游戏特定的选项”。这个兼容性工具应该就是 Proton。

![][9]

Steam 客户端会要求你重新启动，照做，然后重新登录你的 Steam 账户，你的 Linux 的游戏库就能得到扩展了。

![][10]

### 使用 Steam Play 来安装一个 Windows 游戏

现在你已经启用 Proton，开始安装游戏，选择你想要安装的游戏，然后你会发现这个安装过程类似于在 Steam 上安装一个普通游戏，如下面这些截图所示。

![][11]

![][12]

![][13]

![][14]

在下载和安装完游戏后，你就可以开始玩了。

![][15]

![][16]

一些游戏可能会受到 Proton 测试性质的影响，在这个叫 Chantelise 游戏中，没有了声音并且帧率很低。请记住这个功能仍然在测试阶段，Fedora 不会对结果负责。如果你想要了解更多，社区已经创建了一个 Google 文档，这个文档里有已经测试过的游戏的列表。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/play-windows-games-steam-play-proton/

作者：[Francisco J. Vergara Torres][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/patxi/
[1]: https://steamcommunity.com/games/221410/announcements/detail/1696055855739350561
[2]: https://fedoramagazine.org/third-party-repositories-fedora/
[3]: https://fedoramagazine.org/wp-content/uploads/2018/09/listOfGamesLinux-768x505.png
[4]: https://fedoramagazine.org/wp-content/uploads/2018/09/1-768x432.png
[5]: https://fedoramagazine.org/wp-content/uploads/2018/09/2-768x503.png
[6]: https://fedoramagazine.org/wp-content/uploads/2018/09/4.png
[7]: https://fedoramagazine.org/wp-content/uploads/2018/09/6.png
[8]: https://fedoramagazine.org/wp-content/uploads/2018/09/7.png
[9]: https://fedoramagazine.org/wp-content/uploads/2018/09/10.png
[10]: https://fedoramagazine.org/wp-content/uploads/2018/09/12-768x503.png
[11]: https://fedoramagazine.org/wp-content/uploads/2018/09/13-768x501.png
[12]: https://fedoramagazine.org/wp-content/uploads/2018/09/14-768x498.png
[13]: https://fedoramagazine.org/wp-content/uploads/2018/09/15-768x501.png
[14]: https://fedoramagazine.org/wp-content/uploads/2018/09/16-768x500.png
[15]: https://fedoramagazine.org/wp-content/uploads/2018/09/Screenshot-from-2018-08-30-15-14-59-768x432.png
[16]: https://fedoramagazine.org/wp-content/uploads/2018/09/Screenshot-from-2018-08-30-15-19-34-768x432.png
[17]: https://docs.google.com/spreadsheets/d/1DcZZQ4HL_Ol969UbXJmFG8TzOHNnHoj8Q1f8DIFe8-8/edit#gid=1003113831

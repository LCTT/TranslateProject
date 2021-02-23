[#]: collector: (lujun9972)
[#]: translator: (wenwensnow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11504-1.html)
[#]: subject: (Use GameHub to Manage All Your Linux Games in One Place)
[#]: via: (https://itsfoss.com/gamehub/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

用 GameHub 集中管理你 Linux 上的所有游戏
======

你在 Linux 上是怎么[玩游戏的呢][1]? 让我猜猜，要不就是从软件中心直接安装，要不就选 Steam、GOG、Humble Bundle 等平台，对吧？但是，如果你有多个游戏启动器和客户端，又要如何管理呢？好吧，对我来说这简直令人头疼 —— 这也是我发现 [GameHub][2] 这个应用之后，感到非常高兴的原因。

GameHub 是为 Linux 发行版设计的一个桌面应用，它能让你“集中管理你的所有游戏”。这听起来很有趣，是不是？下面让我来具体说明一下。

![][3]

### 集中管理不同平台 Linux 游戏的 GameHub

让我们看看，对玩家来说，让 GameHub 成为一个[不可或缺的 Linux 应用][4]的功能，都有哪些。

#### Steam、GOG & Humble Bundle 支持

![][5]

它支持 Steam、[GOG][6] 和 [Humble Bundle][7] 账户整合。你可以登录你的 GameHub 账号，从而在你的库管理器中管理所有游戏。

对我来说，我在 Steam 上有很多游戏，Humble Bundle 上也有一些。我不能确保它支持所有平台，但可以确信的是，主流平台游戏是没有问题的。

#### 支持原生游戏

![][8]

[有很多网站专门推荐 Linux 游戏，并支持下载][9]。你可以通过下载安装包，或者添加可执行文件，从而管理原生游戏。

可惜的是，现在无法在 GameHub 内搜索 Linux 游戏。如上图所示，你需要分别下载游戏，随后再将其添加到 GameHub 中。

#### 模拟器支持

用模拟器，你可以在 [Linux 上玩复古游戏][10]。正如上图所示，你可以添加模拟器（并导入模拟的镜像）。

你可以在 [RetroArch][11] 查看已有的模拟器，但也能根据需求添加自定义模拟器。

#### 用户界面

![Gamehub 界面选项][12]

当然，用户体验很重要。因此，探究下用户界面都有些什么，也很有必要。

我个人觉得，这一应用很容易使用，并且黑色主题是一个加分项。

#### 手柄支持

如果你习惯在 Linux 系统上用手柄玩游戏 —— 你可以轻松在设置里添加，启用或禁用它。 

#### 多个数据提供商

因为它需要获取你的游戏信息（或元数据），也意味着它需要一个数据源。你可以看到下图列出的所有数据源。

![Data Providers Gamehub][13]

这里你什么也不用做 —— 但如果你使用的是 steam 之外的其他平台，你需要为 [IDGB 生成一个 API 密钥][14]。

我建议只有出现 GameHub 中的提示/通知，或有些游戏在 GameHub 上没有任何描述/图片/状态时，再这么做。

#### 兼容性选项

![][15]

你有不支持在 Linux 上运行的游戏吗？

不用担心，GameHub 上提供了多种兼容工具，如 Wine/Proton，你可以利用它们来玩游戏。

我们无法确定具体哪个兼容工具适用于你 —— 所以你需要自己亲自测试。然而，对许多游戏玩家来说，这的确是个很有用的功能。

### GameHub: 如何安装它呢？

![][18]

首先，你可以直接在软件中心或者应用商店内搜索。 它在 “Pop!_Shop” 之下。所以，它在绝大多数官方源中都能找到。

如果你在这些地方都没有找到，你可以手动添加源，并从终端上安装它，你需要输入以下命令：

```
sudo add-apt-repository ppa:tkashkin/gamehub
sudo apt update
sudo apt install com.github.tkashkin.gamehub
```

如果你遇到了 “add-apt-repository command not found” 这个错误，你可以看看，[add-apt-repository not found error.][19]这篇文章，它能帮你解决这一问题。

这里还提供 AppImage 和 FlatPak 版本。 在[官网][2] 上，你可以针对找到其他 Linux 发行版的安装手册。

同时，你还可以从它的 [GitHub 页面][20]下载之前版本的安装包.

[GameHub][2]

### 如何在 GameHub 上管理你的游戏？

在启动程序后，你可以将自己的 Steam/GOG/Humble Bundle 账号添加进来。

对于 Steam，你需要在 Linux 发行版上安装 Steam 客户端。一旦安装完成，你可以轻松将账号中的游戏导入 GameHub。

![][16]

对于 GOG & Humble Bundle，登录后，就能直接在 GameHub 上管理游戏了。

如果你想添加模拟器或者本地安装文件，点击窗口右上角的 “+” 按钮进行添加。 

### 如何安装游戏？

对于 Steam 游戏，它会自动启动 Steam 客户端，从而下载/安装游戏（我希望之后安装游戏，可以不用启动 Steam！）

![][17]

但对于 GOG/Humble Bundle，登录后就能直接、下载安装游戏。必要的话，对于那些不支持在 Linux 上运行的游戏，你可以使用兼容工具。

无论是模拟器游戏，还是本地游戏，只需添加安装包或导入模拟器镜像就可以了。这里没什么其他步骤要做。

### 注意

GameHub 是相当灵活的一个集中游戏管理应用。 用户界面和选项设置也相当直观。

你之前是否使用过这一应用呢？如果有，请在评论里写下你的感受。

而且，如果你想尝试一些与此功能相似的工具/应用，请务必告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gamehub/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://tkashkin.tk/projects/gamehub/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-home-1.png?ssl=1
[4]: https://itsfoss.com/essential-linux-applications/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-platform-support.png?ssl=1
[6]: https://www.gog.com/
[7]: https://www.humblebundle.com/monthly?partner=itsfoss
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-native-installers.png?ssl=1
[9]: https://itsfoss.com/download-linux-games/
[10]: https://itsfoss.com/play-retro-games-linux/
[11]: https://www.retroarch.com/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-appearance.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/data-providers-gamehub.png?ssl=1
[14]: https://www.igdb.com/api
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-windows-game.png?fit=800%2C569&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-library.png?ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-compatibility-layer.png?ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-install.jpg?ssl=1
[19]: https://itsfoss.com/add-apt-repository-command-not-found/
[20]: https://github.com/tkashkin/GameHub/releases

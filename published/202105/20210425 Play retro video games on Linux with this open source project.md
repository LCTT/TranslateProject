[#]: subject: (Play retro video games on Linux with this open source project)
[#]: via: (https://opensource.com/article/21/4/scummvm-retro-gaming)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13433-1.html)

用这个开源项目在 Linux 上玩复古视频游戏
======

> ScummVM 是在现代硬件上玩老式视频游戏的最直接的方法之一。

![](https://img.linux.net.cn/data/attachment/album/202105/28/061555r14mbzb1g1n545rr.jpg)

玩冒险游戏一直是我使用计算机经验的一个重要部分。从最早的基于文本的冒险游戏到 2D 像素艺术、全动态视频和 3D 游戏，冒险游戏类型为我提供了很多美好的回忆。

有时我想重温那些老游戏，但它们很多都是在 Linux 出现之前发布的，那么我如何去重玩这些游戏呢？我使用 [ScummVM][2]，说实话，这是我最喜欢的开源项目之一。

### 什么是 ScummVM

![ScummVM][3]

ScummVM 是一个设计用来在现代硬件上玩老式冒险游戏的程序。ScummVM 最初是为了运行使用<ruby>卢卡斯艺术<rt>LucasArt</rt></ruby>的<ruby>疯狂豪宅脚本创作工具<rt>Script Creation Utility for Maniac Mansion</rt></ruby>（SCUMM）开发的游戏，现在支持许多不同的游戏引擎。它可以支持几乎所有经典的<ruby>雪乐山娱乐<rt>Sierra On-Line</rt></ruby>和卢卡斯艺术的冒险游戏，以及其他发行商的大量冒险游戏。ScummVM 并不支持所有的冒险游戏（目前），但它可以用来玩数百种冒险游戏。ScummVM 可用于多个平台，包括 Windows、macOS、Linux、Android、iOS 和一些游戏机。

### 为什么使用 ScummVM

有很多方法可以在现代硬件上玩老游戏，但它们往往比使用 ScummVM 更复杂。[DOSBox][5] 可以用来玩 DOS 游戏，但它需要调整设置，使其以正确的速度进行游戏。Windows 游戏可以用 [WINE][6] 来玩，但这需要游戏及其安装程序都与 WINE 兼容。

即使游戏可以在 WINE 下运行，一些游戏仍然不能在现代硬件上很好地运行，因为硬件的速度太快了。这方面的一个例子是《<ruby>国王密使 6<rt>King's Quest VI</rt></ruby>》中的一个谜题，它涉及将点燃的鞭炮带到某个地方。在现代硬件上，鞭炮爆炸的速度太快了，这使得在角色不死很多次的情况下不可能到达正确的位置。

ScummVM 消除了其他玩复古冒险游戏的方法中存在的许多问题。如果是 ScummVM 支持的游戏，那么它的配置和玩都很简单。在大多数情况下，将游戏文件从原始游戏光盘复制到一个目录，并在 ScummVM 中添加该目录，就可以玩该游戏了。对于多张光盘上的游戏，可能需要重命名一些文件以避免文件名冲突。需要哪些数据文件的说明以及任何重命名的说明都记录在 [每个支持的游戏][7] 的 ScummVM 维基页面上。

ScummVM 的一个奇妙之处在于，每一个新版本都会增加对更多游戏的支持。ScummVM 2.2.0 增加了对十几种互动小说解释器的支持，这意味着 ScummVM 现在可以玩数百种基于文本的冒险游戏。ScummVM 的开发分支应该很快就会变成 2.3.0 版本，它整合了 [ResidualVM][8] 对 3D 冒险游戏的支持，所以现在 ScummVM 可以用来玩《<ruby>冥界狂想曲<rt>Grim Fandango</rt></ruby>》、《<rt>神秘岛 3：放逐者<rt>Myst III: Exile</rt></ruby>》和《<ruby>最长的旅程<rt>The Longest Journey</rt></ruby>》。其开发分支最近还增加了对使用 [Adventure Game Studio][9] 创建的游戏的支持，这为 ScummVM 增加了成百上千的游戏。

### 如何安装 ScummVM

如果你想从你的 Linux 发行版的仓库中安装 ScummVM，过程非常简单。你只需要运行一个命令。然而，你的发行版可能会提供一个旧版本的 ScummVM，它不像最新版本那样支持许多游戏，所以要记住这一点。

在 Debian/Ubuntu 上安装 ScummVM：

```
sudo apt install scummvm
```

在 Fedora 上安装 ScummVM：

```
sudo dnf install scummvm
```

#### 使用 Flatpak 或 Snap 安装 ScummVM

ScummVM 也可以以 Flatpak 和 Snap 的形式提供。如果你使用这些方式之一，你可以使用以下命令来安装相关的版本，它应该总是 ScummVM 的最新版本。

```
flatpak install flathub org.scummvm.ScummVM
```

或

```
snap install scummvm
```

#### 编译 ScummVM 的开发分支

如果你想尝试 ScummVM 尚未稳定的开发分支中的最新和主要的功能，你可以通过编译 ScummVM 的源代码来实现。请注意，开发分支是不断变化的，所以事情可能不总是正确的。如果你仍有兴趣尝试开发分支，请按照下面的说明进行。

首先，你需要为你的发行版准备必要的开发工具和库，这些工具和库在 ScummVM 维基上的 [编译 ScummVM/GCC][10] 页面列出。

一旦你安装了先决条件，运行以下命令：

```
git clone <https://github.com/scummvm/scummvm.git>
cd scummvm
./configure
make
sudo make install
```

### 向 ScummVM 添加游戏

将游戏添加到 ScummVM 是你在游戏前需要做的最后一件事。如果你的收藏集中没有任何支持的冒险游戏，你可以从 [ScummVM 游戏][11] 页面下载 11 个精彩的游戏。你还可以从 [GOG.com][12] 购买许多 ScummVM 支持的游戏。如果你从 GOG.com 购买了游戏，并需要从 GOG 下载中提取游戏文件，你可以使用 [innoextract][13] 工具。

大多数游戏需要放在自己的目录中（唯一的例外是由单个数据文件组成的游戏），所以最好先创建一个目录来存储你的 ScummVM 游戏。你可以使用命令行或图形化文件管理器来完成这个工作。在哪里存储游戏并不重要（除了 ScummVM Flatpak，它是一个沙盒，要求游戏存储在 `~/Documents` 目录中）。创建这个目录后，将每个游戏的数据文件放在各自的子目录中。

一旦文件被复制到你想要的地方，运行 ScummVM，并通过点击“Add Game…”将游戏添加到收藏集中，在打开的文件选择器对话框中选择适当的目录，并点击“Choose”。如果 ScummVM 正确检测到游戏，它将打开其设置选项。如果你想的话，你可以从各个标签中选择高级配置选项（也可以在以后通过使用“Edit Game…”按钮进行更改），或者你可以直接点击“OK”，以默认选项添加游戏。如果没有检测到游戏，请查看 ScummVM 维基上的 [支持的游戏][14] 页面，以了解特定游戏的数据文件可能需要的特殊说明的细节。

现在唯一要做的就是在 ScummVM 的游戏列表中选择游戏，点击“Start”，享受重温旧爱或首次体验经典冒险游戏的乐趣。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/scummvm-retro-gaming

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f (Gaming artifacts with joystick, GameBoy, paddle)
[2]: https://www.scummvm.org/
[3]: https://opensource.com/sites/default/files/uploads/scummvm.png (ScummVM)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://www.dosbox.com/
[6]: https://www.winehq.org/
[7]: https://wiki.scummvm.org/index.php?title=Category:Supported_Games
[8]: https://www.residualvm.org/
[9]: https://www.adventuregamestudio.co.uk/
[10]: https://wiki.scummvm.org/index.php/Compiling_ScummVM/GCC
[11]: https://www.scummvm.org/games/
[12]: https://www.gog.com/
[13]: https://constexpr.org/innoextract/
[14]: https://wiki.scummvm.org/index.php/Category:Supported_Games

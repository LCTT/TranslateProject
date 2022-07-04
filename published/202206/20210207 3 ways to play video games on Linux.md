[#]: collector: (lujun9972)
[#]: translator: (godgithubf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14756-1.html)
[#]: subject: (3 ways to play video games on Linux)
[#]: via: (https://opensource.com/article/21/2/linux-gaming)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在 Linux 上玩电子游戏的三种方式
======

> 如果你准备放下爆米花，想从各个角度体验游戏的话，那么就在 Linux 下打开游戏吧！

![](https://img.linux.net.cn/data/attachment/album/202206/25/143306xijsi5aaz5jsj2aj.jpg)

如今，人们有更多喜欢 Linux 的理由。在这个系列里，我将分享 21 个使用 Linux 的理由。今天，我将从游戏开始。

我过去认为“游戏玩家”是一种非常特殊的生物，要由科学家们在数年的研究和测试之后严谨地认定才行。我从来没有把自己归类为游戏玩家，因为我所玩过的游戏要么是桌面游戏（棋盘类游戏和纸笔角色扮演游戏），要么是 NetHack、俄罗斯方块。现在，在移动设备、游戏机、电脑和电视机上都有游戏，我觉得现在的承认有各种形式的游戏玩家们了。如果你想自称为游戏玩家，你就可以是，不需任何资格认定。你不用必须在心里熟记那些“上上下下左右左右BA”的科乐美秘籍（你甚至可以不知道这是什么）；你也不用必须买过和玩过 3A 级游戏。如果你时不时地玩游戏，你就完全可以自称为玩家。如果你想成为一名玩家，那么现在使用 Linux 正当其时。

### 欢迎来到游戏世界

剥除光鲜的广告，在其下面，你肯定会发现一个欣欣向荣的游戏世界。在人们相信不是电子表格也不是练习打字一类的软件能挣钱以前，新兴的游戏市场已经开始发展起来了。<ruby>独立游戏<rt>indie game</rt></ruby>已经在流行文化上以各种方式打上了自己的烙印（或许你不相信，《我的世界》尽管不是开源的，但一开始就是一款独立游戏），这也证实了，在玩家眼里，可玩性高于产品价值。

独立开发者和开源开发者之间有很多交集。没有什么比带着你的 Linux 笔记本电脑，浏览 itch.io 或你的发行版的软件库，寻找鲜为人知但珍贵的开源游戏宝藏更有意义了。

有各种各样的开源游戏，包括大量的第一视角射击游戏、Nodulus 之类的益智游戏、运输大亨之类的策略经营游戏、Jethook 之类的竞速游戏、Sauerbraten 之类的竞速逃生游戏，以及很多未提到的（多亏了像 Open Jam 这样伟大的活动，每年都有新增的游戏）。

![Jethook game screenshot][10]

总的来说，探索开源游戏的世界的体验，和购买大型游戏工作室的产品带来的即时满足感有很大的不同。大型游戏工作室生产的游戏提供大量的视听刺激、知名演员、和长达 60 小时以上的游戏时长。而独立和开源游戏不能与之相提并论。但是话又说回来，大型游戏工作室无法提供的是，当你发现一款别人未曾听说过的游戏时的产生的发现感和与个人相关的感受。当你意识到别人都非常想知道你刚玩过的哪个出色游戏时，大型工作室也并不能提供这种紧迫感。（LCTT 校注：此处大概的意思是指大型工作室的作品已被人熟知，没有什么挖掘的新鲜感）

花点时间找出你最喜欢的游戏，然后浏览下你的发行商的软件仓库、Flathub、开源的游戏仓库，看看你能发现什么，如果发现你很喜欢的游戏，就帮忙推广一下吧。

#### Proton 和 WINE

Linux 上的游戏并没有止步于开源，但是从开源开始的。数年前 Valve 软件公司通过发行 Linux 版的 Steam 客户端把 Linux 重新带入游戏市场时，人们希望这可以推动游戏工作室能编写原生的 Linux 游戏。一些工作室这样做了，但 Valve 公司并没有成功的把 Linux 推为主要的平台，即使是 Valve 品牌的游戏电脑。并且大多数游戏工作室又转回仅在 Windows 平台上开发游戏的旧方式。

有趣的是，最终的结果是产生了更多的开源代码。Valve 公司为 Linux 兼容创建了 Proton 工程，一个可以转换 Windows 游戏到 Linux 的兼容层。在 Proton 的内核层面，它使用了WINE（Wine Is Not an Emulator） —— 以开源的方式极好地重新实现了主要的 Windows 库。

游戏市场的成果，如今已经变成了开源世界的宝藏。今天，来自大型工作室的大多数游戏都可以在 Linux 上像原生游戏一样运行。

当然，如果你是必须要在发行日就玩上最新版游戏的这类玩家，你可能会遇到一些令人不愉快的“惊喜”。尽管那不是惊喜，很少有大型游戏在发行时毫无漏洞，一周后才补上补丁。这些游戏在 Proton 和 WINE 上运行时遇到这些错误可能更糟糕，因此 Linux 玩家通过避免尽早上车而避免这些问题。这种妥协可能是值得的。我玩过一些游戏，它们在 Proton 平台运行完美，后来从愤怒的论坛帖子中发现，它在最新版的 Windows 上运行显然充满了致命的错误。总之，似乎来自大型工作室的游戏并不完美，但你可能在 Linux 上遇到相似但不同的问题，正如你在 Windows 上遇到的。

#### Flatpak

Linux 近来历史上最令人激动的发展就是 Flatpak 了，它是本地容器和打包的结合，它和游戏无关（或者它和游戏息息相关），它使得 Linux 应用基本上能被分发到任意的 Linux 发行版上。这也适用于游戏，因为在游戏中使用了相当多的前沿技术，而对发行版维护者来说，要跟上任何特定游戏所需的所有最新版本可能是相当苛刻的。

Flapak 通过为应用程序库抽象出一种通用的 Flatpak 特定的层，而将其从发行版中抽象出来。Flatpak 软件包的发行者知道，如果一个库不在 Flatpak SDK 中，那么它必须要包含在 Flatpak 软件包中，简单而直接。

多亏了 Flatpak，Steam 客户端可以运行在像 Fedora 这样的常用发行版上，也可以运行在 RHEL、Slackware 等从传统角度看并不面向游戏市场的操作系统上。

#### Lutris

如果你并不急于在 Steam 上注册账号，那么可以用我比较偏爱的游戏客户端 Lutris 。表面上看，Lutris 是一个简单的游戏启动器，当你想玩游戏但还没决定玩什么的时候，你可以到这这里找找。有了 Lutris，你可以将系统上的所有游戏添加到你的游戏库，然后从 Lutris 界面启动并立即玩起来。更好的是，Lutris 贡献者（像我一样）会定期发布安装脚本，使你可以轻松安装自己的游戏。这并不是必须的，但它可以是一个很好的捷径，可以绕过一些繁琐的配置。

Lutris 也可以借助运行器或子系统，来运行那些不能从应用菜单直接启动的游戏。比如你想玩开源的《<ruby>魔兽塔防<rt>Warcraft Tower Defense</rt></ruby>》这样的游戏机游戏，你必须运行模拟器。如果你已经安装过模拟器的话，Lutris 可以帮你处理这一切。除此以外，如果你有一个 GOG.com 游戏账号，Lutris 可以访问它，并可以把游戏导入你的游戏库中。

没有比这更容易的管理你的游戏的方式了。

### 去玩游戏吧

Linux 游戏是一种充实且给人力量的体验。我过去避免玩电脑游戏，因为我不觉得我有太多的选择。似乎昂贵的游戏总是在不断发布，并且不可避免的获得好或者不好的极端体验，然后很快又转向下一个。另一方面，开源游戏把我引入了游戏的圈子。我见到过其他玩家和开发者。我见到过艺术家和音乐家、粉丝以及推广者。我玩过各种各样的我从来不知道的游戏。其中一些甚至不够我玩一下午，而其他的却让我长久的着迷于游戏、修改、关卡设计和乐趣。

如果你准备好放下爆米花，从各个角度体验下游戏的话，那就在 Linux 上开始游戏吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-gaming

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[godgithubf](https://github.com/godgithubf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gaming_grid_penguin.png?itok=7Fv83mHR (Gaming with penguin pawns)
[2]: https://opensource.com/alternatives/minecraft
[3]: https://itch.io/jam/open-jam-2020
[4]: https://opensource.com/article/20/5/open-source-fps-games
[5]: https://hyperparticle.itch.io/nodulus
[6]: https://www.openttd.org/
[7]: https://rcorre.itch.io/jethook
[8]: http://sauerbraten.org/
[9]: https://opensource.com/article/18/9/open-jam-announcement
[10]: https://opensource.com/sites/default/files/game_0.png
[11]: http://flathub.org
[12]: https://github.com/ValveSoftware/Proton
[13]: http://winehq.org
[14]: https://opensource.com/business/16/8/flatpak
[15]: https://www.redhat.com/en/enterprise-linux-8
[16]: http://lutris.net
[17]: https://opensource.com/article/18/10/lutris-open-gaming-platform
[18]: https://ndswtd.wordpress.com/download

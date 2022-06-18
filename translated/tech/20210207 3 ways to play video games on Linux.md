[#]: collector: (lujun9972)
[#]: translator: (godgithubf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 ways to play video games on Linux)
[#]: via: (https://opensource.com/article/21/2/linux-gaming)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

三种在Linux系统上玩视频游戏的方式
======
如果你准备好下载游戏并且全方位体验游戏的话，那么在 linux 下启动游戏吧！
![Gaming with penguin pawns][1]

 从 2021 年以后，人们有更多喜欢 Linux 的理由。在这个系列里，我将分享 21 个使用 Linux 的理由。今天，我将从游戏开始。

我过去认为电脑游戏者是一种特殊的人群，要被研究人员在数年的研究和测试之后严谨地认定。我从来没有把我自己归为电脑游戏者，因为我所玩过的游戏既不是桌面游戏（棋类游戏和纸笔角色扮演游戏）也不是探险游戏和俄罗斯方块。现在，这些游戏可以在移动设备、控制台、电脑和电视机等各种环境上玩。好像该是时候承认游戏者可以以形形色色的方式参与进来。如果你想自称为游戏者，你就可以，不需任何资格认定。你不必记得有科乐美等类似的游戏公司。你不必购买和玩3A级的游戏，只要你时常玩游戏你就完全可以自称为游戏者。如果你想成为一个游戏者，现在使用 Linux 正当其时。

### 欢迎到圈子里

剥除排行榜上闪闪发光的广告及背后的东西，你肯定会发现一个欣欣向荣的游戏世界。在任何人相信既不是电子表格也不是练习打字一类的软件能挣钱以前新兴的游戏市场已经开始发展起来了。非主流的游戏已经在流行文化上以各种方式打上了自己的烙印（信不信由你，《我的世界》尽管不是开源的，作为独立制作的游戏已经发展起来了），这也证实了，在玩家眼里，游戏先于产品价值。

在独立制作和开源开发者之间有很多交叉的地方。

有各种各样的开源游戏可玩，包括大量的第一视角射击游戏，益智游戏像 Nodulus ，策略经营游戏像运输大亨，竞速游戏向 Jethook ，减压游戏像 Sauerbraten ，等等还有很多未提到的（多亏了像 Open Jam 这样伟大的倡议，每年都有新增的游戏）

![Jethook game screenshot][10]

总的来说，探索开源游戏的世界的体验和主流游戏工作室的产品带来的即时的满足是很不同的。大的游戏工作室生产的游戏提供大量的视觉和听觉刺激，知名演员，和多达60小时的游戏。独立和开源游戏不可能和它匹敌。但是，主流游戏工作室无法达到的是当你发现一款别人未曾听说过的游戏时的产生的发现和个人连接的感受。主流工作室不希望当你认识到世界上的的每个人都非常需要知道你刚玩过的那个游戏所获取的那种感受。（这样翻译真别扭 ）

花点时间找出你最喜欢的游戏，然后浏览下你的发行商的软件仓库，打开开源游戏仓库，看下哪个是发行商没有覆盖到的，如果你足够喜欢的游戏，帮忙推广一下吧。

### Proton and WINE

Linux 上的游戏不止于开源，但是从开源开始的。数年前Valve软件公司通过发行 Steam 客户端的 Linux 版把 Linux 带入游戏市场，希望是能够强制游戏工作室能在 Linux 系统上写本地代码。一些工作室这样做了，但 Valve 公司并没有成功的把 Linux 推为主要的平台，即使是 Valve 品牌的游戏电脑。并且大多数游戏工作室又转回仅在 windows 平台上开发游戏的旧方式。

有趣的是，最终的结果是有更多的开源代码被生产出来。 Valve 公司为 Linux 兼容创建了 Proton 工程，一个可以转换 windows 系统游戏到 Linux 的兼容层。在 Proton 的内核层面，它使用了WINE（WINE不是模拟器），好的令人难以置信的是重新实现的主要 windows 库是开源的。

游戏市场的打破结果成为了开源世界的宝藏。今天，来自主流工作室的大多数游戏都可以在 Linux 上运行就好像他们在 windows 上运行一样。

当然，如果你是必须要有最新版的游戏的这类玩家，你可定会遇到令人不愉快的惊喜。尽管那不是惊喜，很少有主流的游戏发行时毫无漏洞，那需要一周后大量的补丁。这些漏洞在Proton和WINE上更糟糕，因此 Linux 游戏者经常从使用早期版本中获益。这种妥协可能是值得的。我玩过一些游戏，它们在 Proton 平台运行完美，后来从愤怒的论坛邮件中发现它在最新版的 windows 上运行有明显的谜一般的致命错误。总之，似乎来自主流工作室的游戏并不完美，但你可能在 Linux 上遇到相似但不同的问题正如你在 windows 上遇到的。

### Flatpak

最近 Linux 历史上最令人激动的发展就是 Flatpak 了，跨越了本地容器和包，它和游戏无关（或者它和游戏息息相关），它使得 Linux 应用能基本上被分发到任意的 Linux 发行版上。这也适用游戏，因为有相当多次要的技术在游戏中使用。并且它可以很好地对给定的游戏要求发行维护者来保持和所有最新版要求一致

 Flapak 从发行中为应用库抽象出一种公共的 Flatpak 特定的层。Flatpak 的发行者知道 如果一个库不在 Flatpak SDK 中，那么它必须要包含在 Flatpak 中，简单而直接。

多亏了 Flatpak ， Steam 客户端可以运行在一些像 Fedora, RHEL, Slackware 等从传统角度看并不面向游戏市场的操作系统

### Lutris

如果你不渴望注册 steam 账号，那么可以用我比较偏爱的游戏客户端 Lutris 。表面上看，Lutris 是一个简单的游戏启动器，当你想玩游戏但还没决定玩什么的时候你可以去的地方。有了Lutris，你可以添加你系统上的所有游戏到你的游戏库，然后从 Lutris 界面启动并立即玩起来。更好的是，Lutris 贡献者（像我一样），可以正常的发布安装脚本来使安装你拥有的游戏变得容易。这并不是必须的，但它可以是一个很好的捷径来免除乏味的配置。
 Lutris 也可以支持运行者或者子系统来运行那些不能从应用菜单直接启动的游戏。比如你想玩控制台游戏像开源的魔兽争霸，你必须运行模拟器。如果你已经安装过模拟器的话， Lutris 可以帮你处理。除此以外，如果你有一些老旧的游戏账号， Lutris 可以访问它，并可以把游戏导入你的游戏库中。

没有比 Lutris 更容易的方式来管理你的游戏了。

### 玩游戏

 Linux 游戏是一个充实且给人力量的体验。我过去避免玩电脑游戏因为我没有觉得我有很多的选择。似乎有很多昂贵的游戏在发行并且不可避免的获得好或者不好的体验，然后很快有转向下一个。另一方面，开源游戏把我引入了游戏的王国。我见到过其他玩家和开发者。我见到过艺术家和音乐家，粉丝以及发起人。我玩过各种各样的游戏但我从来都没认识到他们的确存在过。他们仅仅够我玩一下午，然而其他的却让我长久的着迷于游戏，改进，关卡设计和乐趣。

如果你准备好来从各个角度体验下游戏的话，在 Linux 上开始游戏吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-gaming

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/godgithubf)
校对：[校对者ID](https://github.com/校对者ID)

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

[#]: subject: "How I use open source to play RPGs"
[#]: via: "https://opensource.com/article/21/10/open-source-rpgs"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14859-1.html"

我如何使用开源玩 RPG 游戏
======

> 为角色扮演游戏的所有元素找到一个开源工具。

![](https://img.linux.net.cn/data/attachment/album/202207/24/075445ymf5nvigh4t4htfd.jpg)

我玩过很多桌面角色扮演游戏（RPG），无论是从频率还是种类来说。一般来说，我更喜欢和朋友一起玩 RPG，但在过去的 2 年里，我一直在玩网络游戏。（LCTT 校注：这里的 RPG 游戏指的是那种“传统”的面对面的桌面游戏，而非很多人最初接触的 RPG 电子游戏。）

起初，我不确定如何在线长期的进行游戏。我知道有很多的工具可以实现，但直到我发现在线桌面游戏的开源世界之前，这些工具没有一个引起我的兴趣。通过一小部分开源应用程序，我已经能够在开源平台上进行我的所有游戏。

这也是一年中的好时机，因为最近是 [免费 RPG 日][2]（LCTT 校注：今年的这个节日在 7 月 23 日举办）。在免费 RPG 日，桌面角色扮演游戏行业的发行商们会免费发放游戏，鼓励玩家尝试新游戏和新冒险。尽管它在 2020 年被取消了，但今年它又作为现场活动回归，并通过 [Dungeon Crawl Classics][3] 和 [Paizo][4] 的免费 RPG 示例下载提供了一些虚拟支持。

如果这个活动提供的虚拟产品还不够，我还整理了一份 [你可能尚未尝试过的 5 个开源桌面 RPG 游戏列表][5]。

当你准备好开始玩游戏时，请尝试其中一些开源工具，看看它们能在多大程度上增强你的游戏体验。

### 聊天

在线 RPG 游戏最基本的（从技术上讲，也是唯一的）要求是交流。这是游戏的媒介：玩家需要一种说话的途径。

有几个不错的选择。我发现 [Mumble][6] 是对带宽需求最低的工具。这是一个纯语音聊天应用程序，可以使用非常高效的 Opus 编解码器让每个人一次交谈数小时而不会中断。

![Mumble client][7]

它在世界各地都运行有公共实例，所以下载 Mumble 客户端后，你可以加入其中任何一个开放的实例，并使用它来在线运行游戏。有一个“按下通话”设置，你可以用此来消除背景噪音，当你的其他家庭成员在进行其它工作而不想被你的桌面会话打扰时，这个功能将会非常实用。

还有一个文本聊天客户端。我的游戏组通常使用它来发布与游戏相关的链接，但你也可以将其用于其它无关内容的交谈，而让口头游戏保持在主题上。

如果你的玩家更喜欢看到面部表情，或者只是习惯于视频聊天网页应用。那么 [Jitsi][8] 是面对面围坐在桌子旁聚会的绝佳替代品。Jitsi 和你曾经使用过的其它视频聊天软件几乎一样，甚至更简单。你可以设置一个“房间”，邀请朋友，将陌生人拒之门外，并玩上几个小时。静音和关闭摄像都很直观，界面很吸引人，并且还定期开发和推出了新功能。

![Jitsi][9]

Mumble 和 Jitsi 都有适用于台式机和移动设备的客户端，因此任何人都可以在任何设备上使用。

### 角色表

我发布了我的 [数字角色表][10] 解决方案，但任何 RPG 玩家都知道管理角色不仅仅是统计数据。

在延续多个会话的在线游戏中，我发现每次游戏之间有很长的停止时间。我突然想到，虽然我发现要求我的玩家在现场纸笔游戏中计算损耗是不合理的，但当一切都是数字化时，要求他们跟踪损耗很容易。

网上有很多可用的电子表格，但开源的选择是 [Ethercalc][11]。由于其实例遍布世界各地，因此很容易找到免费的 Ethercalc 主机。或者，你可以使用 Podman 或者 Docker 轻松安装和运行你自己的实例。

![Ethercalc spreadsheet of inventory][12]

Etherclac 提供了一些基本要素：一个共享的账本，这样玩家就可以跟踪他们的团队所携带的物品（以及在任何给定的时间持有该物品的人）、每件物品的重量和价值。当队伍在游戏过程中收集到战利品时，就会输入该物品，所以他们知道什么自己何时会因为负担过重而无法拿起新物品。

在不同的游戏会话之间，可以引用和整理这份共享的电子表格，以便玩家（PC）知道哪些物品可以卖掉，哪些物品可以放入储物袋，哪些物品可以在下一次会话发现更好的战利品时安全的丢弃。

### 地图

Mythic Table 是一款开源的桌面游戏共享地图系统。这意味着你可以加载图片作为游戏地图，并在地图上移动数字标记以表示玩家角色所在的位置。

自从 [上次我介绍了关于 Mythic Table][13] 以来，它已经在 Kickstarter 上成功地进行了一次众筹，以确保它的持续发展。它还增加了一些新功能，其中最引人注目的是“战争迷雾”功能，它允许地下城主掩盖地图并仅显示玩家探索过的部分。

![A dungeon map rendered by Mythic Table and user interface choices for chat, maps, and characters][14]

在过去的几个月里，我一直在 Mythic Table 上运行两款游戏，这是一款优秀且直观的地图系统。它还提供了一个数字骰子筒，所以如果你的玩家没有骰子，或者你更喜欢在公开场合掷骰子，你就可以用它作为共享的骰子池。

你可以在 [mythictable.com][15] 上试用 Mythic Table，或者访问他们在 [Github][16] 上的代码库。

### 开源的开放游戏

我使用的开源工具是通用的，因此它们适用于你想玩的任何游戏系统。因为它们都是开源的，所以无论你的玩家使用什么操作系统，他们都可以在线使用，并且它们都可以自托管。

如果你既是程序员又是游戏玩家，请访问他们的 Git 代码仓库，看看是否有任何你可以贡献的东西。如果你是游戏玩家或者游戏管理员，在下次坐在数字版的游戏桌前请尝试使用一下这些工具。你可能会惊讶于你只需要很少的在线账户就可以使用一些可用于游戏的最佳应用程序。

*（文内图片来自：Seth Kenlon，CC-BY-SA 4.0）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/open-source-rpgs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/header_dice.png?itok=dOMrHopO (Dice as a random number generator)
[2]: https://www.freerpgday.com/
[3]: https://goodman-games.com/blog/2021/10/06/pdf-previews-of-our-free-rpg-day-releases/
[4]: https://paizo.com/community/blog/v5748dyo6shte
[5]: https://opensource.com/article/21/10/rpg-tabletop-games
[6]: http://mumble.info/
[7]: https://opensource.com/sites/default/files/mumble-client.png (Mumble client)
[8]: https://jitsi.org/
[9]: https://opensource.com/sites/default/files/jitsi-client.jpg (Jitsi)
[10]: https://opensource.com/article/21/10/3-ways-manage-your-character-sheets-open-source
[11]: http://ethercalc.net/
[12]: https://opensource.com/sites/default/files/uploads/ethercalc.jpeg (Ethercalc)
[13]: https://opensource.com/article/20/11/open-source-battle-maps
[14]: https://opensource.com/sites/default/files/uploads/mythic.jpeg (Mythic Table)
[15]: http://mythictable.com/
[16]: https://gitlab.com/mythicteam/mythictable

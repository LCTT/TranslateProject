[#]: subject: "How I use open source to play RPGs"
[#]: via: "https://opensource.com/article/21/10/open-source-rpgs"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

我如何使用开源玩 RPG 游戏
======
为角色扮演游戏的所有元素找到一个开源工具。
![Dice as a random number generator][1]

我玩过很多桌面角色扮演游戏（RPG），无论是频率还是种类。一般来说，我更喜欢和朋友一起玩RPG，但在过去的 2 年里，我一直在玩网络游戏。

起初，我不确定如何在线运行长期游戏。我知道有很多的工具可以实现，但直到我发现开源在线桌面游戏的世界之前，我都对此不敢兴趣。通过一小部分开源应用程序，我已经能够在开源平台上运行我的所有游戏。

这也是一年中的好时机，因为最近是[免费 RPG 日][2]。在免费 RPG 日，桌面角色扮演游戏行业的发型商免费发布游戏，鼓励玩家尝试新游戏和新冒险。尽管它在 2020 年被取消，但今年它又作为现场活动回归，并通过 [Dungeon Crawl Classics][3] 和 [Paizo][4] 的免费 RPG 采样器下载提供了一些虚拟支持。

如果活动的虚拟产品还不够，我整理了一份[你可能尚未尝试过的 5 个开源桌面 RPG 游戏列表][5]。

当你准备好开始玩游戏时，请尝试其中一些开源工具，看看它们能在多大程度上增强你的游戏玩法。

### 聊天
在线 RPG 游戏最基本的（从技术上讲，也是唯一的）要求是交流。这是游戏的媒介：玩家需要一种说话的途径。

有几个不错的选择。我发现 [Mumble][6] 是对带宽需求最低的工具。这是一个纯语音聊天应用程序，可以使用非常高效的 Opus 编解码器让每个人一次交谈数小时而不会中断。

![Mumble client][7]

CC BY-SA Seth Kenlon

世界各地都有公共实例，所以下载 Mumble 客户端后，你可以加入其中任何一个开放的实例，并使用它来在线运行游戏。有一个按键通话设置，你可以用此来消除背景噪音，当你的其他家庭成员在进行其它工作而不想被你的桌面会话打扰时，这个功能将会非常实用。

还有一个文本聊天客户端。我的游戏组通常使用它来发布与游戏相关的链接，但你也可以将其用于无关的聊天，尝试保持口语游戏的主题。


If your players prefer facial cues or are just used to video chat web apps, then [Jitsi][8] is an excellent substitute for in-person gatherings around a table. Jitsi is mostly like every other video chat application you've ever used, except possibly even easier. You can set up a room, invite friends, keep out strangers, and play for hours. Muting and going off-camera are intuitive, the interface is attractive, and new features are being developed and introduced regularly.

![Jitsi][9]

CC BY-SA Seth Kenlon

Both Mumble and Jitsi have clients for both desktop and mobiles, so anyone can play no matter what device they're on.

### Character sheets

I've already posted about my [digital character sheet][10] solutions, but any RPG player knows that there's more to managing a character than just stats.

During a game online that spanned several sessions, I found there was a lot of downtime between games. It occurred to me that, while I found it unreasonable to demand that my players calculate encumbrance during a live pen-and-paper game, it's pretty easy to request them to track encumbrance when everything's digital.

There are plenty of spreadsheets available online, but the open source option is [Ethercalc][11]. With instances all over the world, it's easy to find a free Ethercalc host. Alternately, you can use Podman or Docker to easily install and run your own instance.

![Ethercalc spreadsheet of inventory][12]

Seth Kenlon, CC-BY-SA 4.0

Ethercalc provides the essentials: a shared ledger so players can track the items their party is carrying (and who's holding one at any given time), the weight of each item, and the value. Items get entered as the party collects loot during the game, so they know when they're too burdened to pick up something new.

Between sessions, the shared spreadsheet can be referenced and organized so that the PCs know what to sell or stuff into a bag of holding or what they can safely drop when better loot presents itself next session.

### Maps

Mythic Table is an open source shared mapping system for tabletop games. That means you can load an image to serve as the map of your game and move digital tokens on the map to represent where players' characters are located.

Since [last I wrote about Mythic Table][13], it's run a successful Kickstarter campaign to ensure its continued development. It's also gained several new features, most notably a "fog of war" feature that allows the dungeon master to blank out the map and reveal only the parts that players have explored.

![A dungeon map rendered by Mythic Table and user interface choices for chat, maps, and characters][14]

Seth Kenlon, CC-BY-SA 4.0

I've been running two games on Mythic Table for the past few months, and it's been an excellent and straightforward map system. Conveniently, it also features a digital dice roller, so if your players lack dice or you prefer to roll dice in the open, you have a shared dice pool.

You can try Mythic Table at [mythictable.com][15] or visit their code repository on [Github][16].

### Open gaming on open source

The open source tools I use are universal, so they work with whatever game system you decide to play. Because they're all open source, they can be used online by all your players regardless of what OS they use, and they can all be self-hosted.

If you're a programmer as well as a gamer, visit their Git repositories and see if there's anything you can contribute. If you're a gamer or a gamemaster, try the tools out the next time you sit down at a digital game table. You might be surprised at just how few online accounts you actually need to have to use some of the best applications available for gaming.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/open-source-rpgs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

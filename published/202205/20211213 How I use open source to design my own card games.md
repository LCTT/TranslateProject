[#]: subject: "How I use open source to design my own card games"
[#]: via: "https://opensource.com/article/21/12/open-source-card-game"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "hadisi1993"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14551-1.html"

我如何利用开源设计自己的卡牌游戏
======

> 开源并不仅仅指的是软件。开源是一种文化现象，自然也适合桌面游戏。

![](https://img.linux.net.cn/data/attachment/album/202205/06/094320k8uug3i84pg8u0w2.jpg)

我喜欢优秀的游戏，尤其是桌游，因为桌游的很多特性都和开源相同。在现实生活中，当你和朋友围坐在桌旁一起玩卡牌游戏时，作为一个团队，你们可以一起决定小丑牌是不是万能的。还有，你们可以随意地决定当出了小丑牌后，手上有 Ace 牌的人的要不要舍弃 Ace 牌，或者出了方块皇后以后，每个人是不是都要把手上的牌传给右手边的人。换句话说，你们可以随心所欲地重新制定规则，因为游戏不过是参与者们一致认同的条件集合罢了。对我来说，更棒的是你可以发明自己的游戏，而不用破坏别人的游戏规则。有时候，我会作为一个业余爱好者来开发桌游。因为我喜欢把自己的爱好结合起来，所以我倾向于只使用开源和开放的文化资源来设计游戏。

首先，游戏有大致有两个关键特征，风格和机制，理解这一点非常重要。游戏风格指的是游戏的故事或者主题，游戏机制指的是游戏的规则和条件。这两者并不总是完全脱离的，举个例子，在设计一款以赛车为主题的游戏时，自然而然就会要求玩家迅速完成动作。然而，风格和机制通常是被分开对待的，所以我们完全可以为了好玩就去创造一款使用标准扑克牌，却以太空羊驼为主题的游戏。

### 开源美术

如果你去过现代艺术博物馆，你可能会发现自己站在一幅纯蓝色的画布前，无意中听到有人说起老话:“见鬼，这我也能做！”。但事实是，艺术是一项艰巨的工作。创作赏心悦目的艺术品需要付出大量的思考、时间、信心和技巧。这也意味着艺术是你在设计游戏时中最难采购的部分之一。

我有一些“技巧”来解决这个典型难题。

#### 1、寻找同类素材

现在有很多免费、开放的艺术作品，而且大部分质量上佳。问题在于，游戏通常需要不止一件作品。如果你正在设计一款纸牌游戏，你大概至少需要四到六个不同的元素（假设你的纸牌遵循塔罗牌风格），有可能还需要更多。如果你花足够多的时间在这上面，你可以在 [OpenGameArt.org][3]、[FreeSVG.org][4]、[ArtStation.com][5]、[DeviantArt.com][6] 等网站上找到<ruby>[知识共享和公共领域][2]<rt>Creative Commons and Public Domain</rt></ruby>的艺术作品。

如果你使用的网站没有专门搜索<ruby>知识共享<rt>Creative Commons</rt></ruby>的功能，输入以下文字到任何搜索引擎当中，`"This work is licensed under a Creative Commons"` 或 `"本工作处于知识共享许可协议之下"`（引号很重要，不要把它们漏了），并用搜索引擎要求的语法，以便将搜索限制到一个具体的站点当中（举个例子，`site:deviantart.com`）。

一旦你有了一个可供挑选素材的艺术库，那就去辨别这些作品的主题，并根据主题分类。两个不同的人拍摄的机器人的照片可能看起来一点都不像，但它们的主题都是机器人。如果提供给你足够多机器人相关的美术素材，你可以围绕机器人这个主题构建你的游戏风格。

#### 2、委托创作知识共享艺术

你可以雇艺术家来为你定制艺术作品。我与使用开源绘画程序（如 [Krita][7] 和 Mypaint）的艺术家一起合作。同时，作为合同的一部分，我规定艺术作品必须在<ruby>知识共享署名-相同方式许可证<rt>Creative Commons Attribution-ShareAlike</rt></ruby>（CC BY-SA）下授权。迄今为止，只有一位艺术家因为许可证的限制拒绝了我的提议，并且大多数人都很高兴自己的美术作品有可能有更大的生命力，而不仅仅是作为业余爱好者自己发行的游戏的一部分。

#### 3、创作自己的艺术

就像现代艺术馆之旅展示的那样，艺术是一个非常灵活的词。我发现只要我给自己设定一个目标，也就是我需要为一款游戏创造多少纸牌或令牌，我便能够从 Linux 上的丰富图像创造工具中选择一种去创作。这并不需要什么高难度的东西。就像现代艺术一样，你可以用蓝色和黄色的条纹，或者红色和白色的圆点花纹，或者绿色和紫色的锯齿线来涂一张卡片，只要你能把它们画出来，那么除了你以外，其他人永远不会知道你暗地里把它们当做仙宫里的贵族和小姐。想想看，通过运用图形应用程序，描摹日常物品的照片，重组经典的扑克花色和塔罗牌主题等一系列方式，你可以创造出的简单作品吧。

### 版面设计

我用 [Inkscape][8]、Scribus 或者 [GIMP][9] 来进行版面设计，这取决与我有什么素材以及我追求的设计方式是什么。

对于卡牌，我发现简单的版面设计很容易实现，看上去也更好，纯色比渐变色更容易印刷，还有，直观的图像是最棒的。

![layout in Inkscape][10]

（Seth Kenlon, CC BY-SA 4.0）

我在一个单独的 Inkscape 文件中为我最新的游戏做了版面设计，这个游戏只使用了来自 OpenGameArt.com 上三四个不同艺术家的九张图片。在有着更大的美工集，更好的卡牌多样性的游戏中，我会在游戏中的每一种卡片的文件中为它们设计版面。

在为你的游戏素材做任何版面设计之前，要先了解你的目标输出是什么。如果你打算在家里打印游戏，那就做一些计算，搞清楚默认的纸张大小（有些是 US Letter，或者是 A4）可以容纳多少卡牌、令牌或卡片。如果你使用 [TheGameCrafter][11] 之类的桌游打印机打印，请下载好模板文件。

![printed cards][12]

（Seth Kenlon, CC BY-SA 4.0）

### 游戏机制

游戏机制是游戏中最重要的部分。它们使一款游戏成为游戏。开发游戏规则并不一定是一个正式的过程。你可以一时兴起地创造了一款游戏，可以拿一个现有的游戏重组它的规则，直到它和原来不同，可以修改一款你不喜欢的游戏，也可以将两款不同的游戏组合在一起。从简单容易的地方做起，拿索引卡，标准扑克牌，或塔罗牌去试着模拟你的想象中游戏是如何工作的。你可以自己尝试早期的游戏创意，但最终，让朋友来帮忙是找出意外故障和进行优化的好方法。

经常测试游戏。与不同类型的玩家一起玩游戏，并听取他们的反馈。你的游戏可能会激发许多玩家去创造新的规则和想法，因此要将关于 _哪些搞砸了_ 的反馈与关于 _哪些可以做修改_ 的反馈分开。你不一定要去真的实施这些反馈意见，只需迭代你的想法，但还是要仔细考虑错误报告。

一旦确定了你想要让你的规则如何运作，就把它们写下来，让它们 [简短且容易解析][13]。你定的规则不必说服玩家去玩这款游戏，不必向他们解释策略，你也不必允许玩家重新设置规则，只要告诉玩家为了让游戏玩起来，他们应该采取的步骤就可以了。

最重要的是，考虑一下，将你的规则开源。分享经验是游戏的一切，这其中也应该包括规则。知识共享或<ruby>开放游戏许可证<rt>Open Gaming License</rt></ruby>的规则集合允许其他玩家在你的作品上进行迭代、混合和构建。你永远不会知道，有人可能会因此想出一个你更喜欢的游戏变体！

### 开源游戏

开源不仅仅指的是软件。开源是一种文化现象，自然也适合桌面游戏。花几个晚上的时间来尝试制作游戏。如果你是新手，那就从一些简单的开始，比如下面的这个空白卡牌游戏：

  1. 找来一些朋友。
  2. 给每个人几张空白的索引卡，告诉他们在每张卡片上写一条规则。规则可以是任何东西（“如果你穿着红色衣服，你就赢了”或“第一个站起来的人赢”等等）。
  3. 在你自己的索引卡片上，写上 “和”、“但是”、“但是不要”、“而且不要”、“除了”，以及其他的条件短语。
  4. 洗牌并将牌发给所有玩家。
  5. 每个玩家轮到的时候出一张牌。
  6. 最终目标是获胜，但是玩家可以通过出 “和”、“但是”、“或者” 卡片来修改决定胜负的条件。

这是一个有趣的聚会游戏，同时是一份很好的介绍，告诉你如何像游戏设计者一样思考，它帮助你认识到什么适合作为游戏机制，什么不适合。

还有，当然的，这是开源的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/open-source-card-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hadisi1993](https://github.com/hadisi1993)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rich-smith-unsplash.jpg?itok=uzzS0gRa (Deck of playing cards)
[2]: https://opensource.com/article/20/1/what-creative-commons
[3]: https://opensource.com/article/21/12/opengameart.org/
[4]: http://freesvg.org
[5]: http://artstation.com
[6]: http://deviantart.com
[7]: https://opensource.com/article/21/12/krita-digital-paint
[8]: https://opensource.com/article/21/12/linux-draw-inkscape
[9]: https://opensource.com/content/cheat-sheet-gimp
[10]: https://opensource.com/sites/default/files/inkscape-layout.jpg (Layout in Inkscape)
[11]: https://www.thegamecrafter.com/
[12]: https://opensource.com/sites/default/files/cards-printed_0.jpg (Printed cards)
[13]: https://opensource.com/life/16/11/software-documentation-tabletop-gaming

[#]: subject: "Make a video game with Bitsy"
[#]: via: "https://opensource.com/article/22/1/bitsy-game-design"
[#]: author: "Peter Cheer https://opensource.com/users/petercheer"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14224-1.html"

用 Bitsy 制作电子游戏
======

> Bitsy 是一个开源电子游戏设计软件。 其简约的功能使任何人都可以探索他们的创造力。

![](https://img.linux.net.cn/data/attachment/album/202201/29/180248kkvmou3klq9qkyky.jpg)

有许多游戏设计程序和各种游戏设计方法，但对我来说，最突出的是 Bitsy。Bitsy 由 Adam Le Doux 在 2017 年创建，在 MIT 许可下发布，用其创造者的话说，Bitsy 是：“一个用于小游戏或世界的编辑器。其目标是使制作游戏变得容易，在那里你可以四处走动，与人交谈，并到某个地方。”

### 安装 Bitsy

Bitsy 是用 JavaScript 编写的，可以制作 HTML5 游戏。你可以从 [GitHub][2] 或 [它的创造者的网站][3] 下载它。它很小，很容易学习，有独特的位图艺术风格，有意在功能上有所欠缺，而且能做的事情有限。

尽管（也许是因为）这些限制，Bitsy 自发布以来吸引了一个充满活力的用户社区。用户对 Bitsy 采取的两个主要方法是：接受限制和寻求突破限制，看看你能走多远。

### 创意的界限

Bitsy 的局限性意味着接受这些局限性仍能制作出令人满意的游戏，这就成为一个需要创造性和创造力的挑战。你可以在 [Itch.io 网站][4] 上看到和玩一些用 Bitsy 制作的令人印象深刻的游戏。同时，人们也想出了一些黑科技、调整和扩展。这些都在不牺牲 Bitsy 的本质的前提下突破了一些限制。

Bitsy 的基本元素是一个代表玩家的头像、发生游戏动作的房间、精灵（可以与之互动的非玩家角色）和物品。有一个用于创建这些元素的位图编辑器，它也支持简单的两帧动画。

![Bitsy bitmap editor][5]

在 Bitsy 中工作依赖于条件变量，而不是成熟的脚本，这使得没有编码背景的人容易学习，但有时会让那些期待更多灵活性的人感到沮丧。

如果你想了解 Bitsy 的基本情况，你可以在创作者的网站上了解，或者下载并在本地运行。

![Bitsy room editor][7]

### 文档

关于 Bitsy 的文档并不是只有一个地方可以去看。如果你想看 Bitsy 的操作，可以在 YouTube 上找到各种短视频。我更喜欢基于文本的教程，我发现最有用的三个资源是：

  * [Itch.io 网站上提供的官方 Bitsy 教程][8]，作者是 Claire Morwood
  * [Bitsy workshop PDF][9]， 由用户 haraiva 提供
  * [Bitsy 变量][10]， 教程由用户 ayolland 编写

阅读这些教程，尝试一些 Bitsy 游戏，并开始创造你自己的东西。开始时要保持简单。当你熟悉了 Bitsy，你可能想研究一下人们为它创造的一些 [工具、黑科技和扩展][11]。

它也是教育工作者的完美工具，甚至还有教育工作者 Hal Meeks 的 [Bitsy 课程][12] 可供在线学习。

你还可以在 [Itch.io 网站][13] 上找到人们为 Bitsy 制作的大量游戏资源。

### Twine 整合

你可能已经尝试过流行的基于浏览器的游戏开发工具 [Twine][14]。你可以将 Bitsy 与 Twine 不同程度地整合。整合的范围可以从简单地将 Bitsy 游戏放在一个 iframe 中显示在你的 Twine 游戏中，到在两个引擎之间共享变量和对话命令，让你在 Bitsy 游戏中执行基本的 Twine 命令！如果你对这些感兴趣，那么请看：

  * [结合 Bitsy 和 Twine 的教程][15]
  * [Bitsy 黑科技][16]
  * [Freya 的 Twisty 模板][17]

### 给初学者的 Bitsy

初学者很容易入门 Bitsy，无论你是编程新手还是仅仅是游戏设计的新手。有了它，你可以探索它在激发创造力、想象力和创造性方面的所有可能性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/bitsy-game-design

作者：[Peter Cheer][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petercheer
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f (Gaming artifacts with joystick, GameBoy, paddle)
[2]: https://github.com/le-doux/bitsy
[3]: https://ledoux.itch.io/bitsy
[4]: https://itch.io/games/tag-bitsy
[5]: https://opensource.com/sites/default/files/uploads/bitsy-editor-sprite.jpg (Bitsy bitmap editor)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/bitsy-editor-room.jpg (Bitsy room editor)
[8]: https://www.shimmerwitch.space/bitsyTutorial.html
[9]: https://static1.squarespace.com/static/58930a6c893fc0a33ae624db/t/5bacd94ac83025ead3937071/1538054510407/BITSY-WORKSHOP.pdf
[10]: https://ayolland.itch.io/trevor/devlog/29520/bitsy-variables-a-tutorial
[11]: https://itch.io/tools/tag-bitsy
[12]: https://halmeeks.net/bitsyclass/
[13]: https://itch.io/game-assets/tag-bitsy
[14]: https://opensource.com/article/18/2/twine-gaming
[15]: https://spdrcstl.com/blog/bitsy-twine-tutorial.html
[16]: https://github.com/seleb/bitsy-hacks/blob/main/dist/twine-bitsy-comms.js
[17]: https://communistsister.itch.io/twitsy-template-1

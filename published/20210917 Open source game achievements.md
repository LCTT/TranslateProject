[#]: subject: "Open source game achievements"
[#]: via: "https://fedoramagazine.org/open-source-game-achievements/"
[#]: author: "Dennis Payne https://fedoramagazine.org/author/dulsi/"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15389-1.html"

Gamerzilla：一个开源游戏成就系统
======

![][1]

Photo by [Michał Parzuchowski][2] on [Unsplash][3]

> 了解开源游戏成就系统 Gamerzilla。它使游戏开发者能够独立于游戏平台实现成就系统。

一些开源游戏的质量已经媲美商业游戏。尽管还难以比肩 3A 大作，但开源游戏在独立游戏中已颇具竞争力。不过，游戏玩家的期望是随时间变化的。早期的游戏只有高分成就。不断增加的成就种类促使玩家反复重玩游戏。比如你可能达到了满级，却还没有找到所有隐藏物品或没有完成全物品收集。Xbox 360 推出了首个在线多游戏成就系统。随后其它游戏平台也纷纷推出了自己的成就系统。

开源游戏在很大程度被游戏平台的成就系统排除在外。你可以在 Stream 上发布开源游戏，但这需要付费。游戏平台主要与公司合作，而不是与自由软件社区合作。这也进一步把玩家锁定在了非自由的游戏平台上。

商业游戏开发商也没有得到太多好处。由于不能共享成就，一些享受成就的玩家拒绝从其他商店购买游戏。这种锁定效应增强了游戏平台的话语权。由于各个游戏平台使用不同的系统，开发者不得不针对它们分别进行适配和测试。较小的游戏平台则可能完全被忽略掉。并且平台方能够访问到所有使用该平台的公司的成就数据，这些数据可以被用来扩大竞争优势。

### Gamerzilla 的架构

[Gamerzilla][4] 是一个致力于改善这种现状的开源游戏成就系统。Gamerzilla 在设计上同时考虑了开源游戏和商业游戏。你可以运行自己的 Gamerzilla 服务器，使用游戏商店提供的服务器，甚至 Linux 发行版提供的服务器。服务器也可以由其他团体来运行。在哪里购买游戏不再重要。成就数据都会上传到你的 Gamerzilla 服务器上。

一个基本的成就系统需要两个要素：游戏和 Gamerzilla 服务器。然而随着游戏数量增长，这种设计会暴露出其缺点。每个游戏都需要证书才能上传数据到服务器。由于拥有大量的游戏资源，并且能够在不同游戏商店之间同步数据，游戏启动器成为了众多玩家的选择。通过让启动器支持 Gamerzilla，游戏本身就不再需要证书了。游戏结果直接从启动器上传到 Gamerzilla 服务器。

freegamedev.net 曾提供了社交网络系统 Hubzilla。我们基于此开发了一个插件来进行 Gamerzilla 的开发。不幸的是 Hubzilla 的一次升级导致了 freegamedev.net 的服务故障，因此 freegamedev.net 决定不再提供它了。

目前 Gamerzilla 服务器有两种实现。维护 Hubzilla 是一项复杂的工作，所以我们用 .Net 和 React 开发了一个独立的 Gamerzilla 服务器。游戏调用的 API 是相同的，所以不用关心连接的服务器是哪种实现。

游戏启动器的开发和支持工作通常是滞后的。为了方便启动器增加对 Gamerzilla 的支持，我们开发了 libgamerzilla。这个库负责处理启动器、游戏和 Gamerzilla 服务器之间的交互。目前只有 GameHub 实现了一个支持 Gamerzilla 的版本，并将在近期整合到项目中。Fedora 上的 libgamerzilla-server 是一个临时解决方案。它不启动游戏，而是监听成就并把成就上传到服务器。

支持 Gamerzilla 的游戏在不断增长。与游戏启动器一样，开发者使用 libgamerzilla 来完成 Gamerzilla 的集成工作。这个库由 C 语言实现，已经被 Python 和 nim 等多种编程语言使用。对于那些已经有成就系统的游戏，只需要花几天时间就可以完成对 Gamerzilla 的支持。其他游戏想要支持 Gamerzilla，大部分时间都是花在收集信息和授予成就上。

### 架设服务器

架设服务器最容易的方式是使用 Hubzilla 插件。但是运行 Hubzilla 站点却不是一件轻松的事情。在 Fedora 上架设基于 .Net 和 React 的服务器相对来说要容易一些，尽管这仍然需要许多步骤。详细步骤请参考 [readme][5] 文件。需要这么多步骤的一部分原因是目前没有预编译好的发布版本。这意味着你需要自己安装 .Net，动手构建 React 源码部分。构建完成之后，React 代码会直接运行在 Apache 中。.Net 后端则运行在单独的服务上。Apache 作为代理负责把所有 Gamerzilla API 请求转发给后端服务。

按上面的步骤操作，Gamerzilla 已经运行起来了，但是现在还没有用户。当然应该有一个简单的方式来创建管理员和注册新用户。但是该功能还没有完成。目前只能通过 sqlite3 命令行来录入用户信息。具体步骤请参考 [readme][5] 文件。用户可以是公开可见的，也可以是隐藏的。批准标记可以让新用户不立刻使用该系统，但是网络注册是必须的。在设计时我们已经考虑了用户相关模块的可替换性。通过替换 `backend/Service/UserService.cs` 就可以与其他站点进行集成。游戏网站也可以通过这种方式来为用户提供 Gamerzilla 成就系统。

目前 Gamerzilla 的后端使用的是 sqlite 数据库。我们还没有对它进行过性能测试。我们预计较大型的应用安装需要改进系统以使用更鲁棒的数据库。

### 测试

目前要找一个支持 Gamerzilla 的游戏启动器太难了。如果你安装了 libgamerzilla-server，就可以在命令行中运行 `gamerzillaserver` 命令。首次运行该命令时需要输入 URL 和登录信息。以后再运行时会直接从配置文件读取这些信息。目前更正错误的唯一方法是删除 `.local/share/gamerzillaserver/server.cfg` 再重新运行 `gamerzillaserver` 命令。

大多数游戏还没有支持 Gamerzilla 的版本。[itch.io 上的 《Pinball Disc Room》][6]，它的 Linux 版本支持 Gamerzilla，但是它的网页版是没有成就系统的。这款游戏只有两个成就：一个是存活 10 秒钟，另一个是解锁并使用隧道。只需要稍加练习，你就能获得一个成就。由于这款游戏没有可视化的成就提示消息，你需要查看 Gamerzila 服务器才能确认成就。

目前打包到 Fedora 中的游戏都还不支持 Gamerzila。《SuperTuxKart》 已经整合了对 Gamerzila 的支持，正在等待发布新版本。《Seahorse adventures》 和 《Shippy 1984》 添加了成就，但是新发布版本还没有打包。还有一部分游戏由我们独立完成了对 Gamerzila 的支持，但我们的<ruby>拉取请求<rt>pull request</rt></ruby>或其它联系尝试还没有得到开发者的回应。

### 后续工作

Gamerzilla 需要更多游戏的支持。目前已经有很多游戏支持 Gamerzilla，并且正在以大约每月一个的速度增长。如果你有喜欢的游戏，可以请求开发方支持 Gamerzilla。如果你是游戏开发者，并且在支持 Gamerzilla 上需要技术支持，请联系我们。

服务器的开发工作在缓步开展中，我们希望不久之后就会有一个可用的注册系统。在那之后我们可能会建立一个永久托管站点。目前你可以看到我们的 [测试服务器][7]。一些人对于使用 .Net 作为后端表示担忧。我们的 API 并不复杂，可以很容易用 Python 重写。

最大的不确定性来自游戏启动器方面。GameHub 希望有一个通过用的成就接口。未来我们可能会在这方面与他们开展合作。增加对 itch.io 应用的支持可以提升系统的关注度。另一种方案是完全抛开启动器。也许可以将 gamerzillaserver 添加到 Gnome 中。然后你就可以在一个设置页面里配置 URL 和登录信息。这样任何启动的游戏都可以记录成就了。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/open-source-game-achievements/

作者：[Dennis Payne][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dulsi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/09/game_acheivements-816x345.jpg
[2]: https://unsplash.com/@mparzuchowski?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/jenga?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: http://identicalsoftware.com/gamerzilla/
[5]: https://github.com/dulsi/gamerzilla.net#readme
[6]: https://dulsi.itch.io/pinball-disc-room
[7]: http://108.49.106.217/

[#]: subject: "Linux Gaming's Next Big Secret Weapon: Bottles Next-Gen Upgrade 🔥"
[#]: via: "https://news.itsfoss.com/bottles-next-linux-gaming/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16258-1.html"

Linux 游戏的下一个秘密武器：Bottles Next
======

![][0]

> Bottles 的发展计划充满激动人心，目标是成为在 Linux 上运行 Windows 应用和游戏的更优秀工具。
 
如今，Wine 和 Steam 的 Proton 让 Linux 用户获得了升级的游戏体验。

而 Lutris、Heroic Games Launcher 等应用利用这些技术，让你能够轻松管理、安装和启动游戏。

**Bottles** 是一款此类的实用工具，它帮助你在 Linux 上 [运行 Windows 应用和游戏][1]。这是在 Linux 上使用 [Epic 游戏商店][2] 的最佳方法之一。

我深信，它在不久的将来会成为一个更令人激动的工具！_为什么？_ 🤔

嗯，我发现了一些关于 Bottles 下一代升级计划的有趣更新 🤯

### Bottles Next：完全变革

当前版本的 [Bottles][3] 是一款简洁且可以定制的应用，帮助你仅需点击几次便可管理和运行 Windows 应用和游戏。

![Bottles 当前版本的截图][4]

根据其未来升级计划（_尽管目前还没有具体的时间表_），开发者们准备提升用户体验，以及提供一个**更强大的后端**。与之配合的是，他们还计划**重新设计用户界面**，以满足初级和资深用户的需求。

现在，我来告诉你更多它的计划信息...

#### 用户界面的重新设计

这是其创建者 [Mirko Brombin][5] 分享的 Bottles Next 的一些效果图：

![Bottles Next 展示两种模式的设计][6]

如你所见，他们的目标是推出两种使用模式，即 “<ruby>Next 模式<rt>Next Mode</rt></ruby>” 针对初级用户，以及 “<ruby>经典模式<rt>Classic Mode</rt></ruby>” 针对资深用户。

> 🚧 这些效果图可能不代表 Bottles Next 的最终设计。

Bottles Next 的更新旨在提供更简洁的用户体验，同时依然保持了工具的可定制性。

![][7]

游戏信息界面看起来很吸引人，显示了重要信息，并提供了进入高级设置的选项。

![][8]

我个人觉得这个设计不错，_你觉得呢？_

#### 核心的变化

计划中的技术变动很大，但当然，你可能无法从用户界面上看出其变化。

后端重写的一些目标包括：

  * 让后端独立于图形用户界面
  * 重新定义应用如何与其创建的 “<ruby>前置瓶<rt>bottle</rt></ruby>” 联系，重点是单一应用。
  * 引入新功能（如取消创建 “前置瓶” 的能力）

（LCTT 译注：Wine 使用一个被称之为 “Wineprefix” 的配置目录来控制使用 Wine 运行的 Windows 程序，这个目录也被比喻作 “bottle”，而 “Bottles” 是一个基于此机制的软件。在此，我将 “Wineprefix” 和 “bottle” 尝试翻译为 “Wine 前置配置” 和 “前置瓶”。）

为了使后端独立于图形用户界面，他们计划使用客户端和本地服务器的概念。因此，其他应用也可以使用 Bottles 服务器来处理已创建的 <ruby>Wine 前置配置<rt>Wineprefix</rt></ruby>。

> 💡 <ruby>Wine 前置配置<rt>Wineprefix</rt></ruby> 是 Wine 用于存储配置文件及已安装的 Windows 程序的目录（更多关于 Wine 的信息参见 [Arch Linux Wiki][10]）。

换句话说，他们目标是改变所有的工作方式，同时保证他们的后端对其他应用管理 Wine 是有利的。

关于技术变化，Mirko 提到：

> 这种全新的架构允许在任何需要管理 Wine 前置配置的应用中使用 Bottles。你可以用任何工具包，例如 qt、GTK 等写客户端。我们正朝着 Electron 的道路前进，同时也在开发一个 GTK 客户端。

（计划中）Bottles Next 工作方式的一个**有趣的地方**：

> Bottles Next 将会是第一款能够从内部管理 Wine 前置配置的管理器。我们正在编写一个名为 [WineBridge][11] 的项目，它运行在 Wine 前置配置内部，然后通过协议与 Bottles 通信。这样我们便可以避免使用 Shell 命令来启动程序或调整 <ruby>Wine 前置配置<rt>Wineprefix</rt></ruby>，大大降低了痛苦。

此外，他提到将基于 Go 编程语言进行重写。

简而言之，即将在底层和前端出现大量重大的变化。这些整合后，必然能够在 Bottles 上提升用户体验。

随着他们透露的关于 Bottles Next 更多的计划和进展信息，我们可能会获得更多值得关注的消息。

### 🙌 如果可以，帮助他们！

我敢肯定，至此为止，作为一个 Linux 游戏狂热爱好者，你一定迫不及待想要看到下一代的更新!

然而，已经分享的**开发计划**会需要一段时间去实践，最后才能推出。

**但不用担心，你可以伸出援手！**

你可以在 [GitHub][12] 上为项目做出贡献，提出你的想法/反馈到 [论坛][13]， 加入他们的 [Discord][14] 服务器找出更多参与 **Bottles Next** 项目的方式。

> **[Bottles][3]**

💬 你对 Bottles Next 有什么看法？在下方的评论中分享你的观点。

*（题图：MJ/e6b335c1-70d9-4404-b62f-e9b27fd128bb）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/bottles-next-linux-gaming/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/use-windows-applications-linux/
[2]: https://itsfoss.com/epic-games-linux/
[3]: https://usebottles.com/
[4]: https://news.itsfoss.com/content/images/2023/10/bottle-dark-screenshot.png
[5]: https://news.itsfoss.com/interview-mirko-brombin/
[6]: https://news.itsfoss.com/content/images/2023/10/bottles-next.jpg
[7]: https://news.itsfoss.com/content/images/2023/10/bottles-next-ui.jpg
[8]: https://news.itsfoss.com/content/images/2023/10/bottles-next-game-info.jpg
[9]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[10]: https://wiki.archlinux.org/title/wine
[11]: https://github.com/bottlesdevs/winebridge
[12]: https://github.com/bottlesdevs
[13]: https://forum.usebottles.com/
[14]: https://discord.gg/wF4JAdYrTR
[0]: https://img.linux.net.cn/data/attachment/album/202310/06/123651ctvakzantvupnezt.jpg